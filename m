Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC66FC6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:30:24 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.7402.1663641021986308165
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hbsmVZiy;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663641020; i=@fujitsu.com;
	bh=0qZfh7rwy5a93IxbpcXySHI2cTeg7Lv9Lvh4w/iXcRQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hbsmVZiyZNyPagHEYAuvNSl3Xe+MVwkI0ogOaWyPgTYEbI22hB0av9gaxG6DLhvis
	 hzeOLo21UXvKCLSQcVB3Q4NKl3oVl4wL5siGhdZNCtBIR7AzU5Dl+idZK0aa+Z0uf/
	 OIBLJhucRuR8oJ/m0nMcauk78gQbbhY2cQSVEWeuYFAm762l8lrFHdeLGPvc3ZcNCK
	 UFvuAClY025RsRe/qyB4uPxB4feLVXy11+ZHGibgShql1f3Si2rppiUjy7xqaW/D2o
	 Jt9UP+1sJB2UbVCgA0uUr2GjAVRhLWe7rsve9++R+NWi0ZFLZ+GqUPtdPUNizGJgoE
	 UhX8zTNvTWiMw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8OxWXe3qma
  ywdmfGhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aRS2+YC95wVGyY/5SxgXEGRxcjJ4eQwENG
  iQsTU7oYuYDsK0wSc1YfYoRwDjBKdHUsZAKpYhPQlXjxYzELiC0ioC+xdPYeZhBbWCBQYuuuB
  qA4BweLgKrE1d4QkDCvgLvEvyt7GEFsCQEFiSkP3zNDxAUlTs58AjaGWUBC4uCLF8wgrRICih
  Kzp8tDlFdINE4/xARhq0lcPbeJeQIj3ywk3bOQdC9gZFrFaJVUlJmeUZKbmJmja2hgoGtoaKo
  LJI2M9RKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAgMvpZihegfj/96feocY
  JTmYlER5ueo0koX4kvJTKjMSizPii0pzUosPMcpwcChJ8NoLaiYLCRalpqdWpGXmAKMAJi3Bw
  aMkwiunApTmLS5IzC3OTIdInWK05Jg6+99+Zo7lYHLm17YDzEIsefl5qVLivJYgDQIgDRmleX
  DjYJF6iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwL6cy0BSezLwSuK2vgA5iAjrohoo6yEE
  liQgpqQYmVy+fTOGrzxp82+NzWLevtrRms9Y8VtXo58ffPz211ZXN8P6LX4ua4zZwl88R8Vog
  vHmF/rm9q7QW+O3SeP1QWfNib9NvyeObZs3dVXl8zpE32/Y2Rsr7LdvHtlNval59rZTKpr+G8
  hJpcu5K3Ns0Jyo8sfxuV5LYrt2b+3pSbWlA7atNuZMsv52/31K+7bqg7elu8ddP3/zgr545QT
  eh+LYiy6TcvIrkR337DBl4qgs6pvdXzb13eGHkjY08jt3pB0vCHiZsOLwt/8zJGf6Lbj7zaRf
  91SOg2sXPd77LSuT9khi/wxNkZEKPlVSW38hf/1O6w7vdLsSNg/OTrd49lcSbTQ8FZmXdkS66
  3qzEUpyRaKjFXFScCAAUYP/NTwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1663641019!305814!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18472 invoked from network); 20 Sep 2022 02:30:19 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:30:19 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4CFF7158
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:30:19 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 40B6E152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:30:19 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:30:18 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2022.8.17 ->
 2022.9.13
Date: Tue, 20 Sep 2022 10:30:10 +0800
Message-ID: <1663641010-2461-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:30:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98894

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-regex_2022.8.17.bb => python3-regex_2022.9.13.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2022.8.17.bb => python3-regex_2022.9.13.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2022.8.17.bb b/meta-python/recipes-devtools/python/python3-regex_2022.9.13.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2022.8.17.bb
rename to meta-python/recipes-devtools/python/python3-regex_2022.9.13.bb
index 4999fc64f4..886acd7387 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2022.8.17.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2022.9.13.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5c77eab46f3a2b2cd8bbe06467df783543bf7396df431eb4a144cc4b89e9fb3c"
+SRC_URI[sha256sum] = "f07373b6e56a6f3a0df3d75b651a278ca7bd357a796078a26a958ea1ce0588fd"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.25.1


