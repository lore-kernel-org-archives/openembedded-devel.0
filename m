Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D597C3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 15:16:28 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.53181.1746458187728529041
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 08:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=itTLbtdd;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac34257295dso58067166b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1746458186; x=1747062986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f5/C53KmcPXNEj+nxgjZudfCQAw5yLUqGhYD7rNdB7A=;
        b=itTLbtddWWHSoa5RH3hFyXOs7Iv1ZB8MFPzK1laXxmopSzuo9PL/mfzylvf2Pg0vPs
         VWWlSPt7AapWkP4JLC/vswGzio4UAzHeksZGRLK5NSx9rGO8qWoIL+5JoVB4UtKfEwEW
         q+IDtLukg0KgqyWjhxMHOzTqncz948W2XxJXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746458186; x=1747062986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5/C53KmcPXNEj+nxgjZudfCQAw5yLUqGhYD7rNdB7A=;
        b=QmEgkoe1mxXqTRrtnD/XOLQBi78XlNmdUTAuKBqaFnnQrktjG2hTq3Vi9zMVzi+m0W
         CRwqyU02tevGpbHHnfurYQakcSeHTn6ozgBlIVholcMVFoce1GtDi5PmYBriBdGcMkjI
         Q3ZGe7Pk6SHEan4KPKo96fNLdqoroF7EP9pH1DSX3hkY/15DQF/LPD+YZeweaH6au3ET
         SRCOfCT+TJlcwuRHkfeTVsSR+2hPlaC+14Ua5K2+uByRMCclUwSu+Zmw6vST5j5tqQjx
         FZlcCCmbAzKXmRczqKhzbE1u+P/h2npVIQ4nDV/gX70KHibWAz++Ev/1Tkv7yYgZBdCZ
         Pg/Q==
X-Gm-Message-State: AOJu0Yy38z+SGXVTkyLcwbVcDZdNnRc/K0kv80MvcSDiHBxdS9OB+7aL
	DsU3DnPk6w7fcdzhauvLzmCpEIAAOG9RKGjBVYhsUw0Or0Gb+jNUrw+jKwAptErVHiSmEzQZmWU
	S
X-Gm-Gg: ASbGncvhV7hPD75oE91LeMv5iR1xaJaI3rPRqvSUhGrc53/efd9faZ73j+kq40wpr0a
	1klWV3w5TKH0rwcQvf4wuI2t9kCZioFofa/c9nXkJaCQSKUs8jZrt1jiKnX05joOv3Yan/H3sQn
	gqdrr9Wq5WZWuVBzi/cKxpaKLen2jPHUkpoe5KwMb+W4Ti3QBlRDSYrKgBpljGQOmRfpygFjA72
	osHfAQlh80Gm4JgEIlH+uOwtdFFfg65kjHvR3VUIWEQeEfX50pBLS9pth20AHFuU3WjjtbBbl1X
	iSqXzT8cN4IWHzaijxIuVzITkadY7q4I61ZJVHaoIscwc8sHZe0iWVw=
X-Google-Smtp-Source: AGHT+IEQ1OhWlmvnFP6wXG9TMS992UTbhaoZ6m1ncsJCraHI+rv6zOikboQksJf5r1RDZix9zN09rQ==
X-Received: by 2002:a17:907:7248:b0:aca:a204:5df2 with SMTP id a640c23a62f3a-ad1a4b0c174mr707885366b.49.1746458185585;
        Mon, 05 May 2025 08:16:25 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540478sm507412966b.169.2025.05.05.08.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:16:25 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][PATCHv2] x265: Fix error: 'uint8_t'
Date: Mon,  5 May 2025 18:16:23 +0300
Message-Id: <20250505151623.2353326-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 15:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117322

Include cstdint in json11.cpp Fixes:

json11.cpp:101:32: error: 'uint8_t' does not name a type

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-json11.cpp-Include-cstdint.patch     | 33 +++++++++++++++++++
 .../recipes-multimedia/x265/x265_4.1.bb       |  5 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch

diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch b/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch
new file mode 100644
index 0000000000..f32316009f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstdint.patch
@@ -0,0 +1,33 @@
+From 6cbd417be3f6bcbda77464db6a4d83cef3df8904 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 5 May 2025 14:08:36 +0000
+Subject: [PATCH] json11.cpp: Include cstdint
+
+Fixes:
+
+json11.cpp:101:32: error: 'uint8_t' does not name a type
+
+This work was sponsored by GOVCERT.LU.
+
+Upstream-Status: Pending [https://bitbucket.org/multicoreware/x265_git/pull-requests/33]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ dynamicHDR10/json11/json11.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dynamicHDR10/json11/json11.cpp b/dynamicHDR10/json11/json11.cpp
+index 7625777..74f990a 100644
+--- a/dynamicHDR10/json11/json11.cpp
++++ b/dynamicHDR10/json11/json11.cpp
+@@ -25,6 +25,7 @@
+ #include <cstdlib>
+ #include <cstdio>
+ #include <limits>
++#include <cstdint>
+ 
+ #if _MSC_VER
+ #pragma warning(disable: 4510) //const member cannot be default initialized
+-- 
+2.39.5
+
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
index 23d6342d26..ae0f7758c1 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
 
 DEPENDS = "nasm-native gnutls zlib libpcre numactl"
 
-SRC_URI = "https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.gz"
+SRC_URI = " \
+    https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.gz \
+    file://0001-json11.cpp-Include-cstdint.patch \
+"
 SRC_URI[sha256sum] = "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29"
 S = "${WORKDIR}/x265_${PV}/source"
 
-- 
2.39.5


