Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7E6C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 20:59:45 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.3322.1643144383568846227
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 12:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wya4tryY;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id i1so2845185pla.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 12:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Qm5pICZncHb6GF+TcSe+AMT0bFCjwGKT4ylYRnfQJE=;
        b=Wya4tryYk3A3bQHlHRKA+PnLhQ7scxYovkahxb4snL4CRUP/ajuWtbspH/lYf5mhk/
         zuqIvYcSeI0rsHPMJxh2pJohZ9yETUr+tvqb6vRWeKbFmCrsoUGx/9RiF7oYvLZpDhdW
         sGcyfAOz5fhHtaEJgrefr+Dw4WLSaj9okqmf3wPl3CgFutGB2cvEhLWWDjom3PefVHyP
         6RCAcahArb2YuzIsrTD3AdpiekfR4df1bHDl6nWwkqwMeCKhIFku4xTaYR74CoIfzLEI
         AtFeURhM/zsX2MqDkzStFGJhDSSYN/bKQSm7+zk5+EmBdLz44lnu0cqHgxdDs3QhaoSW
         gXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Qm5pICZncHb6GF+TcSe+AMT0bFCjwGKT4ylYRnfQJE=;
        b=YY/E/J4v2OeIxjQcgjdwf8H+MwYcxnLYrz41TYP2CidePia+JgayO/erI5nHxF7aKz
         f1HngaO++6LqhKK2v82sEmBn5AqTb3t9RwpCAaKpj8smjAgdug1VXfCgugAToImjg1re
         LL6O67LaEwHC7T8OfYaud20wYW75IVur9hu2JHWqcd0g4N/7MVuOIEE8YEvG/7TbtOGF
         PvWtrKXCfkF41IHzQ/Jn1fN7+bezkpnuMoUbyZKkbvbvSYmxOHWB2YiL+iruMiQhKS+t
         yylsP90VI8//0upTykkhROPNUOoNH2Kysuo5FTKEKALnjPFtJeAS+rcS4moJIj9yRn6w
         Ctrw==
X-Gm-Message-State: AOAM5302dDicysGPKof4UBnf2aFg6yqjp+KAxeu4128aV0n2qRAngKXF
	gj7+JPSz6T3wRM89m7DfqCsxO1QZs9JmlA==
X-Google-Smtp-Source: 
 ABdhPJyBMw7LfcUq/W5URsMSZrBb6c2ESdXYWxMLDZTxE5qgOdsgYM7N1AEL634pFNQeTusdu+T/8w==
X-Received: by 2002:a17:903:247:b0:149:b6f1:3c8b with SMTP id
 j7-20020a170903024700b00149b6f13c8bmr20503374plh.83.1643144382779;
        Tue, 25 Jan 2022 12:59:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 c8sm22803847pfl.122.2022.01.25.12.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 12:59:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] gerbera: Fix build with fmt 8.1+
Date: Tue, 25 Jan 2022 12:59:39 -0800
Message-Id: <20220125205939.1310384-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 20:59:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95085

The APIs have changes and we use external fmt library in spdlog
which is used here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Explicitly-cast-scanmode-enum-to-int.patch | 35 +++++++++++++++++++
 .../gerbera/gerbera_1.9.2.bb                  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Explicitly-cast-scanmode-enum-to-int.patch

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Explicitly-cast-scanmode-enum-to-int.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Explicitly-cast-scanmode-enum-to-int.patch
new file mode 100644
index 0000000000..bff0b2418d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-Explicitly-cast-scanmode-enum-to-int.patch
@@ -0,0 +1,35 @@
+From 9eaf38dd6e4f7d24d7eaa1c6572495f3b4f2e969 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jan 2022 12:51:45 -0800
+Subject: [PATCH] Explicitly cast scanmode enum to int
+
+Newer fmt library needs this now, fmt::format does not accept
+the enum as part of va_list
+
+Fixes
+/usr/include/fmt/core.h:1727:3: error: static_assert failed due to requ
+irement 'formattable' "Cannot format an argument. To make type T formattable provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt"
+  static_assert(
+
+Upstream-Status: Submitted [https://github.com/gerbera/gerbera/pull/2391]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/content/autoscan.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/content/autoscan.cc b/src/content/autoscan.cc
+index fa5702cf..3c4a9020 100644
+--- a/src/content/autoscan.cc
++++ b/src/content/autoscan.cc
+@@ -121,7 +121,7 @@ std::string_view AutoscanDirectory::mapScanmode(ScanMode scanmode)
+     case ScanMode::INotify:
+         return "inotify";
+     }
+-    throw_std_runtime_error("Illegal scanmode ({}) given to mapScanmode()", scanmode);
++    throw_std_runtime_error("Illegal scanmode ({}) given to mapScanmode()", static_cast<int>(scanmode));
+ }
+ 
+ ScanMode AutoscanDirectory::remapScanmode(const std::string& scanmode)
+-- 
+2.35.0
+
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
index 94657ba534..0424ce89c7 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.9.2.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
 SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https;branch=master \
+           file://0001-Explicitly-cast-scanmode-enum-to-int.patch \
           "
 
 SRCREV = "3b93d362ec33f738868a4e896a2c9ee8e9d7a92a"
-- 
2.35.0


