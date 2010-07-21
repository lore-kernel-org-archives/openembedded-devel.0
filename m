Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ObdfG-0002n6-EK
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 20:05:12 +0200
Received: by pzk2 with SMTP id 2so2472268pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 11:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=DeC0UofVO4tvbA4BzqeXmkW1T+2bsuvYuvAa8UVgkGA=;
	b=TusjXwXfEoHIWKt2IIasYPo0P0DsTn3Xubti3dlUqKAnpoZFlHjkiPwOKcfSZzXuzR
	zOa9PL5izYqTdThsQXfukPorNSgis8PXhtpFo27q9JvpTJnhVyQg+I3Y+F+IxPXWoyF9
	+Cwli5pZ/FrTGEuToS0GvIuvwX3aOTudCz1C4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YZv8YXQHJ0yhO4FXc58ZTW4LtNwCaNqmoKy7aXRCL+tZCJzCkjvhbny+jLIYeN9uMF
	apB3xor5EoJx/obwDEtDnD6dq/IPTrSlzphK3S8lvWdT4cNINZEIrSY65mdKrHf8iMpm
	kmWcpeMqUl5+aDAw4NQB23sQX0cpJIPnrfFmE=
Received: by 10.142.139.5 with SMTP id m5mr642663wfd.165.1279735494484;
	Wed, 21 Jul 2010 11:04:54 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm9343482wfl.1.2010.07.21.11.04.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Jul 2010 11:04:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 11:04:44 -0700
Message-Id: <1279735486-7050-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] toolchain: Remove references to CROSS_DIR
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
X-List-Received-Date: Wed, 21 Jul 2010 18:05:12 -0000

* Toolchain is installed into native sysroot now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/binutils/binutils-cross.inc                |   20 +++++++++---------
 recipes/eglibc/eglibc-package.bbclass              |    4 +-
 recipes/gcc/gcc-configure-sdk.inc                  |   22 ++++++++++----------
 recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb    |    4 +-
 .../gcc/gcc-cross-intermediate_csl-arm-2007q3.bb   |    4 +-
 recipes/gcc/gcc-cross-kernel.inc                   |    2 +-
 recipes/gcc/gcc-cross-sdk_3.4.4.bb                 |    4 +-
 recipes/gcc/gcc-cross_csl-arm-2007q3.bb            |    6 ++--
 recipes/gcc/gcc-cross_csl-arm-2008q1.bb            |    6 ++--
 recipes/gcc/gcc-cross_csl-arm-2008q3.bb            |    6 ++--
 recipes/gcc/gcc-package-cross.inc                  |    8 +++---
 11 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/recipes/binutils/binutils-cross.inc b/recipes/binutils/binutils-cross.inc
index 432e1a7..f3ba5c3 100644
--- a/recipes/binutils/binutils-cross.inc
+++ b/recipes/binutils/binutils-cross.inc
@@ -16,14 +16,14 @@ do_install () {
 	${D}${libdir}/libiberty_pic.a
 
 	# We don't really need these, so we'll remove them...
-	rm -rf ${D}${CROSS_DIR}/lib/ldscripts
-	rm -rf ${D}${CROSS_DIR}/share/info
-	rm -rf ${D}${CROSS_DIR}/share/locale
-	rm -rf ${D}${CROSS_DIR}/share/man
-	rmdir ${D}${CROSS_DIR}/share || :
-	rmdir ${D}${CROSS_DIR}/${libdir}/gcc-lib || :
-	rmdir ${D}${CROSS_DIR}/${libdir}64/gcc-lib || :
-	rmdir ${D}${CROSS_DIR}/${libdir} || :
-	rmdir ${D}${CROSS_DIR}/${libdir}64 || :
-	rmdir ${D}${CROSS_DIR}/${prefix} || :
+	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/lib/ldscripts
+	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/share/info
+	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/share/locale
+	rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/share/man
+	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/share || :
+	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}/gcc-lib || :
+	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}64/gcc-lib || :
+	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir} || :
+	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}64 || :
+	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${prefix} || :
 }
diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index 3dc97b4..4e286af 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -169,8 +169,8 @@ do_prep_locale_tree() {
 		gunzip $i
 	done
 	ls -d ${PKGD}${base_libdir}/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
-	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* ]; then
-		cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* $treedir/lib
+	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.* ]; then
+		cp -pPR ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.* $treedir/lib
 	fi
 	install -m 0755 ${PKGD}${bindir}/localedef $treedir/bin
 }
diff --git a/recipes/gcc/gcc-configure-sdk.inc b/recipes/gcc/gcc-configure-sdk.inc
index 205b106..d5a5942 100644
--- a/recipes/gcc/gcc-configure-sdk.inc
+++ b/recipes/gcc/gcc-configure-sdk.inc
@@ -5,23 +5,23 @@ USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibceabi", "no", "", d )}'
 
 EXTRA_OECONF_PATHS = "--with-sysroot=${prefix}/${TARGET_SYS} \
-                      --with-build-time-tools=${CROSS_DIR}/${TARGET_SYS}/bin \
+                      --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
 #
 # gcc-cross looks and finds these in ${exec_prefix} but we're not so lucky
 # for the sdk. Hardcoding the paths ensures the build doesn't go canadian or worse.
 #
-export AR_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/ar"
-export AS_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/as"
-export DLLTOOL_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/dlltool"
-export LD_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/ld"
-export LIPO_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/lipo"
-export NM_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/nm"
-export OBJDUMP_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/objdump"
-export RANLIB_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/ranlib"
-export STRIP_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/strip"
-export WINDRES_FOR_TARGET = "${CROSS_DIR}/${TARGET_SYS}/bin/windres"
+export AR_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ar"
+export AS_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/as"
+export DLLTOOL_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/dlltool"
+export LD_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ld"
+export LIPO_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/lipo"
+export NM_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/nm"
+export OBJDUMP_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/objdump"
+export RANLIB_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ranlib"
+export STRIP_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/strip"
+export WINDRES_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/windres"
 
 #
 # We need to override this and make sure the compiler can find staging
diff --git a/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
index 908b612..dd60164 100644
--- a/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
@@ -5,6 +5,6 @@ S = "${WORKDIR}/gcc-4.2"
 
 # Hack till we fix *libc properly
 do_install_append() {
-	install -d ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
-	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+	install -d ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include/
 }
diff --git a/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
index 89e6a85..b9b34b6 100644
--- a/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
@@ -5,6 +5,6 @@ S = "${WORKDIR}/gcc-4.2"
 
 # Hack till we fix *libc properly
 do_install_append() {
-	install -d ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include
-	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+	install -d ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include
+	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include/
 }
diff --git a/recipes/gcc/gcc-cross-kernel.inc b/recipes/gcc/gcc-cross-kernel.inc
index c0a8de7..e6f1fb8 100644
--- a/recipes/gcc/gcc-cross-kernel.inc
+++ b/recipes/gcc/gcc-cross-kernel.inc
@@ -19,5 +19,5 @@ do_compile () {
 do_stage () {
 	cd gcc
 	oe_runmake installdirs install-common install-headers install-libgcc
-	install -m 0755 xgcc ${CROSS_DIR}/bin/${TARGET_PREFIX}gcc-${PV}
+	install -m 0755 xgcc ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gcc-${PV}
 }
diff --git a/recipes/gcc/gcc-cross-sdk_3.4.4.bb b/recipes/gcc/gcc-cross-sdk_3.4.4.bb
index 16ca9e4..a885c07 100644
--- a/recipes/gcc/gcc-cross-sdk_3.4.4.bb
+++ b/recipes/gcc/gcc-cross-sdk_3.4.4.bb
@@ -7,7 +7,7 @@ SRC_URI += 'file://sdk-libstdc++-includes.patch'
 
 do_compile_prepend () {
 	mkdir -p gcc
-	ln -s ${CROSS_DIR}/bin/${TARGET_PREFIX}as gcc/as 
-	ln -s ${CROSS_DIR}/bin/${TARGET_PREFIX}ld gcc/ld
+	ln -s ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}as gcc/as 
+	ln -s ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}ld gcc/ld
 }
 
diff --git a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
index 945e8ac..70c869e 100644
--- a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
@@ -14,9 +14,9 @@ LDFLAGS = ""
 
 # staging-linkage and cross-linkage recipes don't work anymore, so do it by hand for this backwards CSL toolchain
 do_compile_prepend() {
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${CROSS_DIR}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${CROSS_DIR}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${CROSS_DIR}/${TARGET_SYS}/lib/ 
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ 
 	sed -i -e 's:gcc_no_link=yes:gcc_no_link=no:' ${S}/libstdc++-v3/configure
 
 }
diff --git a/recipes/gcc/gcc-cross_csl-arm-2008q1.bb b/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
index a3edb28..7ed0f51 100644
--- a/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
+++ b/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
@@ -14,9 +14,9 @@ LDFLAGS = ""
 
 # staging-linkage and cross-linkage recipes don't work anymore, so do it by hand for this backwards CSL toolchain
 do_compile_prepend() {
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${CROSS_DIR}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${CROSS_DIR}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${CROSS_DIR}/${TARGET_SYS}/lib/ 
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ 
 	sed -i -e 's:gcc_no_link=yes:gcc_no_link=no:' ${S}/libstdc++-v3/configure
 
 }
diff --git a/recipes/gcc/gcc-cross_csl-arm-2008q3.bb b/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
index 88b222e..9ada568 100644
--- a/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
+++ b/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
@@ -14,9 +14,9 @@ LDFLAGS = ""
 
 # staging-linkage and cross-linkage recipes don't work anymore, so do it by hand for this backwards CSL toolchain
 do_compile_prepend() {
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${CROSS_DIR}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${CROSS_DIR}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${CROSS_DIR}/${TARGET_SYS}/lib/ 
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ 
 	sed -i -e 's:gcc_no_link=yes:gcc_no_link=no:' ${S}/libstdc++-v3/configure
 
 }
diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index 95936ed..6978340 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -38,12 +38,12 @@ do_install () {
      
 	# Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
 	# gfortran is fully backwards compatible. This is a safe and practical solution.
-	if [ -f ${D}${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
+	if [ -f ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran ]; then
 		currdir="$PWD"
-		cd ${D}${CROSS_DIR}/bin/
+		cd ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/
 		ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
-		if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ; then 
-			cd ${CROSS_DIR}/${TARGET_SYS}/bin/
+		if [ -d ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ ] ; then 
+			cd ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/
 			ln -sf gfortran g77 || true
 		fi
 		cd $currdir
-- 
1.7.1



