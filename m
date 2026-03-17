Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A84FED9F3
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 17:23:52 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81723.1773768231172685761
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 10:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z9E5tjG9;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so71318765e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768229; x=1774373029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UtCpcnMpFtt0MkX47ccdijDsFL7S9/lZerx3klH60A=;
        b=Z9E5tjG9PMW2RN1WCf9QhLt9MeLvXrEze7p5pi8WiazbQK9dxIulvlW7dIBZBI27T2
         7bEe3VwxZ3JixiCH7zWsNGMe/9AcEWxrsQ7n7+/56bPRwZj7CATjnQQKFwLr4KrFkYfE
         PkoXpqSFAhRuFy56M5TFDAiIlOtXX8E82thAG0dMSmdMUqpQe04rBZO9foZOA4issjyL
         KO1B6BSODy/NHL89hV1oZo8izBGtJRxfAtPuLkDbfVvI607pghN+RM6gKRzu2+L9Sv6h
         uajfrPf/Dd9aYvYFbzw00cQu0fE62cQ0R2cAordlHZwodPsn99hCQjl3yOQRvD1/vI0V
         MBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768229; x=1774373029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8UtCpcnMpFtt0MkX47ccdijDsFL7S9/lZerx3klH60A=;
        b=XO9XO9mTDo/EoO2CMtznQqLxxdnW/OrnNuEC1GY3HNG8+BBAecFgfYS0bFzfsO321b
         vxMTyRDUQGlh1jDmOc01dBl8AwiunTwcy9C4CcNZ432dW3zW+7Mazf72wDTc2lOchPMJ
         WfFTIRHYVHk5pkXWaYWyDfgnaGqx8k63rereMcNpGujqKtjngauaSckBtPCPrRA1QsSl
         3G9k3s7yVY0G9nTgtWvhS9lD48LjsYDAF2Dn85YUVfRbvrfHy7w29Esqg2Ph/lo1Q9Ud
         VvC7KrjtkiDEISu/tVEdjUMN5ILdDJyRzcqAzgVx0oQuUHygv0CHruMpIcZIRO55slZE
         UyWg==
X-Gm-Message-State: AOJu0YxkWcLJFO6bHL1WX/okto6SQK2N+I6k4kAstndpGbiRWiN1/zyq
	m7isnAWYiRy/T7ynojIO3erqZneOz4xapBQsnUR8H/AMF+E7Viknj9LpKjJ3jQ==
X-Gm-Gg: ATEYQzyDZLxvcLSTBEkigi14YkgCSOumivjEsadvXt7BtaKJ4QyW/OfD8I61WK5wftw
	Te7R79LUuEzmQkAjP1y60RS+T95c7iByhzGPHRgCOv+E2NvldHV5FMSjvoG4d097Dtae351RyLr
	wQWaV++ostUu0qprLinTndDpzNKFZgToDikQakb6m7fldZ9SKN/BWguGHr/32+7zwDqV0QsT7GV
	aw8yn1yYZI9yUlbjV2dLmsrr8v0MInTn6jtwS5viWQ/659Yjz+94hoGvuNL9kuP8uu63jkqBbiQ
	Q+sgvbpCt3bvLpwvFQBU6oFfW2Wgn8yiEzW/iTchMjCQaFX3KBgStGQnBsbtLks32HFt41aeXw3
	AgSJ6ytB6MYUs1A4+DMJqd31dZ5oBEz8bq38oD6fxA0ek11df9+EXTmnZL7nh6ha/gPDXRkVcBp
	0LyUJR78Al+pHvEJlNv8zutTHwDTuhSLA=
X-Received: by 2002:a05:600c:8b6f:b0:485:6ec7:2df with SMTP id 5b1f17b1804b1-486f4435d46mr5895635e9.8.1773768229413;
        Tue, 17 Mar 2026 10:23:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48634a7ac93sm61717385e9.2.2026.03.17.10.23.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:23:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/7] ettercap: fix typo in CVE ID
Date: Tue, 17 Mar 2026 18:23:43 +0100
Message-ID: <20260317172346.2862459-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317172346.2862459-1-skandigraun@gmail.com>
References: <20260317172346.2862459-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 17:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125326

The CVE fix is correct, but the CVE ID contains a typo. The correct
ID is CVE-2026-3606.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ettercap/{CVE-2026-3603.patch => CVE-2026-3606.patch}       | 0
 meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ettercap/ettercap/{CVE-2026-3603.patch => CVE-2026-3606.patch} (100%)

diff --git a/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3603.patch b/meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
similarity index 100%
rename from meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3603.patch
rename to meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb
index b806a77164..6fac3a0b84 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb
@@ -22,7 +22,7 @@ DEPENDS += "ethtool \
 RDEPENDS:${PN} += "bash ethtool libgcc"
 
 SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https;tag=v${PV} \
-           file://CVE-2026-3603.patch \
+           file://CVE-2026-3606.patch \
            "
 
 SRCREV = "41da65f4026a9e4cea928e61941b976d9279f508"

