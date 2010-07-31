Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Of4iY-0005uZ-D1
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 07:34:44 +0200
Received: by pvg13 with SMTP id 13so831261pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 22:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=k8/mwJiGdWim9haA8qjd0LThv0Agf8pVHa5uFd2Rvwc=;
	b=BIVaL1Ac5KhgWtJJT0kTlzuyTNQjdSInMm0WCkTgJwZnzcaMl1E6Ej1jZ3AeNL4Btl
	9nMfdY9G6ht2bF3AcUka0CnuevUp/fKWCsnhb01S0rC8bgqYYe8OEwgJ2PuFVY2eZMOg
	i8uC1rXK870+P4xLDjnDQ8L9j4A66NEHqD+tU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rdlJmWPF03fAg6q6JaoeC22foKxal7oF6ALnOJdpl95JinAXkS6fp4cSTttTgRlaUt
	G3dMd4f2I9vAOoE79ra1rmepOJo3pKRK4465giVNE9zo8dNsB5e1E73BuSyl9n4dq283
	se3/SnPCx0uPgyhY9nk8XmJE3taF9D5MbIwyU=
Received: by 10.114.13.2 with SMTP id 2mr3498746wam.155.1280554460114;
	Fri, 30 Jul 2010 22:34:20 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n32sm5308381wag.23.2010.07.30.22.34.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Jul 2010 22:34:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 22:34:09 -0700
Message-Id: <1280554451-27780-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/5] gcc, eglibc: Use the paths for mutli-machine safe toolchain install.
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
X-List-Received-Date: Sat, 31 Jul 2010 05:34:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc-package.bbclass              |    2 +-
 recipes/gcc/gcc-configure-sdk.inc                  |   22 ++++++++++----------
 recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb    |    4 +-
 .../gcc/gcc-cross-intermediate_csl-arm-2007q3.bb   |    4 +-
 recipes/gcc/gcc-cross-kernel.inc                   |    2 +-
 recipes/gcc/gcc-cross-sdk_3.4.4.bb                 |    4 +-
 recipes/gcc/gcc-cross_csl-arm-2007q3.bb            |    6 ++--
 recipes/gcc/gcc-cross_csl-arm-2008q1.bb            |    6 ++--
 recipes/gcc/gcc-cross_csl-arm-2008q3.bb            |    6 ++--
 recipes/gcc/gcc-package-cross.inc                  |    8 +++---
 10 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index 4e286af..a041f93 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -170,7 +170,7 @@ do_prep_locale_tree() {
 	done
 	ls -d ${PKGD}${base_libdir}/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
 	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.* ]; then
-		cp -pPR ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.* $treedir/lib
+		cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.* $treedir/lib
 	fi
 	install -m 0755 ${PKGD}${bindir}/localedef $treedir/bin
 }
diff --git a/recipes/gcc/gcc-configure-sdk.inc b/recipes/gcc/gcc-configure-sdk.inc
index d5a5942..328e780 100644
--- a/recipes/gcc/gcc-configure-sdk.inc
+++ b/recipes/gcc/gcc-configure-sdk.inc
@@ -5,23 +5,23 @@ USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibceabi", "no", "", d )}'
 
 EXTRA_OECONF_PATHS = "--with-sysroot=${prefix}/${TARGET_SYS} \
-                      --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
+                      --with-build-time-tools=${TOOLCHAIN_PATH}/${TARGET_SYS}/bin \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
 #
 # gcc-cross looks and finds these in ${exec_prefix} but we're not so lucky
 # for the sdk. Hardcoding the paths ensures the build doesn't go canadian or worse.
 #
-export AR_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ar"
-export AS_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/as"
-export DLLTOOL_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/dlltool"
-export LD_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ld"
-export LIPO_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/lipo"
-export NM_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/nm"
-export OBJDUMP_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/objdump"
-export RANLIB_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ranlib"
-export STRIP_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/strip"
-export WINDRES_FOR_TARGET = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/windres"
+export AR_FOR_TARGET = "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/ar"
+export AS_FOR_TARGET = "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/as"
+export DLLTOOL_FOR_TARGET = "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/dlltool"
+export LD_FOR_TARGET = "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/ld"
+export LIPO_FOR_TARGET = "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/lipo"
+export NM_FOR_TARGET = "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/nm"
+export OBJDUMP_FOR_TARGET = "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/objdump"
+export RANLIB_FOR_TARGET = "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/ranlib"
+export STRIP_FOR_TARGET = "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/strip"
+export WINDRES_FOR_TARGET = "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/windres"
 
 #
 # We need to override this and make sure the compiler can find staging
diff --git a/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
index dd60164..110212b 100644
--- a/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
@@ -5,6 +5,6 @@ S = "${WORKDIR}/gcc-4.2"
 
 # Hack till we fix *libc properly
 do_install_append() {
-	install -d ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include/
-	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+	install -d ${TOOLCHAIN_PATH}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+	ln -sf ${TOOLCHAIN_PATH}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${TOOLCHAIN_PATH}/lib/gcc/${TARGET_SYS}/${BINV}/include/
 }
diff --git a/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
index b9b34b6..b80ab0c 100644
--- a/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
@@ -5,6 +5,6 @@ S = "${WORKDIR}/gcc-4.2"
 
 # Hack till we fix *libc properly
 do_install_append() {
-	install -d ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include
-	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include/
+	install -d ${TOOLCHAIN_PATH}/lib/gcc/${TARGET_SYS}/${BINV}/include
+	ln -sf ${TOOLCHAIN_PATH}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${TOOLCHAIN_PATH}/lib/gcc/${TARGET_SYS}/${BINV}/include/
 }
diff --git a/recipes/gcc/gcc-cross-kernel.inc b/recipes/gcc/gcc-cross-kernel.inc
index e6f1fb8..e9b9d7d 100644
--- a/recipes/gcc/gcc-cross-kernel.inc
+++ b/recipes/gcc/gcc-cross-kernel.inc
@@ -19,5 +19,5 @@ do_compile () {
 do_stage () {
 	cd gcc
 	oe_runmake installdirs install-common install-headers install-libgcc
-	install -m 0755 xgcc ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gcc-${PV}
+	install -m 0755 xgcc ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc-${PV}
 }
diff --git a/recipes/gcc/gcc-cross-sdk_3.4.4.bb b/recipes/gcc/gcc-cross-sdk_3.4.4.bb
index a885c07..bb07bd3 100644
--- a/recipes/gcc/gcc-cross-sdk_3.4.4.bb
+++ b/recipes/gcc/gcc-cross-sdk_3.4.4.bb
@@ -7,7 +7,7 @@ SRC_URI += 'file://sdk-libstdc++-includes.patch'
 
 do_compile_prepend () {
 	mkdir -p gcc
-	ln -s ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}as gcc/as 
-	ln -s ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}ld gcc/ld
+	ln -s ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}as gcc/as 
+	ln -s ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ld gcc/ld
 }
 
diff --git a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
index 70c869e..c155fc2 100644
--- a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
+++ b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
@@ -14,9 +14,9 @@ LDFLAGS = ""
 
 # staging-linkage and cross-linkage recipes don't work anymore, so do it by hand for this backwards CSL toolchain
 do_compile_prepend() {
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ 
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/ 
 	sed -i -e 's:gcc_no_link=yes:gcc_no_link=no:' ${S}/libstdc++-v3/configure
 
 }
diff --git a/recipes/gcc/gcc-cross_csl-arm-2008q1.bb b/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
index 7ed0f51..11f6aff 100644
--- a/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
+++ b/recipes/gcc/gcc-cross_csl-arm-2008q1.bb
@@ -14,9 +14,9 @@ LDFLAGS = ""
 
 # staging-linkage and cross-linkage recipes don't work anymore, so do it by hand for this backwards CSL toolchain
 do_compile_prepend() {
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ 
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/ 
 	sed -i -e 's:gcc_no_link=yes:gcc_no_link=no:' ${S}/libstdc++-v3/configure
 
 }
diff --git a/recipes/gcc/gcc-cross_csl-arm-2008q3.bb b/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
index 9ada568..c3d1af8 100644
--- a/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
+++ b/recipes/gcc/gcc-cross_csl-arm-2008q3.bb
@@ -14,9 +14,9 @@ LDFLAGS = ""
 
 # staging-linkage and cross-linkage recipes don't work anymore, so do it by hand for this backwards CSL toolchain
 do_compile_prepend() {
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ 
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/
+	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/ 
 	sed -i -e 's:gcc_no_link=yes:gcc_no_link=no:' ${S}/libstdc++-v3/configure
 
 }
diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index 6978340..0c4ea2d 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -38,12 +38,12 @@ do_install () {
      
 	# Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
 	# gfortran is fully backwards compatible. This is a safe and practical solution.
-	if [ -f ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran ]; then
+	if [ -f ${D}${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gfortran ]; then
 		currdir="$PWD"
-		cd ${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/
+		cd ${D}${TOOLCHAIN_PATH}/bin/
 		ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
-		if [ -d ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/ ] ; then 
-			cd ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin/
+		if [ -d ${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/ ] ; then 
+			cd ${TOOLCHAIN_PATH}/${TARGET_SYS}/bin/
 			ln -sf gfortran g77 || true
 		fi
 		cd $currdir
-- 
1.7.1



