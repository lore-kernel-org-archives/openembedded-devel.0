Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D11C61DA7
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:51 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.68630.1674717463105713540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QE1KY2Ft;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id x2-20020a17090a46c200b002295ca9855aso4481886pjg.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eeO9HtDvVno8sKuV5clc4ppEkH0V8MoVG+Gg/rCVek=;
        b=QE1KY2FtXALxXINRzlGTX61/qLRGl6VZZ+tVZa6BKsXAaLCu33QOZuupsjOjYaDA69
         ZlBqgwywL5dto6S9I9QjfvrgJwiEibp9qgDhzpdK3BnkGe2uUI2SS15dz2yFHRfHOQfq
         uU07uEmH992SUEbHffCGUQE2SUuF9TxtRXiIpZlDGMIK726iFmIwlZCdwIYNVd9VROJk
         vQMccsa3O6C1TDchK7Ysd6XaB4joUh8n6NNFM7UWo3mQOMAaPej57I5ZyQB89V79RK21
         D1vNcydpXDZngelj41lICBaSU6P56vV6ImOt14OWKSEcYagSGiLkj7w8MAD7BGqEEQS+
         8YhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eeO9HtDvVno8sKuV5clc4ppEkH0V8MoVG+Gg/rCVek=;
        b=Smjw1uvCnKURPeZyyfKVilLWZzvN2Oizu1qjL9s6H0QFse1KaSwV2NjkIIy3cPJB5q
         Mop8wpByQfqlspuHQefJyGmCa1baNKRHkE30ERgf3OrPYlJF+mUqGzLj2qhNl+7iGyA1
         mJl4XOgBzQs2BN9Gbjvfkgbhsj0/wldCyGzCKLWVYn0KIdUzG4rt9V4SRKlkod3LPQDw
         kxAdf9aCt3ph6GTaER3nK49gLCRotvGSQiDjwjuwmtVS2uPkFggJFlWgMZ0fiL8Xw5Yl
         cG7Iz72pPmyrkmm6mvly809DMNGkxJZ11LOIS59VDec25ypro+cxNYJ1sVx7kBCPp8jE
         0Z7A==
X-Gm-Message-State: AO0yUKWMuQdi/u5uHBWzuaFH5hRDVglFO1ddmzT3Fjm/zFKrVbbc5H06
	reIOplXe7JhrCWKvjtI8yUrOPoDffGKr8Q==
X-Google-Smtp-Source: AK7set8Cgguqoqwwhu81bmpt+TpL2eF8V0dMoBqDNX2KRkO9LhZT7V8dt4yvCdH2IbjzrGh8+j0HWg==
X-Received: by 2002:a17:902:d2cc:b0:196:3347:78db with SMTP id n12-20020a170902d2cc00b00196334778dbmr4204822plc.61.1674717462108;
        Wed, 25 Jan 2023 23:17:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/13] redis-plus-plus: Fix build with gcc13
Date: Wed, 25 Jan 2023 23:17:27 -0800
Message-Id: <20230126071735.2444745-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100787

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-include-cstdint.patch          | 37 +++++++++++++++++++
 .../redis-plus-plus/redis-plus-plus_1.3.7.bb  |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/redis-plus-plus/files/0001-include-cstdint.patch

diff --git a/meta-oe/recipes-extended/redis-plus-plus/files/0001-include-cstdint.patch b/meta-oe/recipes-extended/redis-plus-plus/files/0001-include-cstdint.patch
new file mode 100644
index 0000000000..bfe2412b5d
--- /dev/null
+++ b/meta-oe/recipes-extended/redis-plus-plus/files/0001-include-cstdint.patch
@@ -0,0 +1,37 @@
+From e74bb5a7ef87e697571181280e6108b89104c02d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 20:40:56 -0800
+Subject: [PATCH] include <cstdint>
+
+gcc 13 libstdc++ moved some includes around and as a result <cstdint>
+is no longer transitively included [1]. Explicitly include it for uintXX_t.
+
+Fixes
+
+../git/src/sw/redis++/utils.h:187:1: error: 'uint16_t' does not name a type
+  187 | uint16_t crc16(const char *buf, int len);
+      | ^~~~~~~~
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/sewenew/redis-plus-plus/pull/449]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sw/redis++/utils.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/sw/redis++/utils.h b/src/sw/redis++/utils.h
+index f77f796..ff38f2d 100644
+--- a/src/sw/redis++/utils.h
++++ b/src/sw/redis++/utils.h
+@@ -17,6 +17,7 @@
+ #ifndef SEWENEW_REDISPLUSPLUS_UTILS_H
+ #define SEWENEW_REDISPLUSPLUS_UTILS_H
+ 
++#include <cstdint>
+ #include <cstring>
+ #include <string>
+ #include <type_traits>
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb
index 21783b30d5..b127025a73 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb
@@ -4,7 +4,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https"
+SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https \
+           file://0001-include-cstdint.patch"
 SRCREV = "f3b19a8a1f609d1a1b79002802e5cf8c336dc262"
 
 S = "${WORKDIR}/git"
-- 
2.39.1


