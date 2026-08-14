Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3E6C5DF75
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:50 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24381.1786747599810204176
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qMlSnXw0;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1915998a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747599; x=1787352399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3xvnoJO41pqsYv1MWH4h1LXKx/v7+9sMbc+2IqwLS8=;
        b=qMlSnXw0QTksMYd8k7amVAIpx6yz7ACsAQeh1xNSkKdYBkFgE3XPfLNPbaad5ZxhV2
         DtJScH9jjH6VeDYO3C1GYySS75BGoJzOQ59FCagFipwgDFYXRZymD0RSzul+JlJRWH6c
         8Z9kMJWBvQuvs3NPScJqNNE714PuBZpR9MsFKDF58RJOl0++liqSdbf1+HN4hC5iiiVQ
         bG6/qi6zMmPUYWhof9w37CDuCQpEOq6++IfkcFjv9TCIA0/xiuOrh22sfDSEJPxn/DLQ
         eQ3axnsQeFGL8YbAwCZPuvUI9BQLVqsCr58e22BafzZu33cLDC7jy8GjaSJFi5zvh0MK
         ePIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747599; x=1787352399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x3xvnoJO41pqsYv1MWH4h1LXKx/v7+9sMbc+2IqwLS8=;
        b=HQFbmTNoV2g8fvVs1BZe6D3r49peoqyziyyEZonR5XJ1BLDKhHly0y2o2cm3zTz36/
         hz4TqV/wE8BM/7Yp3VMMdHLCdwQNAN5qrxTD5UnhVYDrGXqaRxorPjwxyfYQjtCUtpYv
         Mq6sJID/E/p+P1Do2pn5N7MXwcpx6tFZQI/yqEEsRtw4YuxOXcgbRPEjEGBa5xA2djE5
         pBFztK8Kr+wKRtyG1mwzyqN0HNbfNRlvjVg+4MROT/EBsiiXB0WnX6Wk7R19pGIxbnyY
         jXh9jqeJ74L3VIS2rXzuPQ2rYTVcWhFMiSYtpRY4qBZiVm3qURuOSCXLR9fRZxz0nVeg
         Rk/g==
X-Gm-Message-State: AOJu0YwdSsqnApJbxGUasbaBrj4/x0FBtbyTeKlQSDjxyaF9GaAndQf0
	ovMkBvNla47ZCcjmVksrjtUq/FaV/kM0Pci5NPYTK2KsTmblIS7xv1VUS/djQw==
X-Gm-Gg: AR+sD11Bj74dR+GYQIb9aRzauuqySNdSA8Pwy1KAcxOGue7i04Jda/kwVJFTMt+aGdP
	sQjUNaV5blns+9o3yutR9ILlinbqrpsuekKNf9d+MOpcll0EjJ58CO6SnBkOOi8oEXJ/S/yLjMz
	2Fozww2Y1wU/+EnNHRcHG6MisDD8RsChA6icnS5sBM+NN8Zqr6OSSZTBHzuiKnn0AKtCAzfaIiM
	Erg5clIkcWsAS30h/959I9Ekr4lBA8v4jdjjfXLqsD7ZPll7iqH4NLSW8G539wAl+MMpaI0aGwE
	I7YAWM2bUIQpW91eWflIQLKhqCl1Ua11Cjvc1Ku+9YgJy900MN/pU18ckVZ8XHodcMpFUTj324F
	9ove+vZo42s6a8qHfvtCIpCs6XLsG19mOzoLz79RVknl/hnUnJs5uSyZEt9dNo+sRfWYzqwECyL
	JxBFywgp3OSyG1oJW2+R3T2YVdj+S6K/xBoWySppCEKIkLRO5VUwewPxh+xgem7g2ch45tZqejY
	MvhfZsAwIiQm4ojFSg60vutXBAKV8eIUHVUnvfeylpVopeTkcMhf+SQuoGPxAvz2P9DfZ1VR5AV
	tTxdaMK5F/HWzrxed0z36QH7xNmtbVjrxfpD1iWmz+ajE9R4NHwjw207ol9VzpopAWtZIyKWqJJ
	Cd+vrybOUh9xo8MLiVwpxV5FiwpeNOWMUJUzzMk7bV481YKNquXhgINJA9A==
X-Received: by 2002:a17:90b:264c:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-3931f47d73bmr13044164a91.6.1786747599098;
        Fri, 14 Aug 2026 15:46:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 050/109] pangomm: upgrade 2.46.4 -> 2.46.5
Date: Fri, 14 Aug 2026 15:44:36 -0700
Message-ID: <20260814224539.1523174-50-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129114

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../pango/{pangomm_2.46.4.bb => pangomm_2.46.5.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.46.4.bb => pangomm_2.46.5.bb} (57%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb b/meta-oe/recipes-graphics/pango/pangomm_2.46.5.bb
similarity index 57%
rename from meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.46.5.bb
index fd921be650..4caf4ba3e1 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.4.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.46.5.bb
@@ -1,8 +1,8 @@
 SUMMARY = "C++ bindings for the pango library"
 SECTION = "libs"
 LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
+                    file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce"
 
 DEPENDS = "mm-common cairomm glibmm pango"
 
@@ -11,7 +11,7 @@ inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "b92016661526424de4b9377f1512f59781f41fb16c9c0267d6133ba1cd68db22"
+SRC_URI[archive.sha256sum] = "38ca0b050b065de4e3da0c182df657437757063bbf0c4b6c9567ddba019b1d68"
 
 FILES:${PN} = "${libdir}/lib*.so.*"
 FILES:${PN}-dev += "${libdir}/*/include/ ${libdir}/pangomm-*/"

