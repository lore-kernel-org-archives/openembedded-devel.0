Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD4F17F834
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 14:50:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g17so3703531wro.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 06:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5nweoau3zdGduFLUswOG+pqS14OQC5Og0WxEzv3rabs=;
	b=CbRvoPSHSIcE3yLIEXpmc5HCPjYj5vwVA5lMyRRjJq3E6NJzwj5LbYE+nTNCI5BW/x
	cT5JE7o5PDRdx/xIGuSKdyTbqdDP3CG8uF4VpqlnQEM/wdsIf5IWHdtTZDknduOV+RJ0
	o0snpvOJShHyFZdtXCveXg2M+z2TUcWokooaGLAJ/LAPP8ox9AiRVOeZ7GI5TH6vzUYy
	AL5Tx3SKr3zE/nE8f+pNGjk2KitYIz2vM06kZXTiRza+6nQ/4U81pBxsh9eRO0g0v3mN
	+1950Ei4K3OP02ww3lgIEDWvKV5/H3GvvH4eo0FNEEFolvi0hZYfWqLnfgK4U/JNUATr
	YMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5nweoau3zdGduFLUswOG+pqS14OQC5Og0WxEzv3rabs=;
	b=cqXf/y4DLSHbzvd2l28UvC24G73O6Tky0aDNAd3ddErUGN4zcSowC0PSn/IhyQRoNS
	5PLz04ydZxXBxo1TN9/yZ23f62FyOy1ZJ5UYZ4bvRGBIYl+QFbZyv1IfO8MZCMN/nQTt
	p4IG+WFSnWUZ9R2R6VC05FI4fuwR9Kad7z0th478l/7LyKD6or8ouju4HSP4s2U6m3sE
	pf4CmQ5jjuOobGnQJdha2PzuSwOMyjT71/plPAqcwlrh9Be28CagbG0PMS3bdZX9UrGL
	mChIgsAU08l5gA9KNNqjyDl0sAu35X0HNDZs1BzCRvYdkQZECfDYrgV22DXVn2mKzG1I
	EXyg==
X-Gm-Message-State: APjAAAXu++hAqn//1D9pSjX0dYwYtXOo+bS7nAXsMwUavzBrVUZ8eeb0
	HFgDzyKDunisrzA0n0RkQqsjbHxYLAo=
X-Google-Smtp-Source: APXvYqy5gutglH22d8e5M6UxeDbwh9LaVC4nGGcm1wWZUR2n86x/Ojm5mlvQuClIXxhIcCMc0aWjqg==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr4834398wrn.251.1578495048959; 
	Wed, 08 Jan 2020 06:50:48 -0800 (PST)
Received: from Unimatrix05-Bionic.lan ([2001:b07:5d32:c012:51ed:b4fa:d66:b069])
	by smtp.gmail.com with ESMTPSA id z3sm4434293wrs.94.2020.01.08.06.50.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 06:50:48 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jan 2020 15:50:44 +0100
Message-Id: <20200108145044.14535-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: update to version 6.1.0 and unblacklist
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
X-List-Received-Date: Wed, 08 Jan 2020 14:50:48 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

- Change oe_runmake call because the yocto one exposes AR/O and other variables, not understood by KBUILD makefile.
- Add KBUILD_VERBOSE to add some build verbosity
- Add upstream patch to fix export of the module tarball.

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../vboxguestdrivers/export.patch             | 77 +++++++++++++++++++
 ...rs_5.2.22.bb => vboxguestdrivers_6.1.0.bb} | 15 ++--
 2 files changed, 84 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/export.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.2.22.bb => vboxguestdrivers_6.1.0.bb} (87%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/export.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/export.patch
new file mode 100644
index 000000000..bfba3332b
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/export.patch
@@ -0,0 +1,77 @@
+Index: src/VBox/Additions/linux/export_modules.sh
+===================================================================
+--- a/src/VBox/Additions/linux/export_modules.sh
++++ b/src/VBox/Additions/linux/export_modules.sh
+@@ -46,7 +46,13 @@
+ VBOX_VERSION_MAJOR=`sed -e "s/^ *VBOX_VERSION_MAJOR *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
+ VBOX_VERSION_MINOR=`sed -e "s/^ *VBOX_VERSION_MINOR *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
+ VBOX_VERSION_BUILD=`sed -e "s/^ *VBOX_VERSION_BUILD *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
+-VBOX_SVN_REV=`sed -e 's/^ *VBOX_SVN_REV_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Config.kmk`
++VBOX_SVN_CONFIG_REV=`sed -e 's/^ *VBOX_SVN_REV_CONFIG_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Config.kmk`
++VBOX_SVN_VERSION_REV=`sed -e 's/^ *VBOX_SVN_REV_VERSION_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Version.kmk`
++if [ "$VBOX_SVN_CONFIG_REV" -gt "$VBOX_SVN_VERSION_REV" ]; then
++    VBOX_SVN_REV=$VBOX_SVN_CONFIG_REV
++else
++    VBOX_SVN_REV=$VBOX_SVN_VERSION_REV
++fi
+ VBOX_VENDOR=`sed -e 's/^ *VBOX_VENDOR *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
+ VBOX_VENDOR_SHORT=`sed -e 's/^ *VBOX_VENDOR_SHORT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
+ VBOX_PRODUCT=`sed -e 's/^ *VBOX_PRODUCT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
+Index: src/VBox/HostDrivers/linux/export_modules.sh
+===================================================================
+--- a/src/VBox/HostDrivers/linux/export_modules.sh
++++ b/src/VBox/HostDrivers/linux/export_modules.sh
+@@ -100,12 +100,26 @@
+ VBOX_VERSION_MINOR=`sed -e "s/^ *VBOX_VERSION_MINOR *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
+ VBOX_VERSION_BUILD=`sed -e "s/^ *VBOX_VERSION_BUILD *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
+ VBOX_VERSION_STRING=$VBOX_VERSION_MAJOR.$VBOX_VERSION_MINOR.$VBOX_VERSION_BUILD
+-VBOX_SVN_REV=`sed -e 's/^ *VBOX_SVN_REV_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Config.kmk`                                                                                                        VBOX_VENDOR=`sed -e 's/^ *VBOX_VENDOR *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`                                     VBOX_VENDOR_SHORT=`sed -e 's/^ *VBOX_VENDOR_SHORT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`                         VBOX_PRODUCT=`sed -e 's/^ *VBOX_PRODUCT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`                                   VBOX_C_YEAR=`date +%Y`
++VBOX_VERSION_BUILD=`sed -e "s/^ *VBOX_VERSION_BUILD *= \+\([0-9]\+\)/\1/;t;d" $PATH_ROOT/Version.kmk`
++VBOX_SVN_CONFIG_REV=`sed -e 's/^ *VBOX_SVN_REV_CONFIG_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Config.kmk`
++VBOX_SVN_VERSION_REV=`sed -e 's/^ *VBOX_SVN_REV_VERSION_FALLBACK *:= \+\$(patsubst *%:,, *\$Rev: *\([0-9]\+\) *\$ *) */\1/;t;d' $PATH_ROOT/Version.kmk`
++if [ "$VBOX_SVN_CONFIG_REV" -gt "$VBOX_SVN_VERSION_REV" ]; then
++    VBOX_SVN_REV=$VBOX_SVN_CONFIG_REV
++else
++    VBOX_SVN_REV=$VBOX_SVN_VERSION_REV
++fi
++VBOX_VENDOR=`sed -e 's/^ *VBOX_VENDOR *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
++VBOX_VENDOR_SHORT=`sed -e 's/^ *VBOX_VENDOR_SHORT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
++VBOX_PRODUCT=`sed -e 's/^ *VBOX_PRODUCT *= \+\(.\+\)/\1/;t;d' $PATH_ROOT/Config.kmk`
++VBOX_C_YEAR=`date +%Y`
++VBOX_WITH_PCI_PASSTHROUGH=`sed -e "s/^ *VBOX_WITH_PCI_PASSTHROUGH *= *\(1\?\)/\1/;t;d" $PATH_ROOT/Config.kmk`
+ 
+ . $PATH_VBOXDRV/linux/files_vboxdrv
+ . $PATH_VBOXNET/linux/files_vboxnetflt
+ . $PATH_VBOXADP/linux/files_vboxnetadp
+-. $PATH_VBOXPCI/linux/files_vboxpci
++if [ "$VBOX_WITH_PCI_PASSTHROUGH" -eq "1" ]; then
++    . $PATH_VBOXPCI/linux/files_vboxpci
++fi
+ 
+ # Temporary path for creating the modules, will be removed later
+ rm -rf "$PATH_TMP"
+@@ -187,14 +201,16 @@
+ fi
+ 
+ # vboxpci (VirtualBox host PCI access kernel module)
+-mkdir $PATH_TMP/vboxpci || exit 1
+-for f in $VBOX_VBOXPCI_SOURCES; do
+-    install -D -m 0644 `echo $f|cut -d'=' -f1` "$PATH_TMP/vboxpci/`echo $f|cut -d'>' -f2`"
+-done
+-if [ -n "$VBOX_WITH_HARDENING" ]; then
+-    cat                                   $PATH_VBOXPCI/linux/Makefile > $PATH_TMP/vboxpci/Makefile
+-else
+-    sed -e "s;VBOX_WITH_HARDENING;;g" < $PATH_VBOXPCI/linux/Makefile > $PATH_TMP/vboxpci/Makefile
++if [ "$VBOX_WITH_PCI_PASSTHROUGH" -eq "1" ]; then
++    mkdir $PATH_TMP/vboxpci || exit 1
++    for f in $VBOX_VBOXPCI_SOURCES; do
++        install -D -m 0644 `echo $f|cut -d'=' -f1` "$PATH_TMP/vboxpci/`echo $f|cut -d'>' -f2`"
++    done
++    if [ -n "$VBOX_WITH_HARDENING" ]; then
++        cat                                   $PATH_VBOXPCI/linux/Makefile > $PATH_TMP/vboxpci/Makefile
++    else
++        sed -e "s;VBOX_WITH_HARDENING;;g" < $PATH_VBOXPCI/linux/Makefile > $PATH_TMP/vboxpci/Makefile
++    fi
+ fi
+ 
+ install -D -m 0644 $PATH_LINUX/Makefile $PATH_TMP/Makefile
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.0.bb
similarity index 87%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.0.bb
index 0f8d7af3f..be18b10c6 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.0.bb
@@ -13,21 +13,22 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
+    file://export.patch;patchdir=${WORKDIR}/${VBOX_NAME} \
 "
-SRC_URI[md5sum] = "c9c2f162ac5f99d28d8c0ca43b19ed01"
-SRC_URI[sha256sum] = "5580e875349341a1aabc6d5d2f697d242f277487316faaf1fbe68d9014f788d4"
+SRC_URI[md5sum] = "484b550f4692c9d61896b08bb0a1be7f"
+SRC_URI[sha256sum] = "49005ed94454f893fc3955e1e2b9607e85c300235cb983b39d1df2cfcf29f039"
 
 S = "${WORKDIR}/vbox_module"
 
 export BUILD_TARGET_ARCH="${ARCH}"
 export BUILD_TARGET_ARCH_x86-64="amd64"
 
-EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build'"
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1"
 
 # otherwise 5.2.22 builds just vboxguest
 MAKE_TARGETS = "all"
 
-addtask export_sources before do_patch after do_unpack
+addtask export_sources after do_patch before do_configure
 
 do_export_sources() {
     mkdir -p "${S}"
@@ -50,7 +51,8 @@ do_configure_prepend() {
 }
 
 # compile and install mount utility
-do_compile_append() {
+do_compile() {
+    oe_runmake all
     oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
     if ! [ -e vboxguest.ko -a -e vboxsf.ko -a -e vboxvideo.ko ] ; then
         echo "ERROR: One of vbox*.ko modules wasn't built"
@@ -78,6 +80,3 @@ FILES_${PN} = "${base_sbindir}"
 
 # autoload if installed
 KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
-
-PNBLACKLIST[vboxguestdrivers] = "Needs forward porting to kernel 5.2+"
-
-- 
2.17.1


