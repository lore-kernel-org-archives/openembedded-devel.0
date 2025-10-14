Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9B4CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:32:58 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.3468.1760484772388078396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EdpuwFMD;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27c369f8986so54117685ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484772; x=1761089572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfSba3QntZwva3rBV3aLv7uR32+1ejhntNnWxQzS4rk=;
        b=EdpuwFMDUJ8c3NSLFMHRLKEYX4f/KiZG91FouA/Yr0en9NbiybJQkhLGLYfOZJY4Gz
         BjJsie1VtCYF4z7E7yHRCll2o+MQjkTL563qLOW3twg2iw0pIaIvD4uUKtI9rxVLeZEB
         Oeq+KlMO058TFiOTsbVDPhO9SQucxW7yRuuDPWIichh7tbN/hlJJ7zRWEqYk4A9yN3UR
         B0nloCnorQC1fn4c0WEeEGbvXbUkmDfcV5imzzdLGoctJGaSC7mqJQxXYTgfIFxsfIDK
         ZifVvR7tn7AzTfDPtX7/lixxLmRkXylIUq49yC3W/7JXRHUkcSvZ5/kD/ya67SkOZyK2
         179Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484772; x=1761089572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfSba3QntZwva3rBV3aLv7uR32+1ejhntNnWxQzS4rk=;
        b=eT1kvJh3Xy3ajAObwxOe1xoznLtPa9YDonwM7Iv309N4VYBcjM90qytbAcMt3cuM0z
         LXwCVqMNj1BtlfMYITZ4eTBRN+SKUWSOnpsd0z2EItV/qzlCMGDCLf+TpMHZTlxynw9Y
         cCnUPbZBHxZE011XPbkWZstKCViSjbNq11CPsBlPROlAqkU2OyM6YOrXz88fnKMJoBmA
         Z5pfPXfxTC6+bFWU4MZ9PxD6Rgvezd3zO5rxc8NGpm/leO54yhsrj/OtXV8nYWf6C/vR
         ++zWBNWuOp/HxYjiEV+lcmJuXe3t/dgXj91fgrnxECuczt1K6dtclLEj3eGYebfxkW4c
         XWYQ==
X-Gm-Message-State: AOJu0YxEN3sAP6PSmK9YsmPYGtkvsN9IecuAOMfMpHAIVA9xE/Z1H2e7
	OIYJID9M+wfRH7TzuI22Y58qZDkYWQXFcx0IuOIFeidiuWoYTp54Htyj7b6H7Q==
X-Gm-Gg: ASbGnctEaUNMRYCKfYxysHtot3B2V5HcaSMFKMtCpzbZBnkNNNtkxNO7o/DVXoB3j4Z
	vrtPcuU12Ole6da9vsicVAcAqYDhJqk+e3v9qSe4WhcllUIQUUjaJFCWNxPmXkKPrZrMm1mnpoR
	l70y5tdWsm6yjWidtHlO9Di3FoU/rU5/vnEh4YMM8EsfK40x7UrM0VHs6hd3Y8IS7Xb3MKnwRiu
	+MmfMdIpXQzk49dy8N5jtV+3FGkuZ/+cZXOaDS/Gi+fvayCF7YIVmGwqWIu5iwSEsyx6DPlWihL
	oJHcIPqVo3zXCT+U3ogFrUlSTHil8/31cQEOUo1FhIRFSUCR7l+oVRJwUffK45j2xOsNz1EF0MW
	WYNf7amxZR6VtXSr7HvY7vbgcSYsUSiQsGR8qkZmm1OwYbt1FsJn9JYA=
X-Google-Smtp-Source: AGHT+IHWQAbOyDnxt9Dzdgk9myLb9ySMGroxpr83tTlRcnQBwtoq5RuBPzcFTq122ba7547SrzcRYw==
X-Received: by 2002:a17:903:94f:b0:290:26fb:2b91 with SMTP id d9443c01a7336-2902724dc96mr325300815ad.0.1760484771522;
        Tue, 14 Oct 2025 16:32:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:32:51 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 01/18] dash: set CVE_PRODUCT
Date: Wed, 15 Oct 2025 12:32:12 +1300
Message-ID: <20251014233233.304125-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120660

From: Peter Marko <peter.marko@siemens.com>

This removes false positive CVE-2024-21485 from cve reports.

$ sqlite3 nvdcve_2-2.db
sqlite> select * from products where product = 'dash';
CVE-2009-0854|dash|dash|0.5.4|=||
CVE-2024-21485|plotly|dash|||2.13.0|<
CVE-2024-21485|plotly|dash|2.14.0|>=|2.15.0|<

Our dash:dash did not reach major version 1 yet.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e1427013e01df44b9275908f7605e8e25fc3fd83)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-shells/dash/dash_0.5.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.12.bb b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
index 947ef702d7..1bf3625760 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.12.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
@@ -10,6 +10,8 @@ inherit autotools update-alternatives
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
 SRC_URI[sha256sum] = "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a"
 
+CVE_PRODUCT = "dash:dash"
+
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
 ALTERNATIVE:${PN} = "sh"

