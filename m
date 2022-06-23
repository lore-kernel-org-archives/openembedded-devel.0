Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AE7C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:15:16 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.4584.1655968505109009712
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ADOs0OZf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968507; i=@fujitsu.com;
	bh=/bsRXnaKqaAvVIOCMIFs0AX54nYK4HymWCFUvjT0qZw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ADOs0OZfRR1AttrJzfrFMndgwYCx2G8UhqJfmjawyaXk/tk0WEJsqygfkQdVBcoV2
	 7pwfUGXzK2MhDdQ9zzayb63O89gyBGloL5GvosNOotGNG8Ep/aCqN1x0IGZrug6tmR
	 IFJACht4bUiiwV2Py2Q5F622tONmrSGlODy+eMNHiib0xRu6RRSqI59CmKfFxaErnP
	 h4Eo8TQ5ddXzHWRgP3ogN4uNZLfS8NF6UeUY+GmeEb89IgTSgkandhKs5rhfAvvEuV
	 cSY2nxk5n69byB56t0PfLXTkPtiqn54/NpecHEorxxO/aT4PL2nSI8o7PcAgV3+Sus
	 ssqIDAQ72q36g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqPtbaEu
  SwbyvQhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ar3TYF57kqzh46wdTA+JCzi5GLQ0jgCaPE
  hGOnWCGcu0wSs9qWskM4exgl9lx8xtTFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sECIxI6mPrYuRg4OFgFVialrzEDCvAKOEt+6d4O1SggoSEx5+B6slVPASaLl41EmkHIhoJ
  rX79QhygUlTs58wgIxXULi4IsXzBCtihKzLzezQNgVEjNmbGODsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYrRNKspMzyjJTczM0TU0MNA1NDQF0sa6RoZmeolVuol6qaW6eflFJRm6hnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIFhnFKcfmMH4659v/QOMUpyMCmJ8m4V2JIkxJeUn1KZkVicEV9UmpNaf
  IhRhoNDSYL3Ej9QTrAoNT21Ii0zBxhTMGkJDh4lEd45IGne4oLE3OLMdIjUKUZdjplf2w4wC7
  Hk5eelSonzNrABFQmAFGWU5sGNgMX3JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvB9BruT
  JzCuB2/QK6AgmoCOeLN8AckRJIkJKqoEp2r1r2YsLVeFysX+P/QiULmcS4Hp94oWBVef8IMcf
  TUf2758Q0741bXbGkY9a99X/sp3g0q/JCjh9PkBe0FV8kueWjj534amrJIqOrG+rcpY0jMjz/
  yTXqmp35dSSoxfrT4fZ3H/+vnL7geZLe3f2qzYUMjNI7Nc8e/OMX9uz8PS3JWuuyhqf8J932T
  okp5g12eiQbHiyTptBcdkzpsLVOv836DwteV4TJNb0akmD98roZI/5BXved1ixHI/vublf6Lp
  QQ/Xfrbft+bUXeRcI+RyezyLPzKY8qaNT/O72rAszXkbVKT52XLXowO7E+9bmNywv+0zutzyg
  L3BaqNLc1/JvU1LIqkW+S+aeiVBiKc5INNRiLipOBABFWNYjagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-732.messagelabs.com!1655968506!41563!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4345 invoked from network); 23 Jun 2022 07:15:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:15:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A241010019D
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:15:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9F1AF10019B
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:15:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:15:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.3.2 ->
 1.3.3
Date: Thu, 23 Jun 2022 15:14:47 +0800
Message-ID: <1655968487-3652-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655968487-3652-1-git-send-email-wangmy@fujitsu.com>
References: <1655968487-3652-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:15:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97588

Changelog:
=========
  - Fix unclosed socket error (#826)
  - Update header dict access (#818)
  - Add utf8 workaround to docs (fc9ee9f)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...socket-client_1.3.2.bb => python3-websocket-client_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.3.2.bb => python3-websocket-client_1.3.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.3.2.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.3.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.3.3.bb
index 3f09d267d..9c3ff02e9 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.3.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
 
-SRC_URI[sha256sum] = "50b21db0058f7a953d67cc0445be4b948d7fc196ecbeb8083d68d94628e4abf6"
+SRC_URI[sha256sum] = "d58c5f284d6a9bf8379dab423259fe8f85b70d5fa5d2916d5791a84594b122b1"
 
 inherit pypi setuptools3
 
-- 
2.25.1


