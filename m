Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NM7mn-0006Gh-B1
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Dec 2009 23:28:32 +0100
Received: by mail-gx0-f215.google.com with SMTP id 7so8977535gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Dec 2009 14:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=4krCGxDy4yp8kOTSwXBntR40nzWVlaA5r3lTaaukRjU=;
	b=Z9l5V/MORs0BONOv05VqNrWWADwVjkiySf9o7VWHK9q54L09mTtJ/Hc58WxIW9V1w4
	4fgbf3Z/dnn11w4ITqpTBqEpWEogXrjkVcxaBnDT9JrDwI/N24c9s/DMMn7yZ8VTZvA6
	wMGMDx8QoPwmYM2CR8F1OGbWtNF/cTMyzLRO4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=EAUELztAbMRIgBwMqTPOCq4SCts6SCzFr/TdA8xqc1JbhrupnkEg4xYcD6zgCOpUXS
	DR6j8UZig+tmoh45MyUQVCsBk6QXCzXAoodnqIINrurGh4W/5I2svqwlol/5IQgjXENo
	vJADcyIQMduo/qHu7YuO0+w/Ep5u/XXMLaJUc=
Received: by 10.150.24.2 with SMTP id 2mr8809909ybx.172.1261261601722;
	Sat, 19 Dec 2009 14:26:41 -0800 (PST)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 23sm3304102iwn.3.2009.12.19.14.26.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 19 Dec 2009 14:26:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Dec 2009 14:26:35 -0800
Message-Id: <1261261596-19241-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/3] gcc: Enable mips plt extentions if DISTRO_FEATURE has mplt.
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
X-List-Received-Date: Sat, 19 Dec 2009 22:28:32 -0000

* Newer gcc (4.4+) has implemented -mplt option to
  enable PLT and copy relocation extentions of MIPS ABI
  which makes shared code run a lot faster. This feature
  is however controlled by DISTRO_FEATURES which should
  add 'mplt' to DISTRO_FEATURES to enable it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-3.3.4.inc              |    2 +-
 recipes/gcc/gcc-3.4.3.inc              |    2 +-
 recipes/gcc/gcc-3.4.4.inc              |    2 +-
 recipes/gcc/gcc-4.1.0.inc              |    2 +-
 recipes/gcc/gcc-4.1.1.inc              |    2 +-
 recipes/gcc/gcc-4.1.2.inc              |    2 +-
 recipes/gcc/gcc-4.2.2.inc              |    2 +-
 recipes/gcc/gcc-4.2.3.inc              |    2 +-
 recipes/gcc/gcc-4.2.4.inc              |    2 +-
 recipes/gcc/gcc-4.3.1.inc              |    2 +-
 recipes/gcc/gcc-4.3.2.inc              |    2 +-
 recipes/gcc/gcc-4.3.3.inc              |    2 +-
 recipes/gcc/gcc-4.3.4.inc              |    2 +-
 recipes/gcc/gcc-4.4.1.inc              |    2 +-
 recipes/gcc/gcc-4.4.2.inc              |    2 +-
 recipes/gcc/gcc-common.inc             |    5 +++++
 recipes/gcc/gcc-configure-common.inc   |    5 ++++-
 recipes/gcc/gcc-cross-initial.inc      |    3 ++-
 recipes/gcc/gcc-cross-intermediate.inc |    3 ++-
 19 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/recipes/gcc/gcc-3.3.4.inc b/recipes/gcc/gcc-3.3.4.inc
index 635e617..a3fbdde 100644
--- a/recipes/gcc/gcc-3.3.4.inc
+++ b/recipes/gcc/gcc-3.3.4.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 SRC_URI = "${GNU_MIRROR}/gcc/releases/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://arm-gotoff.dpatch;patch=1;pnum=0 \
diff --git a/recipes/gcc/gcc-3.4.3.inc b/recipes/gcc/gcc-3.4.3.inc
index 72f9042..febe0fc 100644
--- a/recipes/gcc/gcc-3.4.3.inc
+++ b/recipes/gcc/gcc-3.4.3.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://gcc34-reverse-compare.patch;patch=1 \
diff --git a/recipes/gcc/gcc-3.4.4.inc b/recipes/gcc/gcc-3.4.4.inc
index 9a02c5d..b87e1e3 100644
--- a/recipes/gcc/gcc-3.4.4.inc
+++ b/recipes/gcc/gcc-3.4.4.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-INC_PR = "r14"
+INC_PR = "r15"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://gcc34-reverse-compare.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
index 7bb1a34..df0ae3f 100644
--- a/recipes/gcc/gcc-4.1.0.inc
+++ b/recipes/gcc/gcc-4.1.0.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/gcc/gcc-4.1.1.inc b/recipes/gcc/gcc-4.1.1.inc
index 68323ac..a960b41 100644
--- a/recipes/gcc/gcc-4.1.1.inc
+++ b/recipes/gcc/gcc-4.1.1.inc
@@ -2,7 +2,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://100-uclibc-conf.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
index 911d2d9..21bf486 100644
--- a/recipes/gcc/gcc-4.1.2.inc
+++ b/recipes/gcc/gcc-4.1.2.inc
@@ -2,7 +2,7 @@ require gcc-common.inc
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r21"
+INC_PR = "r22"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://100-uclibc-conf.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.2.2.inc b/recipes/gcc/gcc-4.2.2.inc
index 0eb1223..931de9a 100644
--- a/recipes/gcc/gcc-4.2.2.inc
+++ b/recipes/gcc/gcc-4.2.2.inc
@@ -3,7 +3,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r15"
+INC_PR = "r16"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://100-uclibc-conf.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.2.3.inc b/recipes/gcc/gcc-4.2.3.inc
index 1501c7e..b2fb029 100644
--- a/recipes/gcc/gcc-4.2.3.inc
+++ b/recipes/gcc/gcc-4.2.3.inc
@@ -3,7 +3,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r12"
+INC_PR = "r17"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://100-uclibc-conf.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
index 3249c09..e96122a 100644
--- a/recipes/gcc/gcc-4.2.4.inc
+++ b/recipes/gcc/gcc-4.2.4.inc
@@ -3,7 +3,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://100-uclibc-conf.patch;patch=1 \
diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
index 0b05f0a..3eaff45 100644
--- a/recipes/gcc/gcc-4.3.1.inc
+++ b/recipes/gcc/gcc-4.3.1.inc
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r19"
+INC_PR = "r20"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
index 5483b8f..8d40d72 100644
--- a/recipes/gcc/gcc-4.3.2.inc
+++ b/recipes/gcc/gcc-4.3.2.inc
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index 46d5e35..47bfbc6 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
diff --git a/recipes/gcc/gcc-4.3.4.inc b/recipes/gcc/gcc-4.3.4.inc
index 2b1054c..ff02ac5 100644
--- a/recipes/gcc/gcc-4.3.4.inc
+++ b/recipes/gcc/gcc-4.3.4.inc
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	file://fedora/gcc43-c++-builtin-redecl.patch;patch=1;pnum=0 \
diff --git a/recipes/gcc/gcc-4.4.1.inc b/recipes/gcc/gcc-4.4.1.inc
index 9daff95..cbf28dd 100644
--- a/recipes/gcc/gcc-4.4.1.inc
+++ b/recipes/gcc/gcc-4.4.1.inc
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 FILESPATHPKG .= ":gcc-$PV"
 
diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
index 514cc9f..1ef1359 100644
--- a/recipes/gcc/gcc-4.4.2.inc
+++ b/recipes/gcc/gcc-4.4.2.inc
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "mpfr gmp"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 FILESPATHPKG .= ":gcc-$PV"
 
diff --git a/recipes/gcc/gcc-common.inc b/recipes/gcc/gcc-common.inc
index 6e777e6..97b140c 100644
--- a/recipes/gcc/gcc-common.inc
+++ b/recipes/gcc/gcc-common.inc
@@ -15,6 +15,11 @@ def get_gcc_fpu_setting(bb, d):
         return "--with-float=soft"
     return ""
 
+def get_gcc_mips_plt_setting(bb, d):
+    if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'mips', 'mipsel' ] and 'mplt' in bb.data.getVar('DISTRO_FEATURES',d,1).split() :
+        return "--with-mips-plt"
+    return ""
+
 # We really need HOST_SYS here for some packages and TARGET_SYS for others.
 # For now, libgcc is most important so we fix for that - RP.
 SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
index 8a96326..ee6c0e7 100644
--- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -13,6 +13,8 @@ OBJC_linux-uclibceabi ?= ""
 OBJC_linux-uclibc ?= ""
 OBJC_avr ?= ""
 OBJC_nylon ?= ""
+OBJC_mips ?= ""
+OBJC_mipsel ?= ""
 OBJC ?= ",objc"
 
 # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
@@ -36,7 +38,8 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d,
                 --program-prefix=${TARGET_PREFIX} \
                 ${EXTRA_OECONF_BASE} \
                 ${EXTRA_OECONF_FPU} \
-                ${EXTRA_OECONF_PATHS}"
+                ${EXTRA_OECONF_PATHS} \
+		${@get_gcc_mips_plt_setting(bb, d)}"
 
 # Build uclibc compilers without cxa_atexit support
 EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
diff --git a/recipes/gcc/gcc-cross-initial.inc b/recipes/gcc/gcc-cross-initial.inc
index a2c4445..2ab1d7f 100644
--- a/recipes/gcc/gcc-cross-initial.inc
+++ b/recipes/gcc/gcc-cross-initial.inc
@@ -16,7 +16,8 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--program-prefix=${TARGET_PREFIX} \
 		--with-sysroot=${STAGING_DIR_TARGET} \
 		--with-build-sysroot=${STAGING_DIR_TARGET} \
-		${@get_gcc_fpu_setting(bb, d)}"
+		${@get_gcc_fpu_setting(bb, d)} \
+		${@get_gcc_mips_plt_setting(bb, d)}"
 
 do_install () {
 	:
diff --git a/recipes/gcc/gcc-cross-intermediate.inc b/recipes/gcc/gcc-cross-intermediate.inc
index ccfa2b4..50792b6 100644
--- a/recipes/gcc/gcc-cross-intermediate.inc
+++ b/recipes/gcc/gcc-cross-intermediate.inc
@@ -14,7 +14,8 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--program-prefix=${TARGET_PREFIX} \
 		--with-sysroot=${STAGING_DIR_TARGET} \
 		--with-build-sysroot=${STAGING_DIR_TARGET} \
-		${@get_gcc_fpu_setting(bb, d)}"
+		${@get_gcc_fpu_setting(bb, d)} \
+		${@get_gcc_mips_plt_setting(bb, d)}"
 
 do_stage_append () {
 	# get rid of dummy libc.so
-- 
1.6.3.3



