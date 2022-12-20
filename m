Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFDFC4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:20:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.48688.1671538839184906572
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BXOisWtq;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538837; i=@fujitsu.com;
	bh=D+LxBrtClZErNrinwVVadSCTXF3IVU6ngJKLCCNSyI4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BXOisWtqQCspQi+11ZfFif7K9otpEZV74tnxY3sEqtUFjEUkEh6yjjAauEnO6mdoL
	 xgB/5fpjqZiFrAhUBqU6/IE3G0Dmkuwaj6/i9oVZ5BtGs9uKYgnoggZzD1CBpEpl2D
	 eGnn/WsS+04aWN7mKDJhXY2pWlLXe6hP4LH7fWCOQuf1N2Rv6v0cYVIEQvUGqn8Tet
	 kxzAjo1oPu3UAhv4yczc2z9d5fZv1QujBMacL8uREQYHkI3WOswQioQvxLOS83+0ez
	 yng1qlVNRNCV56vOxytSQJ3eO//BkinuSvRxUluJRiUdeiSTpg3rhFMPouvNRDnzlv
	 cmuBT+v1/PJwg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8ORqDt1xcJ
  kg55eQYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePS1XOMBf9FK450rmJvYFwt3MXIxSEk8IRR
  4vCZFewQznUmiXuv37NCOHsYJfbcW8zWxcjJwSYgJXHj/n8wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sIC3xOLNT1hAbBYBVYl7hy6B2bwCjhIdRx+B9UoIKEhMefgerJdTwEli3721QL0cQMscJR
  5vcoIoF5Q4ORNiDLOAhMTBFy+YIVoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1iNCtOLSpLLdI1NNJLKspMzyjJTczM0Uus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J
  0ctLLdnECAzelGKl5h2Mf5f90TvEKMnBpCTKGxa+MFmILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  O+MRUA5waLU9NSKtMwcYCTBpCU4eJREeHtmA6V5iwsSc4sz0yFSpxgtOabO/refmWM5mJz5te
  0AsxBLXn5eqpQ4L9NyoAYBkIaM0jy4cbBov8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNc
  IZApPZl4J3NZXQAcxAR106NJckINKEhFSUg1MO56svlrwc9/WubE13RcYOfnW2k3tNuexfJWm
  e79OiMvlDF/gMv6WJzcf7y2dVC2VFmx9yWXPgQPVt1uWb1b8WVEwp+P1TIVDUxtqzPmnSOZFP
  5715XZ86pPD1z03t75assKncuIO00Kj+d88rKV5Dm6+lGZk/nGRYKyZ4dQDf9eySZxcL/vqWQ
  7HWXUdrgzOXR9uPAtnMxc/nXqxduZU+z9Lr0ZevrjMVFlJM/DevAv1slKb+zT33o0rWLk+zDn
  35s6l3Q5FLBcCLh9s53BJz7oe6hBlv9xzv+PG7PwixcX3Pih4Z03o/NpVUvv4YFD/gug9Dgt2
  Llc28Puwff2LN1YOS3eGfFDvOv41y8FDTYmlOCPRUIu5qDgRAKxuEiJxAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1671538837!115891!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7049 invoked from network); 20 Dec 2022 12:20:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:20:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F2A6510019E
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E66EE100191
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:20:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-isort: upgrade 5.10.1 -> 5.11.3
Date: Tue, 20 Dec 2022 20:19:47 +0800
Message-ID: <1671538789-7206-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538789-7206-1-git-send-email-wangmy@fujitsu.com>
References: <1671538789-7206-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100142

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Fixed #2007: settings for py3.11 (#2040)
 Fixed #2038: packaging pypoetry (#2042)
 Docs: renable portray (#2043)
 Ci: add minimum GitHub token permissions for workflows (#1969)
 Ci: general CI improvements (#2041)
 Ci: add release workflow (#2026)
 Hotfix #2034: isort --version is not accurate on 5.11.x releases (#2034)
 Hotfix #2031: only call colorama.init if colorama is available (#2032)
 Added official support for Python 3.11 (#1996, #2008, #2011)
 Dropped support for Python 3.6 (#2019)
 Fixed problematic tests (#2021, #2022)
 Fixed #1960: Rich compatibility (#1961)
 Fixed #1945, #1986: Python 4.0 upper bound dependency resolving issues
 Fixed Pyodide CDN URL (#1991)
 Docs: clarify description of use_parentheses (#1941)
 Fixed #1976: black compatibility for .pyi files
 Implemented #1683: magic trailing comma option (#1876)
 Add missing space in unrecoverable exception message (#1933)
 Fixed #1895: skip-gitignore: use allow list, not deny list
 Fixed #1917: infinite loop for unmatched parenthesis (#1919)
 Docs: shared profiles (#1896)
 Fixed build-backend values in the example plugins (#1892)
 Remove reference to jamescurtin/isort-action (#1885)
 Split long cython import lines (#1931)
 Update plone profile: copy of black, plus three settings. (#1926)
 Fixed #1815, #1862: Add a command-line flag to sort all re-exports (#1863)
 Fixed #1854: lines_before_imports appending lines after comments (#1861)
 Remove redundant multi_line_output = 3 from "Compatibility with black" (#1858)
 Add tox config example (#1856)
 Docs: add examples for frozenset and tuple settings (#1822)
 Docs: add multiple config documentation (#1850)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-isort_5.10.1.bb => python3-isort_5.11.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.10.1.bb => python3-isort_5.11.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb b/meta-python/recipes-devtools/python/python3-isort_5.11.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.11.3.bb
index 27977821c..4b99c1755 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.11.3.bb
@@ -4,7 +4,7
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "e8443a5e7a020e9d7f97f1d7d9cd17c88bcb3bc7e218bf9cf5095fe550be2951"
+SRC_URI[sha256sum] = "a8ca25fbfad0f7d5d8447a4314837298d9f6b23aed8618584c894574f626b64b"
 
 inherit pypi python_poetry_core
 
-- 
2.25.1


