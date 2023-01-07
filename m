Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782C2C54EBD
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 03:07:11 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.13128.1673060825595697923
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jan 2023 19:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B/k5JG96;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so7157270pjj.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 19:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOSphhzQNamDw57LEqvCWl294DuY098pojpHnKiN1Ro=;
        b=B/k5JG96dYrugs9qz0r97lclJAp1p6Yz6T5CcSDU3XC9bnypJ9pf69xYfMsj+Dx5JX
         QzshQyvKQxNCvul7y1pabPo5ph4zSUPGyjA0v3TbnZwrdA0c9/PX7lfs7zOJxR+pNNIW
         cyzKeBIHGg0z9OJpR1LZnV8tr1BxRjLS5CQGwTilndfeYuy1PsbD9G9WqFOQ3+UYxNUv
         Pf6qXTGtwxQ77geQoiiF5uX61lajXec1cimxI+3UxFY5bjvrqsOJg2LgpVc+LDegO57E
         FbtWk5C9qI9EshpUBhT5HkEQQpmuYEZL8lGzwa16Q9J3vNQO6h0ToiLSgZVXY3/QOPwx
         tTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOSphhzQNamDw57LEqvCWl294DuY098pojpHnKiN1Ro=;
        b=v7d22KqqRt+dsWdyzehC0M7yceiK6bBwD4LDyoD/AGGEuyP4A4P/xf7m13WqOFkRmr
         DFrmSh00xiVP1ka459tVrc9xp8FFgLrLfZWEkVzclpTVKJwO/Ag8X0trPo+qfq4MI3sm
         I21vV2CkrtmPHPV9m0WH98aVkvHL+WA8AWLNxg8OqbE58L4YOXVfiAl/V8Ff6wC3h5ZY
         m3QSl7PZmuyTqnMmNq8TlVOvwxs0jKHp/j/shE+8e4BYhOmJDhAtGMSOSQxO48Bz+Elv
         sHINUxwp3Sec8iXgMWobQ5fz/D03sm/bFfVv27fgiTlmIU2CfRVRob1rN/ZwXtZ0AMtg
         4kVg==
X-Gm-Message-State: AFqh2kqdKFjuAYF0sAxpWXPIdlnICW+9XyOCezcIJDLSidRgxYAVx1Tl
	OGi65mJ6Us/FmMek/zHLzgaGhLQidN9JYg==
X-Google-Smtp-Source: AMrXdXsw1Ce+yGtFLE0D5V9UxvgIwIrzlKyElmR8S+ttZazlYps/vaC0I/wfysE5B/iAMz0hp+yQig==
X-Received: by 2002:a05:6a20:e61b:b0:af:7ed7:d370 with SMTP id my27-20020a056a20e61b00b000af7ed7d370mr65721673pzb.43.1673060824648;
        Fri, 06 Jan 2023 19:07:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id q1-20020aa79821000000b005821db4ff2csm1786180pfl.69.2023.01.06.19.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 19:07:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] concurrencykit: Update to 0.7.0
Date: Fri,  6 Jan 2023 19:06:59 -0800
Message-Id: <20230107030700.1371576-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230107030700.1371576-1-raj.khem@gmail.com>
References: <20230107030700.1371576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 03:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100430

Enable riscv as it is supported now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mpoiler-detection-logic-for-cross-co.patch | 89 +++++++++++++++++++
 .../concurrencykit/concurrencykit/cross.patch | 62 -------------
 .../concurrencykit/concurrencykit_git.bb      | 10 +--
 3 files changed, 93 insertions(+), 68 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch
 delete mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch
new file mode 100644
index 0000000000..57a587b39e
--- /dev/null
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch
@@ -0,0 +1,89 @@
+From e1dcd27e816520bdabc69511d90c4a2ebc242831 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 6 Jan 2023 18:51:34 -0800
+Subject: [PATCH] configure: Fix compoiler detection logic for
+ cross-compilation
+
+We can not run binaries during cross compile, so poke at compiler to
+figure out if it is clang or gcc, for OE we do not have other compilers
+in opensource world if there are we can extend this logic
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure | 56 ++++++++++++++++---------------------------------------
+ 1 file changed, 16 insertions(+), 40 deletions(-)
+
+diff --git a/configure b/configure
+index 9066abb..e382e61 100755
+--- a/configure
++++ b/configure
+@@ -661,48 +661,24 @@ if test "$PROFILE"; then
+ fi
+ 
+ printf "Finding suitable compiler........"
+-if test ! -x "${CC}"; then
+-	CC=`pathsearch "${CC:-cc}"`
+-	if test -z "$CC" -o ! -x "$CC"; then
+-		CC=`pathsearch "${CC:-gcc}"`
+-	fi
++if test -z "$CC"; then
++  if test ! -x "${CC}"; then
++	  CC=`pathsearch "${CC:-cc}"`
++	  if test -z "$CC" -o ! -x "$CC"; then
++		  CC=`pathsearch "${CC:-gcc}"`
++	  fi
++  fi
++  assert "$CC" "not found"
++fi
++if `$CC --version | grep gcc >& /dev/null`; then
++  COMPILER=gcc
++elif `$CC --version | grep clang >& /dev/null`; then
++  COMPILER=clang
++else
++  COMPILER="not found"
+ fi
+-assert "$CC" "not found"
+-
+-cat << EOF > .1.c
+-#include <stdio.h>
+-int main(void) {
+-#if defined(_WIN32)
+-#if defined(__MINGW64__)
+-	puts("mingw64");
+-	return (0);
+-#elif defined(__MINGW32__) && (__MINGW32_MAJOR_VERSION >= 3)
+-	puts("mingw32");
+-	return (0);
+-#else
+-	return (1);
+-#endif /* __MINGW32__ && __MINGW32_MAJOR_VERSION >= 3 */
+-#elif defined(__clang__) && (__clang_major__ >= 3)
+-	puts("clang");
+-	return (0);
+-#elif defined(__SUNPRO_C) && (__SUNPRO_C >= 0x5110)
+-	puts("suncc");
+-	return (0);
+-#elif defined(__GNUC__) && (__GNUC__ >= 4)
+-	puts("gcc");
+-	return (0);
+-#else
+-	return (1);
+-#endif
+-}
+-EOF
+-
+-$CC -o .1 .1.c
+-COMPILER=`./.1 2> /dev/null`
+-r=$?
+-rm -f .1.c .1
+ 
+-if test "$r" -ne 0; then
++if $COMPILER = "not found"; then
+ 	assert "" "update compiler"
+ else
+ 	echo "success [$CC]"
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
deleted file mode 100644
index 9e5058f2ca..0000000000
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From ab0eec78382bd00ce533aec2c84fd50c1733033d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 5 Jan 2013 19:42:51 -0800
-
----
- configure | 32 ++++++++++++++++++--------------
- 1 file changed, 18 insertions(+), 14 deletions(-)
-
-diff --git a/configure b/configure
-index 76c2812..78ce2ff 100755
---- a/configure
-+++ b/configure
-@@ -535,14 +535,18 @@ else
- 	GZIP_SUFFIX=".gz"
- fi
- 
--printf "Finding suitable compiler........"
--CC=`pathsearch "${CC:-cc}"`
--if test -z "$CC" -o ! -x "$CC"; then
--	CC=`pathsearch "${CC:-gcc}"`
-+if test -z "$CC"; then
-+	printf "Finding suitable compiler........"
-+	CC=`pathsearch "${CC:-cc}"`
-+	if test -z "$CC" -o ! -x "$CC"; then
-+		CC=`pathsearch "${CC:-gcc}"`
-+	fi
- fi
- assert "$CC" "not found"
- 
--cat << EOF > .1.c
-+if test -z "$COMPILER"; then
-+
-+	cat << EOF > .1.c
- #include <stdio.h>
- int main(void) {
- #if defined(_WIN32)
-@@ -569,16 +573,16 @@ int main(void) {
- #endif
- }
- EOF
-+	$CC -o .1 .1.c
-+	COMPILER=`./.1`
-+	r=$?
-+	rm -f .1.c .1
- 
--$CC -o .1 .1.c
--COMPILER=`./.1`
--r=$?
--rm -f .1.c .1
--
--if test "$r" -ne 0; then
--	assert "" "update compiler"
--else
--	echo "success [$CC]"
-+	if test "$r" -ne 0; then
-+		assert "" "update compiler"
-+	else
-+		echo "success [$CC]"
-+	fi
- fi
- 
- if test "$COMPILER" = "suncc"; then
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index 0018064119..cb65250e9a 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -7,16 +7,15 @@ LICENSE = "BSD-2-Clause & Apache-2.0"
 HOMEPAGE = "http://concurrencykit.org"
 SECTION = "base"
 
-PV = "0.5.1+git${SRCPV}"
-SRCREV = "f97d3da5c375ac2fc5a9173cdd36cb828915a2e1"
+PV = "0.7.0+git${SRCPV}"
+SRCREV = "6e8e5bec2e2f8cef2072a68579cbb07ababf3331"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0b24c1a8f9ad516a297d055b0294231"
 SRC_URI = "git://github.com/concurrencykit/ck.git;branch=master;protocol=https \
-           file://cross.patch \
-"
+           file://0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch"
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64|powerpc|powerpc64).*-linux*"
+COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64|powerpc|powerpc64|riscv32|riscv64).*-linux*"
 
 inherit autotools-brokensep
 
@@ -26,7 +25,6 @@ PLAT ?= "${HOST_ARCH}"
 
 do_configure () {
     export PLATFORM=${PLAT}
-    export COMPILER='gcc'
     ${S}/configure \
     --prefix=${prefix} \
     --includedir=${includedir} \
-- 
2.39.0


