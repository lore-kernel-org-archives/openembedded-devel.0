Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54BCC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:19:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.2942.1663064373494684311
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mQwpviHh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064371; i=@fujitsu.com;
	bh=u02oMAVWmf++DL1DzMcwkUl5EvHfDcfzs2J57/gk1fY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mQwpviHhxcInYURNAKPdTEXXSgsGhP7l4TJkcfNxP7V9ErfK8xkxGRnKgc9lj/T5P
	 tx3K4W5CSx2CLNZv8erN7eyACpuLdnSB0fhn+S3eVVkEq53x2qjoK63fTvsJp1NFaN
	 tUaJDM4Bu6Yf5oEQLptb1LVohtC0yebUnDO88pXU+R01yTOOmGupqJS6he5Y3QmEnQ
	 c/nelQBzfrmAQ/Or0Vdw2DuYbrmr9EA1GfYU/hGyI74qH6hs5F94zOgDlXCJr333HG
	 V+ZefNKFzp+r/SD+IbnK/lxVwHoeNoXC3TapOYrVXspBvemcm/dSzP/ZTKBQa7ICK+
	 6OOo3DZjAs9Dg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpGsUqZB
  sMP20ucXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFgzVSWgolcFQ+fH2JvYNzP2cXIxSEk8JBR
  4tjWQywQzhUmieUXFzNBOHsYJT60vWDrYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggTmLd3RZGEJtFQFWi8c0HsHpeAUeJFU3zwGwJAQWJKQ/fA/VycHAKOEl86bQHCQsBlX
  yf+ZYFolxQ4uTMJywQ4yUkDr54wQzRqigx+3IzC4RdIdE4/RAThK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaN1UlFmekZJbmJmjq6hgYGuoaGprqWZrqGZXmKVbqJeaqluXn5RSYauoV5iebFeanGx
  XnFlbnJOil5easkmRmAYpxQnCOxg3Lvvl94hRkkOJiVR3kgvhWQhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErzxIUA5waLU9NSKtMwcYEzBpCU4eJREeHmCgdK8xQWJucWZ6RCpU4y6HDO/th1gFm
  LJy89LlRLnnekNVCQAUpRRmgc3AhbflxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80qEAU3
  hycwrgdv0CugIJqAjjKzlQY4oSURISTUw7RA3vtB0zPpnelHkl1jZtr9WRzKv2Vq7T9p9PfiJ
  +B4j36Vr5oUsuL/iv6JN2+9oMeewH1UF85Z3nEisTHA33ZjRKeIgeL4m7Vx8GU/sxXNXhZgeJ
  i1Ym7xpmpfDzGmZYfM3TX5bq7mq9erp49dt6rM/PY7pclrZa24Tsjeg/tRXibAX2fVdBskFWs
  r9z9h/pbldm7D95fXe3QxOyx7KJ995eOe3wiPOV1lfI/Xz2Dua5WYZKK12USxsUrAqKQ1ZGFB
  amXQip7co7gO/V/3dm/U+EZcmXnecVz5xm3rnswsKaq2PmW4kd1Y6TdGTiP1yLqpA8/9hncN7
  lbVany9+F37Ya/uvY5/tLIrFFk5RYinOSDTUYi4qTgQAS3NPgWoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1663064370!308184!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28994 invoked from network); 13 Sep 2022 10:19:30 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:19:30 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 517EF1B3
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:30 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 46C041AC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:30 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:19:28 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.58.0 -> 2.60.0
Date: Tue, 13 Sep 2022 18:19:01 +0800
Message-ID: <1663064344-3276-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064344-3276-1-git-send-email-wangmy@fujitsu.com>
References: <1663064344-3276-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:19:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98777

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.58.0.bb => python3-google-api-python-client_2.60.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.58.0.bb => python3-google-api-python-client_2.60.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.58.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.60.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.58.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.60.0.bb
index e473c7b82f..906bb86e4c 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.58.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.60.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "3af6a181763a8cb18f2b9d973760ba32e4fe2af09e4ce06626ff6a53777c33fa"
+SRC_URI[sha256sum] = "ca770930a1a8fce969ffdc81910844705138e8d05e040ab62d4276a4b1baddea"
 
 inherit pypi setuptools3
 
-- 
2.25.1


