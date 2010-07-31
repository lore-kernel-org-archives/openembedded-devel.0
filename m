Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Of4ic-0005ux-T9
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 07:34:54 +0200
Received: by pvg13 with SMTP id 13so831268pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 22:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=FxhYy6DzW/X943k0UfZvu1PqswNxUmqNbyAGw0atxsI=;
	b=rPTlGc5cUsXjX3b8KS6OtW/iW5PnBuE5Ke/Oa+MFS0QQTWbUyTol3dQM0lMfYJhBym
	QKJflu+URZGI3aaRdG9D+/aYoSjMUAtlLoXdUs8GnlyealmQn1BBKYeVuBrq2MTqKEVV
	fOOpKUCvSI1oCJ2P74AcO2fvTrbjXGQQRWTg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZL8c3dGDXOXAyLQhl9FJsnJ5QEdVqmWDwvIr7Wb87d9JfKsMd5ggHm7CXRXStl3X81
	IJg3OYSXxaB9g7IYbn5Gwu3jGHGafa3bdG8X7zzzPgmJFa7DVIZ7EweqkKc7ilaXXICe
	jq2Q6vB2C8SUsna4y5op9LE6KRNiNouNJh9PA=
Received: by 10.114.74.19 with SMTP id w19mr3519486waa.143.1280554461354;
	Fri, 30 Jul 2010 22:34:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n32sm5308381wag.23.2010.07.30.22.34.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Jul 2010 22:34:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 22:34:10 -0700
Message-Id: <1280554451-27780-5-git-send-email-raj.khem@gmail.com>
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
Subject: [PATCH 4/5] recipes: Fix the PATHs for toolchains.
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
X-List-Received-Date: Sat, 31 Jul 2010 05:34:55 -0000

* Look into the new multi-machine friendly installation.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/apex/apex-env_1.5.14.bb                |    6 +++---
 recipes/apex/apex-env_1.5.8.bb                 |    6 +++---
 recipes/apex/apex-nslu2-16mb_1.5.14.bb         |    6 +++---
 recipes/apex/apex-nslu2_1.5.14.bb              |    6 +++---
 recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb |   18 +++++++++---------
 recipes/avr-libc/avr-libc_1.0.3.bb             |    2 +-
 recipes/bl/bl_cvs.bb                           |    2 +-
 recipes/chromium/chromium_svn.bb               |    2 +-
 recipes/dejagnu/dejagnu-qemu_1.0.bb            |    2 +-
 recipes/dietlibc/dietlibc.inc                  |    4 ++--
 recipes/emacs/emacs.inc                        |   10 +++++-----
 recipes/emacs/emacs_cvs.bb                     |    6 +++---
 recipes/gstreamer/gst-ffmpeg_0.10.10.bb        |    2 +-
 recipes/gstreamer/gst-ffmpeg_0.10.2.bb         |    2 +-
 recipes/gstreamer/gst-ffmpeg_0.10.4.bb         |    2 +-
 recipes/gstreamer/gst-ffmpeg_0.10.6.bb         |    2 +-
 recipes/gstreamer/gst-ffmpeg_0.10.7.bb         |    2 +-
 recipes/gstreamer/gst-ffmpeg_0.10.8.bb         |    2 +-
 recipes/iphone/gcc-iphone-cross_git.bb         |    4 ++--
 recipes/klibc/klibc.inc                        |    2 +-
 recipes/led/led_cvs.bb                         |    2 +-
 recipes/mamona/binutils-noemu_2.17.50.0.5.bb   |    2 +-
 recipes/meta/cross-linkage_1.0.bb              |   18 +++++++++---------
 recipes/musicbrainz/libmusicbrainz.inc         |    2 +-
 recipes/openmoko2/openmoko-browser2_svn.bb     |    2 +-
 recipes/perl/perl_5.10.1.bb                    |    2 +-
 recipes/perl/perl_5.8.8.bb                     |    2 +-
 recipes/phoneme/phoneme-advanced.inc           |    2 +-
 recipes/qi/qi.inc                              |    2 +-
 recipes/uclibc/bfin-uclibc_svn.bb              |    2 +-
 recipes/wvstreams/wvstreams_4.2.2.bb           |    2 +-
 recipes/wvstreams/wvstreams_4.4.1.bb           |    2 +-
 recipes/wvstreams/wvstreams_4.6.bb             |    2 +-
 33 files changed, 65 insertions(+), 65 deletions(-)

diff --git a/recipes/apex/apex-env_1.5.14.bb b/recipes/apex/apex-env_1.5.14.bb
index cb44bd5..38a8960 100644
--- a/recipes/apex/apex-env_1.5.14.bb
+++ b/recipes/apex/apex-env_1.5.14.bb
@@ -10,11 +10,11 @@ SRC_URI = "ftp://ftp.buici.com/pub/apex/apex-${PV}.tar.gz \
 	"
 S = ${WORKDIR}/apex-${PV}/usr
 
-EXTRA_OEMAKE_append = " CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${HOST_PREFIX}"
+EXTRA_OEMAKE_append = " CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${HOST_PREFIX}"
 
 oe_runmake() {
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@"
-	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} "$@"
+	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
 }
 
 do_install() {
diff --git a/recipes/apex/apex-env_1.5.8.bb b/recipes/apex/apex-env_1.5.8.bb
index d2cf0b7..d10e018 100644
--- a/recipes/apex/apex-env_1.5.8.bb
+++ b/recipes/apex/apex-env_1.5.8.bb
@@ -10,11 +10,11 @@ SRC_URI = "ftp://ftp.buici.com/pub/apex/apex-${PV}.tar.gz \
 	"
 S = ${WORKDIR}/apex-${PV}/usr
 
-EXTRA_OEMAKE_append = " CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${HOST_PREFIX}"
+EXTRA_OEMAKE_append = " CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${HOST_PREFIX}"
 
 oe_runmake() {
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@"
-	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} "$@"
+	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
 }
 
 do_install() {
diff --git a/recipes/apex/apex-nslu2-16mb_1.5.14.bb b/recipes/apex/apex-nslu2-16mb_1.5.14.bb
index 4d19f9e..8de194f 100644
--- a/recipes/apex/apex-nslu2-16mb_1.5.14.bb
+++ b/recipes/apex/apex-nslu2-16mb_1.5.14.bb
@@ -17,11 +17,11 @@ CMDLINE_ROOT  ?= "root=/dev/mtdblock4 rootfstype=jffs2 rw"
 
 CMDLINE_DEBUG ?= ""
 
-EXTRA_OEMAKE_append = " CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${HOST_PREFIX}"
+EXTRA_OEMAKE_append = " CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${HOST_PREFIX}"
 
 oe_runmake() {
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@"
-	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} "$@"
+	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
 }
 
 # Set the correct CONFIG_USER_xxx_ENDIAN and CONFIG_CMDLINE at the head
diff --git a/recipes/apex/apex-nslu2_1.5.14.bb b/recipes/apex/apex-nslu2_1.5.14.bb
index 2bea9e2..06c672a 100644
--- a/recipes/apex/apex-nslu2_1.5.14.bb
+++ b/recipes/apex/apex-nslu2_1.5.14.bb
@@ -17,11 +17,11 @@ CMDLINE_ROOT  ?= "root=/dev/mtdblock4 rootfstype=jffs2 rw"
 
 CMDLINE_DEBUG ?= ""
 
-EXTRA_OEMAKE_append = " CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${HOST_PREFIX}"
+EXTRA_OEMAKE_append = " CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${HOST_PREFIX}"
 
 oe_runmake() {
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@"
-	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} "$@"
+	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
 }
 
 # Set the correct CONFIG_USER_xxx_ENDIAN and CONFIG_CMDLINE at the head
diff --git a/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb b/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb
index 40bf8e9..a71a2f6 100644
--- a/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb
+++ b/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb
@@ -27,7 +27,7 @@ CMDLINE_ROOT_NAS100D = "root=/dev/mtdblock2 rootfstype=jffs2 rootflags=noatime r
 CMDLINE_ROOT_NSLU2   = "root=/dev/mtdblock4 rootfstype=jffs2 rootflags=noatime rw init=/linuxrc"
 # CMDLINE is passed correctly on the Freecom FSG-3 from the bootloader.
 
-EXTRA_OEMAKE_append = " CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${HOST_PREFIX}"
+EXTRA_OEMAKE_append = " CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${HOST_PREFIX}"
 
 oe_runmake() {
 	mv ${S}/config.h ${S}/config.h.orig
@@ -41,8 +41,8 @@ oe_runmake() {
 	fi
 	echo "#define COMMANDLINE \"${CMDLINE_CONSOLE} ${CMDLINE_ROOT_NSLU2} ${CMDLINE_DEBUG}\"" >> ${S}/config.h
 	rm -f ${S}/main.o
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nslu2
-	make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nslu2 || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nslu2
+	make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nslu2 || die "oe_runmake failed"
 	# NAS100d
 	if [ ${SITEINFO_ENDIANNESS} == "be" ] ; then
 		sed -e 's|//#define FORCE_BIGENDIAN|#define FORCE_BIGENDIAN|' \
@@ -53,8 +53,8 @@ oe_runmake() {
 	fi
 	echo "#define COMMANDLINE \"${CMDLINE_CONSOLE} ${CMDLINE_ROOT_NAS100D} ${CMDLINE_DEBUG}\"" >> ${S}/config.h
 	rm -f ${S}/main.o
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nas100d
-	make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nas100d || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nas100d
+	make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nas100d || die "oe_runmake failed"
 	# DSMG-600
 	if [ ${SITEINFO_ENDIANNESS} == "be" ] ; then
 		sed -e 's|//#define FORCE_BIGENDIAN|#define FORCE_BIGENDIAN|' \
@@ -65,8 +65,8 @@ oe_runmake() {
 	fi
 	echo "#define COMMANDLINE \"${CMDLINE_CONSOLE} ${CMDLINE_ROOT_DSMG600} ${CMDLINE_DEBUG}\"" >> ${S}/config.h
 	rm -f ${S}/main.o
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-dsmg600
-	make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-dsmg600 || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-dsmg600
+	make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-dsmg600 || die "oe_runmake failed"
 	# FSG-3
 	if [ ${SITEINFO_ENDIANNESS} == "be" ] ; then
 		sed -e 's|//#define FORCE_BIGENDIAN|#define FORCE_BIGENDIAN|' \
@@ -76,8 +76,8 @@ oe_runmake() {
 			${WORKDIR}/config-fsg3.h > ${S}/config.h
 	fi
 	rm -f ${S}/main.o
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-fsg3
-	make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-fsg3 || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-fsg3
+	make ${PARALLEL_MAKE} CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-fsg3 || die "oe_runmake failed"
 	mv ${S}/config.h.orig ${S}/config.h
 }
 
diff --git a/recipes/avr-libc/avr-libc_1.0.3.bb b/recipes/avr-libc/avr-libc_1.0.3.bb
index efd2967..22a7ed9 100644
--- a/recipes/avr-libc/avr-libc_1.0.3.bb
+++ b/recipes/avr-libc/avr-libc_1.0.3.bb
@@ -18,7 +18,7 @@ B = "${WORKDIR}/build.${BUILD_SYS}.${TARGET_SYS}"
 inherit autotools
 
 export tooldir = "${prefix}"
-prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+prefix = "${TOOLCHAIN_PATH}"
 exec_prefix = "${prefix}"
 
 do_stage () {
diff --git a/recipes/bl/bl_cvs.bb b/recipes/bl/bl_cvs.bb
index 779ff1e..0ec705b 100644
--- a/recipes/bl/bl_cvs.bb
+++ b/recipes/bl/bl_cvs.bb
@@ -21,7 +21,7 @@ do_configure (){
 }
 
 do_compile (){
-	oe_runmake bl CC="${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-gcc -I{STAGING_INCDIR} -L${STAGING_LIBDIR}" AS=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-as LD=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-ld
+	oe_runmake bl CC="${TOOLCHAIN_PATH}/bin/${TARGET_SYS}-gcc -I{STAGING_INCDIR} -L${STAGING_LIBDIR}" AS=${TOOLCHAIN_PATH}/bin/${TARGET_SYS}-as LD=${TOOLCHAIN_PATH}/bin/${TARGET_SYS}-ld
 }
 
 do_install () {
diff --git a/recipes/chromium/chromium_svn.bb b/recipes/chromium/chromium_svn.bb
index 6aeab44..5576c79 100644
--- a/recipes/chromium/chromium_svn.bb
+++ b/recipes/chromium/chromium_svn.bb
@@ -100,7 +100,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_compile() {
 	cd ${S}
-	export CROSSTOOL=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}
+	export CROSSTOOL=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}
 	export AR=${CROSSTOOL}ar
 	export AS=${CROSSTOOL}as
 	export RANLIB=${CROSSTOOL}ranlib
diff --git a/recipes/dejagnu/dejagnu-qemu_1.0.bb b/recipes/dejagnu/dejagnu-qemu_1.0.bb
index 89cea80..16a204d 100644
--- a/recipes/dejagnu/dejagnu-qemu_1.0.bb
+++ b/recipes/dejagnu/dejagnu-qemu_1.0.bb
@@ -13,7 +13,7 @@ do_stage() {
 	install -m 0644 ${WORKDIR}/arm-qemu.exp ${STAGING_DATADIR}/dejagnu/baseboards/
 	cat <<EOF >${STAGING_BINDIR_NATIVE}/${QEMU}-test-wrapper
 #!/bin/sh
-exec ${QEMU} ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/${LD_SO} --library-path ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib:${STAGING_DIR_TARGET}${layout_libdir} \$1
+exec ${QEMU} ${TOOLCHAIN_PATH}/${TARGET_SYS}/${LD_SO} --library-path ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib:${STAGING_DIR_TARGET}${layout_libdir} \$1
 EOF
 	chmod 755 ${STAGING_BINDIR_NATIVE}/arm-qemu-test-wrapper
 }
diff --git a/recipes/dietlibc/dietlibc.inc b/recipes/dietlibc/dietlibc.inc
index a1537e1..64bc6be 100644
--- a/recipes/dietlibc/dietlibc.inc
+++ b/recipes/dietlibc/dietlibc.inc
@@ -29,12 +29,12 @@ do_stage () {
 	DIETLIBC_BUILD_ARCH=`echo ${BUILD_ARCH} | sed -e s'/.86/386/'`
 	DIETLIBC_TARGET_ARCH=`echo ${TARGET_ARCH} | sed -e s'/.86/386/'`
 	rm -rf ${STAGING_DIR_TARGET}/lib/dietlibc || true
-	rm ${STAGING_DIR_NATIVE}${prefix_native}/bin/diet || true
+	rm ${TOOLCHAIN_PATH}/bin/diet || true
 	install -d ${STAGING_DIR_TARGET}/lib/dietlibc/lib-${DIETLIBC_TARGET_ARCH}
 	install -d ${STAGING_DIR_TARGET}/lib/dietlibc/include
         for i in `find include -name \*.h`; do install -m 644 -D $i ${STAGING_DIR_TARGET}/lib/dietlibc/$i; done
 
-        install -m755 bin-${DIETLIBC_BUILD_ARCH}/diet-i ${STAGING_DIR_NATIVE}${prefix_native}/bin/diet
+        install -m755 bin-${DIETLIBC_BUILD_ARCH}/diet-i ${TOOLCHAIN_PATH}/bin/diet
 	
 	cd bin-${DIETLIBC_TARGET_ARCH}
 	install -m 644 start.o libm.a libpthread.a librpc.a \
diff --git a/recipes/emacs/emacs.inc b/recipes/emacs/emacs.inc
index 893ee9d..3db264e 100644
--- a/recipes/emacs/emacs.inc
+++ b/recipes/emacs/emacs.inc
@@ -32,7 +32,7 @@ export LOGNAME = "$(whoami)"
 
 do_compile_prepend() {
 	sed -i ':1;s:\(START.* \|LIB_STANDARD.* \|LIBES.* \)/usr/lib:\1${STAGING_LIBDIR}:;t1' ${S}/src/s/gnu-linux.h `find "${S}" -name Makefile`
-	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
+	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
 # Ugly hack, see files/use-qemu.patch for more:
 	ln -sf ../src/emacs lisp/emacs
 	ln -sf ../src/emacs lib-src/emacs
@@ -44,11 +44,11 @@ do_compile_prepend() {
 	fi
 	mkdir $treedir
 	cp -pPR ${STAGING_DIR_TARGET}/* $treedir
-	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so ]; then
-                cp -pPR ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib
+	if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so ]; then
+                cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib
         fi
-        if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so.* ]; then
-                cp -pPR ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so.* $treedir/lib
+        if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so.* ]; then
+                cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so.* $treedir/lib
         fi
 	# stupid hack, but without it, it tries to use /usr/lib/libc.so from host and fails
 	# temacs: error while loading shared libraries: /usr/lib/libc.so: ELF file version does not match current one
diff --git a/recipes/emacs/emacs_cvs.bb b/recipes/emacs/emacs_cvs.bb
index a2065be..8ffc22f 100644
--- a/recipes/emacs/emacs_cvs.bb
+++ b/recipes/emacs/emacs_cvs.bb
@@ -27,12 +27,12 @@ FILES_${PN}-el = "${datadir}/emacs/*/*/*.el.gz \
 FILES_${PN} += "${datadir}/emacs"
 
 QEMU = "qemu-${TARGET_ARCH} -L ${STAGING_DIR_TARGET}"
-LDFLAGS += "-L${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
+LDFLAGS += "-L${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
 
 EXTRA_OECONF = "--without-sound --without-x"
 
 do_bootstrap() {
-    cp "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so.1" "${S}"
+    cp "${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so.1" "${S}"
     export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${S}"
     export QEMU="${QEMU}"
 
@@ -46,7 +46,7 @@ do_bootstrap() {
 addtask bootstrap before do_compile after do_configure
 
 do_compile_prepend() {
-    cp "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so.1" "${S}"
+    cp "${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so.1" "${S}"
     export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${S}"
     export QEMU="${QEMU}"
 }
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.10.bb b/recipes/gstreamer/gst-ffmpeg_0.10.10.bb
index d2b6901..0952683 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.10.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.10.bb
@@ -24,7 +24,7 @@ EXTRA_OECONF = " --with-system-ffmpeg "
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
+PATH_prepend="${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.2.bb b/recipes/gstreamer/gst-ffmpeg_0.10.2.bb
index f2c2654..2328b0d 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.2.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.2.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
+PATH_prepend="${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.4.bb b/recipes/gstreamer/gst-ffmpeg_0.10.4.bb
index 28a753d..83ccdb5 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.4.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.4.bb
@@ -24,7 +24,7 @@ EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
+PATH_prepend="${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.6.bb b/recipes/gstreamer/gst-ffmpeg_0.10.6.bb
index 9b8ec8d..c78b4c4 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.6.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.6.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
+PATH_prepend="${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.7.bb b/recipes/gstreamer/gst-ffmpeg_0.10.7.bb
index 8a1d56e..a8bbbec 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.7.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.7.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
+PATH_prepend="${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.8.bb b/recipes/gstreamer/gst-ffmpeg_0.10.8.bb
index 0cd0ceb..5f92dcc 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.8.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.8.bb
@@ -21,7 +21,7 @@ EXTRA_OECONF = " --with-system-ffmpeg "
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
+PATH_prepend="${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/iphone/gcc-iphone-cross_git.bb b/recipes/iphone/gcc-iphone-cross_git.bb
index 3c6a788..43f8b6b 100644
--- a/recipes/iphone/gcc-iphone-cross_git.bb
+++ b/recipes/iphone/gcc-iphone-cross_git.bb
@@ -20,8 +20,8 @@ EXTRA_OECONF = "\
 	--enable-sjlj-exceptions \
 	--enable-wchar_t=no  \
 	--with-gxx-include-dir=${STAGING_DIR_TARGET}/${layout_includedir}/c++ \
-	--with-as=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}as \
-	--with-ld=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}ld \
+	--with-as=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}as \
+	--with-ld=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ld \
 	--with-sysroot=${STAGING_DIR_TARGET} \
 	--with-build-sysroot=${STAGING_DIR_TARGET} \
 	--with-local-prefix=${STAGING_DIR_TARGET}${layout_prefix} \
diff --git a/recipes/klibc/klibc.inc b/recipes/klibc/klibc.inc
index d0f8e1c..a40a45c 100644
--- a/recipes/klibc/klibc.inc
+++ b/recipes/klibc/klibc.inc
@@ -13,7 +13,7 @@ do_install() {
 export INST=${STAGING_DIR_TARGET}
 do_stage() {
         oe_runmake  install
-        cp '${STAGING_DIR_TARGET}/bin/klcc'  '${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}klcc'
+        cp '${STAGING_DIR_TARGET}/bin/klcc'  '${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}klcc'
 }
 
 PACKAGES = "${PN} ${PN}-dev "
diff --git a/recipes/led/led_cvs.bb b/recipes/led/led_cvs.bb
index 90eb116..8fd0586 100644
--- a/recipes/led/led_cvs.bb
+++ b/recipes/led/led_cvs.bb
@@ -19,7 +19,7 @@ do_configure (){
 }
 
 do_compile (){
-	oe_runmake led CC="${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-gcc -I${STAGING_INCDIR} -I${STAGING_KERNEL_DIR}/include  -L${STAGING_LIBDIR}" AS=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-as LD=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-ld
+	oe_runmake led CC="${TOOLCHAIN_PATH}/bin/${TARGET_SYS}-gcc -I${STAGING_INCDIR} -I${STAGING_KERNEL_DIR}/include  -L${STAGING_LIBDIR}" AS=${TOOLCHAIN_PATH}/bin/${TARGET_SYS}-as LD=${TOOLCHAIN_PATH}/bin/${TARGET_SYS}-ld
 }
 
 do_install () {
diff --git a/recipes/mamona/binutils-noemu_2.17.50.0.5.bb b/recipes/mamona/binutils-noemu_2.17.50.0.5.bb
index c3e2b31..73330c4 100644
--- a/recipes/mamona/binutils-noemu_2.17.50.0.5.bb
+++ b/recipes/mamona/binutils-noemu_2.17.50.0.5.bb
@@ -16,7 +16,7 @@ SRC_URI = \
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
      "
 
-EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS} \
+EXTRA_OECONF = "--with-sysroot=${TOOLCHAIN_PATH}/${TARGET_SYS} \
 		--program-prefix=${TARGET_PREFIX} --disable-shared"
 
 HOST_SYS = "${BUILD_SYS}"
diff --git a/recipes/meta/cross-linkage_1.0.bb b/recipes/meta/cross-linkage_1.0.bb
index a5e456b..713e1fd 100644
--- a/recipes/meta/cross-linkage_1.0.bb
+++ b/recipes/meta/cross-linkage_1.0.bb
@@ -21,15 +21,15 @@ do_install() {
 }
 
 do_stage () {
-	install -d ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/
-	if [ -e ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/include ]; then
-		cp -pPRr ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/include/* ${STAGING_INCDIR}
-		mv ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/include/ ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/include-oldbackup
+	install -d ${TOOLCHAIN_PATH}/${TARGET_SYS}/
+	if [ -e ${TOOLCHAIN_PATH}/${TARGET_SYS}/include ]; then
+		cp -pPRr ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${STAGING_INCDIR}
+		mv ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/ ${TOOLCHAIN_PATH}/${TARGET_SYS}/include-oldbackup
 	fi
-	ln -s  ${STAGING_INCDIR}/ ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/include
-	if [ -e ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib ]; then
-		cp -pPRr ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/* ${STAGING_LIBDIR}
-		mv ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib-oldbackup
+	ln -s  ${STAGING_INCDIR}/ ${TOOLCHAIN_PATH}/${TARGET_SYS}/include
+	if [ -e ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib ]; then
+		cp -pPRr ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/* ${STAGING_LIBDIR}
+		mv ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/ ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib-oldbackup
 	fi
-	ln -s  ${STAGING_LIBDIR} ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib 
+	ln -s  ${STAGING_LIBDIR} ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib 
 }
diff --git a/recipes/musicbrainz/libmusicbrainz.inc b/recipes/musicbrainz/libmusicbrainz.inc
index 1838d4e..4d64ff3 100644
--- a/recipes/musicbrainz/libmusicbrainz.inc
+++ b/recipes/musicbrainz/libmusicbrainz.inc
@@ -10,7 +10,7 @@ SRC_URI = "ftp://ftp.musicbrainz.org/pub/musicbrainz/libmusicbrainz-${PV}.tar.gz
 inherit cmake pkgconfig
 
 # Fight a compiler/link bug that leaks too many c++ symbols
-TARGET_LDFLAGS += " -Wl,-rpath-link,${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib -ldl"
+TARGET_LDFLAGS += " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib -ldl"
 
 do_stage() {
 	autotools_stage_all
diff --git a/recipes/openmoko2/openmoko-browser2_svn.bb b/recipes/openmoko2/openmoko-browser2_svn.bb
index a4d8164..4fb5699 100644
--- a/recipes/openmoko2/openmoko-browser2_svn.bb
+++ b/recipes/openmoko2/openmoko-browser2_svn.bb
@@ -6,7 +6,7 @@ PV = "0.0.1+svnr${SRCPV}"
 PR = "r2"
 
 inherit openmoko2
-LDFLAGS_append = " -Wl,-rpath-link,${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
+LDFLAGS_append = " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
 
 SRC_URI += "file://webkit-update.patch;minrev=3646;maxrev=4171"
 
diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index efd7cf3..c469cf9 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -131,7 +131,7 @@ do_install() {
                    -e "s,${STAGING_LIBDIR},${libdir},g" \
                    -e "s,${STAGING_BINDIR},${bindir},g" \
                    -e "s,${STAGING_INCDIR},${includedir},g" \
-                   -e "s,${STAGING_DIR_NATIVE}${prefix_native}${base_bindir}/,,g" \
+                   -e "s,${TOOLCHAIN_PATH}${base_bindir}/,,g" \
                 ${D}${bindir}/h2xs \
                 ${D}${bindir}/h2ph \
                 ${D}${datadir}/perl/${PV}/pod/*.pod \
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index bc6cc22..0b9135d 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -135,7 +135,7 @@ do_install() {
                    -e "s,${STAGING_LIBDIR},${libdir},g" \
                    -e "s,${STAGING_BINDIR},${bindir},g" \
                    -e "s,${STAGING_INCDIR},${includedir},g" \
-                   -e "s,${STAGING_DIR_NATIVE}${prefix_native}${base_bindir}/,,g" \
+                   -e "s,${TOOLCHAIN_PATH}${base_bindir}/,,g" \
                 ${D}${bindir}/h2xs \
                 ${D}${bindir}/h2ph \
                 ${D}${datadir}/perl/${PV}/pod/*.pod \
diff --git a/recipes/phoneme/phoneme-advanced.inc b/recipes/phoneme/phoneme-advanced.inc
index 9df61a6..be3ff92 100644
--- a/recipes/phoneme/phoneme-advanced.inc
+++ b/recipes/phoneme/phoneme-advanced.inc
@@ -66,7 +66,7 @@ do_configure() {
 
   pmo "# Java toolchain binaries"
   pmo JDK_HOME /dev/null
-  pmo CVM_TARGET_TOOLS_PREFIX ${STAGING_DIR_NATIVE}${prefix_native}/bin/
+  pmo CVM_TARGET_TOOLS_PREFIX ${TOOLCHAIN_PATH}/bin/
   pmo CVM_JAVA java
   pmo CVM_JAVAC javac
   pmo CVM_JAVADOC true
diff --git a/recipes/qi/qi.inc b/recipes/qi/qi.inc
index f9d4f2e..c4aadba 100644
--- a/recipes/qi/qi.inc
+++ b/recipes/qi/qi.inc
@@ -21,7 +21,7 @@ BUILD_DATE=\$(shell date --iso-8601=seconds)
 # has been built. If it bails out with something like: "| arm-linux-ld: 4.3.3: No such file or directory"
 # then you need to remove all previously built toolchain directories out of the cross library path.
 GCCV="`${CC} -dumpversion`"
-COMPILER_LIB_PATH_PRE=${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/$(GCCV)
+COMPILER_LIB_PATH_PRE=${TOOLCHAIN_PATH}/lib/gcc/${TARGET_SYS}/$(GCCV)
 COMPILER_LIB_PATH=\$(COMPILER_LIB_PATH_PRE)/\$(shell ls \$(COMPILER_LIB_PATH_PRE))
 
 AS=${AS}
diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-uclibc_svn.bb
index 954d10d..dafd094 100644
--- a/recipes/uclibc/bfin-uclibc_svn.bb
+++ b/recipes/uclibc/bfin-uclibc_svn.bb
@@ -20,7 +20,7 @@ COMPATIBLE_HOST = "bfin.*-uclinux"
 
 #as stated above, uclibc needs real kernel-headers
 #however: we can't depend on virtual/kernel when nptl hits due to depends deadlocking ....
-KERNEL_SOURCE = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}"
+KERNEL_SOURCE = "${TOOLCHAIN_PATH}/${TARGET_SYS}"
 
 SRC_URI = "svn://sources.blackfin.uclinux.org/toolchain/trunk;module=uClibc "
 SRC_URI += "file://uClibc.machine file://uClibc.distro"
diff --git a/recipes/wvstreams/wvstreams_4.2.2.bb b/recipes/wvstreams/wvstreams_4.2.2.bb
index 4358ec1..8782790 100644
--- a/recipes/wvstreams/wvstreams_4.2.2.bb
+++ b/recipes/wvstreams/wvstreams_4.2.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/w/wvstreams/${PN}_${PV}.ori
 
 inherit autotools pkgconfig
 
-LDFLAGS_append = " -Wl,-rpath-link,${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
+LDFLAGS_append = " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
 
 EXTRA_AUTORECONF += " -I${S}/gnulib/m4"
 EXTRA_OECONF = " --without-tcl --without-qt --without-pam"
diff --git a/recipes/wvstreams/wvstreams_4.4.1.bb b/recipes/wvstreams/wvstreams_4.4.1.bb
index 4506b05..f18f219 100644
--- a/recipes/wvstreams/wvstreams_4.4.1.bb
+++ b/recipes/wvstreams/wvstreams_4.4.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
 
 inherit autotools pkgconfig
 
-LDFLAGS_append = " -Wl,-rpath-link,${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
+LDFLAGS_append = " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
 
 EXTRA_AUTORECONF += " -I${S}/gnulib/m4"
 EXTRA_OECONF = " --without-tcl --without-qt --without-pam"
diff --git a/recipes/wvstreams/wvstreams_4.6.bb b/recipes/wvstreams/wvstreams_4.6.bb
index eb70fd2..a6d2c26 100644
--- a/recipes/wvstreams/wvstreams_4.6.bb
+++ b/recipes/wvstreams/wvstreams_4.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
 
 inherit autotools pkgconfig
 
-LDFLAGS_append = " -Wl,-rpath-link,${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
+LDFLAGS_append = " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
 
 EXTRA_OECONF = " --without-tcl --without-qt --without-pam"
 
-- 
1.7.1



