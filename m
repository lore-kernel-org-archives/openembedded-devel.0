Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B4E74782A7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jul 2017 00:00:06 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y129so12111151pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 17:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rIt6ZRVNIYHi34a763RuulTwn3EbNsnjUI13cw3ICGc=;
	b=Iv0oX3KDuDu2FZE/ux10WsPKXnzjgnNTdt+6xFnDAX8eFMhnu4Fupdqtarf3zKkKeP
	JVnKajEez/sb+uHD5ZnzGsa9vuzB7OeW6m93mPdcIcA17I2DNwOfHUVazDCoOuacTwN6
	N6P6V4vkl+UiapKpUZ2r/tLSLneMwwDPXqR0tnHmgczebs8yishUtfjMoPQt6hBq7yhh
	pe9deit6I0Iu9BvR4g88GhvgjDt1GKn6r7JTHqki1Di7dLv3vMxYxlV6xOeH4uIfP5/2
	sIOH6TGOP7r2pfOm31FS4KK0RnaFoPkSDCc46p6NE/Hrx0EmUgKEe34wBctabyqd/PQA
	1+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rIt6ZRVNIYHi34a763RuulTwn3EbNsnjUI13cw3ICGc=;
	b=fgqGIQwp2kRTazkGuZ4HU1qza6Fxx5HVX+2LJvNsrNyE2HKeqHJYr6VHshOLT1lC+6
	vDThAW3/4NI2CFynOFVJVHkKYKeGyY1VSfLED8zCMQLv1QyRvuYpt+gFTsi9sczuDRzs
	47yU0h6UiIOx2kvq8TQgPSVU/rDbo3ymvkdk6igfmtyijSegnHy5X/+04ezcITCxuYLD
	qAhBY1HfScIOr5tDNMkycnN5xPE3SAfoSb/c3kBVnnSaZGNWZ2HUnZCoZArLuUaynzOw
	aiM32a4YAI7uDb2DShLJLupsjRk1IJWVqbaPGJAOhasmw6bgFG2MGgVoJpCof0R1SLhE
	LlrA==
X-Gm-Message-State: AIVw113MjVOqWhwynjsBhgvidJEcfpvJl6O4RkF79hoczKXhJIwRJuwp
	pGH1EpVSyywvNVsz
X-Received: by 10.98.75.156 with SMTP id d28mr7708604pfj.135.1500076807228;
	Fri, 14 Jul 2017 17:00:07 -0700 (PDT)
Received: from ip-172-31-1-64.ap-northeast-2.compute.internal
	(ec2-13-124-121-69.ap-northeast-2.compute.amazonaws.com.
	[13.124.121.69]) by smtp.gmail.com with ESMTPSA id
	b6sm23929681pgn.67.2017.07.14.17.00.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Jul 2017 17:00:06 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 23:59:59 +0000
Message-Id: <1500076799-13470-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: namhyung@gmail.com
Subject: [meta-oe][PATCH] uftrace: add recipe
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
X-List-Received-Date: Sat, 15 Jul 2017 00:00:06 -0000

- Add recipe for uftrace v0.7.
- Support x86_64, arm (v6 or later), and aarch64.
- Disable for armv4 and armv5 in arm architecture which is only
  supported armv6 or later.
- Attached 2 patches is merged to upstream.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../0001-Makefile-Add-LDFLAGS-in-export.patch      | 31 +++++++++++++++++++
 ...tils-Add-limits-header-to-fix-build-error.patch | 31 +++++++++++++++++++
 meta-oe/recipes-devtools/uftrace/uftrace_0.7.bb    | 35 ++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace_0.7.bb

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
new file mode 100644
index 0000000..f665051
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
@@ -0,0 +1,31 @@
+From ec794945475d5792f2ae85afe461e64266613640 Mon Sep 17 00:00:00 2001
+From: Changhyeok Bae <changhyeok.bae@gmail.com>
+Date: Thu, 13 Jul 2017 16:44:52 +0900
+Subject: [PATCH 1/2] Makefile: Add LDFLAGS in export
+
+To use build with musl, need to argp library.
+So need to add LDFLAGS from outside.
+
+Upstream-Status: Accepted
+
+Signed-off-by: <Changhyeok Bae changhyeok.bae@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 67be2da..0ca649a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -48,7 +48,7 @@ endif
+ RM = rm -f
+ INSTALL = install
+ 
+-export ARCH CC AR LD RM srcdir objdir
++export ARCH CC AR LD RM srcdir objdir LDFLAGS
+ 
+ COMMON_CFLAGS := -O2 -g -D_GNU_SOURCE $(CFLAGS) $(CPPFLAGS)
+ COMMON_CFLAGS +=  -iquote $(srcdir) -iquote $(objdir) -iquote $(srcdir)/arch/$(ARCH)
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
new file mode 100644
index 0000000..2690011
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
@@ -0,0 +1,31 @@
+From 3bda554766150705160fe2191d8761c7881e2433 Mon Sep 17 00:00:00 2001
+From: Changhyeok Bae <changhyeok.bae@gmail.com>
+Date: Thu, 13 Jul 2017 16:46:20 +0900
+Subject: [PATCH 2/2] utils: Add limits header to fix build error
+
+[Error]
+error: 'PATH_MAX' undeclared (first use in this function); did you mean
+'INT8_MAX'?
+
+Upstream-Status: Accepted
+
+Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
+---
+ utils/utils.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/utils.c b/utils/utils.c
+index 03522c9..30f9e81 100644
+--- a/utils/utils.c
++++ b/utils/utils.c
+@@ -6,6 +6,7 @@
+ #include <errno.h>
+ #include <sys/uio.h>
+ #include <sys/stat.h>
++#include <limits.h>
+ 
+ #include "utils/utils.h"
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.7.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.7.bb
new file mode 100644
index 0000000..821d0bb
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.7.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Trace and analyze execution of a program written in C/C++"
+HOMEPAGE = "https://github.com/namhyung/uftrace"
+BUGTRACKER = "https://github.com/namhyung/uftrace/issues"
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "elfutils"
+DEPENDS_append_libc-musl = " argp-standalone"
+
+inherit autotools
+
+SRCREV = "712ad01fdde57893936d7e254451eec67ab41ca6"
+SRC_URI = "\
+    git://github.com/namhyung/${BPN} \
+    file://0001-Makefile-Add-LDFLAGS-in-export.patch \
+    file://0002-utils-Add-limits-header-to-fix-build-error.patch \
+"
+S = "${WORKDIR}/git"
+
+LDFLAGS_append_libc-musl = " -largp"
+EXTRA_OECONF = "ARCH=${TARGET_ARCH}"
+
+do_configure() {
+    ${S}/configure ${EXTRA_OECONF}
+}
+
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "${libdir}/*.so"
+
+COMPATIBLE_HOST = "(x86_64|aarch64|arm)"
+
+# uftrace supports armv6 and above
+COMPATIBLE_HOST_armv4 = 'null'
+COMPATIBLE_HOST_armv5 = 'null'
-- 
2.7.4


