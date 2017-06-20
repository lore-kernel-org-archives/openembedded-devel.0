Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2566E78223
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 06:47:16 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id w12so21176317pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 23:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zD33EMskISzS8akfmC9RzZiTZu27qYZmCox3rrw1emI=;
	b=Qw9km76Bm5UlgPHoU535BXCThga3gVuNvQCl/AIJCKZ11sG76TL8pdxyChHUNVel3/
	cJgeRj7Q97N05IgCtPkBq6Kp7tgzZ7mp3Ll5hhtNvSgzHklrO6l+HZEOmBPccgQvBUCa
	io6w4vm+xf2Kek5fkVdr+XFP9RfVhuER/QuGCTuEAufdsMtxcC+OPiz6DQEv8l1WCwGL
	HFpzNfnOygrkbYcmhKqYra5/99co3S5oa7nCt7qU9Mn553iPBIDonymFAmt788BQGW/p
	0zS294UHxwxuK6/JMGQ5b4IlXYfm9yJmBOXmnln2Jv+7XB7TIpb4ls3rsYgQb5lvE2oA
	CNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zD33EMskISzS8akfmC9RzZiTZu27qYZmCox3rrw1emI=;
	b=Y7eHAFOrtmBqjuAt3/mU3QcqqNw3I5k2nfDAN37cYez8hWu7xb81dBPa47UpshDNHN
	/bYtYpMF70s1Rxm+GhhwEZIjQtXu/0DEe5kqWN26lSPzQBxeaB3YAA2foeOLubUkxfC/
	VKRRmdBFImfqzMr1ns6kbF+0XOM8+XVMd/XO9LPOPA7HgKac6W9K0BbiQ6iYwvkhhEn+
	NkLQ4T/Sbue5JAaIAilv6ko+TBeg+zusUUOiz2q+4wkDdM8VLJ8RMCfEtX0I3BR/5YMm
	e/njqUrq1CfdDVlXqmIS2PVghJR4dgaQqRliHp1owmqtsieNhF5KdoQhRErQuI8ewuru
	thmA==
X-Gm-Message-State: AKS2vOyhXmor1EKO0M4RF58BXuk1g0q/Hq8kDd2xyk301JK/BhQs+9Gn
	kFaMzkarJCFQtf3A
X-Received: by 10.99.49.20 with SMTP id x20mr29744120pgx.181.1497941237871;
	Mon, 19 Jun 2017 23:47:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	x27sm28180033pfe.113.2017.06.19.23.47.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 23:47:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Jun 2017 23:47:01 -0700
Message-Id: <20170620064701.28084-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170620064701.28084-1-raj.khem@gmail.com>
References: <20170620064701.28084-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] squid: Upgrade to 3.5.26
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Jun 2017 06:47:17 -0000

Fix build errors with gcc7 along the way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...heck-for-Wno-error-format-truncation-comp.patch | 116 +++++++++++++++++++++
 .../recipes-daemons/squid/files/gcc7-fixes.patch   |  17 +++
 .../squid/{squid_3.5.25.bb => squid_3.5.26.bb}     |   6 +-
 3 files changed, 137 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
 rename meta-networking/recipes-daemons/squid/{squid_3.5.25.bb => squid_3.5.26.bb} (94%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch b/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
new file mode 100644
index 000000000..0c0a3aad1
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
@@ -0,0 +1,116 @@
+From 14d469bc82c758116aef7d549abd49c131b4170f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Apr 2017 11:54:57 -0700
+Subject: [PATCH] configure: Check for -Wno-error=format-truncation compiler
+ option
+
+If this option is supported by compiler then disable it ( gcc7+)
+Fixes
+client.c:834:23: error: '%s' directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Werror=format-truncation=]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                |  3 +-
+ m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 76 insertions(+), 1 deletion(-)
+ create mode 100644 m4/ax_check_compile_flag.m4
+
+Index: squid-3.5.26/configure.ac
+===================================================================
+--- squid-3.5.26.orig/configure.ac
++++ squid-3.5.26/configure.ac
+@@ -26,6 +26,7 @@ m4_include([acinclude/pkg.m4])
+ m4_include([acinclude/lib-checks.m4])
+ m4_include([acinclude/ax_cxx_compile_stdcxx_11.m4])
+ m4_include([acinclude/ax_cxx_0x_types.m4])
++m4_include([acinclude/ax_check_compile_flag.m4])
+ 
+ HOSTCXX="$BUILD_CXX"
+ PRESET_CFLAGS="$CFLAGS"
+@@ -44,6 +45,7 @@ AC_PROG_CXX
+ AC_LANG([C++])
+ AC_CANONICAL_HOST
+ 
++AX_CHECK_COMPILE_FLAG([-Werror=format-truncation],[CFLAGS="$CFLAGS -Wno-error=format-truncation" CXXFLAGS="$CXXFLAGS -Wno-error=format-truncation"])
+ # Clang 3.2 on some CPUs requires -march-native to detect correctly.
+ # GCC 4.3+ can also produce faster executables when its used.
+ # But building inside a virtual machine environment has been found to
+Index: squid-3.5.26/acinclude/ax_check_compile_flag.m4
+===================================================================
+--- /dev/null
++++ squid-3.5.26/acinclude/ax_check_compile_flag.m4
+@@ -0,0 +1,74 @@
++# ===========================================================================
++#  https://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_CHECK_COMPILE_FLAG(FLAG, [ACTION-SUCCESS], [ACTION-FAILURE], [EXTRA-FLAGS], [INPUT])
++#
++# DESCRIPTION
++#
++#   Check whether the given FLAG works with the current language's compiler
++#   or gives an error.  (Warnings, however, are ignored)
++#
++#   ACTION-SUCCESS/ACTION-FAILURE are shell commands to execute on
++#   success/failure.
++#
++#   If EXTRA-FLAGS is defined, it is added to the current language's default
++#   flags (e.g. CFLAGS) when the check is done.  The check is thus made with
++#   the flags: "CFLAGS EXTRA-FLAGS FLAG".  This can for example be used to
++#   force the compiler to issue an error when a bad flag is given.
++#
++#   INPUT gives an alternative input source to AC_COMPILE_IFELSE.
++#
++#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION. Please keep this
++#   macro in sync with AX_CHECK_{PREPROC,LINK}_FLAG.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
++#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
++#
++#   This program is free software: you can redistribute it and/or modify it
++#   under the terms of the GNU General Public License as published by the
++#   Free Software Foundation, either version 3 of the License, or (at your
++#   option) any later version.
++#
++#   This program is distributed in the hope that it will be useful, but
++#   WITHOUT ANY WARRANTY; without even the implied warranty of
++#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
++#   Public License for more details.
++#
++#   You should have received a copy of the GNU General Public License along
++#   with this program. If not, see <https://www.gnu.org/licenses/>.
++#
++#   As a special exception, the respective Autoconf Macro's copyright owner
++#   gives unlimited permission to copy, distribute and modify the configure
++#   scripts that are the output of Autoconf when processing the Macro. You
++#   need not follow the terms of the GNU General Public License when using
++#   or distributing such scripts, even though portions of the text of the
++#   Macro appear in them. The GNU General Public License (GPL) does govern
++#   all other use of the material that constitutes the Autoconf Macro.
++#
++#   This special exception to the GPL applies to versions of the Autoconf
++#   Macro released by the Autoconf Archive. When you make and distribute a
++#   modified version of the Autoconf Macro, you may extend this special
++#   exception to the GPL to apply to your modified version as well.
++
++#serial 5
++
++AC_DEFUN([AX_CHECK_COMPILE_FLAG],
++[AC_PREREQ(2.64)dnl for _AC_LANG_PREFIX and AS_VAR_IF
++AS_VAR_PUSHDEF([CACHEVAR],[ax_cv_check_[]_AC_LANG_ABBREV[]flags_$4_$1])dnl
++AC_CACHE_CHECK([whether _AC_LANG compiler accepts $1], CACHEVAR, [
++  ax_check_save_flags=$[]_AC_LANG_PREFIX[]FLAGS
++  _AC_LANG_PREFIX[]FLAGS="$[]_AC_LANG_PREFIX[]FLAGS $4 $1"
++  AC_COMPILE_IFELSE([m4_default([$5],[AC_LANG_PROGRAM()])],
++    [AS_VAR_SET(CACHEVAR,[yes])],
++    [AS_VAR_SET(CACHEVAR,[no])])
++  _AC_LANG_PREFIX[]FLAGS=$ax_check_save_flags])
++AS_VAR_IF(CACHEVAR,yes,
++  [m4_default([$2], :)],
++  [m4_default([$3], :)])
++AS_VAR_POPDEF([CACHEVAR])dnl
++])dnl AX_CHECK_COMPILE_FLAGS
diff --git a/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch b/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
new file mode 100644
index 000000000..cc1ea78a5
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
@@ -0,0 +1,17 @@
+../../squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc: In function 'void squidaio_init()':                                                              ../../squid-3.5.26/src/DiskIO/DiskThreads/DiskThreads.h:30:50: error: '*' in boolean context, suggest '&&' instead [-Werror=int-in-bool-context]      #define NUMTHREADS (Config.cacheSwap.n_configured*16)
+
+
+Upstream-Status: Backport
+Index: squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc
+===================================================================
+--- squid-3.5.26.orig/src/DiskIO/DiskThreads/aiops.cc
++++ squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc
+@@ -290,7 +290,7 @@ squidaio_init(void)
+     /* Create threads and get them to sit in their wait loop */
+     squidaio_thread_pool = memPoolCreate("aio_thread", sizeof(squidaio_thread_t));
+ 
+-    assert(NUMTHREADS);
++    assert(NUMTHREADS != 0);
+ 
+     for (i = 0; i < NUMTHREADS; ++i) {
+         threadp = (squidaio_thread_t *)squidaio_thread_pool->alloc();
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.25.bb b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
similarity index 94%
rename from meta-networking/recipes-daemons/squid/squid_3.5.25.bb
rename to meta-networking/recipes-daemons/squid/squid_3.5.26.bb
index 5116383b8..e1b4c06dc 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.25.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
@@ -22,9 +22,11 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://set_sysroot_patch.patch \
            file://squid-don-t-do-squid-conf-tests-at-build-time.patch \
            file://0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch \
+           file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
+           file://gcc7-fixes.patch \
            "
-SRC_URI[md5sum] = "c34b228129a755f363367c45c46287ba"
-SRC_URI[sha256sum] = "0bfd6182154b7f29574d71c659f1cfd1b7d9be9356895dac70dc0f3696a0639b"
+SRC_URI[md5sum] = "dc1830cd361e077814aa39bcc3691d8b"
+SRC_URI[sha256sum] = "41d8845863dcd026c856508cd1599d417c8947ffd96e86e24085f9893cb8b8c2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
                     file://errors/COPYRIGHT;md5=8861130fae91400bcf99b66f133172b3 \
-- 
2.13.1


