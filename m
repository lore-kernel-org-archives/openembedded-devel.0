Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 221536011B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 08:15:20 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c85so7475721wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 00:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=zCfYzlfdRYHlj+ghz/mrNT3aqeQHyONTGqExzdX2hTM=;
	b=GA5g8+v8fX24No36HmMwxLsmZbDEVgqe82f9+9bTc3qQVaTgk2xb3+JWoyMHFAjDa2
	a4XSHHXziYW625rROqfxf0PJddxJdu4XYeHh9rJ3Q+B8SKBP4sBocbQfojv+7Q4VAZl4
	Zz3W7yaqp0CVyCmZd/PGe1rpBoPKzCYGHSpgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zCfYzlfdRYHlj+ghz/mrNT3aqeQHyONTGqExzdX2hTM=;
	b=pGp0fItyDSYt+cS8MeMg/sho9dVWT4M8hDqcuoCk2mP5JMkc3wRRldUp4ApdOboDMN
	Qp8idKqMnZPVnsgdGgTelFVtMl1BXzJKMKM2khoX7jDsqnYr2ybbfX0qI/5DWeOPz4r3
	CY00Z2r+9/1iphhlmbn74VV/Td7JzSHOFxONOKHRJCDUY/63tFFRnDwpQa2uJeMB3Agw
	9KGOucdbfJpk8FipIM8GES/2GEXi3EVfWS1FZVQ/RA/wzgvV4B0kGf+9GY8dX0IEHpDx
	XlNRTCL3wK2WCusyAyaJjSEprs9UZYpw090zu4mal9T1BUIeskU9kHVdmQ0EdSQ21v4T
	E/ew==
X-Gm-Message-State: AMke39kY50buYrCtOzxRvijGNhbmPk9Ss4NDOQhVTHaLkqzyA0/3bCjwfh4kheNGtlDWRuqd
X-Received: by 10.28.4.216 with SMTP id 207mr1022558wme.45.1487319320333;
	Fri, 17 Feb 2017 00:15:20 -0800 (PST)
Received: from localhost.localdomain (ip4da29576.direct-adsl.nl.
	[77.162.149.118])
	by smtp.gmail.com with ESMTPSA id 186sm713159wmw.24.2017.02.17.00.15.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 00:15:19 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2017 09:11:25 +0100
Message-Id: <20170217081125.9677-1-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] efivar: update to 0.30 to fix readdir* issues
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
X-List-Received-Date: Fri, 17 Feb 2017 08:15:22 -0000

Drop patches with upstream fixes.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../efivar/efivar/0002-disable-static-build.patch  | 33 ----------------
 .../0004-fix-unknow-option-for-gold-linker.patch   | 38 ------------------
 .../fix-compile-failure-with-host-gcc-4.6.patch    | 45 ----------------------
 .../efivar/{efivar_0.24.bb => efivar_0.30.bb}      |  8 +---
 4 files changed, 2 insertions(+), 122 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
 delete mode 100644 meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
 delete mode 100644 meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
 rename meta-oe/recipes-extended/efivar/{efivar_0.24.bb => efivar_0.30.bb} (72%)

diff --git a/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch b/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
deleted file mode 100644
index 951b159..0000000
--- a/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 126e0d3c1ad74cf5b0abe9e98ec444bcc3c83159 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@linaro.org>
-Date: Fri, 4 Mar 2016 14:53:55 +0100
-Subject: [PATCH 2/2] disable static build
-
-Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-
-Upstream-Status: Inappropriate [meta-oe specific]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- src/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 1829d22..c7a0ca3 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -8,9 +8,9 @@ include $(TOPDIR)/Make.defaults
- 
- LIBTARGETS=libefivar.so libefiboot.so
- STATICLIBTARGETS=libefivar.a libefiboot.a
--BINTARGETS=efivar efivar-static
-+BINTARGETS=efivar
- PCTARGETS=efivar.pc efiboot.pc
--TARGETS=$(LIBTARGETS) $(STATICLIBTARGETS) $(BINTARGETS) $(PCTARGETS)
-+TARGETS=$(LIBTARGETS) $(BINTARGETS) $(PCTARGETS)
- 
- LIBEFIBOOT_SOURCES = crc32.c creator.c disk.c gpt.c linux.c loadopt.c
- LIBEFIBOOT_OBJECTS = $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES))
--- 
-2.4.3
-
diff --git a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch b/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
deleted file mode 100644
index 5d50c19..0000000
--- a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b3d35e7dd27a755df5acbe050837885914dbb28b Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 10 May 2016 11:34:50 -0400
-Subject: [PATCH]  fix unknow option for gold linker
-
-- Revert the following patch, since oe-core work with gcc 5
-...
-commit 3055a3797f16693dfdd855fa68bc57fd900dc408
-Author: Peter Jones <pjones@redhat.com>
-Date:   Mon Feb 15 14:15:40 2016 -0500
-
-    Make gcc.specs work with gcc 6 / binutils 2.26
-
-    Apparently binutils 2.26 gets real picky about "ld -PIC" vs "ld -fPIC".
-
-    Signed-off-by: Peter Jones <pjones@redhat.com>
-...
-
-- Remove unknown option '--add-needed'
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gcc.specs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gcc.specs b/gcc.specs
-index 24fabc2..5b0fdef 100644
---- a/gcc.specs
-+++ b/gcc.specs
-@@ -14,4 +14,4 @@
- + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now}
- 
- *link:
--+ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined --add-needed -z now --build-id %{!static:%{!shared:-PIE}} %{shared:-z relro -PIC} %{static:%<pie}
-++ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro -fPIC} %{static:%<pie}
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch b/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
deleted file mode 100644
index 1c68a29..0000000
--- a/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 1361225abbaba878960f970df39a4570bbc39553 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 26 May 2016 21:50:01 -0400
-Subject: [PATCH] fix compile failure with older host gcc (<=4.6)
-
-While host gcc version is 4.6.3 in ubuntu 1204, it
-did not recognize -std=gnu11 and -Wmaybe-uninitialized.
-
-While host gcc version is 4.4.7 in centos6, it
-did not recognize -std=gnu11, -Wmaybe-uninitialized,
-and -flto.
-
-For native build, use -std=gnu99 to replace -std=gnu11,
-and directly remove -Wmaybe-uninitialized and -flto.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gcc.specs | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc.specs b/gcc.specs
-index 0d4bbda..3802ca6 100644
---- a/gcc.specs
-+++ b/gcc.specs
-@@ -2,13 +2,13 @@
- + -D_GNU_SOURCE
- 
- *efivar_cpp_options:
-- -Werror -Wall -std=gnu11 -Wextra
-+ -Werror -Wall -std=gnu99 -Wextra
- 
- *cpp_options:
- + %(efivar_cpp_options)
- 
- *cc1_options:
--+ %(efivar_cpp_options) -Wmaybe-uninitialized -fno-merge-constants -flto -fvisibility=hidden %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
-++ %(efivar_cpp_options) -fno-merge-constants -fvisibility=hidden %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
- 
- *self_spec:
- + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now}
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb b/meta-oe/recipes-extended/efivar/efivar_0.30.bb
similarity index 72%
rename from meta-oe/recipes-extended/efivar/efivar_0.24.bb
rename to meta-oe/recipes-extended/efivar/efivar_0.30.bb
index 4c7793f..f002a27 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.30.bb
@@ -10,15 +10,13 @@ DEPENDS_append_class-target = " efivar-native"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRCREV = "963cb2e5adc145fe00717f94e382f2973f80e753"
+SRCREV = "270205d88598d60d4e75f9cec13b8d25d82ee550"
 SRC_URI = "git://github.com/rhinstaller/efivar.git \
-           file://0002-disable-static-build.patch \
 "
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
                                 file://0003-efivar-fix-for-cross-compile.patch \
-                                ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)} \
                               "
-SRC_URI_append_class-native = " file://fix-compile-failure-with-host-gcc-4.6.patch \
+SRC_URI_append_class-native = " \ 
                                 file://allow-multi-definitions-for-native.patch \
                               "
 
@@ -41,5 +39,3 @@ do_install_append_class-native() {
 
 BBCLASSEXTEND = "native"
 
-
-PNBLACKLIST[efivar] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132821/"
-- 
2.9.3


