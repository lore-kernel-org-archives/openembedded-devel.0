Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36590C433FE
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 02:14:00 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.5820.1648779238703026554
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 19:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2312DuBQ016321
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 31 Mar 2022 19:13:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 2312DteQ002999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 31 Mar 2022 19:13:55 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 31 Mar 2022 19:13:55 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 31 Mar 2022 19:13:55 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 31 Mar 2022 19:13:54 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/1] wxwidgets: fix typo
Date: Fri, 1 Apr 2022 10:13:47 +0800
Message-ID: <20220401021347.10600-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401021347.10600-1-kai.kang@windriver.com>
References: <20220401021347.10600-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 02:14:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96309

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../wxwidgets/not-append-system-name-to-lib-name.patch          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch
index ef6963375..0f78cc134 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch
@@ -2,7 +2,7 @@ It appends system name to library names for cross compile. For example, the
 library name is libwx_baseu-3.1-Linux.so rather than libwx_baseu-3.1.so. It is
 not appropriate for oe.
 
-Upsteam-Status: Pending [oe specific]
+Upstream-Status: Pending [oe specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
-- 
2.17.1


