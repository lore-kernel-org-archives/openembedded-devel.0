Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBCBC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 00:22:04 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.32479.1656634917450096617
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 17:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EgALYfMd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656634915; i=@fujitsu.com;
	bh=FGYfsyJmMl9hMLgsU3Hm1uQtBrwWRK/SZ5U4MkMxkTE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EgALYfMdyh1Lk2ISFoS/svx5iLBhHmIUx05d++tjR3ItzbGJ7F52qn0DYcKGmiy0k
	 xr9NLtxM9BXKLWGYM8krC3TuBGnebWrHt04JxMEUcLj+bwyxDTTDTHP7imyWbCuxpH
	 0Cjzk/pR4a5jqBvkAArku8x85Qom1J2bwlswA+gOKMjfUu8Yqj+J/F3R41BmkgwsJS
	 inKk+YqMniAo+dLWGdMNuN2wTO1+uwvMJChkfyg3ehgr0XtIm+GmrAffKRhKTHfSpY
	 Z3tfYznM1yOmnKRZlQjhsJNrE2UQEM5X6JLUr1/YsbeShQ3X3pwtr9L3tfs4SIO+7k
	 tTsdxnfFCzoLA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqKtkty/
  JYGGPtsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHl6B/2go0cFduO3mdtYHzI3sXIySEk8IRR
  om1NURcjF5B9nUlixeoVzBDObkaJBc+7mUCq2ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7B
  2ySsICXxOpXu8DiLEDxi/M3gPXyCjhJPDw0AaxXQkBBYsrD92A1nALOEh/+NDFDXOEkMa99Cg
  tEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtCYsaMbWwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjFZJRZnpGSW5iZk5uoYGBrqGhqa6hrpGhuZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBQZxSzHhzB2Nr30+9Q4ySHExKoryR5/YmCfEl5adUZiQWZ8QXleakFh9ilOHgU
  JLgFbXZlyQkWJSanlqRlpkDjCiYtAQHj5IIbxlImre4IDG3ODMdInWKUZdj5te2A8xCLHn5ea
  lS4rxRIEUCIEUZpXlwI2DRfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8eyBSezLwSuE2
  vgI5gAjpi57Q9IEeUJCKkpBqYMrzufz7E9Gzigtf6Vif2582aKlAuJy7TMU9Jt0B63u/XTu/F
  73CwTmngmKR/6kbpbK304PCXf5fN5JdMEL7Zxmvp/WKX2SsD3bv+X67ub5iz1qgqo0jPSulzQ
  9WW7z1uK/KL+KcznmzWY0qeHj/tnIProarbp/RdOSw/p09v47in/su8NuXulPAz34+bn559Rn
  tjtlEe+7297/blf1FiO1gbxx+8yWRD74aATXcYEgQr9taVR6Q5Tbtg/CBONU7xSYjayuUcvI8
  nXLh17GmZZa9U9J4r7DejLmfejZ/nKn50aVfQqnz/kMS7ycJRLiyMJgo+zKKldc/iZkzfeceo
  8qL1+aaojPZ9y3bzcmUosRRnJBpqMRcVJwIA7S8bKWkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-585.messagelabs.com!1656634914!16193!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7009 invoked from network); 1 Jul 2022 00:21:54 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 00:21:54 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 575DF100190
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Jul 2022 01:21:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4B9E010018D
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Jul 2022 01:21:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 01:21:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ifaddr: upgrade 0.1.7 -> 0.2.0
Date: Fri, 1 Jul 2022 08:21:24 +0800
Message-ID: <1656634887-17192-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656634887-17192-1-git-send-email-wangmy@fujitsu.com>
References: <1656634887-17192-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 00:22:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97646

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ifaddr_0.1.7.bb => python3-ifaddr_0.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ifaddr_0.1.7.bb => python3-ifaddr_0.2.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb b/meta-python/recipes-devtools/python/python3-ifaddr_0.2.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
rename to meta-python/recipes-devtools/python/python3-ifaddr_0.2.0.bb
index b73063eaa..6c97c374e 100644
--- a/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-ifaddr_0.2.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8debe8d42320ec0ff24665319b625a5e"
 
-SRC_URI[sha256sum] = "1f9e8a6ca6f16db5a37d3356f07b6e52344f6f9f7e806d618537731669eb1a94"
+SRC_URI[sha256sum] = "cc0cbfcaabf765d44595825fb96a99bb12c79716b73b44330ea38ee2b0c4aed4"
 
 inherit pypi setuptools3
 
-- 
2.25.1


