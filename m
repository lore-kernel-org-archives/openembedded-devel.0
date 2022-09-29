Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3193EC433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 19:01:18 +0000 (UTC)
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by mx.groups.io with SMTP id smtpd.web09.14633.1664478073179091475
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 12:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=MIc4hVKF;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.128.202,
 mailfrom: 3eos1ywmkaec5jtpxxpun.lxv@flex--wak.bounces.google.com)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-3508d8c60ceso22077347b3.18
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 12:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date;
        bh=8l0ZCcCr9ysU4bkiYmXp8SkVXFfS3wLPxNZLVzCyEIs=;
        b=MIc4hVKF/P3m/koYYfczk+c0+UZmcC3kjUP4FTrGSPEFLVH4k0DIQsSDREdYmhPIV/
         wEYJUbsMNcz/JL5eYzB30CynS2djswtMJPoo32kfkyqDAOI+ZLJqeQbHBaqVkNHKKMmp
         ZLftlTf/Mie1uRvVKzKYpjvcr/EdfaDce+Rn3aJAMCCLPn70DuXwtmM9MsoXJTxetrlD
         QyaHpYAign8VFADwqm2N2Z1tsAgnuFZHWJ5kHd7M+OcpjPmzE899aNozJwNqiv8aFl7J
         FTS9Dcf9yGdwBT1/hbQkjcXGTlpeccviPPnoM754TTNphFQovcDrLgGz7v7GfaLdQ/ya
         NsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=8l0ZCcCr9ysU4bkiYmXp8SkVXFfS3wLPxNZLVzCyEIs=;
        b=qrM4b363ibw/2/ejP6bub66B5mZnCm8l4tWnkyFnO6m5FvuD678ogo4znI9vM91x8L
         jb9zbCgyyAk5vmV4VWXbzYpU9gdO2PdS7zSmSCIWHLj7hxWMY5ngr4NWhJ+nzDovuTm6
         qnuYVSvrxH/SZ/cdq5fWHm0XaTQCKpwdYZ4+xGQ1nOm9lLOz/XAUem07YtfXeWAA8KVX
         heOxrR6AZp11NTHouK27mVGyy6eGHxf+E27olIXnGWC7hqaAMRhNzbqaJCPZRXG8YGnU
         NpXoP4OZHgeyhg5oIaO7KylFvU0EVL9PLLP2V40d6OV2IXraxz0oDivt784A7NXAxolo
         VXBw==
X-Gm-Message-State: ACrzQf2HgaskEZaNFg1jboLfsXOojcpfuiysgjQVDTFJWnlxNtIA2yCP
	9R6W6IptLbVqyF+iyy2opNS23Vk1nDR1ZzNGM8/xiSbNV30lc1Av8kndx6yYxPdyFvQcf0lGkxv
	MeDTd5+jbys3GR7m4k6Rj8wufII/7hpmFtHWG9cd+tL/swvFvu656vEz0pgOXjy3hQ6t5cdD90Z
	bX9pc=
X-Google-Smtp-Source: 
 AMsMyM4xVrKSpJSZsjwj46iAR/k3M77MAklagdRLplJrm7+iCuvLBALDM2VyK0tc43WwXgNxEQOTU7E=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:91bf:f672:2dae:41ab])
 (user=wak job=sendgmr) by 2002:a5b:443:0:b0:6bc:e3d1:8990 with SMTP id
 s3-20020a5b0443000000b006bce3d18990mr414700ybp.191.1664478072376; Thu, 29 Sep
 2022 12:01:12 -0700 (PDT)
Date: Thu, 29 Sep 2022 12:01:09 -0700
Message-Id: <20220929190109.2227884-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Subject: [meta-oe][PATCH] gerbera: upgrade 1.9.2 -> 1.11.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Sep 2022 19:01:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99013

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../gerbera/0001-Fix-build-with-fmt-9.0.patch | 35 ++++++++++++++
 .../gerbera/0001-Fix-for-fmt-8.0.patch        | 46 -------------------
 .../{gerbera_1.9.2.bb => gerbera_1.11.0.bb}   |  6 +--
 3 files changed, 38 insertions(+), 49 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-for-fmt-8.0.patch
 rename meta-multimedia/recipes-multimedia/gerbera/{gerbera_1.9.2.bb => gerbera_1.11.0.bb} (82%)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch
new file mode 100644
index 000000000..9de0e4f28
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-build-with-fmt-9.0.patch
@@ -0,0 +1,35 @@
+From d7b8fafbc94405c20753fed569abd8878cccde89 Mon Sep 17 00:00:00 2001
+From: Felix Yan <felixonmars@archlinux.org>
+Date: Fri, 19 Aug 2022 15:22:10 +0300
+Subject: [PATCH] Fix build with fmt 9.0
+
+Fixes #2681
+---
+ src/database/sql_format.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/database/sql_format.h b/src/database/sql_format.h
+index 32dc00ef..e4e1909a 100644
+--- a/src/database/sql_format.h
++++ b/src/database/sql_format.h
+@@ -42,7 +42,7 @@ struct SQLIdentifier {
+ template <>
+ struct fmt::formatter<SQLIdentifier> : formatter<std::string_view> {
+     template <typename FormatContext>
+-    auto format(const SQLIdentifier& tn, FormatContext& ctx) -> decltype(ctx.out())
++    auto format(const SQLIdentifier& tn, FormatContext& ctx) const -> decltype(ctx.out())
+     {
+         return format_to(ctx.out(), "{}{}{}", tn.quote_begin, tn.name, tn.quote_end);
+     }
+@@ -61,7 +61,7 @@ struct ColumnUpdate {
+ template <>
+ struct fmt::formatter<ColumnUpdate> : formatter<std::string_view> {
+     template <typename FormatContext>
+-    auto format(const ColumnUpdate& a, FormatContext& ctx) -> decltype(ctx.out())
++    auto format(const ColumnUpdate& a, FormatContext& ctx) const -> decltype(ctx.out())
+     {
+         return format_to(ctx.out(), "{} = {}", a.column, a.value);
+     }
+-- 
+2.38.0.rc1.362.ged0d419d3c-goog
+
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-for-fmt-8.0.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-for-fmt-8.0.patch
deleted file mode 100644
index efd8dc066..000000000
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-for-fmt-8.0.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 22b3a91473d548456a0823f9f170db0d7db5a444 Mon Sep 17 00:00:00 2001
-From: kyak <bas@bmail.ru>
-Date: Wed, 12 Jan 2022 19:41:37 +0300
-Subject: [PATCH] Fix for fmt > 8.0
-
-Upstream-Status: Backport [https://github.com/gerbera/gerbera/commit/82d84ac5e62c23e717198fc7b2ef190ff95e70d1]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/util/logger.h | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/src/util/logger.h b/src/util/logger.h
-index 8a8f0b1f..0a512bff 100644
---- a/src/util/logger.h
-+++ b/src/util/logger.h
-@@ -32,7 +32,9 @@
- #ifndef __LOGGER_H__
- #define __LOGGER_H__
- 
-+#include <fmt/format.h>
- #include <spdlog/spdlog.h>
-+#include <type_traits>
- 
- #define log_debug SPDLOG_DEBUG
- #define log_info SPDLOG_INFO
-@@ -40,4 +42,17 @@
- #define log_error SPDLOG_ERROR
- #define log_js SPDLOG_INFO
- 
-+#if FMT_VERSION >= 80100
-+template <typename T>
-+struct fmt::formatter<T, std::enable_if_t<std::is_enum_v<T>, char>>
-+    : formatter<std::underlying_type_t<T>> {
-+    template <typename FormatContext>
-+    auto format(const T& value, FormatContext& ctx) -> decltype(ctx.out())
-+    {
-+        return fmt::formatter<std::underlying_type_t<T>>::format(
-+            static_cast<std::underlying_type_t<T>>(value), ctx);
-+    }
-+};
-+#endif
-+
- #endif // __LOGGER_H__
--- 
-2.35.0
-
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.11.0.bb
similarity index 82%
rename from meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
rename to meta-multimedia/recipes-multimedia/gerbera/gerbera_1.11.0.bb
index cbb127d3d..9f2f1b093 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.11.0.bb
@@ -3,11 +3,11 @@ Description = "Gerbera - An UPnP media server"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
-SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https;branch=master \
-           file://0001-Fix-for-fmt-8.0.patch \
+SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master \
+           file://0001-Fix-build-with-fmt-9.0.patch \
           "
 
-SRCREV = "3b93d362ec33f738868a4e896a2c9ee8e9d7a92a"
+SRCREV = "d73d8c1346213d784753c02ea771970500e0df2a"
 
 S = "${WORKDIR}/git"
 
-- 
2.38.0.rc1.362.ged0d419d3c-goog


