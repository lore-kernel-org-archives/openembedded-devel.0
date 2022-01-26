Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635F4C5DF62
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 01:49:33 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.7008.1643161772794921380
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 17:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fFtPiiOU;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id q63so17153433pja.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 17:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7bRcVTx9z6LBShTBzAeDMYTvZ5tyLVJQoHcfOUOCjd8=;
        b=fFtPiiOUmH2Ej74pykH1E4Sg0UAs+fRQnk52t0ZonmNAvaYoG5d4C4RETp2H0ihR5h
         3a2dlk5AP9XmwUpuzxo376696YGLgxG4sZ5ziBIXLA1/MAV3J1BBR9v2uupbArTQ27/c
         4wpn2jTWRjjcRe59CYT+08Osti4+E/sHy2BPiL+xEB+QunPzisu5Qjtv5xk1k9A/lqVq
         7x+LGoXuM8fywlIBVtpXl42kEyUsrjhKAzBJQKIol9clJyeadEzBpEie35+ceq2n6Pze
         enLMUbLrW0mTtE5tzqBQCN+M9bzcSPI+sKAN3LUpYv0vXKu8crboIs9/e4HT58HJ5F35
         5U0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7bRcVTx9z6LBShTBzAeDMYTvZ5tyLVJQoHcfOUOCjd8=;
        b=VaOD+J/cltqHJsgt2hLQ4s+SNxSrbeuTHjlQ1AAh8W9gAcJdB+bNuKxwFJ8VA2Tft8
         5qKvB7259+ECx1u2NN58UMU1XUboJCCXzP3ceXTh92nYVEs04gPbNMu72AqKjpvFSgDo
         r66oHbe9OJc4LfBOraoiSJfKI7zEQ1XUlv8DWmvYurzWHgiponYzHnMhWE7OWbstb0Gz
         T1o2wPmtd+PVXQ//3lVBuWELrOOGBlB1oylPz5TtojV0DysKWuLS4KZ909fN3Klw6e1x
         +tKyW/cT8k6A/WR8SjejXIVJkhVy3D6zPy4UfVyYitCuHC8/MNtrmBjLZb66o9NhQpiv
         YM1w==
X-Gm-Message-State: AOAM530d8U08SPJUst5ax7e71x1WvE3+f+SIplNVtKqm7ZIiSNv2UMEW
	xhIHKIR2dFcMx4G76K82G/jzQacg5L2e6g==
X-Google-Smtp-Source: 
 ABdhPJy56G4jm+OjFca/MVEkXHMORCHvO5rTxI80s9cnxXpj0O1ljyh5Beult5WcgJ3JtBnwYOmKfg==
X-Received: by 2002:a17:90b:3a87:: with SMTP id
 om7mr6394483pjb.168.1643161772107;
        Tue, 25 Jan 2022 17:49:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 y15sm258362pfi.87.2022.01.25.17.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 17:49:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH v2] gerbera: Fix build with fmt 8.1+
Date: Tue, 25 Jan 2022 17:49:29 -0800
Message-Id: <20220126014929.2056999-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 01:49:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95088

The APIs have changes and we use external fmt library in spdlog
which is used here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Backport upstream applied fix instead

 .../gerbera/0001-Fix-for-fmt-8.0.patch        | 46 +++++++++++++++++++
 .../gerbera/gerbera_1.9.2.bb                  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-for-fmt-8.0.patch

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-for-fmt-8.0.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-for-fmt-8.0.patch
new file mode 100644
index 0000000000..efd8dc066c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Fix-for-fmt-8.0.patch
@@ -0,0 +1,46 @@
+From 22b3a91473d548456a0823f9f170db0d7db5a444 Mon Sep 17 00:00:00 2001
+From: kyak <bas@bmail.ru>
+Date: Wed, 12 Jan 2022 19:41:37 +0300
+Subject: [PATCH] Fix for fmt > 8.0
+
+Upstream-Status: Backport [https://github.com/gerbera/gerbera/commit/82d84ac5e62c23e717198fc7b2ef190ff95e70d1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/logger.h | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/util/logger.h b/src/util/logger.h
+index 8a8f0b1f..0a512bff 100644
+--- a/src/util/logger.h
++++ b/src/util/logger.h
+@@ -32,7 +32,9 @@
+ #ifndef __LOGGER_H__
+ #define __LOGGER_H__
+ 
++#include <fmt/format.h>
+ #include <spdlog/spdlog.h>
++#include <type_traits>
+ 
+ #define log_debug SPDLOG_DEBUG
+ #define log_info SPDLOG_INFO
+@@ -40,4 +42,17 @@
+ #define log_error SPDLOG_ERROR
+ #define log_js SPDLOG_INFO
+ 
++#if FMT_VERSION >= 80100
++template <typename T>
++struct fmt::formatter<T, std::enable_if_t<std::is_enum_v<T>, char>>
++    : formatter<std::underlying_type_t<T>> {
++    template <typename FormatContext>
++    auto format(const T& value, FormatContext& ctx) -> decltype(ctx.out())
++    {
++        return fmt::formatter<std::underlying_type_t<T>>::format(
++            static_cast<std::underlying_type_t<T>>(value), ctx);
++    }
++};
++#endif
++
+ #endif // __LOGGER_H__
+-- 
+2.35.0
+
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
index 94657ba534..7e6ae97983 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
 SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https;branch=master \
+           file://0001-Fix-for-fmt-8.0.patch \
           "
 
 SRCREV = "3b93d362ec33f738868a4e896a2c9ee8e9d7a92a"
-- 
2.35.0


