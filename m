Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF4C71C7A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 23:31:39 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id j16so7596913pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 16:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pjrhMrK6KDSXv4tKNwArWvDw1K0iA0QShLESNeY250Q=;
	b=M0dyTuO2LKtPRtlDc81wYknepXi2uOUeXrLggHB9L2liV75SI3MjrTUHDKyzlsO5mG
	N88cn4c99Qmww15NXJDW6nDo+Qa0YqE+k/lBZHI+/K3Q24k/1Xr2ohJO/X4FBwl5RPWg
	0w+LGpDy8m3wkFgKqA67/4knZD2gcZY7qVbcaO1lqlybLwwIJ5UIZwS2BKmLq1Bmm2uS
	Mv8jVseiWGmK/SDjgl9S4aFS8ti6EA9mCP0QTrLA/ZAzUM1hCVR1IKA3rKwh++yGoq8y
	6fy0bMo7tt2Ut55CxX/KBEbIs8FC1k6E7tBaWn7Qw0MXwp/vO4bpe7I6qa3uurMbhgUV
	1rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pjrhMrK6KDSXv4tKNwArWvDw1K0iA0QShLESNeY250Q=;
	b=NVk90bHzwV/IzZcX66LYgWR5Fo403skcqPR2ZE4oVlSPTNmI1cSwHvFn9BOdfYM9jB
	mUHJxV9aFPFmNM035ggE9Nxo3FGiwFbb92VIs99ylC2kb9gLVJylM+rvyMxGF216EvtF
	ln5QD5wqA3Lo3gXl7DpJ27cBhFXcRIhXR1tUnQLVS2WWK4FiAkX0S/kP4HKLzftPx810
	RUSlD+K3Ul4q1Mv+8fqzfWJLH4xCONryyIfK3dHjyn8n62rljWisOwEGoLlclzcAx7Qo
	dPiTbwJ+MIZXiIUTanQJB/EPOQoIQAuOkegHh7QZ7s0LfA0R8BC0iVOJOLNzzi+pKBr3
	MwTw==
X-Gm-Message-State: AHPjjUj+6OhnOL9gVvL7/ZR3QiBjAhptUPZgm/hmS2Weoe6oLjBU8/jd
	2Pk/wDFNUcrunA9t2ixbk2dHvQ==
X-Google-Smtp-Source: AOwi7QBim8LnBntXBghbUzcSHM0P5Lw4AX+8JZqBdMDE35Ow+/BKuDsTvfV/Ej2QSQpO+TB72CQwUQ==
X-Received: by 10.99.143.14 with SMTP id n14mr12288399pgd.107.1506468700361;
	Tue, 26 Sep 2017 16:31:40 -0700 (PDT)
Received: from ip-172-31-1-64.ap-northeast-2.compute.internal
	(ec2-13-124-121-69.ap-northeast-2.compute.amazonaws.com.
	[13.124.121.69]) by smtp.gmail.com with ESMTPSA id
	126sm15878904pfd.181.2017.09.26.16.31.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Sep 2017 16:31:39 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Sep 2017 23:31:27 +0000
Message-Id: <1506468687-25912-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] uftrace: update version to 0.8
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
X-List-Received-Date: Tue, 26 Sep 2017 23:31:39 -0000

Two patches are applied in upstream (v0.8)

Major release features
 * event tracing support
 * python scripting support
 * nested libcall tracing

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../0001-Makefile-Add-LDFLAGS-in-export.patch      | 31 ----------------------
 ...tils-Add-limits-header-to-fix-build-error.patch | 31 ----------------------
 .../uftrace/{uftrace_0.7.bb => uftrace_0.8.bb}     |  8 ++----
 3 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
 delete mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.7.bb => uftrace_0.8.bb} (75%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
deleted file mode 100644
index f665051..0000000
--- a/meta-oe/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ec794945475d5792f2ae85afe461e64266613640 Mon Sep 17 00:00:00 2001
-From: Changhyeok Bae <changhyeok.bae@gmail.com>
-Date: Thu, 13 Jul 2017 16:44:52 +0900
-Subject: [PATCH 1/2] Makefile: Add LDFLAGS in export
-
-To use build with musl, need to argp library.
-So need to add LDFLAGS from outside.
-
-Upstream-Status: Accepted
-
-Signed-off-by: <Changhyeok Bae changhyeok.bae@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 67be2da..0ca649a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -48,7 +48,7 @@ endif
- RM = rm -f
- INSTALL = install
- 
--export ARCH CC AR LD RM srcdir objdir
-+export ARCH CC AR LD RM srcdir objdir LDFLAGS
- 
- COMMON_CFLAGS := -O2 -g -D_GNU_SOURCE $(CFLAGS) $(CPPFLAGS)
- COMMON_CFLAGS +=  -iquote $(srcdir) -iquote $(objdir) -iquote $(srcdir)/arch/$(ARCH)
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
deleted file mode 100644
index 2690011..0000000
--- a/meta-oe/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3bda554766150705160fe2191d8761c7881e2433 Mon Sep 17 00:00:00 2001
-From: Changhyeok Bae <changhyeok.bae@gmail.com>
-Date: Thu, 13 Jul 2017 16:46:20 +0900
-Subject: [PATCH 2/2] utils: Add limits header to fix build error
-
-[Error]
-error: 'PATH_MAX' undeclared (first use in this function); did you mean
-'INT8_MAX'?
-
-Upstream-Status: Accepted
-
-Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
----
- utils/utils.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/utils.c b/utils/utils.c
-index 03522c9..30f9e81 100644
---- a/utils/utils.c
-+++ b/utils/utils.c
-@@ -6,6 +6,7 @@
- #include <errno.h>
- #include <sys/uio.h>
- #include <sys/stat.h>
-+#include <limits.h>
- 
- #include "utils/utils.h"
- 
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.7.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.bb
similarity index 75%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.7.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.8.bb
index 821d0bb..82b1795 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.7.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.bb
@@ -10,12 +10,8 @@ DEPENDS_append_libc-musl = " argp-standalone"
 
 inherit autotools
 
-SRCREV = "712ad01fdde57893936d7e254451eec67ab41ca6"
-SRC_URI = "\
-    git://github.com/namhyung/${BPN} \
-    file://0001-Makefile-Add-LDFLAGS-in-export.patch \
-    file://0002-utils-Add-limits-header-to-fix-build-error.patch \
-"
+SRCREV = "5af9ff9fa89c340617e52c8ed05798b352a7145c"
+SRC_URI = "git://github.com/namhyung/${BPN}"
 S = "${WORKDIR}/git"
 
 LDFLAGS_append_libc-musl = " -largp"
-- 
2.7.4


