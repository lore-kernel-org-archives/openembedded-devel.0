Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FA4C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 15:48:31 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.73833.1656949709249192633
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 08:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 264FmOTa018003
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 4 Jul 2022 08:48:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 264FmG5p008882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 4 Jul 2022 08:48:24 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 4 Jul 2022 08:48:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 4 Jul 2022 08:48:17 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 4 Jul 2022 08:48:16 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 4/4] python3-flatbuffer: enable native
Date: Mon, 4 Jul 2022 23:48:12 +0800
Message-ID: <20220704154812.17732-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220704154812.17732-1-kai.kang@windriver.com>
References: <20220704154812.17732-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 15:48:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97692

From: Kai Kang <kai.kang@windriver.com>

Native python module of flatbuffer exists before it is split from
flatbuffers. So add it back.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
index cc453da35..7c05e76d9 100644
--- a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
@@ -13,3 +13,4 @@ RDEPENDS:${PN} = "flatbuffers"
 
 inherit setuptools3
 
+BBCLASSEXTEND = "native"
-- 
2.17.1


