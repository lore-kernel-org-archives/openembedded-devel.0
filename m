Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CBDC44502
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:39 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20723.1782663753129646403
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Oum/v0uW;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30eac9abd79so1144220eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663752; x=1783268552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9lhQAFvcl/0wE2JFd/xiOUfjN1rn+4P17Gs7uF1St8=;
        b=Oum/v0uWUM/ULzziOrw63ZVIiJPFG1kCKzrzj8M3HL9LKe4ehu7Koq98eXOPvaDTVX
         vvduDJUjP/1oAx2JpP53TlAHQokUU7X7qFnLuNHJgVDS6EiRE/F8mFU/qUa42Vq76r+Y
         ngeo5FmB+wrVDK/HNqAH4KBKREo8aFt/ciqZPBOb4A0jvNvxBPyaEBfysCl3G6fF+bu6
         OIA4x3C5ENiRQbWs9VbPepTlhai5HT9zXmBnS8qBWXjSvBAUr07xbwRoiwCEEC8S+JhD
         G/2nT9EjBuy9qmZAh5Z92D8kDtHJTi6pkc/esUVEi8uHAKjaR7gkmFQQOBmugxmncZM9
         Dppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663752; x=1783268552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9lhQAFvcl/0wE2JFd/xiOUfjN1rn+4P17Gs7uF1St8=;
        b=KllIopeJEcQYYFfzQSYC/+YImQN8Wgbf8x4xIumuM4k5SzgfNk0TRRcIiohP0UJlr5
         GADiYvJwB3msMsLOli2RQ0J5wbyqTpdNSjBS90AkJsOmEsRs/uIOUHQeHJYFYu/DKxTR
         YaEKjrWr1h2y1S8KO1BEWfBmUmRwEwsOgpj0+SUzKX+L0SprNgbud5sEbX5YoKwvdx+z
         eVd3QB0tJXTUVBXNFm/LwWi4F7OiwuhtVACsHbVrnXRBL/Y6VaJN25z4G9YEUNxiOCTG
         /0Irsnovw44WLWCEwho9UTGwsXAAbsRYpbRsNe02ImfKsBuNZGPBxq9azS/5qm/Xe0V3
         2ffw==
X-Gm-Message-State: AOJu0Yw414hLissVJRTH+Hjn0LliLDT28MzM+pX4aAvFKkLsYQqfD5az
	xXNlZ3HZYcwXCYmm35SdOdjBFin0pwZ7C+tZDA/inpqixhgdOzlWSU5jsKx9dXxM4MPYcg==
X-Gm-Gg: AfdE7clzYDlJ6GGIsPP0ove1G0lzHCuKCkw4UL0AWdIBQ9eYkLJlgvWlwnc0k8pu3tx
	KmfGgq+9tb5d4Iqorz9KxMYn9Pd04SXywwtnv5FuPCFBX4JKw6eC64jH1/uOvQ9y/UqLgiuoQUR
	Fm5R1gU6/ZLwlUfzclOyUWKI3VxyLPlmSqeiNlkYz5norXmoiIO/v8qhUohZYmKWny6lw0kbGmR
	vy/yvzvHOj5QNl3sPcEwM2LrznXoj0nISmSK735ANVW6ZYRv+rNpKJvgGCDXGURGvTYNu24tqQV
	PEbi2RMWMmsW8YmAbsxYol4qCUhWbCV5oD4fpJyPy1IKhRT2dx8N0gA4TPhHBLFZulBfytWtYlh
	IBONfUimbwsqo9ETlVLs+miTzzAwfCNvgiRHLpGsrkADsI0lmU4mwt1Dk0dfzgeeuQ6+1HGWwik
	/PeE1i1JGs06dimMJ8b3fliHEB3DDjdxtHwWY2L21Bv9CR15fw/LSDvOQmPi7p96cmHagm30fgs
	ueY3sMiMUuAPvuln96fgzNNKau1kLXzmBIwdfBzmnprmq/288A4/ZZugM7xyavjpwDxKjVmJ8i3
	ZyHXjua+iYfqZ5WRf81f4a0iMrIjMA==
X-Received: by 2002:a05:7300:fb96:b0:2ef:9961:27fa with SMTP id 5a478bee46e88-30cab22afa3mr7420114eec.18.1782663752355;
        Sun, 28 Jun 2026 09:22:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 106/128] pstack: include <cstdint> for fixed-width integer types
Date: Sun, 28 Jun 2026 09:22:00 -0700
Message-ID: <20260628162222.4081517-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127916

GCC 16 / libstdc++ no longer transitively pulls in cstdint
so reader.h fails to find uintmax_t/intmax_t.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...clude-cstdint-for-uintmax_t-intmax_t.patch | 35 +++++++++++++++++++
 .../recipes-devtools/pstack/pstack_2.12.2.bb  |  4 ++-
 meta-oe/recipes-devtools/pstack/pstack_git.bb |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/pstack/files/0001-reader.h-include-cstdint-for-uintmax_t-intmax_t.patch

diff --git a/meta-oe/recipes-devtools/pstack/files/0001-reader.h-include-cstdint-for-uintmax_t-intmax_t.patch b/meta-oe/recipes-devtools/pstack/files/0001-reader.h-include-cstdint-for-uintmax_t-intmax_t.patch
new file mode 100644
index 0000000000..a5ab825183
--- /dev/null
+++ b/meta-oe/recipes-devtools/pstack/files/0001-reader.h-include-cstdint-for-uintmax_t-intmax_t.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Jun 2026 00:00:00 +0000
+Subject: [PATCH] reader.h: include <cstdint> for uintmax_t/intmax_t
+
+GCC 16 / newer libstdc++ no longer transitively pull in <cstdint> via
+other standard headers. reader.h uses uintmax_t and intmax_t (in the
+readULEB128/readSLEB128 prototypes) without directly including the
+header that declares them, which fails to compile with:
+
+  error: 'uintmax_t' was not declared in this scope
+  error: 'intmax_t' was not declared in this scope
+
+Include <cstdint> explicitly to provide these fixed-width integer types.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libpstack/reader.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libpstack/reader.h b/libpstack/reader.h
+index 1111111..2222222 100644
+--- a/libpstack/reader.h
++++ b/libpstack/reader.h
+@@ -1,6 +1,7 @@
+ #ifndef pstack_reader_h
+ #define pstack_reader_h
+
++#include <cstdint>
+ #include <climits>
+ #include <iostream>
+ #include <memory>
+--
+2.49.0
diff --git a/meta-oe/recipes-devtools/pstack/pstack_2.12.2.bb b/meta-oe/recipes-devtools/pstack/pstack_2.12.2.bb
index 24f46396e8..98cf948de0 100644
--- a/meta-oe/recipes-devtools/pstack/pstack_2.12.2.bb
+++ b/meta-oe/recipes-devtools/pstack/pstack_2.12.2.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=671019a96ba80415b696240ed2ca5e80"
 
 DEPENDS = "tcl virtual/libx11 libxt zip-native"
 
-SRC_URI = "git://github.com/peadar/pstack;branch=v2.12-maint;tag=v${PV};protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/peadar/pstack;branch=v2.12-maint;tag=v${PV};protocol=https;tag=v${PV} \
+           file://0001-reader.h-include-cstdint-for-uintmax_t-intmax_t.patch \
+          "
 SRCREV = "98c4ddb7f0faa5221ea0a5f38105fc2a2f5cbfe7"
 
 PACKAGES =+ "${PN}-lib"
diff --git a/meta-oe/recipes-devtools/pstack/pstack_git.bb b/meta-oe/recipes-devtools/pstack/pstack_git.bb
index cc6721f9e3..0785ef2ab7 100644
--- a/meta-oe/recipes-devtools/pstack/pstack_git.bb
+++ b/meta-oe/recipes-devtools/pstack/pstack_git.bb
@@ -5,4 +5,5 @@ PV = "2.11"
 
 SRC_URI = "git://github.com/peadar/pstack.git;branch=master;protocol=https \
            file://0001-tests-fix-the-issue-of-cross-compilation-failure.patch \
+           file://0001-reader.h-include-cstdint-for-uintmax_t-intmax_t.patch \
           "

