Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaX-0005Zg-2j
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:59 +0100
Received: (qmail 27361 invoked by uid 813007); 4 Mar 2009 15:53:59 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:59 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPr-0001EG-Rc; Wed, 04 Mar 2009 16:53:51 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:48 +0100
Message-Id: <1236182004-4523-34-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 33/70] Add rootfs_rpm.bbclass, a start at image generation from rpms. Its not expected to be entirely functional yet. (from Poky)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2009 16:05:07 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5101 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/rootfs_rpm.bbclass |  148 ++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 148 insertions(+), 0 deletions(-)
 create mode 100644 classes/rootfs_rpm.bbclass

diff --git a/classes/rootfs_rpm.bbclass b/classes/rootfs_rpm.bbclass
new file mode 100644
index 0000000..83ceccf
--- /dev/null
+++ b/classes/rootfs_rpm.bbclass
@@ -0,0 +1,148 @@
+#
+# Creates a root filesystem out of rpm packages
+#
+
+ROOTFS_PKGMANAGE = "opkg" 
+# "rpm" "yum"
+ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
+
+do_rootfs[depends] += "rpm-native:do_populate_staging yum-native:do_populate_staging createrepo-native:do_populate_staging fakechroot-native:do_populate_staging"
+do_rootfs[recrdeptask] += "do_package_write_rpm"
+
+YUMCONF = "${IMAGE_ROOTFS}/etc/yum.conf"
+YUMARGS = "-c ${YUMCONF} --installroot ${IMAGE_ROOTFS}"
+
+fakeroot rootfs_rpm_do_rootfs () {
+	set -x
+
+	# Update the repository index
+	createrepo ${DEPLOY_DIR_RPM}
+
+	mkdir -p ${IMAGE_ROOTFS}/etc/rpm/
+	#echo "arm" > ${IMAGE_ROOTFS}/etc/rpm/platform
+
+	# Copy the packages into the target image
+	# Ugly ugly ugly but rpm is braindead and can't see outside the chroot 
+	# when installing :(
+	mkdir -p ${IMAGE_ROOTFS}${DEPLOY_DIR_RPM}
+	cp -r ${DEPLOY_DIR_RPM}/* ${IMAGE_ROOTFS}${DEPLOY_DIR_RPM}/
+
+	# Generate an apprpriate yum.conf
+	rm -rf ${YUMCONF}
+	cat > ${YUMCONF} << EOF
+[main]
+cachedir=/var/cache2/yum
+keepcache=1
+debuglevel=10
+logfile=/var/log2/yum.log
+exactarch=0
+obsoletes=1
+tolerant=1
+arch=arm
+basearch=arm
+
+[poky-feed]
+name = Poky RPM Feed
+baseurl=file://${DEPLOY_DIR_RPM}
+gpgcheck=0
+
+EOF
+	#mkdir -p ${IMAGE_ROOTFS}/var/lib/rpm
+	#rpm --root ${IMAGE_ROOTFS} --initdb
+	#rpm --root ${IMAGE_ROOTFS} --dbpath ${IMAGE_ROOTFS}/var/lib/rpm -ihv --nodeps --ignoreos  
+	#rpm -ihv --root ${IMAGE_ROOTFS} ${PACKAGE_INSTALL}
+
+	#package_update_index_rpm
+	#package_generate_ipkg_conf
+
+	# Uclibc builds don't provide this stuff...
+	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then 
+		if [ ! -z "${LINGUAS_INSTALL}" ]; then
+			for i in ${LINGUAS_INSTALL}; do
+				fakechroot yum ${YUMARGS} -y install $i 
+			done
+		fi
+	fi
+	if [ ! -z "${PACKAGE_INSTALL}" ]; then
+		fakechroot yum ${YUMARGS} -y install ${PACKAGE_INSTALL}
+	fi
+
+	#export D=${IMAGE_ROOTFS}
+	#export OFFLINE_ROOT=${IMAGE_ROOTFS}
+	#export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
+	#export OPKG_OFFLINE_ROOT=${IPKG_OFFLINE_ROOT}
+
+	#mkdir -p ${IMAGE_ROOTFS}/etc/opkg/
+	#grep "^arch" ${IPKGCONF_TARGET} >${IMAGE_ROOTFS}/etc/opkg/arch.conf
+
+	${ROOTFS_POSTINSTALL_COMMAND}
+	
+	#for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.preinst; do
+	#	if [ -f $i ] && ! sh $i; then
+	#		opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .preinst`
+	#	fi
+	#done
+	#for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.postinst; do
+	#	if [ -f $i ] && ! sh $i configure; then
+	#		opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .postinst`
+	#	fi
+	#done
+
+	install -d ${IMAGE_ROOTFS}/${sysconfdir}
+	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
+
+	${ROOTFS_POSTPROCESS_COMMAND}
+	
+	rm -rf ${IMAGE_ROOTFS}/var/cache2/
+	rm -rf ${IMAGE_ROOTFS}/var/run2/
+	rm -rf ${IMAGE_ROOTFS}/var/log2/
+
+	log_check rootfs 	
+}
+
+rootfs_rpm_log_check() {
+	target="$1"
+        lf_path="$2"
+
+	lf_txt="`cat $lf_path`"
+	for keyword_die in "Cannot find package" "exit 1" ERR Fail
+	do				
+		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
+		then
+			echo "log_check: There were error messages in the logfile"
+			echo -e "log_check: Matched keyword: [$keyword_die]\n"
+			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
+			echo ""
+			do_exit=1				
+		fi
+	done
+	test "$do_exit" = 1 && exit 1
+	true
+}
+
+remove_packaging_data_files() {
+	rm -rf ${IMAGE_ROOTFS}/usr/lib/opkg/
+}
+
+install_all_locales() {
+
+    PACKAGES_TO_INSTALL=""
+
+	INSTALLED_PACKAGES=`grep ^Package: ${IMAGE_ROOTFS}${libdir}/opkg/status |sed "s/^Package: //"|egrep -v -- "(-locale-|-dev$|-doc$|^kernel|^glibc|^ttf|^task|^perl|^python)"`
+
+    for pkg in $INSTALLED_PACKAGES
+    do
+        for lang in ${IMAGE_LOCALES}
+        do
+            if [ `opkg-cl ${IPKG_ARGS} info $pkg-locale-$lang | wc -l` -gt 2 ]
+            then
+                    PACKAGES_TO_INSTALL="$PACKAGES_TO_INSTALL $pkg-locale-$lang"
+            fi
+        done
+    done
+    if [ "$PACKAGES_TO_INSTALL" != "" ]
+    then
+        opkg-cl ${IPKG_ARGS} install $PACKAGES_TO_INSTALL
+    fi
+}
+
-- 
1.6.1.3





