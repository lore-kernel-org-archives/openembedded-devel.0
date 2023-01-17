Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01065C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:14:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.191218.1673939637417933034
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QTH/Lfcw;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939635; i=@fujitsu.com;
	bh=dMxVI1bd/65MiQk7qYzyafOMqDLpzZxqXzJUxMDY6Kg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QTH/LfcwbSzBEPjenBpjv0sLymdwaM0P8cenZiNpveyqC4iED64dCEyvBjfyiqFSb
	 ZHIqYzTg1JVbBt9c/9YiIZN72NPjP8w4iqHYhuviABRhvp4uvr4qaadElXnwqBHdtE
	 2KUrwRC3kpLeENWYBFYbrQDpXEPAPKCiSy1beDxf8n7n3/wiP91j9PsXKyXoqYo9Zq
	 JFL2CvsZX1I5bAK95GAU4dmte+51OLYhQQggS6tZx+AcVAIO4frFqSAAes/IWn+I2k
	 q6ZuJOCngY3EO7YkMrl5U0j3BuGYSdwXzt6RbnXtp/pC7s9Y51Qt+sFJIlWFRm32yW
	 ff+hSKcs0pL3A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpLvZ61i
  ywYSHjBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8avHXwFFzgrjm07wNrAeJKji5GLQ0jgIaPE
  oq7VLBDOVSaJVysmMEI4exklzixpZe1i5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hASeJxf/ASlgEVCW+rtgGZvMChV9/+Qw2RkJAQWLKw/dgrZwCzhI/Dq1jAbGFgGpOnp
  7BClEvKHFy5hMWiPESEgdfvGCG6FWUmH25mQXCrpRo/fALylaTuHpuE/MERsFZSNpnIWlfwMi
  0itGsOLWoLLVI19BQL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0Uv
  L7VkEyMwdFOK1QJ2MH5c9kfvEKMkB5OSKO9J02PJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4v
  dyBcoJFqempFWmZOcA4gklLcPAoifCGWwKleYsLEnOLM9MhUqcYFaXEeVd7AiUEQBIZpXlwbb
  DYvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPeJB9AUnsy8Erjpr4AWMwEt9ig5CrK4JBE
  hJdXAtOxyht6FtKCallu/Cipc2K7r/9685G6L2fyHUZ9NP/3tD5//av5q77VeTyzWdXn6TIiY
  0NYwZVvmugk/Uvv4pWWT1/X1Ts1jmNsz+6N17xa14B1OK3/XLO0+wLmm9BPvtbUrQ275u5/6w
  7PE6NoVc5Gn/o96pFUvvrD0cz3xqFxotd/mtU5Xc+18Zkhd3CWz4efPoK/h7Cu5Xv44oPfu9C
  vZJ3GvxHWqNzlVFGRMvdH0pInN65pkl+yKvjWVR9T+fU/WanRsUJt+4/uHzO0nXfgFs68tLZm
  wi6WkfNeSw2e/KsnyXIvPTQ7Ybv6rfWI9j3rA1K7JV/zVvx0pzu6/zbtjiqrklMWRP/sXLPz6
  M1eJpTgj0VCLuag4EQAokMNhWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1673939634!403486!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23913 invoked from network); 17 Jan 2023 07:13:55 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:13:55 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B9A921B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:13:54 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AE3941AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:13:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:13:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 2.1.3 -> 2.1.4
Date: Tue, 17 Jan 2023 15:13:34 +0800
Message-ID: <1673939617-20032-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939617-20032-1-git-send-email-wangmy@fujitsu.com>
References: <1673939617-20032-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100595

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed #177 "size sorting is broken". Thanks to Nicolas Thierry-Mieg 
- Removed "failovermethod" from repo information, not available any more

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnfdragora/{dnfdragora_2.1.3.bb => dnfdragora_2.1.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/dnfdragora/{dnfdragora_2.1.3.bb => dnfdragora_2.1.4.bb} (95%)

diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.3.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.4.bb
similarity index 95%
rename from meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.3.bb
rename to meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.4.bb
index 3a306ad95..25b16121e 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.3.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.4.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=master;protocol=http
            file://0001-To-fix-error-when-do_package.patch \
            "
 
-SRCREV = "5b0f4c38efb92c9dac1d39fade5b9a3c30f20ec4"
+SRCREV = "e38e1127e56f5c7cc38e22c6dd4c2728fc4f0b3c"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


