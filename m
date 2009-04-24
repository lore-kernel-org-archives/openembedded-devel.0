Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWR-0006eG-B9
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:45:11 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090424164020.JENU10385.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>;
	Fri, 24 Apr 2009 12:40:20 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgLuS; Fri, 24 Apr 2009 12:40:20 -0400
X-Authority-Analysis: v=1.0 c=1 a=4rudoNWt6SEA:10 a=fNm-rEa56GoA:10
	a=4HVRqb_MAAAA:8 a=WWXsFYDd0ou2dpjGiMkA:9 a=eh5tB9pT3fMehnhVc84A:7
	a=_QfvyFCOqjP9YdKX6vELB4ysySgA:4 a=k-kO48AawpMA:10
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:11:58 -0700
Message-Id: <1240589520-1104-11-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1240589520-1104-10-git-send-email-trini@kernel.crashing.org>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-7-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-8-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-9-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-10-git-send-email-trini@kernel.crashing.org>
Cc: David Huggins-Daines <dhuggins@cs.cmu.edu>
Subject: [PATCH][STABLE] canadian-sdk: Synchronize (to some extent) canadian-sdk.bb with meta-toolchain.bb.
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
X-List-Received-Date: Fri, 24 Apr 2009 16:46:09 -0000

From: David Huggins-Daines <dhuggins@cs.cmu.edu>


Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 recipes/meta/canadian-sdk.bb |  130 ++++++++++++++++++++++++++----------------
 1 files changed, 81 insertions(+), 49 deletions(-)

diff --git a/recipes/meta/canadian-sdk.bb b/recipes/meta/canadian-sdk.bb
index 9126c7e..809173b 100644
--- a/recipes/meta/canadian-sdk.bb
+++ b/recipes/meta/canadian-sdk.bb
@@ -1,25 +1,57 @@
 DESCRIPTION = "Meta package for building a installable toolchain"
 LICENSE = "MIT"
-DEPENDS = "ipkg-native ipkg-utils-native fakeroot-native sed-native zip-native"
-PR = "r3"
+DEPENDS = "opkg-native ipkg-utils-native fakeroot-native sed-native zip-native"
+PR = "r4"
+
+# NOTE: We need to save and restore PACKAGE_ARCHS, because sdk.bbclass
+# will change HOST_ARCH, which can result in SITEINFO_ENDIANESS (which
+# is computed in siteinfo.bbclass) in changing if the original HOST_ARCH
+# endianess differs from the new HOST_ARCH endianess.  SITEINFO_ENDIANNESS
+# is used in a number of places, including the construction of the
+# PACKAGE_EXTRA_ARCHS list for machines that are capable of running in
+# either endianess.  There may be better ways to fix this.
+
+# Save value of PACKAGE_ARCHS (note the ":=" syntax to force immediate eval)
+REAL_PACKAGE_ARCHS := "${PACKAGE_ARCHS}"
 
 inherit canadian-sdk meta
 
+# Restore PACKAGE_ARCHS (sdk.bbclass may have caused it to change)
+PACKAGE_ARCHS := "${REAL_PACKAGE_ARCHS}"
+
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
-SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
-SDK_SUFFIX = "toolchain"
+SDK_DEPLOY = "${DEPLOY_DIR}/sdk"
 
-FEED_ARCH ?= "${TARGET_ARCH}"
-
-IPKG_HOST = "ipkg-cl -f ${IPKGCONF_CANSDK} -o ${SDK_OUTPUT}"
-IPKG_TARGET = "ipkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}${prefix}"
+IPKG_HOST = "opkg-cl -f ${IPKGCONF_CANSDK} -o ${SDK_OUTPUT}"
+IPKG_TARGET = "opkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/${SDK_PATH}/${TARGET_SYS}"
 
 TOOLCHAIN_CANADIAN_HOST_TASK ?= "task-sdk-canadian-host"
 TOOLCHAIN_TARGET_TASK ?= "task-sdk-bare"
+FEED_ARCH ?= "${TARGET_ARCH}"
+SDK_SUFFIX = "toolchain"
+TOOLCHAIN_OUTPUTNAME ?= "${SDK_SYS}-${DISTRO}-${DISTRO_VERSION}-${FEED_ARCH}-${TARGET_OS}-${SDK_SUFFIX}"
 
 RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_CANADIAN_HOST_TASK}"
 
+TOOLCHAIN_FEED_URI ?= "${DISTRO_FEED_URI}"
+
+modify_opkg_conf () {
+        OUTPUT_OPKGCONF_TARGET="${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/${layout_sysconfdir}/opkg.conf"
+        OUTPUT_OPKGCONF_HOST="${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/${layout_sysconfdir}/opkg-canadian-sdk.conf"
+        OUTPUT_OPKGCONF_SDK="${SDK_OUTPUT}/${sysconfdir}/opkg-canadian-sdk.conf"
+        rm ${OUTPUT_OPKGCONF_TARGET}
+        rm ${OUTPUT_OPKGCONF_HOST}
+        rm ${OUTPUT_OPKGCONF_SDK}
+        opkgarchs="${PACKAGE_ARCHS}"
+        priority=1
+        for arch in ${opkgarchs}; do
+                echo "arch ${arch} ${priority}" >> ${OUTPUT_OPKGCONF_TARGET};
+                echo "src/gz ${arch} ${TOOLCHAIN_FEED_URI}/${arch}" >> ${OUTPUT_OPKGCONF_TARGET};
+                priority=$(expr ${priority} + 5);
+        done
+}
+
 do_populate_sdk() {
 	rm -rf ${SDK_OUTPUT}
 	mkdir -p ${SDK_OUTPUT}
@@ -31,41 +63,26 @@ do_populate_sdk() {
 		revipkgarchs="$arch $revipkgarchs"
 	done
 
+	mkdir -p ${SDK_OUTPUT}/usr/lib/opkg
 	${IPKG_HOST} update
 	${IPKG_HOST} -force-depends install ${TOOLCHAIN_CANADIAN_HOST_TASK}
 
+	mkdir -p ${SDK_OUTPUT}/${SDK_PATH}/${TARGET_SYS}/usr/lib/opkg
 	${IPKG_TARGET} update
 	${IPKG_TARGET} install ${TOOLCHAIN_TARGET_TASK}
 
-	mkdir -p ${SDK_OUTPUT}${prefix}/${TARGET_SYS}
-	cp -pPR ${SDK_OUTPUT}${prefix}/usr ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/
-	rm -rf ${SDK_OUTPUT}${prefix}/usr
-
-	cp -pPR ${SDK_OUTPUT}${prefix}/lib/* ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/
-	rm -rf ${SDK_OUTPUT}${prefix}/lib/*
-
-	cp -pPR ${SDK_OUTPUT}/usr/lib/ipkg ${SDK_OUTPUT}${prefix}/lib/
-	rm -rf ${SDK_OUTPUT}/usr/lib/ipkg/*
-	rmdir -p --ignore-fail-on-non-empty ${SDK_OUTPUT}/usr/lib/ipkg
-
-	for fn in `ls ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/`; do
-		if [ -h ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/$fn ]; then
-			link=`readlink ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/$fn`
-			bname=`basename $link`
-			if [ ! -e $link -a -e ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/$bame ]; then
-				rm ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/$fn
-				ln -s $bname ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/$fn
-			fi
-		fi
-	done
+	install -d ${SDK_OUTPUT}/${prefix}/usr/lib/opkg
+	mv ${SDK_OUTPUT}/usr/lib/opkg/* ${SDK_OUTPUT}/${prefix}/usr/lib/opkg/
+	rm -Rf ${SDK_OUTPUT}/usr/lib
 
-	mv ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/gcc ${SDK_OUTPUT}${prefix}/lib
+	install -d ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/${layout_sysconfdir}
+	install -m 0644 ${IPKGCONF_TARGET} ${IPKGCONF_CANSDK} ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/${layout_sysconfdir}/
 
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/libc.so
+	install -d ${SDK_OUTPUT}/${sysconfdir}
+	install -m 0644 ${IPKGCONF_CANSDK} ${SDK_OUTPUT}/${sysconfdir}/
 
 	# extract and store ipks, pkgdata and shlibs data
-	target_pkgs=`cat ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/usr/lib/ipkg/status | grep Package: | cut -f 2 -d ' '`
+	target_pkgs=`cat ${SDK_OUTPUT}/${prefix}/package-status | grep Package: | cut -f 2 -d ' '`
 	mkdir -p ${SDK_OUTPUT}/${prefix}/ipk/
 	mkdir -p ${SDK_OUTPUT}/${prefix}/pkgdata/runtime/
 	mkdir -p ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/shlibs/
@@ -78,12 +95,12 @@ do_populate_sdk() {
 				orig_pkg=`ipkg-list-fields $pkgnames | grep OE: | cut -d ' ' -f2`
 				pkg_subdir=$arch${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}
 				mkdir -p ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/runtime
-				cp ${TMPDIR}/pkgdata/$pkg_subdir/$orig_pkg ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/
-				subpkgs=`cat ${TMPDIR}/pkgdata/$pkg_subdir/$orig_pkg | grep PACKAGES: | cut -b 10-`
+				cp ${STAGING_DIR}/pkgdata/$pkg_subdir/$orig_pkg ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/
+				subpkgs=`cat ${STAGING_DIR}/pkgdata/$pkg_subdir/$orig_pkg | grep PACKAGES: | cut -b 10-`
 				for subpkg in $subpkgs; do
-					cp ${TMPDIR}/pkgdata/$pkg_subdir/runtime/$subpkg ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/runtime/
-					if [ -e ${TMPDIR}/pkgdata/$pkg_subdir/runtime/$subpkg.packaged ];then
-						cp ${TMPDIR}/pkgdata/$pkg_subdir/runtime/$subpkg.packaged ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/runtime/
+					cp ${STAGING_DIR}/pkgdata/$pkg_subdir/runtime/$subpkg ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/runtime/
+					if [ -e ${STAGING_DIR}/pkgdata/$pkg_subdir/runtime/$subpkg.packaged ];then
+						cp ${STAGING_DIR}/pkgdata/$pkg_subdir/runtime/$subpkg.packaged ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/runtime/
 					fi
 					if [ -e ${STAGING_DIR_TARGET}/shlibs/$subpkg.list ]; then
 						cp ${STAGING_DIR_TARGET}/shlibs/$subpkg.* ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/shlibs/
@@ -96,7 +113,7 @@ do_populate_sdk() {
 
 	# add missing link to libgcc_s.so.1
 	# libgcc-dev should be responsible for that, but it's not getting built
-	# RP: it gets smashed up depending on the order that gcc, gcc-cross and
+	# RP: it gets smashed up depending on the order that gcc, gcc-cross and 
 	# gcc-cross-sdk get built :( (30/11/07)
 	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/lib/libgcc_s.so
 
@@ -122,21 +139,36 @@ do_populate_sdk() {
 	for sitefile in ${CONFIG_SITE} ; do
 		cat $sitefile >> $siteconfig
 	done
-}
 
-do_package_sdk() {
-	# package it up
+	# Create environment setup script
+	script=${SDK_OUTPUT}/${prefix}/environment-setup
+	touch $script
+	echo 'export PATH=${prefix}/bin:$PATH' >> $script
+	echo 'export LIBTOOL_SYSROOT_PATH=${prefix}/${TARGET_SYS}' >> $script
+	echo 'export PKG_CONFIG_SYSROOT_DIR=${prefix}/${TARGET_SYS}' >> $script
+	echo 'export PKG_CONFIG_PATH=${prefix}/${TARGET_SYS}${layout_libdir}/pkgconfig' >> $script
+	echo 'export CONFIG_SITE=${prefix}/site-config' >> $script
+	echo "alias opkg='LD_LIBRARY_PATH=${prefix}/lib ${prefix}/bin/opkg-cl -f ${sysconfdir}/opkg-canadian-sdk.conf -o ${prefix}'" >> $script
+	echo "alias opkg-target='LD_LIBRARY_PATH=${prefix}/lib ${prefix}/bin/opkg-cl -f ${prefix}/${TARGET_SYS}${layout_sysconfdir}/opkg.conf -o ${prefix}/${TARGET_SYS}'" >> $script
+
+	# Add version information
+	versionfile=${SDK_OUTPUT}/${prefix}/version
+	touch $versionfile
+	echo 'Distro: ${DISTRO}' >> $versionfile
+	echo 'Distro Version: ${DISTRO_VERSION}' >> $versionfile
+	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
+	echo 'Timestamp: ${DATETIME}' >> $versionfile
+
+	modify_opkg_conf
+
+	# Package it up
 	mkdir -p ${SDK_DEPLOY}
 	cd ${SDK_OUTPUT}
-	fakeroot tar cfj ${SDK_DEPLOY}/${SDK_SYS}-sdk-${DISTRO}-${DISTRO_VERSION}-${FEED_ARCH}-${TARGET_OS}.tar.bz2 .${prefix}
-	rm -f ${SDK_DEPLOY}/${SDK_SYS}-sdk-${DISTRO}-${DISTRO_VERSION}-${FEED_ARCH}-${TARGET_OS}.zip
-	zip -r -D ${SDK_DEPLOY}/${SDK_SYS}-sdk-${DISTRO}-${DISTRO_VERSION}-${FEED_ARCH}-${TARGET_OS}.zip .${prefix}
+	fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+	rm -f ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.zip
+	zip -r -D ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.zip .
 }
 
 do_populate_sdk[nostamp] = "1"
 do_populate_sdk[recrdeptask] = "do_package_write"
 addtask populate_sdk before do_build after do_install
-
-do_package_sdk[nostamp] = "1"
-do_package_sdk[recrdeptask] = "do_populate_sdk"
-addtask package_sdk before do_build after do_populate_sdk
-- 
1.5.6.3



