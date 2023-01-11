Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168C5C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 18:20:32 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.32081.1673461230846347803
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jan 2023 10:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iO48O0CU;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id y1so17664995plb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 10:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhxQwWWC1R/16uSst8lgfAvkigkLI4poO7QauNfjgsQ=;
        b=iO48O0CUYRBvlKTkd6hzc0zYrf5Huk1+xHp0ukmMiQNRWHBgLtNHQBvnPoYHO6qsIc
         ZrwyvuYoo9x34Y6fzc6URrqMhml4gM04+zfQpfmA2uMGaaf6/L3D7/zaZY0c1vsh0zeT
         z+dDfMWJbeoLt1IEW9qfWdPTCpR8g98/1WuYNsgEsq607G2VCSrnVxBPfVbAH6+Xu3Gd
         7eJSmMhF3ar3EGhrpIe7qG4UpC9QNwVJTkcxVdxDQVOULPYI+S/b65rDwIDvDxTepiKo
         4+CdMp2RYaWkUkL+RDMUBWW9MK5dk7wjTtRL23Z5iz8y2K0yGmAQv3h0mh55yL0rEa5+
         KEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhxQwWWC1R/16uSst8lgfAvkigkLI4poO7QauNfjgsQ=;
        b=LIfvfqRyXKB0pEMtBjjXLet3MYw2bSe9dK12Y9/pcGhDeRhyZlSV1NyciN1Bj+QIjZ
         1VP/BWpZUUWAlkag8vD2Pfedh65P/PUWhYKMbcukaHovLHsayERqZ6xWBijNgy3YwBG+
         YiW2mt6asYEdPRnEwoIWGawa9EmJEVOlNNYwBUJp47X+BT9JI+022cYvFYO30xn/W3Fv
         dVaxXuHSEOPoN8dBf0xptWwBbaAZK1IlrbhiCqgl+jvy52ZRF2jsoeMh53oDQ+xFIc1d
         GIX+Ubyha1V9UO9zELpFiSmhyDVrZnhaiveUdg1aSeX5YYs1oTKb+jbewXDE0Y/zbQhb
         ti3A==
X-Gm-Message-State: AFqh2koUDZBNnZkawztGFl3glOG/GWrYbymC5Msgq9/hlGVg4XkqIzo9
	Tzm0halil3NACKNuftd4/+Om6a/b+k7VEA==
X-Google-Smtp-Source: AMrXdXsdGnCppkqBSU7LWhL6s2emMIIgNan1KQawd2dK+ubeS8T851lE30AyyuQu9z5xwcVaoe8rlA==
X-Received: by 2002:a17:902:be05:b0:192:a4e5:ac5f with SMTP id r5-20020a170902be0500b00192a4e5ac5fmr46045503pls.61.1673461229896;
        Wed, 11 Jan 2023 10:20:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090322c200b0017f73dc1549sm10465522plg.263.2023.01.11.10.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 10:20:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ipmitool: Remove unneeded patch
Date: Wed, 11 Jan 2023 10:20:27 -0800
Message-Id: <20230111182027.3437927-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 18:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100556

This has been fixed with [1]

[1] https://github.com/ipmitool/ipmitool/commit/1724b031

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rovide-missing-function-declarations.patch | 34 -------------------
 .../ipmitool/ipmitool_1.8.19.bb               |  1 -
 2 files changed, 35 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-ipmi_fru.c-Provide-missing-function-declarations.patch

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-ipmi_fru.c-Provide-missing-function-declarations.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-ipmi_fru.c-Provide-missing-function-declarations.patch
deleted file mode 100644
index 704bbdb5c7..0000000000
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-ipmi_fru.c-Provide-missing-function-declarations.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e5bbf96edf776821f29ab67baed22a690bf8ab10 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 Sep 2022 07:30:10 -0700
-Subject: [PATCH] ipmi_fru.c: Provide missing function declarations
-
-Fixes build with clang-15+
-
-Upstream-Status: Submitted [https://github.com/ipmitool/ipmitool/pull/360]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/ipmi_fru.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/lib/ipmi_fru.c b/lib/ipmi_fru.c
-index 3d1d8a1..5c5661c 100644
---- a/lib/ipmi_fru.c
-+++ b/lib/ipmi_fru.c
-@@ -60,6 +60,13 @@ static const char *section_id[4] = {
- 	"Board Section",
- 	"Product Section"
- };
-+/* From lib/ipmi_hpmfwupg.c: */
-+uint16_t
-+ipmi_intf_get_max_request_data_size(struct ipmi_intf * intf);
-+
-+/* From src/plugins/ipmi_intf.c: */
-+uint16_t
-+ipmi_intf_get_max_response_data_size(struct ipmi_intf * intf);
- 
- static const char * combined_voltage_desc[] = {
- 	"12 V",
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
index a8d203e599..0340901c22 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
@@ -24,7 +24,6 @@ DEPENDS = "openssl readline ncurses"
 SRCREV = "19d78782d795d0cf4ceefe655f616210c9143e62"
 SRC_URI = "git://github.com/ipmitool/ipmitool;protocol=https;branch=master \
            ${IANA_ENTERPRISE_NUMBERS} \
-           file://0001-ipmi_fru.c-Provide-missing-function-declarations.patch \
            file://0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch \
            "
 IANA_ENTERPRISE_NUMBERS ?= ""
-- 
2.39.0


