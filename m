Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029EFC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 01:27:00 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.3798.1634261219176075316
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 18:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p03XwcYK;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so8212442pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 18:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6CfCYY8tQ2pmZFsVxV2Cdb9QQ9G/h5gitR3XR2Pc6KE=;
        b=p03XwcYKp44kJ4iMAz/4ZVmCJ64IABMDsaS2GV71xW3iaKHugRSBHkVYXWsQGwDKnl
         4GyG3qAA9Q+72GNf17jQkW+93HMudUKXICCto7AtRY4mUTaeghN0wB3MONm23UfybaUM
         u3Fhyu7z3aUI3eWHCHGxT/KERXBtBeIjdUz1yTSgLLvFc1vXf0rYYHSYQETZiWfoDGhm
         bUH/fCbhS6HPeaU3wRuauD6BiLKxNHzoE7cdJGhvFtbrIisT1b6e0iEuYl6uonbRQaFI
         m9pm6S7g+I/kmEsReun7S8tbPsOpAnTppekzi6GwecJwjXPGtVaa9OrJ5+SZ59/SQkPk
         nTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6CfCYY8tQ2pmZFsVxV2Cdb9QQ9G/h5gitR3XR2Pc6KE=;
        b=Z0TrSbIqW+Ps3/nglIq4w1ELd7aA07EVGfXfubJK3JN0PAGA0vNeZ/UKb03r2iniK6
         uPMk2jModt/iNTsmIjqdq+6XDXPsGzRwuzUfyJht5D5Lrvly9qibxxYdVBvPzZ6IT/zd
         vYLGASNWMtRKPoJozLNgzy1qSWt9tY10uuyuNuY2lQg8wkzCpuL9Ki2ua/+7/iofk5Mj
         S1Y1DWP/uGoJDiR+Szy14k29tiI4yYIKjKrg0fXANApnoskq2V0vUuPx5ruM6z7NU7zG
         CBaY2HydOVwl189uyuJj4BUX6W3lLTlrcZrlw8sRCYhzTP4BV7Ca/nQz60kxHrrlCdE1
         n5LA==
X-Gm-Message-State: AOAM532HybGBo4z42snEYweaeCbPKA1DJox2hXBNfTs21BQA2AdX0+ik
	slFgM39n3fno1t88PVfa1FV4dGoY0tlDHw==
X-Google-Smtp-Source: 
 ABdhPJyDk1Lv68tXgZRIdM1BjseBJvZOvlBO39fatKqsWAI7cZGtBpTOEyTXjhtD2bBcQY2K3v7BTQ==
X-Received: by 2002:a17:90a:6289:: with SMTP id
 d9mr24853789pjj.110.1634261218354;
        Thu, 14 Oct 2021 18:26:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 b10sm3862759pfl.200.2021.10.14.18.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 18:26:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pcimem: Add riscv64 into COMPATIBLE_HOST
Date: Thu, 14 Oct 2021 18:26:55 -0700
Message-Id: <20211015012655.165757-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 01:26:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93317

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb              | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index eb53fdaff9..52536ddbe3 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -306,6 +306,7 @@ RDEPENDS:packagegroup-meta-oe-devtools ="\
 "
 RDEPENDS:packagegroup-meta-oe-devtools:append:x86 = " cpuid msr-tools pahole pmtools"
 RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 = " cpuid msr-tools pahole pcimem pmtools"
+RDEPENDS:packagegroup-meta-oe-devtools:append:riscv64 = " pcimem"
 RDEPENDS:packagegroup-meta-oe-devtools:append:arm = " pcimem"
 RDEPENDS:packagegroup-meta-oe-devtools:append:aarch64 = " pahole pcimem"
 RDEPENDS:packagegroup-meta-oe-devtools:append:libc-musl = " musl-nscd"
diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
index 107d5a8b72..42f5513284 100644
--- a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
+++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-COMPATIBLE_HOST = "(x86_64|aarch64|arm)"
+COMPATIBLE_HOST = "(x86_64|aarch64|arm|riscv64)"
 
 SRCREV = "09724edb1783a98da2b7ae53c5aaa87493aabc9b"
 SRC_URI = "git://github.com/billfarrow/pcimem.git "
-- 
2.33.1


