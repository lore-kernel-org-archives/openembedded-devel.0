Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OQnpF-0006wf-Mj
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 22:42:43 +0200
Received: by wwb39 with SMTP id 39so993573wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 13:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=8JxPz531CPFqOrFeLPBuTPEflsnshk+h1uxXP1ly9U0=;
	b=bmyWERB0QZB5/eCRMBW6AcvoDhGJyYgnGW0YjrbdE1HxiPsNcUv8jeZ+d8kHjgkk6T
	wiIOPiAx/7GxdugfDcAHGU2RysEdsJ2Z8VL98pcWvj2GbBQaw4eE5gypfb7Luw4wEUCr
	yuCUQtyNPxoVk23dUEIz+NDETQofbxjSaDbGw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AzP5mrv7gJuCGFMvG5r9KhIoqu5iODToLuBkN38e5SPSxLH0qD5GK/fmM7mBgzp2ez
	R45Wz+sylkBzxiG7H/ZpXqZyZ7fVDnuMH2Pupdno159dYXg3rFauER0Ty/c7JSTCORUo
	ndQ7sq9N2eu6TT7I5ovOhrP/Z6f9syCni2tvg=
Received: by 10.227.141.135 with SMTP id m7mr5064665wbu.205.1277152682757;
	Mon, 21 Jun 2010 13:38:02 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id b17sm36704150wbd.1.2010.06.21.13.38.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 21 Jun 2010 13:38:02 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jun 2010 22:37:43 +0200
Message-Id: <1277152663-12051-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <AANLkTikjJzqog2Cla8H_JazzRw6QuSrSdllTOD7XwgBx@mail.gmail.com>
References: <AANLkTikjJzqog2Cla8H_JazzRw6QuSrSdllTOD7XwgBx@mail.gmail.com>
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-libc-headers: use kernel-arch.bbclass
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
X-List-Received-Date: Mon, 21 Jun 2010 20:42:48 -0000

linux-libc-headers recipes all have their own code to set ARCH.
However this same functionality is in kernel-arch.bbclass
This patch adds an inherit kernel-arch in linux-libc-headers.inc
and removes all arch calculation code from the recipes

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/linux-libc-headers/linux-libc-headers.inc  |    2 +
 .../linux-libc-headers_2.6.11.1.bb                 |   18 +-------------
 .../linux-libc-headers_2.6.15.99.bb                |   18 +-------------
 .../linux-libc-headers_2.6.18+2.6.19-rc1.bb        |   22 +----------------
 .../linux-libc-headers_2.6.18.bb                   |   23 +-----------------
 .../linux-libc-headers_2.6.20.bb                   |   25 +-------------------
 .../linux-libc-headers_2.6.22.bb                   |   25 +-------------------
 .../linux-libc-headers_2.6.23.bb                   |   25 +-------------------
 .../linux-libc-headers_2.6.24.bb                   |   25 +-------------------
 .../linux-libc-headers_2.6.25.bb                   |   25 +-------------------
 .../linux-libc-headers_2.6.29.bb                   |   25 +-------------------
 .../linux-libc-headers_2.6.30.bb                   |   25 +-------------------
 .../linux-libc-headers_2.6.31.bb                   |   25 +-------------------
 .../linux-libc-headers_2.6.32.bb                   |   25 +-------------------
 .../linux-libc-headers_2.6.7.0.bb                  |   18 +-------------
 .../linux-libc-headers_2.6.8.1.bb                  |   18 +-------------
 16 files changed, 17 insertions(+), 327 deletions(-)

diff --git a/recipes/linux-libc-headers/linux-libc-headers.inc b/recipes/linux-libc-headers/linux-libc-headers.inc
index 0b0d05a..3410f35 100644
--- a/recipes/linux-libc-headers/linux-libc-headers.inc
+++ b/recipes/linux-libc-headers/linux-libc-headers.inc
@@ -6,3 +6,5 @@ BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
+
+inherit kernel-arch
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
index 0f925dd..95143c9 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/"
 #   standard linux kernel license applies.
 # since we assume GPL for linux i think we can also assume it here
 INHIBIT_DEFAULT_DEPS = "1"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/linux-libc-headers-${PV}.tar.bz2 \
 	file://keyboard.patch"
@@ -15,22 +15,6 @@ SRC_URI = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/linux-libc-heade
 S = "${WORKDIR}/linux-libc-headers-${PV}"
 
 do_configure () {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=ppc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	esac
 	if test !  -e include/asm-$ARCH; then
 		oefatal unable to create asm symlink in kernel headers
 	fi
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
index 3dafb32..c5a6c4f 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
@@ -13,7 +13,7 @@ require linux-libc-headers.inc
 # since we assume GPL for linux i think we can also assume it here
 DEFAULT_PREFERENCE = "-1"
 INHIBIT_DEFAULT_DEPS = "1"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://ewi546.ewi.utwente.nl/OE/eabi/linux-libc-headers-${PV}.tar.bz2 \
 	file://keyboard.patch \
@@ -27,22 +27,6 @@ SRC_URI = "http://ewi546.ewi.utwente.nl/OE/eabi/linux-libc-headers-${PV}.tar.bz2
 S = "${WORKDIR}/linux-libc-headers-${PV}"
 
 do_configure () {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=ppc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	esac
 	if test !  -e include/asm-$ARCH; then
 		oefatal unable to create asm symlink in kernel headers
 	fi
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
index d5494d4..17d2091 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 DEFAULT_PREFERENCE = "-1"
 INHIBIT_DEFAULT_DEPS = "1"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = " \
 	${KERNELORG_MIRROR}/pub/linux/kernel/people/dwmw2/kernel-headers/snapshot/linux-kernel-headers-2.6.19-rc1.tar.bz2 \
@@ -13,27 +13,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/linux-2.6.19-rc1"
 
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	esac
-}
-
 do_install() {
-	set_arch
 	install -d ${D}${includedir}
 	cp -pfLR ${S}${includedir}/linux ${D}${includedir}/
 	cp -pfLR ${S}${includedir}/asm-${ARCH} ${D}${includedir}/asm
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
index 8d88bf1..80806ff 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb
@@ -2,34 +2,14 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.18.tar.bz2 \
            file://arm-syscall-define.patch"
 
 S = "${WORKDIR}/linux-2.6.18"
 
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	esac
-}
-
 do_configure() {
-	set_arch
 	oe_runmake allnoconfig ARCH=${ARCH}
 }
 
@@ -37,7 +17,6 @@ do_compile () {
 }
 
 do_install() {
-	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=${ARCH}
 	# Add UTS_RELEASE to version.h. UTS_RELEASE was moved from version.h to
 	# utsrelease.h in order to avoid recompiling a kernel every time a localversion
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
index f048ea3..32ce044 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h \
@@ -11,29 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 
 S = "${WORKDIR}/linux-${PV}"
 
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	        avr32*)   ARCH=avr32 ;;
-                bfin*)    ARCH=blackfin ;;
-	esac
-}
-
 do_configure() {
-	set_arch
 	oe_runmake allnoconfig ARCH=$ARCH
 }
 
@@ -41,7 +19,6 @@ do_compile () {
 }
 
 do_install() {
-	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 }
 
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
index 6b9a9f7..12845e0 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
@@ -2,36 +2,14 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h"
 
 S = "${WORKDIR}/linux-${PV}"
 
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	        avr32*)   ARCH=avr32 ;;
-                bfin*)    ARCH=blackfin ;;
-	esac
-}
-
 do_configure() {
-	set_arch
 	oe_runmake allnoconfig ARCH=$ARCH
 }
 
@@ -39,7 +17,6 @@ do_compile () {
 }
 
 do_install() {
-	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 }
 
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
index 742433f..474b96c 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h \
@@ -11,29 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 
 S = "${WORKDIR}/linux-${PV}"
 
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	        avr32*)   ARCH=avr32 ;;
-                bfin*)    ARCH=blackfin ;;
-	esac
-}
-
 do_configure() {
-	set_arch
 	oe_runmake allnoconfig ARCH=$ARCH
 }
 
@@ -41,7 +19,6 @@ do_compile () {
 }
 
 do_install() {
-	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 }
 
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
index 74876bf..b90c478 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://procinfo.h \
@@ -10,29 +10,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 
 S = "${WORKDIR}/linux-${PV}"
 
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	        avr32*)   ARCH=avr32 ;;
-                bfin*)    ARCH=blackfin ;;
-	esac
-}
-
 do_configure() {
-	set_arch
 	oe_runmake allnoconfig ARCH=$ARCH
 }
 
@@ -40,7 +18,6 @@ do_compile () {
 }
 
 do_install() {
-	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 }
 
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
index c4200e0..084fea6 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 	   file://reinstate-a.out.h.patch \
@@ -13,29 +13,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 
 S = "${WORKDIR}/linux-${PV}"
 
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	        avr32*)   ARCH=avr32 ;;
-                bfin*)    ARCH=blackfin ;;
-	esac
-}
-
 do_configure() {
-	set_arch
 	oe_runmake allnoconfig ARCH=$ARCH
 }
 
@@ -43,7 +21,6 @@ do_compile () {
 }
 
 do_install() {
-	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 }
 
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
index d939349..d59fb4d 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
@@ -2,36 +2,14 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 	  "
 
 S = "${WORKDIR}/linux-${PV}"
 
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	        avr32*)   ARCH=avr32 ;;
-                bfin*)    ARCH=blackfin ;;
-	esac
-}
-
 do_configure() {
-	set_arch
 	oe_runmake allnoconfig ARCH=$ARCH
 }
 
@@ -39,7 +17,6 @@ do_compile () {
 }
 
 do_install() {
-	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 }
 
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
index 0048f24..c64e59c 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 	   file://uio-header.patch \
@@ -12,29 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 
 S = "${WORKDIR}/linux-${PV}"
 
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	        avr32*)   ARCH=avr32 ;;
-                bfin*)    ARCH=blackfin ;;
-	esac
-}
-
 do_configure() {
-	set_arch
 	oe_runmake allnoconfig ARCH=$ARCH
 }
 
@@ -42,7 +20,6 @@ do_compile () {
 }
 
 do_install() {
-	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 }
 
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
index e3a27c5..c31d482 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r4"
+PR = "r5"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -11,29 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 	  "
 S = "${WORKDIR}/linux-${PV}"
 
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	        avr32*)   ARCH=avr32 ;;
-                bfin*)    ARCH=blackfin ;;
-	esac
-}
-
 do_configure() {
-	set_arch
 	oe_runmake allnoconfig ARCH=$ARCH
 }
 
@@ -41,7 +19,6 @@ do_compile () {
 }
 
 do_install() {
-	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
 }
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
index 16304df..b12100c 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r4"
+PR = "r5"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -11,29 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
 	  "
 S = "${WORKDIR}/linux-${PV}"
 
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	        avr32*)   ARCH=avr32 ;;
-                bfin*)    ARCH=blackfin ;;
-	esac
-}
-
 do_configure() {
-	set_arch
 	oe_runmake allnoconfig ARCH=$ARCH
 }
 
@@ -41,7 +19,6 @@ do_compile () {
 }
 
 do_install() {
-	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
 }
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
index 0a1159a..8141fac 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 NATIVE_INSTALL_WORKS = "0"
-PR = "r4"
+PR = "r5"
 # NOTE: no need to package these headers, since the c library includes them.
 PACKAGES = ""
 
@@ -12,22 +12,6 @@ SRC_URI = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/linux-libc-heade
 S = "${WORKDIR}/linux-libc-headers-${PV}"
 
 do_configure () {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=ppc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	esac
 	if test !  -e include/asm-$ARCH; then
 		oefatal unable to create asm symlink in kernel headers
 	fi
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
index 6cbd8ba..15c4e6d 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/"
 #   standard linux kernel license applies.
 # since we assume GPL for linux i think we can also assume it here
 INHIBIT_DEFAULT_DEPS = "1"
-PR = "r8"
+PR = "r9"
 
 # NOTE: no need to package these headers, since the c library includes them.
 PACKAGES = ""
@@ -20,22 +20,6 @@ SRC_URI = "http://ep09.pld-linux.org/~mmazur/linux-libc-headers/linux-libc-heade
 S = "${WORKDIR}/linux-libc-headers-${PV}"
 
 do_configure () {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=ppc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-	esac
 	if test !  -e include/asm-$ARCH; then
 		oefatal unable to create asm symlink in kernel headers
 	fi
-- 
1.6.4.2



