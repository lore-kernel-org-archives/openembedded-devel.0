Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E78F578721
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vANC9Q3g014612
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 23 Nov 2017 04:09:26 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:04 -0500
Message-ID: <f79f253674f5724642ff3a1abd9d6d8bf07d2314.1511437793.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/15] meta-installer: add distro anaconda for host build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Nov 2017 12:09:26 -0000
Content-Type: text/plain

While DISTRO = "anaconda", it enable features of host build.

The host build requires:

- append anaconda_kernel to KERNEL_CLASSES to add kernel configs

- misc setting in conf/distro/anaconda.conf for host build

- copy package/image from target build to host image

- add rpm packages check

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-installer/classes/anaconda_image.bbclass | 321 ++++++++++++++++++++++++++
 meta-installer/conf/distro/anaconda.conf      |  33 +++
 2 files changed, 354 insertions(+)
 create mode 100644 meta-installer/classes/anaconda_image.bbclass
 create mode 100644 meta-installer/conf/distro/anaconda.conf

diff --git a/meta-installer/classes/anaconda_image.bbclass b/meta-installer/classes/anaconda_image.bbclass
new file mode 100644
index 0000000..be37a09
--- /dev/null
+++ b/meta-installer/classes/anaconda_image.bbclass
@@ -0,0 +1,321 @@
+RPM_POSTPROCESS_COMMANDS_append = "wrl_installer;"
+
+INSTPRODUCT ?= "${DISTRO_NAME}"
+INSTVER     ?= "${DISTRO_VERSION}"
+INSTBUGURL  ?= "http://www.windriver.com/"
+
+# NOTE: Please update anaconda-init when you change INSTALLER_CONFDIR, use "="
+#       but not "?=" since this is not configurable.
+INSTALLER_CONFDIR = "${IMAGE_ROOTFS}/installer-config"
+KICKSTART_FILE ?= ""
+WRL_INSTALLER_CONF ?= ""
+
+build_iso_prepend() {
+	install -d ${ISODIR}
+	ln -snf /.discinfo ${ISODIR}/.discinfo
+	ln -snf /.buildstamp ${ISODIR}/.buildstamp
+	ln -snf /Packages ${ISODIR}/Packages
+}
+
+build_iso_append() {
+	implantisomd5 ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
+}
+
+# Check WRL_INSTALLER_CONF and copy it to
+# ${IMAGE_ROOTFS}/.buildstamp.$prj_name when exists
+wrl_installer_copy_buildstamp() {
+    prj_name=$1
+    buildstamp=$2
+    if [ -f $buildstamp ]; then
+        bbnote "Using $buildstamp as the buildstamp"
+        cp $buildstamp ${IMAGE_ROOTFS}/.buildstamp.$prj_name
+    else
+        bbfatal "Can't find WRL_INSTALLER_CONF: $buildstamp"
+    fi
+}
+
+# Hardlink when possible, otherwise copy.
+# $1: src
+# $2: target
+wrl_installer_hardlinktree() {
+    src_dev="`stat -c %d $1`"
+    if [ -e "$2" ]; then
+        tgt_dev="`stat -c %d $2`"
+    else
+        tgt_dev="`stat -c %d $(dirname $2)`"
+    fi
+    hdlink=""
+    if [ "$src_dev" = "$tgt_dev" ]; then
+        hdlink="--link"
+    fi
+    cp -rvf $hdlink $1 $2
+}
+
+wrl_installer_copy_local_repos() {
+    deploy_dir_rpm=$1
+
+    if [ -d "$deploy_dir_rpm" ]; then
+        echo "Copy rpms from target build to installer image."
+        mkdir -p ${IMAGE_ROOTFS}/Packages.$prj_name
+
+        : > ${IMAGE_ROOTFS}/Packages.$prj_name/.treeinfo
+        echo "[general]" >> ${IMAGE_ROOTFS}/Packages.$prj_name/.treeinfo
+        echo "version = ${DISTRO_VERSION}" >> ${IMAGE_ROOTFS}/Packages.$prj_name/.treeinfo
+
+        # Determine the max channel priority
+        channel_priority=5
+        for pt in $installer_target_archs ; do
+            channel_priority=$(expr $channel_priority + 5)
+        done
+
+        : > ${IMAGE_ROOTFS}/Packages.$prj_name/.feedpriority
+        for arch in $installer_target_archs; do
+            if [ -d "$deploy_dir_rpm/"$arch -a ! -d "${IMAGE_ROOTFS}/Packages.$prj_name/"$arch ]; then
+                channel_priority=$(expr $channel_priority - 5)
+                echo "$channel_priority $arch" >> ${IMAGE_ROOTFS}/Packages.$prj_name/.feedpriority
+                wrl_installer_hardlinktree "$deploy_dir_rpm/"$arch "${IMAGE_ROOTFS}/Packages.$prj_name/."
+            fi
+        done
+        createrepo_c --update -q ${IMAGE_ROOTFS}/Packages.$prj_name/
+    fi
+}
+
+# Update .buildstamp and copy rpm packages to IMAGE_ROOTFS
+wrl_installer_copy_pkgs() {
+
+    target_build="$1"
+    target_image="$2"
+    prj_name="$3"
+    if [ -n "$4" ]; then
+        installer_conf="$4"
+    else
+        installer_conf=""
+    fi
+
+    common_grep="-e '^ALL_MULTILIB_PACKAGE_ARCHS=.*' \
+            -e '^MULTILIB_VARIANTS=.*' -e '^PACKAGE_ARCHS=.*'\
+            -e '^PACKAGE_ARCH=.*' -e '^PACKAGE_INSTALL_ATTEMPTONLY=.*' \
+            -e '^DISTRO=.*' -e '^DISTRO_NAME=.*' -e '^DISTRO_VERSION=.*' \
+            "
+
+    if [ -f "$installer_conf" ]; then
+        eval "grep -e \"^PACKAGE_INSTALL=.*\" $common_grep $installer_conf \
+            | sed -e 's/=/=\"/' -e 's/$/\"/' > ${BB_LOGFILE}.distro_vals"
+
+        eval "cat $target_build/installersupport_$target_image | \
+            grep -e 'DEPLOY_DIR_RPM=.*' >> ${BB_LOGFILE}.distro_vals"
+
+        eval `cat ${BB_LOGFILE}.distro_vals`
+        if [ $? -ne 0 ]; then
+            bbfatal "Something is wrong in $installer_conf, please correct it"
+        fi
+        if [ -z "$PACKAGE_ARCHS" -o -z "$PACKAGE_INSTALL" ]; then
+            bbfatal "PACKAGE_ARCHS or PACKAGE_INSTALL is null, please check $installer_conf"
+        fi
+    else
+        eval "cat $target_build/installersupport_$target_image | \
+            grep $common_grep -e '^PN=.*' -e '^SUMMARY=.*' -e 'DEPLOY_DIR_RPM=.*'\
+            -e '^DESCRIPTION=.*' -e '^export PACKAGE_INSTALL=.*' > ${BB_LOGFILE}.distro_vals"
+
+        eval `cat ${BB_LOGFILE}.distro_vals`
+    fi
+
+    export installer_default_arch="$PACKAGE_ARCH"
+    # Reverse it for priority
+    export installer_default_archs="`for arch in $PACKAGE_ARCHS; do echo $arch; done | tac | tr - _`"
+    installer_target_archs="$installer_default_archs"
+    if [ -n "$MULTILIB_VARIANTS" ]; then
+        export MULTILIB_VARIANTS
+        mlarchs_reversed="`for mlarch in $ALL_MULTILIB_PACKAGE_ARCHS; do echo $mlarch; \
+            done | tac | tr - _`"
+        for arch in $mlarchs_reversed; do
+            if [ "$arch" != "noarch" -a "$arch" != "all" -a "$arch" != "any" ]; then
+                installer_target_archs="$installer_target_archs $arch"
+            fi
+        done
+    fi
+    export installer_target_archs
+
+    # Save the vars to .buildstamp when no installer_conf
+    if [ ! -f "$installer_conf" ]; then
+        cat >> ${IMAGE_ROOTFS}/.buildstamp.$prj_name <<_EOF
+DISTRO=$DISTRO
+DISTRO_NAME=$DISTRO_NAME
+DISTRO_VERSION=$DISTRO_VERSION
+
+[Rootfs]
+LIST=$PN
+
+[$PN]
+SUMMARY=$SUMMARY
+DESCRIPTION=$DESCRIPTION
+
+PACKAGE_INSTALL=$PACKAGE_INSTALL
+PACKAGE_INSTALL_ATTEMPTONLY=$PACKAGE_INSTALL_ATTEMPTONLY
+ALL_MULTILIB_PACKAGE_ARCHS=$ALL_MULTILIB_PACKAGE_ARCHS
+MULTILIB_VARIANTS=$MULTILIB_VARIANTS
+PACKAGE_ARCHS=$PACKAGE_ARCHS
+PACKAGE_ARCH=$PACKAGE_ARCH
+IMAGE_LINGUAS=${IMAGE_LINGUAS}
+_EOF
+    fi
+
+    if [ -d "$DEPLOY_DIR_RPM" ]; then
+        # Copy local repos while the image is not initramfs
+        bpn=${BPN}
+        if [ "${bpn##*initramfs}" = "${bpn%%initramfs*}" ]; then
+            wrl_installer_copy_local_repos $DEPLOY_DIR_RPM
+        fi
+        echo "$DISTRO::$prj_name::$DISTRO_NAME::$DISTRO_VERSION" >> ${IMAGE_ROOTFS}/.target_build_list
+    fi
+}
+
+wrl_installer_get_count() {
+    sum=0
+    for i in $*; do
+        sum=$(expr $sum + 1)
+    done
+    echo $sum
+}
+
+wrl_installer[vardepsexclude] = "DATETIME"
+wrl_installer() {
+    cat >${IMAGE_ROOTFS}/.discinfo <<_EOF
+${DATETIME}
+${DISTRO_NAME} ${DISTRO_VERSION}
+${TARGET_ARCH}
+_EOF
+
+    : > ${IMAGE_ROOTFS}/.target_build_list
+    counter=0
+    targetimage_counter=0
+    for target_build in ${INSTALLER_TARGET_BUILD}; do
+        target_build="`readlink -f $target_build`"
+        echo "Installer Target Build: $target_build"
+        counter=$(expr $counter + 1)
+        prj_name="`echo $target_build | sed -e 's#/ *$##g' -e 's#.*/##'`"
+        prj_name="$prj_name-$counter"
+
+	    # Generate .buildstamp
+	    if [ -n "${WRL_INSTALLER_CONF}" ]; then
+	        installer_conf="`echo ${WRL_INSTALLER_CONF} | awk '{print $'"$counter"'}'`"
+	        wrl_installer_copy_buildstamp $prj_name $installer_conf
+	    else
+	        cat >${IMAGE_ROOTFS}/.buildstamp.$prj_name <<_EOF
+[Main]
+Product=${INSTPRODUCT}
+Version=${INSTVER}
+BugURL=${INSTBUGURL}
+IsFinal=True
+UUID=${DATETIME}.${TARGET_ARCH}
+_EOF
+	    fi
+
+	    if [ -f "$target_build" ]; then
+	        filename=$(basename "$target_build")
+	        extension="${filename##*.}"
+	        bpn=${BPN}
+	        # Do not copy image for initramfs
+	        if [ "${bpn##*initramfs}" != "${bpn%%initramfs*}" ]; then
+	            continue
+	        elif [ "x$extension" = "xext2" -o "x$extension" = "xext3" -o "x$extension" = "xext4" ]; then
+	            echo "Image based target install selected."
+	            mkdir -p "${IMAGE_ROOTFS}/LiveOS.$prj_name"
+	            wrl_installer_hardlinktree "$target_build" "${IMAGE_ROOTFS}/LiveOS.$prj_name/rootfs.img"
+	            echo "::$prj_name::" >> ${IMAGE_ROOTFS}/.target_build_list
+	        else
+	            bberror "Unsupported image: $target_build."
+	            bberror "The image must be ext2, ext3 or ext4"
+	            exit 1
+	        fi
+	    elif [ -d "$target_build" ]; then
+	        targetimage_counter=$(expr $targetimage_counter + 1)
+	        target_image="`echo ${INSTALLER_TARGET_IMAGE} | awk '{print $'"$targetimage_counter"'}'`"
+	        echo "Target Image: $target_image"
+	        wrl_installer_copy_pkgs $target_build $target_image $prj_name $installer_conf
+	    else
+	        bberror "Invalid configuration of INSTALLER_TARGET_BUILD: $target_build."
+	        bberror "It must either point to an image (ext2, ext3 or ext4) or to the root of another build directory"
+	        exit 1
+	    fi
+
+	    ks_cfg="${INSTALLER_CONFDIR}/ks.cfg.$prj_name"
+	    if [ -n "${KICKSTART_FILE}" ]; then
+	        ks_file="`echo ${KICKSTART_FILE} | awk '{print $'"$counter"'}'`"
+	        bbnote "Copying kickstart file $ks_file to $ks_cfg ..."
+	        mkdir -p ${INSTALLER_CONFDIR}
+	        cp $ks_file $ks_cfg
+	    fi
+    done
+
+    # Setup the symlink if only one target build dir.
+    if [ "$counter" = "1" ]; then
+        prj_name="`awk -F:: '{print $2}' ${IMAGE_ROOTFS}/.target_build_list`"
+        entries=".buildstamp LiveOS Packages installer-config/ks.cfg"
+        for i in $entries; do
+            if [ -e ${IMAGE_ROOTFS}/$i.$prj_name ]; then
+                ln -sf `basename $i.$prj_name` ${IMAGE_ROOTFS}/$i
+            fi
+        done
+    fi
+}
+
+python __anonymous() {
+    if "selinux" in d.getVar("DISTRO_FEATURES", True).split():
+        raise bb.parse.SkipPackage("Unable to build the installer when selinux is enabled.")
+
+    if bb.data.inherits_class('image', d):
+        if d.getVar("DISTRO", True) != "anaconda":
+            raise bb.parse.SkipPackage("Set DISTRO = 'anaconda' in local.conf")
+
+        target_builds = d.getVar('INSTALLER_TARGET_BUILD', True)
+        if not target_builds:
+            errmsg = "No INSTALLER_TARGET_BUILD is found,\n"
+            errmsg += "set INSTALLER_TARGET_BUILD = '<target-build-topdir>' and\n"
+            errmsg += "INSTALLER_TARGET_IMAGE = '<target-image-pn>' to do RPMs\n"
+            errmsg += "install, or\n"
+            errmsg += "set INSTALLER_TARGET_BUILD = '<target-build-image>' to do\n"
+            errmsg += "image copy install"
+            raise bb.parse.SkipPackage(errmsg)
+
+        count = 0
+        for target_build in target_builds.split():
+            if not os.path.exists(target_build):
+                raise bb.parse.SkipPackage("The %s of INSTALLER_TARGET_BUILD does not exist" % target_build)
+
+            if os.path.isdir(target_build):
+                count += 1
+
+        # While do package management install
+        if count > 0:
+            target_images = d.getVar('INSTALLER_TARGET_IMAGE', True)
+            if not target_images:
+                errmsg = "The INSTALLER_TARGET_BUILD is a dir, but not found INSTALLER_TARGET_IMAGE,\n"
+                errmsg += "set INSTALLER_TARGET_IMAGE = '<target-image-pn>' to do RPMs install"
+                raise bb.parse.SkipPackage(errmsg)
+
+            elif count != len(target_images.split()):
+                errmsg = "The INSTALLER_TARGET_BUILD has %s build dirs: %s\n" % (count, target_builds)
+                errmsg += "But INSTALLER_TARGET_IMAGE has %s build images: %s\n" % (len(target_images.split()), target_images)
+                raise bb.parse.SkipPackage(errmsg)
+
+        # The count of INSTALLER_TARGET_BUILD and WRL_INSTALLER_CONF must match when set.
+        wrlinstaller_confs = d.getVar('WRL_INSTALLER_CONF', True)
+        if wrlinstaller_confs:
+            if len(wrlinstaller_confs.split()) != len(target_builds.split()):
+                raise bb.parse.SkipPackage("The count of INSTALLER_TARGET_BUILD and WRL_INSTALLER_CONF not match!")
+            for wrlinstaller_conf in wrlinstaller_confs.split():
+                if not os.path.exists(wrlinstaller_conf):
+                    raise bb.parse.SkipPackage("The installer conf %s in WRL_INSTALLER_CONF doesn't exist!" % wrlinstaller_conf)
+
+        # The count of INSTALLER_TARGET_BUILD and KICKSTART_FILE must match when set.
+        kickstart_files = d.getVar('KICKSTART_FILE', True)
+        if kickstart_files:
+            if len(kickstart_files.split()) != len(target_builds.split()):
+                raise bb.parse.SkipPackage("The count of INSTALLER_TARGET_BUILD and KICKSTART_FILE not match!")
+            for kickstart_file in kickstart_files.split():
+                if not os.path.exists(kickstart_file):
+                    raise bb.parse.SkipPackage("The kickstart file %s in KICKSTART_FILE doesn't exist!" % kickstart_file)
+
+}
+
diff --git a/meta-installer/conf/distro/anaconda.conf b/meta-installer/conf/distro/anaconda.conf
new file mode 100644
index 0000000..fc3f23d
--- /dev/null
+++ b/meta-installer/conf/distro/anaconda.conf
@@ -0,0 +1,33 @@
+# use systemd as the default init manager
+# comment the following lines to use 'sysvinit' as the init manager
+VIRTUAL-RUNTIME_init_manager = "systemd"
+DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " sysvinit"
+DISTRO_FEATURES_append = " systemd"
+
+DISTRO_FEATURES_append = " \
+    x11 \
+    opengl \
+"
+
+VIRTUAL-RUNTIME_base-utils = "busybox"
+
+SYSTEMD_AUTO_ENABLE_pn-lvm2 = "enable"
+
+KERNEL_CLASSES_append = " anaconda_kernel"
+
+IMAGE_FEATURES_append = " package-management"
+
+# Want ldconfig in the output package
+# The python module require it
+DISTRO_FEATURES_append = " ldconfig"
+
+# It works for both of syslinux and grub-efi
+LABELS_LIVE = "boot"
+
+QB_MEM_qemux86-64 = "-m 2048"
+
+HOSTTOOLS_append = " tac"
+
+MACHINE_FEATURES_append = " efi pcbios"
+
+UVESA_MODE = "1024x768-32"
-- 
2.8.1


