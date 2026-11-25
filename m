Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37952.1795594112226424314
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EaTvX5Kf;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-385d8a00598so8057846eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594112; x=1796198912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mD0QiopVbxgEZZ+UKhowndzm1uN5MCeiyWIJtdUAJ2c=;
        b=EaTvX5Kfu6L3LcO3rWtMJcUsflCbChVYT+0UIpHKRlOsYKKAA1JK+yNhJUGqsQfEXM
         lPei7G7mqNoNuO64Ts9qmEeE/oN5A1z+XgHbV1MZpTw+BlD/MX13GCndECxEAo+aiBKG
         MRStDL4UC1oy3gpwAxU4X3PhQxl6rUbjU8+StGv8yRrHrgm/r7UddJeZN4CXD5+WEtdX
         NIOmh0arTqXTv5wRf5pYkfC7LQ08BOe3NgS5b1XbtmJkg+tqviwCriAVpYAoUbq7x1Gt
         V/Ga69F8tm+jcAsmR5BvWdVSctXS2FKciBiyPRlAv+X46yoGFZzH6rlJgEk0MMqsfp6w
         YBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594112; x=1796198912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mD0QiopVbxgEZZ+UKhowndzm1uN5MCeiyWIJtdUAJ2c=;
        b=vmxyvNxSjbwgts01eAzb2cqgKX1jQJFETg0vDt+F60GXNaBuSbRRwKlZl25HH4II5G
         GWVrERvSF7q03g3LHraiYIGlNH2dwPtUlWvRxDWCdAmt7G4L66nPAB7qksdFIksNGvhE
         Btv+VnjI3MUNUmtQWW34ly4O3fY2jjx/JK14JbZ5WrWbbEGsI8BEStavPjx60VjXGMnw
         y+IqFiWdEu0D2Q/TEcmk59BGkdTtdHC/u3XsF360F66+Tmns3XGTGSqYt5hu2uj1sIh9
         pf+7U3zBAWHt+uPvLno2HVlWfhZftWVArCd5AqDV0Cf3lIoV/S1DQgNKXXHpBNdbkDa0
         UGdQ==
X-Gm-Message-State: APuU4Z83bA5yB+Wy8nbIVMh1KlDpqY36NPRZOVnNYdmJFX4gI6mfkNN+
	AO9LZiaJo8UtETqJ/o6eoPG8af1npevMibLzox/Gv+ZuwQslPzSS0pzuTD/dvWEQ
X-Gm-Gg: AZFdTZefxsVeyOj4vNqVD3aUrGwmmdO97YdzN9RH9I9915iUpwA2zb1Eo1mjC60JJJ6
	jPxIsGQoYLIt73laB+OwhjJzqLCSvnQufzee3OCeRZr40fyHszDwO6UdJJjIkmWa0FOfj+kMDlI
	wLQqbZGodRDOlD5/cPZYC+jUhKa9TE37ufxlMCtnczYDe2d6AAWBC/cqhVdFpqdNGWwcnlnWn/P
	qQyOqMCcoH8d8rnME7dR1AU6CWOlJYZeH1bAVExAgVB9m0bGjt6uTKQ2CQOPJGvVXoSMRIWUzUk
	OpbV7h2b36Lku5OD2yTPXmvvr53QBB8hjkiGkXJWOaDRyKHVJpsmpRbvR98tZ6bMQrEgw1z5kxP
	bCYaaPIQ2OFeSFqgtQRtIK6Ti6ItRue/pagcrSulQ+bOxUPcqLuXNdXuUnEv8sHrPuKeCThVLMw
	aUJz5A3ayAXH5oUp/IlBOmotOKORvQSl6Bv98TJ8b9/l08+Ed78QanvSBT8mp6SNK475Uewud6A
	oJLRLseKN0YzE4olDFN8u/7oltjMtWhKBKwxuNVRO+7JzT2PIacyIoV6II7vlmN7I4858TmBLHU
	6hw5181sUTm0UYjy9b6M2WK65xwclcD3wvvWNLI45900YXQsKWT5SsDFFY7N2BWaXTkGYB9uMoP
	VO2vAQ/WlcJ7Otsr7qMKVehoe20zmMyxAnQG0KZ/5IoEpj2M09PfJoPetVNEKVOgFp5c1hetCZT
	MoTeUXcBdAEzDs5SIiFQyqLohdppgJm+L4FGTu7ZH3ZjqiUvJFXSYiTxzlBeeJbjWkw6jD3e9UN
	7xBwV2ZWzAEPmr5+SdJ4BLeJ5Ag/V6KS6dEeSqDo7+VEgbN+sOzBVys52vUNiEGAW/DQCbtBJb9
	lOVA
X-Received: by 2002:a05:7300:d205:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-3856fe564a1mr17308220eec.23.1795594111337;
        Wed, 25 Nov 2026 00:08:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 39/55] pcp: upgrade 6.3.8 -> 7.2.2
Date: Wed, 25 Nov 2026 00:06:55 -0800
Message-ID: <20261125080732.2419614-45-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133042
Content-Type: text/plain; charset="utf-8"

Upstream changes (CHANGELOG):
- libpcp.so.4 is the new default PMAPI with nanosecond timestamps;
  libpcp.so.3 and libpcp_import.so.1 are still built for backward
  compatibility, and pmapi.h selects the API with -DPMAPI_VERSION=2|4.
- New pmdaopentelemetry, pmdarocestat and pmdahdb agents, and the new
  pmlogpush, pcp2opentelemetry and pmseries_import tools.
- Python 2 support (3.6 minimum), Qt4 support, the BCC and JSON PMDAs
  and the rc_pcp init.d wrapper are removed.
- pmlogger/pmproxy gained a remote archive push webhook; hiredis is
  replaced by a vendored libvalkey.

Upstream no longer has a stable branch, and 6.3.8 is not on main, so
use branch=main where 7.2.2 is. Add an upstream check for the plain
version tags.

Drop fix_parallel_make.patch and
0001-pcp-htop-fix-header-build-race-condition.patch, both are in 7.2.2.
Refresh 0001-configure-Limit-the-header-search-to-sysroot.patch for the
new python3-config based header lookup, and
0001-Remove-unsuitble-part-for-cross-compile.patch for the reworked
AR check. Drop --with-python, --with-pmdajson and --with-pmdabcc, which
configure no longer knows.

Package the new libpcp.so.4 (libpcp4) and libpcp_import.so.2
(libpcp-import2) next to the compat libraries; libpcp_fault moves to
soname 4.

libpcp's exports lists getdomainname, which libpcp only defines when
libc lacks it, and lld fails on it with --no-undefined-version; link
with --undefined-version for clang. Package the new /etc/atop directory
and the libpcp_import tmpfiles.d snippet.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...cp-native_6.3.8.bb => pcp-native_7.2.2.bb} |   0
 meta-oe/recipes-support/pcp/pcp.inc           |   8 +-
 ...ove-unsuitble-part-for-cross-compile.patch |  20 ++--
 ...e-Limit-the-header-search-to-sysroot.patch |  25 ++--
 ...htop-fix-header-build-race-condition.patch |  33 -----
 .../pcp/pcp/fix_parallel_make.patch           | 113 ------------------
 .../pcp/{pcp_6.3.8.bb => pcp_7.2.2.bb}        |  19 ++-
 7 files changed, 42 insertions(+), 176 deletions(-)
 rename meta-oe/recipes-support/pcp/{pcp-native_6.3.8.bb => pcp-native_7.2.2.bb} (100%)
 delete mode 100644 meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch
 delete mode 100644 meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
 rename meta-oe/recipes-support/pcp/{pcp_6.3.8.bb => pcp_7.2.2.bb} (94%)

diff --git a/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb b/meta-oe/recipes-support/pcp/pcp-native_7.2.2.bb
similarity index 100%
rename from meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
rename to meta-oe/recipes-support/pcp/pcp-native_7.2.2.bb
diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index d80e700f2f..bbeaf7b4f0 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -7,13 +7,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=37ab75b580d5aad4ada04260efa3702f \
                     "
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRC_URI = "git://github.com/performancecopilot/pcp;branch=stable;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/performancecopilot/pcp;branch=main;protocol=https;tag=${PV} \
            file://0001-configure-Limit-the-header-search-to-sysroot.patch \
            file://0001-htop-Change-dependency-order-of-header-and-sourcefil.patch \
            file://config.linux \
 	   "
 
-SRCREV = "7b0943ade0bcecaf50ed4b4c2cc9084150420eff"
+SRCREV = "87fc51f5ea667b1b532a03752b1a9091b5d6b3de"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 
 inherit setuptools3-base pkgconfig autotools-brokensep
@@ -23,12 +24,9 @@ CACHED_CONFIGUREVARS = "PACKAGE_DISTRIBUTION=arch"
 EXTRA_OECONF:append = "\
                     --with-dstat-symlink=yes \
                     --with-infiniband=no \
-                    --with-python=no \
                     --with-perl=no \
                     --with-python3=yes \
-                    --with-pmdajson=no  \
                     --with-perfevent=no \
-                    --with-pmdabcc=yes \
                     --with-rundir=${localstatedir}/run \
                     --with-sysconfigdir=${sysconfdir} \
                     --with-logdir=${localstatedir}/log \
diff --git a/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch b/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch
index abf4aee61d..0cf5090084 100644
--- a/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch
+++ b/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch
@@ -7,28 +7,32 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 ---
- configure.ac               | 6 ------
- src/libpcp/src/GNUmakefile | 1 -
- 2 files changed, 7 deletions(-)
+ configure.ac               | 8 +-------
+ src/libpcp/src/GNUmakefile | 2 --
+ 2 files changed, 1 insertion(+), 9 deletions(-)
 
+diff --git a/configure.ac b/configure.ac
 --- a/configure.ac
 +++ b/configure.ac
-@@ -607,12 +607,6 @@ fi
+@@ -715,13 +715,7 @@ fi
  which=$WHICH
  AC_SUBST(which)
  
 -if test -z "$AR"; then
--    AC_PATH_PROGS(AR, [gcc-ar ar], /usr/bin/ar)
+-    AC_PATH_PROGS(AR, [gcc-ar ar], ar)
 -fi
--if test ! -x "$AR"; then
+-ar=`$which $AR`
+-if test ! -x "$ar"; then
 -    AC_MSG_ERROR([cannot find a valid 'ar' command.])
 -fi
- ar=$AR
++ar=$AR
  AC_SUBST(ar)
  
+ AC_PROG_LEX([noyywrap])
+diff --git a/src/libpcp/src/GNUmakefile b/src/libpcp/src/GNUmakefile
 --- a/src/libpcp/src/GNUmakefile
 +++ b/src/libpcp/src/GNUmakefile
-@@ -179,8 +179,6 @@ exports:	exports.in mk.exports
+@@ -184,8 +184,6 @@ exports:	exports.in mk.exports
  # consistent in all placess.
  #
  check.done:	$(OBJECTS)
diff --git a/meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch b/meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch
index b03c48e581..3ec76439cb 100644
--- a/meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch
+++ b/meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch
@@ -11,21 +11,22 @@ Upstream-Status: Inappropriate [OE Specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- configure.ac | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
+diff --git a/configure.ac b/configure.ac
 --- a/configure.ac
 +++ b/configure.ac
-@@ -907,7 +907,7 @@ AC_DEFUN([PCP_CHECK_PYTHON_HEADER],
-   [ PY_MAJOR="$1"
-     PY_MINOR="$2"
-     PY_VERSION="python$PY_MAJOR.$PY_MINOR"
--    PY_INCLUDE_DIRS="-I/usr/include/${PY_VERSION}m -I/usr/include/${PY_VERSION}"
-+    PY_INCLUDE_DIRS="-I${STAGING_INCDIR}/${PY_VERSION}m -I${STAGING_INCDIR}/${PY_VERSION}"
+@@ -982,7 +982,7 @@ AC_DEFUN([PCP_CHECK_PYTHON_HEADER],
+ 
+     dnl Fallback to manual paths if python3-config fails or is unavailable
+     if test -z "$PY_INCLUDE_DIRS"; then
+-        PY_INCLUDE_DIRS="-I/usr/include/${PY_VERSION}m -I/usr/include/${PY_VERSION} -I/usr/local/include/${PY_VERSION} -I/opt/homebrew/include/${PY_VERSION} -I/opt/homebrew/include/${PY_VERSION}m"
++        PY_INCLUDE_DIRS="-I${STAGING_INCDIR}/${PY_VERSION}m -I${STAGING_INCDIR}/${PY_VERSION}"
+     fi
+ 
      saved_CFLAGS="$CFLAGS"
-     saved_CPPFLAGS="$CPPFLAGS"
-     CFLAGS="$CFLAGS $PY_INCLUDE_DIRS"
-@@ -1603,7 +1603,7 @@ AC_SUBST(qmake)
+@@ -1594,7 +1594,7 @@ AC_SUBST(qmake)
  
  enable_qt3d=false
  AS_IF([test "x$do_qt3d" != "xno"], [
@@ -34,7 +35,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      then
  	enable_qt3d=$enable_qt
      elif test x"$do_qt3d" = x"yes"
-@@ -3699,7 +3699,7 @@ AC_SUBST(enable_decompression)
+@@ -3819,7 +3819,7 @@ AC_SUBST(enable_decompression)
  AC_SUBST(enable_lzma)
  
  dnl check for array sessions
diff --git a/meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch b/meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch
deleted file mode 100644
index 2c3cf696ed..0000000000
--- a/meta-oe/recipes-support/pcp/pcp/0001-pcp-htop-fix-header-build-race-condition.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d04ea418c5fcfec2f6fbb2dd9f982ddf12c5be87 Mon Sep 17 00:00:00 2001
-From: Yoann Congal <yoann.congal@smile.fr>
-Date: Tue, 3 Jun 2025 10:02:58 +0200
-Subject: [PATCH] pcp-htop: fix header build race condition
-
-.c and .h files are soft-linked before being compiled. Under heavy load
-or a build with a high CPU count, the compilation can start before
-header files are softlinked, resulting in a build error:
-| pcp-htop.c:13:10: fatal error: CommandLine.h: No such file or directory
-|    13 | #include "CommandLine.h"
-|       |          ^~~~~~~~~~~~~~~
-
-Fix this by adding the make dependency between object files and the
-headers.
-
-Upstream-Status: Backport [https://github.com/performancecopilot/pcp/commit/0ca303467ce382127cd9676e288bf7690a93f084]
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
----
- src/pcp/htop/GNUmakefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/pcp/htop/GNUmakefile b/src/pcp/htop/GNUmakefile
-index 3e29638d6..898f0b766 100644
---- a/src/pcp/htop/GNUmakefile
-+++ b/src/pcp/htop/GNUmakefile
-@@ -224,6 +224,7 @@ default:	build-me
- include $(BUILDRULES)
- 
- ifeq "$(HAVE_NCURSESW)" "true"
-+$(OBJECTS): $(HFILES)
- build-me: $(TOPXFILES) $(SUBXFILES) $(CFGXFILES) $(CMDTARGET) $(DISTLINKS) $(MAN_PAGES)
- 
- install: default
diff --git a/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch b/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
deleted file mode 100644
index 7bc045949b..0000000000
--- a/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 92add24ccfc7e643349a1c091957595ce25a9915 Mon Sep 17 00:00:00 2001
-From: Yoann Congal <yoann.congal@smile.fr>
-Date: Tue, 27 May 2025 08:45:36 +0200
-Subject: [PATCH] QA: cleanup localconfig.h build dependencies
-
-Some QA binaries include localconfig.h but there is no explicit dependencies
-between the binary build and the localconfig.h generation.
-On heavily loaded systems, this can result in the binary being built
-before localconf.h and a compilation error, e.g:
-| username.c:8:10: fatal error: localconfig.h: No such file or directory
-|     8 | #include "localconfig.h"
-|       |          ^~~~~~~~~~~~~~~
-| compilation terminated.
-
-This can be reproduced by adding "sleep 30" at the start of the
-localconfig.h generation rule.
-
-Fix this by adding the missing Makefile rule dependency between the
-binary (or its pre-link .o) and localconfig.h.
-
-Also remove an un-needed scale.o->localconfig.h dependency.
-
-Upstream-Status: Backport [https://github.com/performancecopilot/pcp/commit/8de7bbb06703f224b72fe0994acde3189b742fd2]
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
----
- qa/src/GNUlocaldefs | 22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/qa/src/GNUlocaldefs b/qa/src/GNUlocaldefs
-index f83826068..e47fbfd72 100644
---- a/qa/src/GNUlocaldefs
-+++ b/qa/src/GNUlocaldefs
-@@ -299,7 +299,7 @@ diowr:	diowr.c
- 	rm -f $@
- 	$(CCF) $(CDEFS) -o $@ diowr.c
- 
--endian:	endian.c
-+endian:	endian.c localconfig.h
- 	rm -f $@
- 	$(CCF) $(CDEFS) -o $@ endian.c
- 
-@@ -331,15 +331,15 @@ exercise:	exercise.c
- 	rm -f $@
- 	$(CCF) $(CDEFS) -o $@ exercise.c $(LDLIBS)
- 
--chkacc1:	chkacc1.c
-+chkacc1:	chkacc1.c localconfig.h
- 	rm -f $@
- 	$(CCF) $(CDEFS) -o $@ chkacc1.c $(LDLIBS)
- 
--chkacc2:	chkacc2.c
-+chkacc2:	chkacc2.c localconfig.h
- 	rm -f $@
- 	$(CCF) $(CDEFS) -o $@ chkacc2.c $(LDLIBS)
- 
--chkacc3:	chkacc3.c
-+chkacc3:	chkacc3.c localconfig.h
- 	rm -f $@
- 	$(CCF) $(CDEFS) -o $@ chkacc3.c $(LDLIBS)
- 
-@@ -489,7 +489,7 @@ pmdashutdown:	pmdashutdown.c
- 	rm -f $@
- 	$(CCF) $(CDEFS) -o $@ $@.c $(LDLIBS) -lpcp_pmda
- 
--dumb_pmda: dumb_pmda.c
-+dumb_pmda: dumb_pmda.c localconfig.h
- 	$(CCF) $(LCDEFS) $(LCOPTS) -o $@ $@.c $(LDLIBS) -lpcp_pmda
- 
- pmdacache: pmdacache.c
-@@ -633,7 +633,7 @@ else
- 	$(CCF) $(CDEFS) -o $@ $@.c $(LIB_FOR_PTHREADS) $(LDLIBS)
- endif
- 
--multithread2:	multithread2.c
-+multithread2:	multithread2.c localconfig.h
- 	rm -f $@
- 	$(CCF) $(CDEFS) -o $@ $@.c $(LIB_FOR_PTHREADS) $(LDLIBS)
- 
-@@ -786,7 +786,6 @@ $(NVIDIAQALIB):	nvidia-ml.o
- endif
- 
- arch_maxfd.o:	localconfig.h
--scale.o:	localconfig.h
- 
- 779246.o:	libpcp.h
- aggrstore.o:	libpcp.h
-@@ -847,14 +846,14 @@ multithread14.o:	libpcp.h
- nameall.o:	libpcp.h
- parsehostattrs.o:	libpcp.h
- parsehostspec.o:	libpcp.h
--pdubufbounds.o:	libpcp.h
--pducheck.o:	libpcp.h
-+pdubufbounds.o:	libpcp.h localconfig.h
-+pducheck.o:	libpcp.h localconfig.h
- pducrash.o:	libpcp.h
--pdu-server.o:	libpcp.h
-+pdu-server.o:	libpcp.h localconfig.h
- pmcdgone.o:	libpcp.h
- pmlcmacro.o:	libpcp.h
- pmnsinarchives.o:	libpcp.h
--pmnsunload.o:	libpcp.h
-+pmnsunload.o:	libpcp.h localconfig.h
- proc_test.o:	libpcp.h
- qa_libpcp_compat.o:	libpcp.h
- qa_timezone.o:	libpcp.h
-@@ -874,6 +873,7 @@ torture_pmns.o:	libpcp.h
- tztest.o:	libpcp.h
- unpack.o:	libpcp.h
- unpickargs.o:	libpcp.h
-+username.o:	localconfig.h
- xarch.o:	libpcp.h
- xlog.o:	libpcp.h
- xmktime.o:	libpcp.h
diff --git a/meta-oe/recipes-support/pcp/pcp_6.3.8.bb b/meta-oe/recipes-support/pcp/pcp_7.2.2.bb
similarity index 94%
rename from meta-oe/recipes-support/pcp/pcp_6.3.8.bb
rename to meta-oe/recipes-support/pcp/pcp_7.2.2.bb
index 1a5eac2ca7..cff911271f 100644
--- a/meta-oe/recipes-support/pcp/pcp_6.3.8.bb
+++ b/meta-oe/recipes-support/pcp/pcp_7.2.2.bb
@@ -12,11 +12,12 @@ DEPENDS += "perl-native bison-native flex-native python3-native python3-setuptoo
 
 SRC_URI += "file://0001-Remove-unsuitble-part-for-cross-compile.patch \
             file://pass-options-to-AR.patch \
-            file://fix_parallel_make.patch \
 			file://0001-bind2-Use-pmcpp-from-native-builds.patch \
-            file://0001-pcp-htop-fix-header-build-race-condition.patch \
            "
 
+# libpcp exports list getdomainname, which libpcp defines only when libc lacks it
+LDFLAGS:append:toolchain-clang = " -Wl,--undefined-version"
+
 export PCP_DIR = "${RECIPE_SYSROOT_NATIVE}"
 #export PCP_RUN_DIR = "${RECIPE_SYSROOT_NATIVE}"
 EXTRA_OEMAKE = '\
@@ -105,12 +106,12 @@ do_install () {
 PACKAGE_BEFORE_PN = "${PN}-xsos"
 PACKAGES =+ " ${PN}-export-zabbix-agent ${PN}-testsuite \
 	libpcp-gui2  libpcp-gui2-dev \
-	libpcp-import1 libpcp-archive1 \
+	libpcp-import1 libpcp-import2 libpcp-archive1 \
 	libpcp-mmv1 libpcp-mmv1-dev \
 	libpcp-pmda3 libpcp-pmda3-dev \
 	libpcp-trace2 libpcp-trace2-dev \
 	libpcp-web1 libpcp-web1-dev \
-	libpcp3 libpcp3-dev python3-${PN}\
+	libpcp3 libpcp3-dev libpcp4 python3-${PN}\
 "
 FILES:libpcp-gui2 = "${libdir}/libpcp_gui.so.2 \
 "
@@ -141,6 +142,10 @@ INSANE_SKIP:libpcp-mmv1-dev = "staticdev"
 FILES:libpcp-import1 = " \
 	${libdir}/libpcp_import.so.1 \
 "
+FILES:libpcp-import2 = " \
+	${libdir}/libpcp_import.so.2 \
+	${nonarch_libdir}/tmpfiles.d/libpcp_import.conf \
+"
 FILES:libpcp-pmda3 = " \
 	${libdir}/libpcp_pmda.so.3 \
 "
@@ -183,12 +188,16 @@ INSANE_SKIP:libpcp-web1-dev = "staticdev"
 FILES:libpcp3 = " \
 	${libdir}/libpcp.so.3 \
 "
+FILES:libpcp4 = " \
+	${libdir}/libpcp.so.4 \
+"
 
 FILES:${PN}-xsos = " \
 	${libexecdir}/pcp/bin/pcp-xsos \
 "
 FILES:${PN} = " \
 	${sysconfdir}/pcp \
+	${sysconfdir}/atop \
 	${sysconfdir}/cron.d \
 	${sysconfdir}/init.d \
 	${libexecdir} \
@@ -209,7 +218,7 @@ FILES:${PN} = " \
 	${localstatedir}/lib/pcp/config \
 	${localstatedir}/lib/pcp/pmdas/ \
 	${localstatedir}/lib/pcp/pmns \
-	${libdir}/libpcp_fault.so.3 \
+	${libdir}/libpcp_fault.so.4 \
 	${nonarch_libdir}/tmpfiles.d/pcp-reboot-init.conf \
 "
 
