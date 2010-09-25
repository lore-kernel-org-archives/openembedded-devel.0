Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzdvV-0006vv-OC
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:13:23 +0200
Received: by pwi10 with SMTP id 10so937581pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=A8TGkp/yFR+9jLip3hJhWMqHI3WQoPVVgXcGltGejko=;
	b=TWg1V4RuAvTjstwvfmjBfSqd1YrMCz2HDb0RZysqelWuu5MFL6qJ/W40Qz0D87ZlbJ
	g3x/hn4fm3hwOYFjPsZuLorGt5y2nkwe4ATYsovnpVTp5CVRBDyHpbVrbmS13sfiG7Mx
	H+zvSjc+502YGvrJqCk1GiO4VasaHFDAUqD7U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=K0sBJWNWL6qmgfA4cXqethMHbZLEOIIER58z8qoWgBWsxaQ8kKKZBRWaAae7NQNr40
	G5HcHSs2+jOXj94QYQNfSad4acIajl/up4QjFSjX+NODsOkLVDv9IBkEymbzhR1pmzb3
	Sd56ZWudwKFRNxw1LOEKQQ/7N+bblW0X9DCNc=
Received: by 10.114.135.11 with SMTP id i11mr5780345wad.2.1285456376566;
	Sat, 25 Sep 2010 16:12:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.12.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:12:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:29 -0700
Message-Id: <1285456353-27457-9-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 08/12] gcc-4.5: Add support to build for mips64
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
X-List-Received-Date: Sat, 25 Sep 2010 23:13:27 -0000

* Defaults to mabi=64 which means N64 is the default supported ABI
* Tweak multilib directories to emit mips64 into /lib instead of /lib64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-4.5.inc                     |    6 +++
 recipes/gcc/gcc-4.5/mips64-nomultilib.patch |   52 +++++++++++++++++++++++++++
 recipes/gcc/gcc-configure-common.inc        |    2 +
 3 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.5/mips64-nomultilib.patch

diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index b7bd87b..0a13c2b 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -33,6 +33,9 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
 	   file://Makefile.in.patch \
 	  "
 
+SRC_URI_append_mips64 = " file://mips64-nomultilib.patch"
+SRC_URI_append_mips64el = " file://mips64-nomultilib.patch"
+
 # Language Overrides
 FORTRAN = ""
 JAVA = ""
@@ -55,3 +58,6 @@ EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap --disable-libgomp --disable-li
 EXTRA_OECONF_append_linux-uclibc = " --disable-decimal-float "
 EXTRA_OECONF_append_linux-uclibceabi = " --disable-decimal-float "
 EXTRA_OECONF_append_linux-uclibcspe = " --disable-decimal-float "
+
+EXTRA_OECONF_append_mips64 = " --with-arch-64=mips64 --with-tune-64=mips64"
+EXTRA_OECONF_append_mips64el = " --with-arch-64=mips64 --with-tune-64=mips64"
diff --git a/recipes/gcc/gcc-4.5/mips64-nomultilib.patch b/recipes/gcc/gcc-4.5/mips64-nomultilib.patch
new file mode 100644
index 0000000..1ef69f8
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/mips64-nomultilib.patch
@@ -0,0 +1,52 @@
+Index: gcc-4.5/gcc/config/mips/linux64.h
+===================================================================
+--- gcc-4.5.orig/gcc/config/mips/linux64.h	2010-09-25 02:05:05.484423095 -0700
++++ gcc-4.5/gcc/config/mips/linux64.h	2010-09-25 02:31:18.524931014 -0700
+@@ -26,7 +26,7 @@
+   BASE_DRIVER_SELF_SPECS, \
+   LINUX_DRIVER_SELF_SPECS \
+   " %{!EB:%{!EL:%(endian_spec)}}" \
+-  " %{!mabi=*: -mabi=n32}"
++  " %{!mabi=*: -mabi=64}"
+ 
+ #undef LIB_SPEC
+ #define LIB_SPEC "\
+@@ -35,9 +35,9 @@
+ %{!shared: \
+   %{profile:-lc_p} %{!profile:-lc}}"
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld.so.1"
+-#define GLIBC_DYNAMIC_LINKERN32 "/lib32/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER32 "/lib32/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER64 "/lib/ld.so.1"
++#define GLIBC_DYNAMIC_LINKERN32 "/lib64/ld.so.1"
+ #define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
+ #define LINUX_DYNAMIC_LINKERN32 \
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32)
+Index: gcc-4.5/gcc/config.gcc
+===================================================================
+--- gcc-4.5.orig/gcc/config.gcc	2010-07-22 16:37:17.000000000 -0700
++++ gcc-4.5/gcc/config.gcc	2010-09-25 02:25:41.412414136 -0700
+@@ -1707,7 +1707,7 @@
+ 	*-*-irix6*)
+ 		tm_file="${tm_file} mips/iris6.h"
+ 		tmake_file="${tmake_file} mips/t-iris6"
+-		tm_defines="${tm_defines} MIPS_ISA_DEFAULT=3 MIPS_ABI_DEFAULT=ABI_N32"
++		tm_defines="${tm_defines} MIPS_ISA_DEFAULT=3 MIPS_ABI_DEFAULT=ABI_64"
+ 		case ${target} in
+ 		*-*-irix6.[0-4]*)
+ 			use_gcc_stdint=provide
+Index: gcc-4.5/gcc/config/mips/t-linux64
+===================================================================
+--- gcc-4.5.orig/gcc/config/mips/t-linux64	2010-07-11 16:14:42.000000000 -0700
++++ gcc-4.5/gcc/config/mips/t-linux64	2010-09-25 02:29:52.758708250 -0700
+@@ -18,7 +18,7 @@
+ 
+ MULTILIB_OPTIONS = mabi=n32/mabi=32/mabi=64
+ MULTILIB_DIRNAMES = n32 32 64
+-MULTILIB_OSDIRNAMES = ../lib32 ../lib ../lib64
++MULTILIB_OSDIRNAMES = ../lib64 ../lib32 ../lib
+ 
+ EXTRA_MULTILIB_PARTS=crtbegin.o crtend.o crtbeginS.o crtendS.o crtbeginT.o
+ 
diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
index bad70a4..fe0d32d 100644
--- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -53,6 +53,8 @@ EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_linux-gnueabi       = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_linux-uclibc        = " --disable-__cxa_atexit"
 EXTRA_OECONF_append_linux-uclibceabi    = " --disable-__cxa_atexit"
+EXTRA_OECONF_append_mips64    = " --with-abi=64"
+EXTRA_OECONF_append_mips64el    = " --with-abi=64"
 EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
 CPPFLAGS = ""
 
-- 
1.7.0.4



