Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ObdfU-0002oC-W8
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 20:05:30 +0200
Received: by pzk2 with SMTP id 2so2472358pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 11:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=BzbsnWD3IKh1+yeaQIHlAig0AnFvf40nfzVQXSjMgaY=;
	b=fjt/MSIjX4y8jYdzHwm6e2P495AEH7KSOaRijLded1AViJGwrrErFFjTt6jjOwPoLG
	+e6Fd2qVe1IiXEYcWwOz2mrKxxMxvNd7J9Nh1BvuZBsvuW4ef4J1ytK0aj3FmeDco5hY
	df0ubYQtIE0TcYHw6ht7fMtENKag/awl3DqZI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=j+wcFJ0uFvM5Wvrr6FW9gz3QCNgOjkpjNChBXPVD2ZENaqYl5M4Of7kVOVn2hyr3HW
	6l/NLx8Kxcy1w9s+14eEGlVna46a3lIXvj6yZVijh1immsEzLbG8Gf4TfRIz6W2uZpaN
	UW2R1AEWXhO8PYkhDRQ3KdwgiohPrxd2dw9k4=
Received: by 10.142.211.6 with SMTP id j6mr557696wfg.345.1279735496149;
	Wed, 21 Jul 2010 11:04:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm9343482wfl.1.2010.07.21.11.04.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Jul 2010 11:04:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 11:04:45 -0700
Message-Id: <1279735486-7050-4-git-send-email-raj.khem@gmail.com>
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
Subject: [PATCH 3/4] recipes: Fix references to CROSS_DIR
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
X-List-Received-Date: Wed, 21 Jul 2010 18:05:31 -0000

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
index ddd28f3..cb44bd5 100644
--- a/recipes/apex/apex-env_1.5.14.bb
+++ b/recipes/apex/apex-env_1.5.14.bb
@@ -10,11 +10,11 @@ SRC_URI = "ftp://ftp.buici.com/pub/apex/apex-${PV}.tar.gz \
 	"
 S = ${WORKDIR}/apex-${PV}/usr
 
-EXTRA_OEMAKE_append = " CROSS_COMPILE=${CROSS_DIR}/bin/${HOST_PREFIX}"
+EXTRA_OEMAKE_append = " CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${HOST_PREFIX}"
 
 oe_runmake() {
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} "$@"
-	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@"
+	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
 }
 
 do_install() {
diff --git a/recipes/apex/apex-env_1.5.8.bb b/recipes/apex/apex-env_1.5.8.bb
index b619026..d2cf0b7 100644
--- a/recipes/apex/apex-env_1.5.8.bb
+++ b/recipes/apex/apex-env_1.5.8.bb
@@ -10,11 +10,11 @@ SRC_URI = "ftp://ftp.buici.com/pub/apex/apex-${PV}.tar.gz \
 	"
 S = ${WORKDIR}/apex-${PV}/usr
 
-EXTRA_OEMAKE_append = " CROSS_COMPILE=${CROSS_DIR}/bin/${HOST_PREFIX}"
+EXTRA_OEMAKE_append = " CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${HOST_PREFIX}"
 
 oe_runmake() {
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} "$@"
-	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@"
+	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
 }
 
 do_install() {
diff --git a/recipes/apex/apex-nslu2-16mb_1.5.14.bb b/recipes/apex/apex-nslu2-16mb_1.5.14.bb
index 8e764dd..1e654df 100644
--- a/recipes/apex/apex-nslu2-16mb_1.5.14.bb
+++ b/recipes/apex/apex-nslu2-16mb_1.5.14.bb
@@ -17,11 +17,11 @@ CMDLINE_ROOT  ?= "root=/dev/mtdblock4 rootfstype=jffs2 rw"
 
 CMDLINE_DEBUG ?= ""
 
-EXTRA_OEMAKE_append = " CROSS_COMPILE=${CROSS_DIR}/bin/${HOST_PREFIX}"
+EXTRA_OEMAKE_append = " CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${HOST_PREFIX}"
 
 oe_runmake() {
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} "$@"
-	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@"
+	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
 }
 
 # Set the correct CONFIG_USER_xxx_ENDIAN and CONFIG_CMDLINE at the head
diff --git a/recipes/apex/apex-nslu2_1.5.14.bb b/recipes/apex/apex-nslu2_1.5.14.bb
index a1d91b7..efab695 100644
--- a/recipes/apex/apex-nslu2_1.5.14.bb
+++ b/recipes/apex/apex-nslu2_1.5.14.bb
@@ -17,11 +17,11 @@ CMDLINE_ROOT  ?= "root=/dev/mtdblock4 rootfstype=jffs2 rw"
 
 CMDLINE_DEBUG ?= ""
 
-EXTRA_OEMAKE_append = " CROSS_COMPILE=${CROSS_DIR}/bin/${HOST_PREFIX}"
+EXTRA_OEMAKE_append = " CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${HOST_PREFIX}"
 
 oe_runmake() {
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} "$@"
-	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@"
+	make ${PARALLEL_MAKE} LDFLAGS= CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} "$@" || die "oe_runmake failed"
 }
 
 # Set the correct CONFIG_USER_xxx_ENDIAN and CONFIG_CMDLINE at the head
diff --git a/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb b/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb
index f02cc95..76e2606 100644
--- a/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb
+++ b/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb
@@ -27,7 +27,7 @@ CMDLINE_ROOT_NAS100D = "root=/dev/mtdblock2 rootfstype=jffs2 rootflags=noatime r
 CMDLINE_ROOT_NSLU2   = "root=/dev/mtdblock4 rootfstype=jffs2 rootflags=noatime rw init=/linuxrc"
 # CMDLINE is passed correctly on the Freecom FSG-3 from the bootloader.
 
-EXTRA_OEMAKE_append = " CROSS_COMPILE=${CROSS_DIR}/bin/${HOST_PREFIX}"
+EXTRA_OEMAKE_append = " CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${HOST_PREFIX}"
 
 oe_runmake() {
 	mv ${S}/config.h ${S}/config.h.orig
@@ -41,8 +41,8 @@ oe_runmake() {
 	fi
 	echo "#define COMMANDLINE \"${CMDLINE_CONSOLE} ${CMDLINE_ROOT_NSLU2} ${CMDLINE_DEBUG}\"" >> ${S}/config.h
 	rm -f ${S}/main.o
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nslu2
-	make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nslu2 || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nslu2
+	make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nslu2 || die "oe_runmake failed"
 	# NAS100d
 	if [ ${SITEINFO_ENDIANESS} == "be" ] ; then
 		sed -e 's|//#define FORCE_BIGENDIAN|#define FORCE_BIGENDIAN|' \
@@ -53,8 +53,8 @@ oe_runmake() {
 	fi
 	echo "#define COMMANDLINE \"${CMDLINE_CONSOLE} ${CMDLINE_ROOT_NAS100D} ${CMDLINE_DEBUG}\"" >> ${S}/config.h
 	rm -f ${S}/main.o
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nas100d
-	make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nas100d || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nas100d
+	make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-nas100d || die "oe_runmake failed"
 	# DSMG-600
 	if [ ${SITEINFO_ENDIANESS} == "be" ] ; then
 		sed -e 's|//#define FORCE_BIGENDIAN|#define FORCE_BIGENDIAN|' \
@@ -65,8 +65,8 @@ oe_runmake() {
 	fi
 	echo "#define COMMANDLINE \"${CMDLINE_CONSOLE} ${CMDLINE_ROOT_DSMG600} ${CMDLINE_DEBUG}\"" >> ${S}/config.h
 	rm -f ${S}/main.o
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-dsmg600
-	make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-dsmg600 || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-dsmg600
+	make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-dsmg600 || die "oe_runmake failed"
 	# FSG-3
 	if [ ${SITEINFO_ENDIANESS} == "be" ] ; then
 		sed -e 's|//#define FORCE_BIGENDIAN|#define FORCE_BIGENDIAN|' \
@@ -76,8 +76,8 @@ oe_runmake() {
 			${WORKDIR}/config-fsg3.h > ${S}/config.h
 	fi
 	rm -f ${S}/main.o
-	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-fsg3
-	make ${PARALLEL_MAKE} CROSS_COMPILE=${CROSS_DIR}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-fsg3 || die "oe_runmake failed"
+	oenote make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-fsg3
+	make ${PARALLEL_MAKE} CROSS_COMPILE=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX} PACKAGE=arm-kernel-shim-fsg3 || die "oe_runmake failed"
 	mv ${S}/config.h.orig ${S}/config.h
 }
 
diff --git a/recipes/avr-libc/avr-libc_1.0.3.bb b/recipes/avr-libc/avr-libc_1.0.3.bb
index 052425b..efd2967 100644
--- a/recipes/avr-libc/avr-libc_1.0.3.bb
+++ b/recipes/avr-libc/avr-libc_1.0.3.bb
@@ -18,7 +18,7 @@ B = "${WORKDIR}/build.${BUILD_SYS}.${TARGET_SYS}"
 inherit autotools
 
 export tooldir = "${prefix}"
-prefix = "${CROSS_DIR}"
+prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 exec_prefix = "${prefix}"
 
 do_stage () {
diff --git a/recipes/bl/bl_cvs.bb b/recipes/bl/bl_cvs.bb
index cdbf2ba..779ff1e 100644
--- a/recipes/bl/bl_cvs.bb
+++ b/recipes/bl/bl_cvs.bb
@@ -21,7 +21,7 @@ do_configure (){
 }
 
 do_compile (){
-	oe_runmake bl CC="${CROSS_DIR}/bin/${TARGET_SYS}-gcc -I{STAGING_INCDIR} -L${STAGING_LIBDIR}" AS=${CROSS_DIR}/bin/${TARGET_SYS}-as LD=${CROSS_DIR}/bin/${TARGET_SYS}-ld
+	oe_runmake bl CC="${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-gcc -I{STAGING_INCDIR} -L${STAGING_LIBDIR}" AS=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-as LD=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-ld
 }
 
 do_install () {
diff --git a/recipes/chromium/chromium_svn.bb b/recipes/chromium/chromium_svn.bb
index a71f947..6aeab44 100644
--- a/recipes/chromium/chromium_svn.bb
+++ b/recipes/chromium/chromium_svn.bb
@@ -100,7 +100,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_compile() {
 	cd ${S}
-	export CROSSTOOL=${CROSS_DIR}/bin/${TARGET_PREFIX}
+	export CROSSTOOL=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}
 	export AR=${CROSSTOOL}ar
 	export AS=${CROSSTOOL}as
 	export RANLIB=${CROSSTOOL}ranlib
diff --git a/recipes/dejagnu/dejagnu-qemu_1.0.bb b/recipes/dejagnu/dejagnu-qemu_1.0.bb
index 2eef27e..89cea80 100644
--- a/recipes/dejagnu/dejagnu-qemu_1.0.bb
+++ b/recipes/dejagnu/dejagnu-qemu_1.0.bb
@@ -13,7 +13,7 @@ do_stage() {
 	install -m 0644 ${WORKDIR}/arm-qemu.exp ${STAGING_DATADIR}/dejagnu/baseboards/
 	cat <<EOF >${STAGING_BINDIR_NATIVE}/${QEMU}-test-wrapper
 #!/bin/sh
-exec ${QEMU} ${CROSS_DIR}/${TARGET_SYS}/${LD_SO} --library-path ${CROSS_DIR}/${TARGET_SYS}/lib:${STAGING_DIR_TARGET}${layout_libdir} \$1
+exec ${QEMU} ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/${LD_SO} --library-path ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib:${STAGING_DIR_TARGET}${layout_libdir} \$1
 EOF
 	chmod 755 ${STAGING_BINDIR_NATIVE}/arm-qemu-test-wrapper
 }
diff --git a/recipes/dietlibc/dietlibc.inc b/recipes/dietlibc/dietlibc.inc
index 624a9ae..a1537e1 100644
--- a/recipes/dietlibc/dietlibc.inc
+++ b/recipes/dietlibc/dietlibc.inc
@@ -29,12 +29,12 @@ do_stage () {
 	DIETLIBC_BUILD_ARCH=`echo ${BUILD_ARCH} | sed -e s'/.86/386/'`
 	DIETLIBC_TARGET_ARCH=`echo ${TARGET_ARCH} | sed -e s'/.86/386/'`
 	rm -rf ${STAGING_DIR_TARGET}/lib/dietlibc || true
-	rm ${CROSS_DIR}/bin/diet || true
+	rm ${STAGING_DIR_NATIVE}${prefix_native}/bin/diet || true
 	install -d ${STAGING_DIR_TARGET}/lib/dietlibc/lib-${DIETLIBC_TARGET_ARCH}
 	install -d ${STAGING_DIR_TARGET}/lib/dietlibc/include
         for i in `find include -name \*.h`; do install -m 644 -D $i ${STAGING_DIR_TARGET}/lib/dietlibc/$i; done
 
-        install -m755 bin-${DIETLIBC_BUILD_ARCH}/diet-i ${CROSS_DIR}/bin/diet
+        install -m755 bin-${DIETLIBC_BUILD_ARCH}/diet-i ${STAGING_DIR_NATIVE}${prefix_native}/bin/diet
 	
 	cd bin-${DIETLIBC_TARGET_ARCH}
 	install -m 644 start.o libm.a libpthread.a librpc.a \
diff --git a/recipes/emacs/emacs.inc b/recipes/emacs/emacs.inc
index 6645f41..893ee9d 100644
--- a/recipes/emacs/emacs.inc
+++ b/recipes/emacs/emacs.inc
@@ -32,7 +32,7 @@ export LOGNAME = "$(whoami)"
 
 do_compile_prepend() {
 	sed -i ':1;s:\(START.* \|LIB_STANDARD.* \|LIBES.* \)/usr/lib:\1${STAGING_LIBDIR}:;t1' ${S}/src/s/gnu-linux.h `find "${S}" -name Makefile`
-	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${CROSS_DIR}/${TARGET_SYS}/lib"
+	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
 # Ugly hack, see files/use-qemu.patch for more:
 	ln -sf ../src/emacs lisp/emacs
 	ln -sf ../src/emacs lib-src/emacs
@@ -44,11 +44,11 @@ do_compile_prepend() {
 	fi
 	mkdir $treedir
 	cp -pPR ${STAGING_DIR_TARGET}/* $treedir
-	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so ]; then
-                cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib
+	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so ]; then
+                cp -pPR ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib
         fi
-        if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.* ]; then
-                cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.* $treedir/lib
+        if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so.* ]; then
+                cp -pPR ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so.* $treedir/lib
         fi
 	# stupid hack, but without it, it tries to use /usr/lib/libc.so from host and fails
 	# temacs: error while loading shared libraries: /usr/lib/libc.so: ELF file version does not match current one
diff --git a/recipes/emacs/emacs_cvs.bb b/recipes/emacs/emacs_cvs.bb
index c3a98a3..a2065be 100644
--- a/recipes/emacs/emacs_cvs.bb
+++ b/recipes/emacs/emacs_cvs.bb
@@ -27,12 +27,12 @@ FILES_${PN}-el = "${datadir}/emacs/*/*/*.el.gz \
 FILES_${PN} += "${datadir}/emacs"
 
 QEMU = "qemu-${TARGET_ARCH} -L ${STAGING_DIR_TARGET}"
-LDFLAGS += "-L${CROSS_DIR}/${TARGET_SYS}/lib"
+LDFLAGS += "-L${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
 
 EXTRA_OECONF = "--without-sound --without-x"
 
 do_bootstrap() {
-    cp "${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.1" "${S}"
+    cp "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so.1" "${S}"
     export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${S}"
     export QEMU="${QEMU}"
 
@@ -46,7 +46,7 @@ do_bootstrap() {
 addtask bootstrap before do_compile after do_configure
 
 do_compile_prepend() {
-    cp "${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.1" "${S}"
+    cp "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/libgcc_s.so.1" "${S}"
     export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${S}"
     export QEMU="${QEMU}"
 }
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.10.bb b/recipes/gstreamer/gst-ffmpeg_0.10.10.bb
index c29e3b6..9b0269c 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.10.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.10.bb
@@ -22,7 +22,7 @@ EXTRA_OECONF = " --with-system-ffmpeg "
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${CROSS_DIR}/${TARGET_SYS}/bin:"
+PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.2.bb b/recipes/gstreamer/gst-ffmpeg_0.10.2.bb
index c835011..f2c2654 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.2.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.2.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${CROSS_DIR}/${TARGET_SYS}/bin:"
+PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.4.bb b/recipes/gstreamer/gst-ffmpeg_0.10.4.bb
index 19d1bb1..28a753d 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.4.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.4.bb
@@ -24,7 +24,7 @@ EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${CROSS_DIR}/${TARGET_SYS}/bin:"
+PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.6.bb b/recipes/gstreamer/gst-ffmpeg_0.10.6.bb
index 0a9b373..9b8ec8d 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.6.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.6.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${CROSS_DIR}/${TARGET_SYS}/bin:"
+PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.7.bb b/recipes/gstreamer/gst-ffmpeg_0.10.7.bb
index c9e33de..8a1d56e 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.7.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.7.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${CROSS_DIR}/${TARGET_SYS}/bin:"
+PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.8.bb b/recipes/gstreamer/gst-ffmpeg_0.10.8.bb
index 2e5b84e..2bdc45b 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.8.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.8.bb
@@ -21,7 +21,7 @@ EXTRA_OECONF = " --with-system-ffmpeg "
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-PATH_prepend="${CROSS_DIR}/${TARGET_SYS}/bin:"
+PATH_prepend="${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin:"
 
 # Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
 CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/iphone/gcc-iphone-cross_git.bb b/recipes/iphone/gcc-iphone-cross_git.bb
index ea351cf..3c6a788 100644
--- a/recipes/iphone/gcc-iphone-cross_git.bb
+++ b/recipes/iphone/gcc-iphone-cross_git.bb
@@ -20,8 +20,8 @@ EXTRA_OECONF = "\
 	--enable-sjlj-exceptions \
 	--enable-wchar_t=no  \
 	--with-gxx-include-dir=${STAGING_DIR_TARGET}/${layout_includedir}/c++ \
-	--with-as=${CROSS_DIR}/bin/${TARGET_PREFIX}as \
-	--with-ld=${CROSS_DIR}/bin/${TARGET_PREFIX}ld \
+	--with-as=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}as \
+	--with-ld=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}ld \
 	--with-sysroot=${STAGING_DIR_TARGET} \
 	--with-build-sysroot=${STAGING_DIR_TARGET} \
 	--with-local-prefix=${STAGING_DIR_TARGET}${layout_prefix} \
diff --git a/recipes/klibc/klibc.inc b/recipes/klibc/klibc.inc
index 9ae6c5b..d0f8e1c 100644
--- a/recipes/klibc/klibc.inc
+++ b/recipes/klibc/klibc.inc
@@ -13,7 +13,7 @@ do_install() {
 export INST=${STAGING_DIR_TARGET}
 do_stage() {
         oe_runmake  install
-        cp '${STAGING_DIR_TARGET}/bin/klcc'  '${CROSS_DIR}/bin/${TARGET_PREFIX}klcc'
+        cp '${STAGING_DIR_TARGET}/bin/klcc'  '${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}klcc'
 }
 
 PACKAGES = "${PN} ${PN}-dev "
diff --git a/recipes/led/led_cvs.bb b/recipes/led/led_cvs.bb
index 6f303d1..90eb116 100644
--- a/recipes/led/led_cvs.bb
+++ b/recipes/led/led_cvs.bb
@@ -19,7 +19,7 @@ do_configure (){
 }
 
 do_compile (){
-	oe_runmake led CC="${CROSS_DIR}/bin/${TARGET_SYS}-gcc -I${STAGING_INCDIR} -I${STAGING_KERNEL_DIR}/include  -L${STAGING_LIBDIR}" AS=${CROSS_DIR}/bin/${TARGET_SYS}-as LD=${CROSS_DIR}/bin/${TARGET_SYS}-ld
+	oe_runmake led CC="${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-gcc -I${STAGING_INCDIR} -I${STAGING_KERNEL_DIR}/include  -L${STAGING_LIBDIR}" AS=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-as LD=${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}-ld
 }
 
 do_install () {
diff --git a/recipes/mamona/binutils-noemu_2.17.50.0.5.bb b/recipes/mamona/binutils-noemu_2.17.50.0.5.bb
index f2362ff..c3e2b31 100644
--- a/recipes/mamona/binutils-noemu_2.17.50.0.5.bb
+++ b/recipes/mamona/binutils-noemu_2.17.50.0.5.bb
@@ -16,7 +16,7 @@ SRC_URI = \
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
      "
 
-EXTRA_OECONF = "--with-sysroot=${CROSS_DIR}/${TARGET_SYS} \
+EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS} \
 		--program-prefix=${TARGET_PREFIX} --disable-shared"
 
 HOST_SYS = "${BUILD_SYS}"
diff --git a/recipes/meta/cross-linkage_1.0.bb b/recipes/meta/cross-linkage_1.0.bb
index 9be09aa..a5e456b 100644
--- a/recipes/meta/cross-linkage_1.0.bb
+++ b/recipes/meta/cross-linkage_1.0.bb
@@ -21,15 +21,15 @@ do_install() {
 }
 
 do_stage () {
-	install -d ${CROSS_DIR}/${TARGET_SYS}/
-	if [ -e ${CROSS_DIR}/${TARGET_SYS}/include ]; then
-		cp -pPRr ${CROSS_DIR}/${TARGET_SYS}/include/* ${STAGING_INCDIR}
-		mv ${CROSS_DIR}/${TARGET_SYS}/include/ ${CROSS_DIR}/${TARGET_SYS}/include-oldbackup
+	install -d ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/
+	if [ -e ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/include ]; then
+		cp -pPRr ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/include/* ${STAGING_INCDIR}
+		mv ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/include/ ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/include-oldbackup
 	fi
-	ln -s  ${STAGING_INCDIR}/ ${CROSS_DIR}/${TARGET_SYS}/include
-	if [ -e ${CROSS_DIR}/${TARGET_SYS}/lib ]; then
-		cp -pPRr ${CROSS_DIR}/${TARGET_SYS}/lib/* ${STAGING_LIBDIR}
-		mv ${CROSS_DIR}/${TARGET_SYS}/lib/ ${CROSS_DIR}/${TARGET_SYS}/lib-oldbackup
+	ln -s  ${STAGING_INCDIR}/ ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/include
+	if [ -e ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib ]; then
+		cp -pPRr ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/* ${STAGING_LIBDIR}
+		mv ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib-oldbackup
 	fi
-	ln -s  ${STAGING_LIBDIR} ${CROSS_DIR}/${TARGET_SYS}/lib 
+	ln -s  ${STAGING_LIBDIR} ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib 
 }
diff --git a/recipes/musicbrainz/libmusicbrainz.inc b/recipes/musicbrainz/libmusicbrainz.inc
index 010dd23..1838d4e 100644
--- a/recipes/musicbrainz/libmusicbrainz.inc
+++ b/recipes/musicbrainz/libmusicbrainz.inc
@@ -10,7 +10,7 @@ SRC_URI = "ftp://ftp.musicbrainz.org/pub/musicbrainz/libmusicbrainz-${PV}.tar.gz
 inherit cmake pkgconfig
 
 # Fight a compiler/link bug that leaks too many c++ symbols
-TARGET_LDFLAGS += " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib -ldl"
+TARGET_LDFLAGS += " -Wl,-rpath-link,${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib -ldl"
 
 do_stage() {
 	autotools_stage_all
diff --git a/recipes/openmoko2/openmoko-browser2_svn.bb b/recipes/openmoko2/openmoko-browser2_svn.bb
index 3d329b7..a4d8164 100644
--- a/recipes/openmoko2/openmoko-browser2_svn.bb
+++ b/recipes/openmoko2/openmoko-browser2_svn.bb
@@ -6,7 +6,7 @@ PV = "0.0.1+svnr${SRCPV}"
 PR = "r2"
 
 inherit openmoko2
-LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
+LDFLAGS_append = " -Wl,-rpath-link,${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
 
 SRC_URI += "file://webkit-update.patch;minrev=3646;maxrev=4171"
 
diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index c22ecd7..86b08dc 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -129,7 +129,7 @@ do_install() {
                    -e "s,${STAGING_LIBDIR},${libdir},g" \
                    -e "s,${STAGING_BINDIR},${bindir},g" \
                    -e "s,${STAGING_INCDIR},${includedir},g" \
-                   -e "s,${CROSS_DIR}${base_bindir}/,,g" \
+                   -e "s,${STAGING_DIR_NATIVE}${prefix_native}${base_bindir}/,,g" \
                 ${D}${bindir}/h2xs \
                 ${D}${bindir}/h2ph \
                 ${D}${datadir}/perl/${PV}/pod/*.pod \
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index f09360f..c73fe4e 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -135,7 +135,7 @@ do_install() {
                    -e "s,${STAGING_LIBDIR},${libdir},g" \
                    -e "s,${STAGING_BINDIR},${bindir},g" \
                    -e "s,${STAGING_INCDIR},${includedir},g" \
-                   -e "s,${CROSS_DIR}${base_bindir}/,,g" \
+                   -e "s,${STAGING_DIR_NATIVE}${prefix_native}${base_bindir}/,,g" \
                 ${D}${bindir}/h2xs \
                 ${D}${bindir}/h2ph \
                 ${D}${datadir}/perl/${PV}/pod/*.pod \
diff --git a/recipes/phoneme/phoneme-advanced.inc b/recipes/phoneme/phoneme-advanced.inc
index a74bc04..9df61a6 100644
--- a/recipes/phoneme/phoneme-advanced.inc
+++ b/recipes/phoneme/phoneme-advanced.inc
@@ -66,7 +66,7 @@ do_configure() {
 
   pmo "# Java toolchain binaries"
   pmo JDK_HOME /dev/null
-  pmo CVM_TARGET_TOOLS_PREFIX ${CROSS_DIR}/bin/
+  pmo CVM_TARGET_TOOLS_PREFIX ${STAGING_DIR_NATIVE}${prefix_native}/bin/
   pmo CVM_JAVA java
   pmo CVM_JAVAC javac
   pmo CVM_JAVADOC true
diff --git a/recipes/qi/qi.inc b/recipes/qi/qi.inc
index 0b5451a..f9d4f2e 100644
--- a/recipes/qi/qi.inc
+++ b/recipes/qi/qi.inc
@@ -21,7 +21,7 @@ BUILD_DATE=\$(shell date --iso-8601=seconds)
 # has been built. If it bails out with something like: "| arm-linux-ld: 4.3.3: No such file or directory"
 # then you need to remove all previously built toolchain directories out of the cross library path.
 GCCV="`${CC} -dumpversion`"
-COMPILER_LIB_PATH_PRE=${CROSS_DIR}/lib/gcc/${TARGET_SYS}/$(GCCV)
+COMPILER_LIB_PATH_PRE=${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/$(GCCV)
 COMPILER_LIB_PATH=\$(COMPILER_LIB_PATH_PRE)/\$(shell ls \$(COMPILER_LIB_PATH_PRE))
 
 AS=${AS}
diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-uclibc_svn.bb
index 2757fc2..954d10d 100644
--- a/recipes/uclibc/bfin-uclibc_svn.bb
+++ b/recipes/uclibc/bfin-uclibc_svn.bb
@@ -20,7 +20,7 @@ COMPATIBLE_HOST = "bfin.*-uclinux"
 
 #as stated above, uclibc needs real kernel-headers
 #however: we can't depend on virtual/kernel when nptl hits due to depends deadlocking ....
-KERNEL_SOURCE = "${CROSS_DIR}/${TARGET_SYS}"
+KERNEL_SOURCE = "${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}"
 
 SRC_URI = "svn://sources.blackfin.uclinux.org/toolchain/trunk;module=uClibc "
 SRC_URI += "file://uClibc.machine file://uClibc.distro"
diff --git a/recipes/wvstreams/wvstreams_4.2.2.bb b/recipes/wvstreams/wvstreams_4.2.2.bb
index 83f97be..4358ec1 100644
--- a/recipes/wvstreams/wvstreams_4.2.2.bb
+++ b/recipes/wvstreams/wvstreams_4.2.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/w/wvstreams/${PN}_${PV}.ori
 
 inherit autotools pkgconfig
 
-LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
+LDFLAGS_append = " -Wl,-rpath-link,${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
 
 EXTRA_AUTORECONF += " -I${S}/gnulib/m4"
 EXTRA_OECONF = " --without-tcl --without-qt --without-pam"
diff --git a/recipes/wvstreams/wvstreams_4.4.1.bb b/recipes/wvstreams/wvstreams_4.4.1.bb
index fa865c7..4506b05 100644
--- a/recipes/wvstreams/wvstreams_4.4.1.bb
+++ b/recipes/wvstreams/wvstreams_4.4.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
 
 inherit autotools pkgconfig
 
-LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
+LDFLAGS_append = " -Wl,-rpath-link,${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
 
 EXTRA_AUTORECONF += " -I${S}/gnulib/m4"
 EXTRA_OECONF = " --without-tcl --without-qt --without-pam"
diff --git a/recipes/wvstreams/wvstreams_4.6.bb b/recipes/wvstreams/wvstreams_4.6.bb
index a52c284..eb70fd2 100644
--- a/recipes/wvstreams/wvstreams_4.6.bb
+++ b/recipes/wvstreams/wvstreams_4.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
 
 inherit autotools pkgconfig
 
-LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
+LDFLAGS_append = " -Wl,-rpath-link,${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib"
 
 EXTRA_OECONF = " --without-tcl --without-qt --without-pam"
 
-- 
1.7.1



