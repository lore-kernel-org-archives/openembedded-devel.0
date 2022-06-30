Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2A1CCA47F
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 02:14:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.19892.1656555263180640946
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 19:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AkRI4vmw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656555261; i=@fujitsu.com;
	bh=gB7EbcPvKHUf2t+SDchHk9lS5c38vv2JsWwQ6c/1tz0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AkRI4vmwD9umPA3tV0tHSv3RVutmYDC+y/q/mnceG9Nk/dWrMyl+yJzoeQHNejanS
	 8z/MXf91GeenaoJvSo2212Gwa5VqWdFT/ylzt66stpEsaFBtRfkagi4LziypZxe/8L
	 luhuQHzX40Y1sz0SoUKp/g+3DDBO40TjOZ6pwJ7B+OWHSpPbnnN0uGEwyghkZBPChO
	 977QPfzLN28ugz+iTGaF6Lfg4cZR9dTvPYqKaY23caZ+7I2gwpEPmELyc/QMSA75cw
	 r0/g8s4vK1OMH0t5dGKKkoAp6O/QIYVpJEpu+gVD6Vda751kGs0Y+kLAqmr8pzNN5M
	 NEnnGe+kJ0Lnw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWfcP294
  kg9YV4hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b/fx1MBQ3cFW2XzrA0MDZwdTFycQgJPGSU
  +Pd+FROEc5lJYkpTKyOEc5JRYtmOH0AOJwebgLrE45uvwWwRAX2JpbP3MIPYzAKqEt0X17CD2
  MICvhK/Fx1lAbFZgOKfF75i62Lk4OAVcJdY2AnWKiGgIDHl4XtmkDCngIfEm2MqIGEhoIpZvy
  +DdfIKCEqcnPmEBWK6hMTBFy+YIVqVJE6s+MgEYVdIvD58CSquJnH13CbmCYyCs5C0z0LSvoC
  RaRWjTVJRZnpGSW5iZo6uoYGBrqGhqa6lma6RoYFeYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYBinFCdc2sG4bt8vvUOMkhxMSqK8T6ftSRLiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwbueYW+SkGBRanpqRVpmDjCmYNISHDxKIrw3vgO18hYXJOYWZ6ZDpE4x6nLM/Np2gF
  mIJS8/L1VKnHclC9AMAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiXAZg
  shHgy80rgNr0COoIJ6Iid08COKElESEk1MAVXsj83Y4lrDXx9b3us25e51tyiob9vpWkevqi9
  vjVHXqBVOV/69PSfGdtXfJL5eiwt4ZL5aWWbvx9Ezt3f0D2H//jGYNVfE27Um+1am+/UoHW4R
  ej/Wl4Z1phncUtOTBB2mm1TH+BsamLnUGMr93ZZ+DbewsWO3AzOHyVv/fpySEP7w/+bv5d6VV
  /xlEhobCqZe4l50dd/r5KVP2kzKrqt+J8ewGDBn66/WilxQZaz+64fs6f+dWaW2jkjyePtzh5
  Oro6HVQvratOyiwWmGz54v21RaJF4r9b9zXyT9ryb1BXys6wx7uvlHTwvm81e/DYqSNa2VN97
  YdFj2+PLF5xbLZ4rKe724WSXQGOPkBJLcUaioRZzUXEiACgURulqAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1656555260!455073!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11364 invoked from network); 30 Jun 2022 02:14:20 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 02:14:20 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C6988142
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:14:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BA0AA75
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:14:19 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 03:14:17 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.11.5 -> 2.11.6
Date: Thu, 30 Jun 2022 10:14:01 +0800
Message-ID: <1656555244-20637-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656555244-20637-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1656555244-20637-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 02:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97624

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
The Qt brain now correctly treats calling .disconnect() (with no
arguments) on a slot as valid.

The argparse brain no longer incorrectly adds "Namespace" to the locals
of functions that return an argparse.Namespace object.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-astroid_2.11.5.bb => python3-astroid_2.11.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.11.5.bb => python3-astroid_2.11.6.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.11.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.11.6.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.11.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.11.6.bb
index f11a4a13d..4f9d1af93 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.11.5.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.11.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "f4e4ec5294c4b07ac38bab9ca5ddd3914d4bf46f9006eb5c0ae755755061044e"
+SRC_URI[sha256sum] = "4f933d0bf5e408b03a6feb5d23793740c27e07340605f236496cd6ce552043d6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


