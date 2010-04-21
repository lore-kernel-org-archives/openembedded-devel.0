Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1O4YzS-00039M-8I
	for openembedded-devel@linuxtogo.org; Wed, 21 Apr 2010 14:25:42 +0200
Received: by ewy25 with SMTP id 25so2648406ewy.27
	for <openembedded-devel@linuxtogo.org>;
	Wed, 21 Apr 2010 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Af8UiD5VxngHIk1+LBH9fV0/GsNmES7PfQAwaiiwpms=;
	b=SFQDukD6pJP1KM4W749438R54vYaHmGwIHAPWTw4GwFbpy53v/WCYsMNLAAI1ag+YN
	4GpEOeGog0X419bBqcMjdrSV8BFRMbs4oxrR21LwWUkMuekpnMBDMkwCr185kUS6S1q8
	0rGhcyudxYrXN7oe7P2Md3TAoakjFYxl2JRcw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hKkexBgPZKRYaewFe13ABcKWan329RBFePAYzHctx+CK60VWvGy/pk8QmeZiWneoD4
	xE5MErh0NmvaTyZTxi27AES7MBoaCk6cwhSV022m/SAmUpwHvyrWiAw52cqIZK1Wc6fh
	IAeK8NPTLdAIX/HdMi/TUN7RPrbpjGZ8KF9d8=
Received: by 10.213.56.142 with SMTP id y14mr4223367ebg.97.1271852493975;
	Wed, 21 Apr 2010 05:21:33 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 16sm5215667ewy.7.2010.04.21.05.21.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Apr 2010 05:21:32 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@linuxtogo.org
Date: Wed, 21 Apr 2010 14:21:11 +0200
Message-Id: <1271852471-16659-1-git-send-email-koen.kooi@gmail.com>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [RFC][PATCH] meta-toolchain: use MULTIMACH_TARGET_SYS instead of TARGET_SYS
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
X-List-Received-Date: Wed, 21 Apr 2010 12:27:28 -0000

From: Koen Kooi <koen@openembedded.org>

This is the first step to be able to mix multiple arm archs (and ABIs) when installing multiple SDKs on one buildhost (e.g. armv4 and armv7a).

---
 recipes/meta/meta-toolchain.bb |   50 ++++++++++++++++++++--------------------
 1 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index adc057a..2e2196a 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -10,7 +10,7 @@ SDK_OUTPUT2 = "${SDK_DIR}/image-extras"
 SDK_DEPLOY = "${DEPLOY_DIR}/sdk"
 
 IPKG_HOST = "opkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
-IPKG_TARGET = "opkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}"
+IPKG_TARGET = "opkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}"
 
 TOOLCHAIN_HOST_TASK ?= "task-sdk-host"
 TOOLCHAIN_TARGET_TASK ?= "task-sdk-bare"
@@ -26,14 +26,14 @@ RDEPENDS = "${DISTRO_FEED_CONFIGS} ${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TAS
 TOOLCHAIN_FEED_URI ?= "${DISTRO_FEED_URI}"
 
 modify_opkg_conf () {
-        OUTPUT_OPKGCONF_TARGET="${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}/opkg.conf"
-        OUTPUT_OPKGCONF_HOST="${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}/opkg-sdk.conf"
+        OUTPUT_OPKGCONF_TARGET="${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sysconfdir}/opkg.conf"
+        OUTPUT_OPKGCONF_HOST="${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sysconfdir}/opkg-sdk.conf"
         OUTPUT_OPKGCONF_SDK="${SDK_OUTPUT}/${sysconfdir}/opkg-sdk.conf"
         rm -f ${OUTPUT_OPKGCONF_TARGET}
         rm -f ${OUTPUT_OPKGCONF_HOST}
         rm -f ${OUTPUT_OPKGCONF_SDK}
 
-        if [ -e ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}/opkg/arch.conf ] ; then
+        if [ -e ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sysconfdir}/opkg/arch.conf ] ; then
             echo "Creating empty opkg.conf since arch.conf is already present"
             echo > ${OUTPUT_OPKGCONF_TARGET} 
         else
@@ -53,7 +53,7 @@ do_populate_sdk() {
 	rm -rf ${SDK_OUTPUT}
 	mkdir -p ${SDK_OUTPUT}
 	mkdir -p ${SDK_OUTPUT}${libdir}/opkg/
-	mkdir -p ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}${libdir}/opkg/
+	mkdir -p ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}${libdir}/opkg/
 
 	package_generate_ipkg_conf
 
@@ -79,17 +79,17 @@ do_populate_sdk() {
 	# Clean up empty directories from excluded packages
 	find ${SDK_OUTPUT} -depth -type d -empty -print0 | xargs -r0 /bin/rmdir
 
-	install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}
-	install -m 0644 ${IPKGCONF_TARGET} ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}/
+	install -d ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sysconfdir}
+	install -m 0644 ${IPKGCONF_TARGET} ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/${sysconfdir}/
 
 	install -d ${SDK_OUTPUT}/${SDKPATH}/${sysconfdir}
 	install -m 0644 ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATH}/${sysconfdir}/
 
 	# extract and store ipks, pkgdata and shlibs data
-	target_pkgs=`cat ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/usr/lib/opkg/status | grep Package: | cut -f 2 -d ' '`
+	target_pkgs=`cat ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/usr/lib/opkg/status | grep Package: | cut -f 2 -d ' '`
 	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/ipk/
 	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/pkgdata/runtime/
-	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/${TARGET_SYS}/shlibs/
+	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/shlibs/
 	for pkg in $target_pkgs ; do
 		for arch in $revipkgarchs; do
 			pkgnames=${DEPLOY_DIR_IPK}/$arch/${pkg}_*_$arch.ipk
@@ -107,7 +107,7 @@ do_populate_sdk() {
 						cp ${TMPDIR}/pkgdata/$pkg_subdir/runtime/$subpkg.packaged ${SDK_OUTPUT2}/${SDKPATH}/pkgdata/$pkg_subdir/runtime/
 					fi
 					if [ -e ${STAGING_DIR_TARGET}/shlibs/$subpkg.list ]; then
-						cp ${STAGING_DIR_TARGET}/shlibs/$subpkg.* ${SDK_OUTPUT2}/${SDKPATH}/${TARGET_SYS}/shlibs/
+						cp ${STAGING_DIR_TARGET}/shlibs/$subpkg.* ${SDK_OUTPUT2}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/shlibs/
 					fi
 				done
 				break
@@ -119,20 +119,20 @@ do_populate_sdk() {
 	# libgcc-dev should be responsible for that, but it's not getting built
 	# RP: it gets smashed up depending on the order that gcc, gcc-cross and 
 	# gcc-cross-sdk get built :( (30/11/07)
-	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/lib/libgcc_s.so
+	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/lib/libgcc_s.so
 
 	# With sysroot support, gcc expects the default C++ headers to be
 	# in a specific place.
-	install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include
-	mv ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/usr/include/c++ \
-		${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include/
+	install -d ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/include
+	mv ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/usr/include/c++ \
+		${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS}/include/
 
 	# Fix or remove broken .la files
-	for i in `find ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS} -name \*.la`; do
-		sed -i 	-e "/^dependency_libs=/s,\([[:space:]']\)${base_libdir},\1\$SDK_PATH/\$TARGET_SYS${base_libdir},g" \
-			-e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1\$SDK_PATH/\$TARGET_SYS${libdir},g" \
-			-e "/^dependency_libs=/s,\-\([LR]\)${base_libdir},-\1\$SDK_PATH/\$TARGET_SYS${base_libdir},g" \
-			-e "/^dependency_libs=/s,\-\([LR]\)${libdir},-\1\$SDK_PATH/\$TARGET_SYS${libdir},g" \
+	for i in `find ${SDK_OUTPUT}/${SDKPATH}/${MULTIMACH_TARGET_SYS} -name \*.la`; do
+		sed -i 	-e "/^dependency_libs=/s,\([[:space:]']\)${base_libdir},\1\$SDK_PATH/\$MULTIMACH_TARGET_SYS${base_libdir},g" \
+			-e "/^dependency_libs=/s,\([[:space:]']\)${libdir},\1\$SDK_PATH/\$MULTIMACH_TARGET_SYS${libdir},g" \
+			-e "/^dependency_libs=/s,\-\([LR]\)${base_libdir},-\1\$SDK_PATH/\$MULTIMACH_TARGET_SYS${base_libdir},g" \
+			-e "/^dependency_libs=/s,\-\([LR]\)${libdir},-\1\$SDK_PATH/\$MULTIMACH_TARGET_SYS${libdir},g" \
 			-e 's/^installed=yes$/installed=no/' $i
 	done
 	rm -f ${SDK_OUTPUT}/${SDKPATH}/lib/*.la
@@ -148,15 +148,15 @@ do_populate_sdk() {
 	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
 	touch $script
 	echo 'export SDK_PATH=${SDKPATH}' >> $script
-	echo 'export TARGET_SYS=${TARGET_SYS}' >> $script
+	echo 'export MULTIMACH_TARGET_SYS=${MULTIMACH_TARGET_SYS}' >> $script
 	echo 'export PATH=$SDK_PATH/bin:$PATH' >> $script
-	echo 'export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
-	echo 'export LIBTOOL_SYSROOT_PATH=$SDK_PATH/$TARGET_SYS' >> $script
-	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
-	echo 'export PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
+	echo 'export CPATH=$SDK_PATH/$MULTIMACH_TARGET_SYS/usr/include:$CPATH' >> $script
+	echo 'export LIBTOOL_SYSROOT_PATH=$SDK_PATH/$MULTIMACH_TARGET_SYS' >> $script
+	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$MULTIMACH_TARGET_SYS' >> $script
+	echo 'export PKG_CONFIG_PATH=$SDK_PATH/$MULTIMACH_TARGET_SYS${libdir}/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=$SDK_PATH/site-config' >> $script
 	echo 'alias opkg="LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/${sysconfdir}/opkg-sdk.conf -o $SDK_PATH"' >> $script
-	echo 'alias opkg-target="LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/$TARGET_SYS${sysconfdir}/opkg.conf -o $SDK_PATH/$TARGET_SYS"' >> $script
+	echo 'alias opkg-target="LD_LIBRARY_PATH=$SDK_PATH/lib $SDK_PATH/bin/opkg-cl -f $SDK_PATH/$MULTIMACH_TARGET_SYS${sysconfdir}/opkg.conf -o $SDK_PATH/$MULTIMACH_TARGET_SYS"' >> $script
 
 	# Add version information
 	versionfile=${SDK_OUTPUT}/${SDKPATH}/version
-- 
1.6.6.1



