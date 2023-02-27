Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3993EC7EE2D
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:04:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.85439.1677485056731135296
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:04:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qhLG/j6B;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485055; i=@fujitsu.com;
	bh=kONZzRSaW7snZTEAOOj03QZo2WDTr0oj6yGcY9lJ5Uk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qhLG/j6BjOS03hDhvhj8tcWC79D6Dwh4NRdV5BunG36h4079Z5P1oOoZwUaUUkhCU
	 SLZnGqSV19/wZx929EKWCzheRgquoP5rZs2Zx6EAff5BfIASWMs9sx49l6A2rrHEg0
	 57GwOcoBMbUSNFxBnE9uEQqtYhXoI76EJp0oSCYCDg0DQfxD5XEaZbBl/Eahc4g/E3
	 jrg1NTUhPoaQCUWdFy/+yqwGK8M6nR/+rNN4YczdWN0YJPX9aKEsBjWI4CKVHQQhtg
	 4IuIreH0jaaXUBYaZ8OaDgJrKWcixh1V088ZecIaEmgBybPAZ4NGNQPPmSpLXsGBPj
	 uBg0m0o5e0D8A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqPsv+U+
  ywfFvshYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8buH8tZCyZzV6yedYKxgXEtVxcjF4eQwBNG
  icMdr9ghnBtMElNPf2CBcPYyShxZ8IS5i5GTg01ASuLG/f9sILaIgL7E0tl7wOLMAioSL373s
  IPYwgIhEvdvLGEFsVkEVCU2HL8LVs8r4CSx79kBsLiEgILElIfvwXo5BZwlLl6aA9YrBFTz/O
  UVqHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2pUTrh19QtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjKbFqUVlqUW6RnpJRZnpGSW5iZk5eolVuol6qaW65anFJUCZxPJivdTiYr3iytzknBS9vNSS
  TYzA4E0pVu3fwbi296/eIUZJDiYlUd5FTn+ShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwHkwCy
  gkWpaanVqRl5gAjCSYtwcGjJMLLbASU5i0uSMwtzkyHSJ1iVJQS5+VLBEoIgCQySvPg2mDRe4
  lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG9UAtAUnsy8Erjpr4AWMwEt3v7wB8jikkSElFQ
  D03Lzx8/1FfqCNa8+E2M7Iu/WMN/j5CphiWe6VsrlHJ3Nf9OCxPxk4/3esjzrjkoNYUhUzs5K
  S12j3DDLQqLGlk84Xuna1ejtKlde/fnuffnb/xWdLOfn8f75XpMhsCIqJPHmhhO3/+l9E5TIL
  tw+v+yhj9v11xXaVb2FMas73+ueuM55ZL/nBsN9vvfyni9QiP9zfHVu2EeZa/Ps/7SzcE0xam
  DwLypV83RONp7ecNr2vcv6mqwLe+7aNJn+2fLu3VctqUw/JseT12UO7k6a6rLtFE/+NymhT75
  Zh7/OSJ4054i43H7WmzsYu1ynLllTvlpBsXsW/zvjjIddOQd6H5+uqjbTnb4rZnUeV6++Ektx
  RqKhFnNRcSIAnMU7Y1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-565.messagelabs.com!1677485054!410825!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8973 invoked from network); 27 Feb 2023 08:04:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:04:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1A58A100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:04:14 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id EA4AC100043
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:04:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:04:12 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-antlr4-runtime: upgrade 4.11.1 -> 4.12.0
Date: Mon, 27 Feb 2023 16:03:40 +0800
Message-ID: <1677485021-11417-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485021-11417-1-git-send-email-wangmy@fujitsu.com>
References: <1677485021-11417-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101266

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/antlr/antlr4/releases/tag/4.12.0

License-Update: version updated to 4.12.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...lr4-runtime_4.11.1.bb => python3-antlr4-runtime_4.12.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-antlr4-runtime_4.11.1.bb => python3-antlr4-runtime_4.12.0.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.11.1.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.12.0.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-antlr4-runtime_4.11.1.bb
rename to meta-python/recipes-devtools/python/python3-antlr4-runtime_4.12.0.bb
index 535dc022d..1c8c70977 100644
--- a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.12.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "ANTLR runtime for Python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a0a1d20e667cf7ab7c59357cf8b4812"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ab3c64dc056e158882a9a6b35a2f4a6e"
 
-SRC_URI[sha256sum] = "a53de701312f9bdacc5258a6872cd6c62b90d3a90ae25e494026f76267333b60"
+SRC_URI[sha256sum] = "0a8b82f55032734f43ed6b60b8a48c25754721a75cd714eb1fe9ce6ed418b361"
 
 PYPI_PACKAGE = "antlr4-python3-runtime"
 
-- 
2.34.1


