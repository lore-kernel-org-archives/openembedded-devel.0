Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC777C636CB
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:25 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.34507.1675055362560729327
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N5pzULV0;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id e8-20020a17090a9a8800b0022c387f0f93so9220939pjp.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNptuGFg+h2N+dkEX2kOInSj8rRhdakQvy8r964o3HY=;
        b=N5pzULV0hG5mjBNjJhFlzP4DyQTMMi0tWJHSWJ9t6fgP4tJxL9K0vLhg8yd3knhKDi
         jraRThmVtBr4jwYgTUha5maQjjouSr+E9h/4ir/8OEhewAxOGFTA6I62qiWvgMKV3s0A
         XpOz7Q7c1VS2hShyP6mm3+rmSLHqGmiPm1Suev7sfuYKaXjVgBBJrYdRenQezm6p1jLY
         buRSLwCnv/NTW0HPn1MXDkjccJSvQzWvJ2KY1g4t6G34F3EgQvMDYyvpv8DYq3ASlPI9
         2IXlpoLYxCi/7bulLUcYo8BtQo647mu/qHkkJ78h7i2P0BYB9KHWUypocu5wSlIozzF6
         zjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNptuGFg+h2N+dkEX2kOInSj8rRhdakQvy8r964o3HY=;
        b=73Lm/sngfztR4KkNU5cqB30rXRwMB1CAETusoHtCTrN+iJhl+iln+hmCBESnX32ARM
         oPcQELWrJ0o2z2vO3Ffk47qYX/IQnmY2Ir696P8znXM6DO5p39gh2ayidUazEI4Ukh1m
         nxDWFeq4slm9K3RZiKtLGxl+VwUI/iqulV1Q/SEt1r3NKUCOwEpqm2qbVJLZW5l0mwob
         b8khBg50lo8/Kyh4aEimpwbxh/3NEYS3QXOCVJjPkXjVO/YkWarqdKm6+QZdfXoflyZM
         Xtdl0wt03FC0IiOWj1k6wWbURr15SrgtbP4mUtw8S66UAMMEF0VmBJI50DoiNyGfEhau
         NsFQ==
X-Gm-Message-State: AO0yUKXqpXBZOciCPwn1ls7Oldq6c8tvWlraJEuf/kVnRthrBz+wLmxO
	tpSMiJi2W6ICK7hzfCncietSNxMIDDKRCA==
X-Google-Smtp-Source: AK7set/PWVOlLE1UXviqED4NPI9g8+jfTwyN+FCwURJITpgmv2Eoc1rkIZXD4nvcVj/ruUO0Km1S0g==
X-Received: by 2002:a17:902:f202:b0:189:340c:20d2 with SMTP id m2-20020a170902f20200b00189340c20d2mr6238158plc.23.1675055361753;
        Sun, 29 Jan 2023 21:09:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/12] nodejs: Fix build with gcc13
Date: Sun, 29 Jan 2023 21:09:09 -0800
Message-Id: <20230130050909.133727-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130050909.133727-1-raj.khem@gmail.com>
References: <20230130050909.133727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100856

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nodejs/nodejs/gcc13.patch                 | 28 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_18.12.1.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
new file mode 100644
index 0000000000..7268c5e64f
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
@@ -0,0 +1,28 @@
+Add missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/deps/v8/src/base/logging.h
++++ b/deps/v8/src/base/logging.h
+@@ -5,6 +5,7 @@
+ #ifndef V8_BASE_LOGGING_H_
+ #define V8_BASE_LOGGING_H_
+ 
++#include <cstdint>
+ #include <cstring>
+ #include <sstream>
+ #include <string>
+--- a/deps/v8/src/inspector/v8-string-conversions.h
++++ b/deps/v8/src/inspector/v8-string-conversions.h
+@@ -5,6 +5,7 @@
+ #ifndef V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
+ #define V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
+ 
++#include <cstdint>
+ #include <string>
+ 
+ // Conversion routines between UT8 and UTF16, used by string-16.{h,cc}. You may
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
index e96913e563..e96412fecc 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
+           file://gcc13.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.39.1


