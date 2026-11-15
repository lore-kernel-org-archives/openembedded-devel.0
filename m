Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3883.1794729057522331898
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aaQFDTN/;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2982652eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729057; x=1795333857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPvRyZUQiXcBjB/nq9bqvJppIFrTzA9Dmwpx5UREeTA=;
        b=aaQFDTN/eJBLcGFUdE5VUoj/hoxvlct5/ZSD1AoeHdB3rymxabRT0yLheNOS9rYEvL
         A9PZsZMBfUy/Lc76S3lcezLebW1X0tSauWHgWjvR5P0aL7141welEo53RdxzDM3NbiSR
         /6BN5H9fDXjzuMeVUwhIKXTB2YBXjeHIy51lRzcw1OUoN9TuSU0dAXk6YbpkJpkH3sMF
         BRuBRG46apM31T/2mqa4DJs+CNThYjByZvBYPrukAXX9GYemdwxn5m3xwmXY42v3tPCI
         iSeNbiQinyJsJ15kqob+zZ0R6HW4Y67K0SqbwZu0HNzodfN7SrZ9BrIrZJPMyeXmP30I
         MzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729057; x=1795333857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPvRyZUQiXcBjB/nq9bqvJppIFrTzA9Dmwpx5UREeTA=;
        b=L0V3mCIEzeNCST63emW/OpzCAz/rUXYWnx/yQXDnNqmH/wUMXldJ8TNoa+eKf/ereG
         zn3lAKgm8tvw60pFi0GLjLeKgHIsS7SV1S+u7w8VqzsvFMoHL3in/C4jMytjSIaGLQYq
         +p30Q0ThC6C7SkKroQ9/PKNIqU9R4tBIZ3OPP3io9aLuMt1PPYEVl1Ig6mXm0+U2oh7p
         ofZsdAGHeNxb0Z1eCsSEklndBrzlx5f85QFdwpIc1kM5KLkla9MegBsKf1UbreUUlQYN
         U+E9ll8o3QSLpG9ZhfrNDo5aRfead2xygXrzWs4nQSgfcQg+dQmG8l2ZPuHCFzfRp74+
         jCew==
X-Gm-Message-State: APuU4Z+UN7frEYueY5zEZtvqC7aTIUio1r0upDUtDAKamod1eoR36drk
	Om22exB3Kke2wpbVtnZYXpYRT1sgbJuEQcKJbYOEkksbXgwa4Ep03uT54dONyMwa
X-Gm-Gg: AYBFou2GEnc1qmkElWylnXfCqryeSher+9ZNt59gCq1iImsxa8TV6xSYq29Qj09DgoS
	aGgfzBQgH2qjmlOww9wwF09TDTizuXPRRGc90GDR8DwG2A4HhKouGUXJuiJXzFWBWImtT67SaAm
	IqDEc7zWuZq8aDkD9TlZpaIomZGBqwVT43e0Gspikye4JDf/7ntoQ+yXb3wJntHdwFvhH7FCF3I
	nZWJDXYkPyJOJi8HuH03RJb0TJKrxQWpDFEEbLJSPdgeOnozhiq3onztj6hTutIAnRdssbyRydi
	A3R037qe4SVOoVeejCerk+KeFQSBTHzlmyNvD+Dkdsg+wHkKmPF2J6uE7rbB9zs/4oirT45LiOB
	I5n3B8cKCdlkdJSm3mju08LhQJcuYP5zEvKO8+boZ2GxiRcmwDob1WAF86vgf7TgWRjzKufSTMn
	z9OnZtrs+vAvPI1XtDKfZDDvOezeQu58kPlwiQpziJSIZqVncB9aMogReuLZUcvO/2bU/JpdF/X
	F71IRCIsBYT3xl6Xa7VFjkZjBiyXi8yskZBenB3mYoI+Q32WgG4VXEa2ynmpOg+OEMRb/9chwtH
	QK4+G7vU3Ta6WWRTKt38DwBSwcGsVqbgMUm8khyB5gLWEu4RbW6ZkHrqcTy8802tX/1F8UED7lp
	7GLYv0FcnOgTp4avstugC/C48q0Rn4HTWd0L6zKCZ1BAPk3ZbBz26btUncOj6uqYpiXpxBBtdI+
	0scwQdwb/8ZfLyFmXpbxS9JzdwaOo4Ag+zIg+uci+eeGIbBW/dJbGO9wZkxGVLbOyvArzaobE+H
	6pfmbkeMAfeDlFbm+mWx7bUj4wjSPSh4ZscPM0PjOzkcNmiqmS7wfP7FojsdWSlN8Gu4vavbvV9
	txxF
X-Received: by 2002:a05:7300:5609:b0:377:a1c8:a628 with SMTP id 5a478bee46e88-3796676addcmr6768454eec.6.1794729056743;
        Sat, 14 Nov 2026 23:50:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 60/96] fwts: upgrade 22.11.00 -> 26.09.00
Date: Sat, 14 Nov 2026 23:48:38 -0800
Message-ID: <20261115074918.2932593-60-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132330
Content-Type: text/plain; charset="utf-8"

fwts.ubuntu.com no longer serves release tarballs, fetch the V<version>
tag from GitHub instead.

- Drop 0003-Remove-Werror-from-build.patch and use --disable-werror.
- Drop 0001-Makefile.am-Add-missing-link-with-zlib.patch and
  0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch,
  fixed upstream.
- Refresh 0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch.
- The license header of src/main.c only changed the copyright years.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...kefile.am-Add-missing-link-with-zlib.patch | 43 ------------
 ...ble-parallel-builds-of-lex-bison-fil.patch | 68 -------------------
 .../fwts/0003-Remove-Werror-from-build.patch  | 45 ------------
 ..._t-to-fix-pointer-to-int-cast-issues.patch | 38 +++--------
 .../{fwts_22.11.00.bb => fwts_26.09.00.bb}    | 14 ++--
 5 files changed, 16 insertions(+), 192 deletions(-)
 delete mode 100644 meta-oe/recipes-test/fwts/fwts/0001-Makefile.am-Add-missing-link-with-zlib.patch
 delete mode 100644 meta-oe/recipes-test/fwts/fwts/0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch
 delete mode 100644 meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
 rename meta-oe/recipes-test/fwts/{fwts_22.11.00.bb => fwts_26.09.00.bb} (72%)

diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Makefile.am-Add-missing-link-with-zlib.patch b/meta-oe/recipes-test/fwts/fwts/0001-Makefile.am-Add-missing-link-with-zlib.patch
deleted file mode 100644
index 358f7c424d..0000000000
--- a/meta-oe/recipes-test/fwts/fwts/0001-Makefile.am-Add-missing-link-with-zlib.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From dd97e711b13af6f770db27abec316d5c9271c777 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 12 Jun 2023 10:25:55 -0700
-Subject: [PATCH] Makefile.am: Add missing link with zlib
-
-It uses functions e.g. gzopen/gzclone/gzgets which are provided by zlib
-therefore add it to linker flags.
-
-Fixes
-| aarch64-yoe-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: gzgets
-| >>> referenced by ../src/lib/src/.libs/libfwts.so
-|
-| aarch64-yoe-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: gzopen
-| >>> referenced by ../src/lib/src/.libs/libfwts.so
-|
-| aarch64-yoe-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: gzclose
-| >>> referenced by ../src/lib/src/.libs/libfwts.so
-| clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
-| make[3]: *** [Makefile:2301: fwts] Error 1
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
-index 76c48d4..45eea88 100644
---- a/src/lib/src/Makefile.am
-+++ b/src/lib/src/Makefile.am
-@@ -30,7 +30,7 @@ pkglib_LTLIBRARIES = libfwts.la
- libfwts_la_LDFLAGS = -version-info 1:0:0
- 
- libfwts_la_LIBADD = 				\
--	-lm -lpthread -lbsd				\
-+	-lm -lpthread -lbsd -lz				\
- 	@GIO_LIBS@					\
- 	@GLIB_LIBS@
- 
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-test/fwts/fwts/0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch b/meta-oe/recipes-test/fwts/fwts/0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch
deleted file mode 100644
index 90bee3e722..0000000000
--- a/meta-oe/recipes-test/fwts/fwts/0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 6135a318dd48787f1b6e1296c755d67575f44dc1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Dec 2022 15:18:55 -0800
-Subject: [PATCH] libfwtsiasl: Disable parallel builds of lex/bison files
-
-Since they are using mv cmds they maybe conflicting with each other in
-highly parallelized build resulting in errors like
-
-| mv dtcompilerparser.tab.c dtcompilerparser.c
-| mv dtcompilerparser.tab.c dtcompilerparser.c
-| cp dtcompilerparser.tab.h dtcompilerparser.y.h
-| mv dtcompilerparser.tab.c dtcompilerparser.c
-| mv: cannot stat 'dtcompilerparser.tab.c': No such file or directory
-| make[3]: *** [Makefile:4196: dtcompilerparser.c] Error 1
-| make[3]: *** Waiting for unfinished jobs....
-| mv: cannot stat 'dtcompilerparser.tab.c': No such file or directory
-| make[3]: *** [Makefile:4194: dtcompilerparser.y.h] Error 1
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libfwtsiasl/Makefile.am | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
---- a/src/libfwtsiasl/Makefile.am
-+++ b/src/libfwtsiasl/Makefile.am
-@@ -58,32 +58,24 @@ aslcompiler.y: $(ASL_PARSER)
- aslcompilerlex.c: $(ASL_LEXER)
- 	${LEX} ${AM_LFLAGS} -PAslCompiler -o$@ $(top_srcdir)/src/acpica/source/compiler/aslcompiler.l
- 
--.NOTPARALLEL: aslcompiler.c
-+.NOTPARALLEL: aslcompiler.c aslcompiler.y.h
- aslcompiler.c aslcompiler.y.h: aslcompiler.y
--	${YACC} ${AM_YFLAGS} -d -baslcompiler -pAslCompiler $^
--	mv aslcompiler.tab.c aslcompiler.c
--	cp aslcompiler.tab.h aslcompiler.y.h
-+	${YACC} ${AM_YFLAGS} -d -baslcompiler -pAslCompiler --header=aslcompiler.y.h --output=aslcompiler.c $^
- 
--.NOTPARALLEL: dtcompilerparserlex.c
-+.NOTPARALLEL: dtcompilerparserlex.c dtcompilerparser.c dtcompilerparser.y.h
- dtcompilerparserlex.c dtcompilerparser.c dtcompilerparser.y.h: $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.l $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.y
- 	${LEX} ${AM_LFLAGS} -PDtCompilerParser -odtcompilerparserlex.c $<
--	${YACC} ${AM_YFLAGS} -bdtcompilerparser -pDtCompilerParser $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.y
--	mv dtcompilerparser.tab.c dtcompilerparser.c
--	cp dtcompilerparser.tab.h dtcompilerparser.y.h
-+	${YACC} ${AM_YFLAGS} -bdtcompilerparser -pDtCompilerParser --header=dtcompilerparser.y.h --output=dtcompilerparser.c $(top_srcdir)/src/acpica/source/compiler/dtcompilerparser.y
- 
--.NOTPARALLEL: dtparserlex.c
-+.NOTPARALLEL: dtparserlex.c dtparser.c dtparser.y.h
- dtparserlex.c dtparser.c dtparser.y.h: $(top_srcdir)/src/acpica/source/compiler/dtparser.l $(top_srcdir)/src/acpica/source/compiler/dtparser.y
- 	${LEX} ${AM_LFLAGS} -PDtParser -odtparserlex.c $<
--	${YACC} ${AM_YFLAGS} -bdtparser -pDtParser $(top_srcdir)/src/acpica/source/compiler/dtparser.y
--	mv dtparser.tab.c dtparser.c
--	cp dtparser.tab.h dtparser.y.h
-+	${YACC} ${AM_YFLAGS} -bdtparser -pDtParser --header=dtparser.y.h --output=dtparser.c $(top_srcdir)/src/acpica/source/compiler/dtparser.y
- 
--.NOTPARALLEL: prparserlex.c
-+.NOTPARALLEL: prparserlex.c prparser.c prparser.y.h
- prparserlex.c prparser.c prparser.y.h: $(top_srcdir)/src/acpica/source/compiler/prparser.l $(top_srcdir)/src/acpica/source/compiler/prparser.y
- 	${LEX} ${AM_LFLAGS} -PPrParser -oprparserlex.c $<
--	${YACC} ${AM_YFLAGS} -bprparser -pPrParser $(top_srcdir)/src/acpica/source/compiler/prparser.y
--	mv prparser.tab.c prparser.c
--	cp prparser.tab.h prparser.y.h
-+	${YACC} ${AM_YFLAGS} -bprparser -pPrParser --header=prparser.y.h --output=prparser.c $(top_srcdir)/src/acpica/source/compiler/prparser.y
- 
- pkglib_LTLIBRARIES = libfwtsiasl.la
- 
diff --git a/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch b/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
deleted file mode 100644
index 610113e6fe..0000000000
--- a/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7317aba872f2bcf052a7db9fa3c7a7ce3c55dc6b Mon Sep 17 00:00:00 2001
-From: Benjamin Berg <bberg@redhat.com>
-Date: Mon, 21 Aug 2017 10:34:40 +0200
-Subject: [PATCH 3/6] Remove -Werror from build
-
-Upstream-Status: Pending
----
- src/Makefile.am           | 2 +-
- src/lib/src/Makefile.am   | 2 +-
- src/utilities/Makefile.am | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -13,7 +13,7 @@ AM_CPPFLAGS = \
- 	-I$(top_srcdir)/efi_runtime			\
- 	-I$(top_srcdir)/smccc_test			\
- 	-pthread					\
--	-Wall -Werror -Wextra				\
-+	-Wall -Wextra					\
- 	-Wno-address-of-packed-member			\
- 	-Wfloat-equal -Wmissing-declarations		\
- 	-Wno-long-long -Wredundant-decls -Wshadow	\
---- a/src/lib/src/Makefile.am
-+++ b/src/lib/src/Makefile.am
-@@ -22,7 +22,7 @@ AM_CPPFLAGS = \
- 	-I$(top_srcdir)/src/acpica/source/include	\
- 	-I$(top_srcdir)/src/acpica/source/compiler	\
- 	-DDATAROOTDIR=\"$(datarootdir)\"		\
--	-Wall -Werror -Wextra				\
-+	-Wall -Wextra					\
- 	-Wno-address-of-packed-member
- 
- pkglib_LTLIBRARIES = libfwts.la
---- a/src/utilities/Makefile.am
-+++ b/src/utilities/Makefile.am
-@@ -16,7 +16,7 @@
- # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
- #
- 
--AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
-+AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
- 	-I$(srcdir)/../lib/include
- 
- bin_PROGRAMS = kernelscan
diff --git a/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch b/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
index b723b87c7a..e54290dab3 100644
--- a/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
@@ -8,37 +8,17 @@ converting a void* to uintptr_t and back again
 will yield the original pointer value
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
+---
+ src/lib/src/fwts_mmap.c   | 2 +-
+ src/lib/src/fwts_smbios.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
- src/lib/src/fwts_acpi_tables.c | 4 ++--
- src/lib/src/fwts_mmap.c        | 2 +-
- src/lib/src/fwts_smbios.c      | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
---- a/src/lib/src/fwts_acpi_tables.c
-+++ b/src/lib/src/fwts_acpi_tables.c
-@@ -171,7 +171,7 @@ static fwts_acpi_table_rsdp *fwts_acpi_g
- 		return NULL;
- 	}
- 
--	if ((mem = fwts_mmap((off_t)addr, sizeof(fwts_acpi_table_rsdp))) == FWTS_MAP_FAILED)
-+	if ((mem = fwts_mmap((uintptr_t)addr, sizeof(fwts_acpi_table_rsdp))) == FWTS_MAP_FAILED)
- 		return NULL;
- 
- 	if (fwts_safe_memcpy(rsdp, mem, sizeof(fwts_acpi_table_rsdp)) != FWTS_OK) {
-@@ -484,7 +484,7 @@ static int fwts_acpi_load_tables_from_fi
- 	if ((rsdp = fwts_acpi_get_rsdp(fw, rsdp_addr, &rsdp_len)) == NULL)
- 		return FWTS_ERROR;
- 
--	fwts_acpi_add_table("RSDP", rsdp, (uint64_t)(off_t)rsdp_addr, rsdp_len, FWTS_ACPI_TABLE_FROM_FIRMWARE);
-+	fwts_acpi_add_table("RSDP", rsdp, (uint64_t)(uintptr_t)rsdp_addr, rsdp_len, FWTS_ACPI_TABLE_FROM_FIRMWARE);
- 
- 	/* Load any tables from XSDT if it's valid */
- 	if (rsdp->xsdt_address) {
+diff --git a/src/lib/src/fwts_mmap.c b/src/lib/src/fwts_mmap.c
+index 6df5a18..98cbe29 100644
 --- a/src/lib/src/fwts_mmap.c
 +++ b/src/lib/src/fwts_mmap.c
-@@ -82,7 +82,7 @@ int fwts_munmap(void *mem, const size_t
+@@ -81,7 +81,7 @@ int fwts_munmap(void *mem, const size_t size)
  	off_t offset;
  
  	page_size = fwts_page_size();
@@ -47,9 +27,11 @@ Upstream-Status: Pending
  
  	if (munmap((void *)((uint8_t *)mem - offset), size + offset) < 0)
  		return FWTS_ERROR;
+diff --git a/src/lib/src/fwts_smbios.c b/src/lib/src/fwts_smbios.c
+index 836c169..4bd80bb 100644
 --- a/src/lib/src/fwts_smbios.c
 +++ b/src/lib/src/fwts_smbios.c
-@@ -78,7 +78,7 @@ static void *fwts_smbios_find_entry_uefi
+@@ -77,7 +77,7 @@ static void *fwts_smbios_find_entry_uefi(
  	if ((addr = fwts_scan_efi_systab(smbios)) != NULL) {
  		fwts_smbios_entry *mapped_entry;
  
diff --git a/meta-oe/recipes-test/fwts/fwts_22.11.00.bb b/meta-oe/recipes-test/fwts/fwts_26.09.00.bb
similarity index 72%
rename from meta-oe/recipes-test/fwts/fwts_22.11.00.bb
rename to meta-oe/recipes-test/fwts/fwts_26.09.00.bb
index 29fe018a9f..0f9cee8fa4 100644
--- a/meta-oe/recipes-test/fwts/fwts_22.11.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_26.09.00.bb
@@ -3,21 +3,17 @@ DESCRIPTION = "The tool fwts comprises of over fifty tests that are designed to
 HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
+LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=2443b6d0c5731b9be596f49c34669c33"
 
-SRC_URI = "http://fwts.ubuntu.com/release/fwts-V${PV}.tar.gz;subdir=${BP} \
+SRC_URI = "git://github.com/fwts/fwts.git;protocol=https;branch=master;tag=V${PV} \
            file://0001-Add-correct-printf-qualifier-for-off_t.patch \
-           file://0003-Remove-Werror-from-build.patch \
            file://0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
            file://0005-Undefine-PAGE_SIZE.patch \
            file://0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
-           file://0001-libfwtsiasl-Disable-parallel-builds-of-lex-bison-fil.patch \
-           file://0001-Makefile.am-Add-missing-link-with-zlib.patch \
            "
-SRC_URI[sha256sum] = "4af4e1e0f1ae9313297af722d744ba47a81c81bc5bdeab3f4f40837a39e4b808"
+SRCREV = "f06eeafe26509961bfdffa60feb855623d79224e"
 
-# fwts.ubuntu.com no longer serves a browsable release listing (port 80/443
-# both refuse/time out), so track the upstream git release tags instead.
+# fwts.ubuntu.com no longer serves releases, use the upstream git tags.
 UPSTREAM_CHECK_URI = "https://github.com/fwts/fwts/tags"
 UPSTREAM_CHECK_REGEX = "releases/tag/V(?P<pver>\d+(\.\d+)+)"
 
@@ -39,3 +35,5 @@ FILES:${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
 FILES:${PN}-staticdev += "${libdir}/fwts/lib*a"
 
 RDEPENDS:${PN} += "dtc"
+
+EXTRA_OECONF += "--disable-werror"
