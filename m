Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44349C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:12:31 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.85576.1677485543751534403
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A/aOeAjU;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485542; i=@fujitsu.com;
	bh=bdxEE9cEL7+J7aGYkjryennyD9lHE2akU92sZcrJYvc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=A/aOeAjU70AHcQyDkW1Ckv/q6uYYlVZh57F3OHjslivZ5b6IbNMgzAJuXFRrjRwTn
	 mURgZvOprNIDPe60cS+JNPpFUQ24UN6U+DR5VPdNKGc+yjzYqazkoZEwuCIFjaOVdJ
	 87tTfPIeumGmkQLRzn/1hlkbsGceUoiCPWPQ1TUUvkBZAwgZ2W3ZNhFEOQA+AohSPx
	 mmNsJNcPHdaSI0dKE2VbeZAL4/BdMD5BEyIquhMM1LQT4127kvkxdVqQtJA1yNn+Ea
	 ckbJAvdlKZ9aUOg0RN0WiSPvB8X7a5tr1z/BE9mQNpCzlG3cM71YQX9/ESUO+/+3Wm
	 Nhs8N6xer4swA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpPs09U+
  yweu1yhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bfTy2sBVN5K+Y+2cXWwPieu4uRi0NI4CGj
  xIM/G5ghnCtMEls+3GOEcPYySjQ+Ws3axcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAoMTnJduZuhg5OFgEVCUeTHQACfMKOElMe3iLBcSWEFCQmPLwPTNICaeAs8Sm94wgYS
  GgkrvtG1khygUlTs58wgIxXULi4IsXzBCtihKzLzdDjamUaP3wC8pWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRtDi1qCy1SNdUL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwcFOKWcx2MLb3/dU7xCjJwaQkyrvI6U+yEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  Qneg0lAOcGi1PTUirTMHGAUwaQlOHiURHiZjYDSvMUFibnFmekQqVOMilLivHyJQAkBkERGaR
  5cGyxyLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5o1KAJrCk5lXAjf9FdBiJqDF2x/+AFl
  ckoiQkmpgkruySPLhLq6kzSzGJ1MefeRQnlgyy4OTaV/krRxe61vBd16YnV5RZtxVOtkz5vmD
  kJty16490nSN/iWs81zV6WRxvZa332a2j1JqkS4ts3h+bXq0Irgy7Mnihz6KL/0eZEzsLr2gu
  bakz66G68W3S8mS6jdbjlR5uRoW72BsdVixWXiy7ffYbQo775zQKwhTEHnisEa3WOf/pA+Gj5
  3Ya/qfcqceXxvX/dJrlaCF0M/2pHkBF/daPj2zK+9ir4FJ5YS/Mx55iF7OvrC5VuBBt1uJrPX
  eKJM5LLd3OR07ve2TpFb/ictTT+25u+OS+e205dsir0z33aS6PeXalG9fF3cr80+da9p5evXn
  mct04pVYijMSDbWYi4oTAQ6FuR5XAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1677485541!214349!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13451 invoked from network); 27 Feb 2023 08:12:21 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:12:21 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3089F1AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:21 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 24E627B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:12:19 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-soupsieve: upgrade 2.3.2.post1 -> 2.4
Date: Mon, 27 Feb 2023 16:12:03 +0800
Message-ID: <1677485523-11699-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485523-11699-1-git-send-email-wangmy@fujitsu.com>
References: <1677485523-11699-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101287

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  NEW: Update to support changes related to :lang() in the official CSS spec. :lang("") should match unspecified
  languages, e.g. lang="", but not lang=und.
  NEW: Only :is() and :where() should allow forgiving selector lists according to latest CSS (as far as Soup
  Sieve supports "forgiving" which is limited to empty selectors).
  NEW: Formally drop Python 3.6.
  NEW: Formally declare support for Python 3.11.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-soupsieve_2.3.2.post1.bb => python3-soupsieve_2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.3.2.post1.bb => python3-soupsieve_2.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.2.post1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.3.2.post1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.4.bb
index 99b6f7c04..ba5fe505d 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.2.post1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c7a2acf04248c0d02dac4c82ee8a7f56"
 
-SRC_URI[sha256sum] = "fc53893b3da2c33de295667a0e19f078c14bf86544af307354de5fcf12a3f30d"
+SRC_URI[sha256sum] = "e28dba9ca6c7c00173e34e4ba57448f0688bb681b7c5e8bf4971daafc093d69a"
 
 inherit pypi python_hatchling python_setuptools_build_meta ptest
 
-- 
2.34.1


