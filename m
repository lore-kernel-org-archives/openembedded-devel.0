Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B330C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:13:28 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.65387.1679548404053007412
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=zHAdIWpW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548402; i=@fujitsu.com;
	bh=cQNlPDeshT0DMlLxaIr/6bbcBqI9kxV6RamcNwuPcbM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=zHAdIWpWokMn02qYP1fNNY5ont14/iWvdd7M87kIb8yZu30tg3lt8brdlt38zhyyX
	 ZwEWY+Gu3gCeS3aMEY9/wgOXgphDpEliwoHun0TcPtT4gclOWerAfWrcQpOf27/XwR
	 6dtqxZXjBVM7xfVD6RnBA0W+H++fMvT9PmTJf6Y9piA1Zz1zFv8IWi0I/+5/Orf8t/
	 +HiM0LT6T0kGvvIYRMO1DcFU4OQX84IFawz6YXAgHTTxlJQan/RN2ylAO2X6RKafnq
	 E8KhmLOid12IgiOBmPip6GKmmesXWbOEkZladhUo5091GqxfabNkVdxCGfnO0OMksg
	 r5Ljw+l65E3nw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpPvxvnS
  Kwf5pQhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bLNuWC3zwVH3qXsTcwXuHuYuTiEBJ4yCgx
  +8Z0dgjnCpPEuj2tQA4nkLOHUWLCE3UQm01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e8Dqh
  QUCJD50XmMBsVkEVCVa7t5mBLF5BZwkbq3/BWZLCChITHn4HqyXU8BZ4sqTiywQu5wknm+fxg
  JRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QaJx+iAnCVpO4em4T8wRGwVlI2mchaV/AyLS
  K0aw4tagstUjX0FAvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8v
  tWQTIzB0U4qZqnYwvuj7q3eIUZKDSUmUVyJUOkWILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK/AH
  aCcYFFqempFWmYOMI5g0hIcPEoivHMPAqV5iwsSc4sz0yFSpxh1Oa5eubKXWYglLz8vVUqcd/
  k9oCIBkKKM0jy4EbCYvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFcHZApPZl4J3KZXQEc
  wAR0RN0MC5IiSRISUVAPTTpU5xfv2C52unRj6LL183Zwzx+86J7jEdC6+onxUJ3mF89JbL24y
  reH5wqwqsfRwSasSQ93Ba00L69OvCDxunfeD3yzs2crIxuhJUj3O1oxv1tqHucYZv0qUbfBni
  no/sWyC7RkTpr038lyOZz+SqXp2OERnR+mdyYv/FNTf2NsQ2nXiQGE/y7R/BpXudw4d6jp7gX
  eLeg9LosGKvimT/ih7vQu55WrylivzTHTTO3kNj6n3OetianqSn2rKpcgdk3DeKXrVe86Cv4n
  OZ0SnJWVaxN8ubiyY8CCQg49RI0nL56+K57VFspXiJhMO2J8N1tfsTU84PKnizruJRVsllZzC
  EyaUPW7g2Phgmo4SS3FGoqEWc1FxIgA8/dQPZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1679548401!171791!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19792 invoked from network); 23 Mar 2023 05:13:21 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:13:21 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DDF331B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:20 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D2EE41B0
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:13:19 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.169 -> 2.4.169.2
Date: Thu, 23 Mar 2023 13:12:52 +0800
Message-ID: <1679548374-20397-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548374-20397-1-git-send-email-wangmy@fujitsu.com>
References: <1679548374-20397-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101654

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Changes
--------
- Bump version.
- Include event reports by default in feed.
- Bump deps.
- Add greynoise-ip object.

Fix
----
- Use proper parameter to trigger the request in search_galaxy_clusters.
- Use POST in search galaxy cluster.

Other
------
- Rename include_event_reports kwarg to with_event_reports, in-line with
  other kwarg naming.
- Add kwarg to allow the inclusion of event reports into to_feed(),
  honour with_distribution and valid_distributions kwargs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.169.bb => python3-pymisp_2.4.169.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.169.bb => python3-pymisp_2.4.169.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.169.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.169.2.bb
index a82b26851..fd78306cf 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "be755277b85cd6b06a1c2d6bb793f47ac891cc66"
+SRCREV = "9e2712bb1da00c7bd3559f978c6316ca0287d453"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


