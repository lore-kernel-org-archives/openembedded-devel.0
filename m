Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1EAC433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:10:02 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web10.6906.1634807401347631362
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 02:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WsWAIKv2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634807399; i=@fujitsu.com;
	bh=7Pyi1EklwrLuAVCqDCdmxI/SOobXN6AmJYcaLqcYGAg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WsWAIKv2RsGaqa5LBB6i8HLCoFJfFiY01rc1VuXsiKikpekE53gJ90uCnoL7JalIO
	 JxgXRageHDobXjPQ0HOtl9lGzmyg1NvV4oX/Oo2el00oLgD2KaBmm76Z+t243f1WFU
	 GbVxrQeiLY/jVYpogzZK4GvrL7ArbUeZoZEkS1gsAWLOsorj+bfFhEcrTchGQempUJ
	 hqYgFrvZCrOBUFbwu4w+Jqg6hNbXmaBTuD9ZYeQsWRpdhY31BWXindsith9eK/m21Y
	 oCq9xI87k1IfQsv6Nzb+FmQOLrJYASAkp6Zz6l+EruTn/rJYgiKg/w0/azGf66Jr1f
	 2WadHmI8YY1pw==
Received: from [100.113.1.182] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id FA/30-11692-76E21716;
 Thu, 21 Oct 2021 09:09:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8ORqOupV5h
  ocDbQ4uLhpcwOjB7nNq5gDGCMYs3MS8qvSGDN6Nt1mq3gP0fFrWmbWBsYV3N0MXJxCAk8YZT4
  srGRDcK5wCTx48Q9JgjnBKPExeeLWLoYOTnYBHQkOl50g9kiAvoSS2fvYQaxhQU8JebPvwYWZ
  xFQlXi36hpYnFfATWLn9aesILaEgILElIfvoeKCEidnPgGrZxaQkDj44gUzRI2ixPadZ1gg7A
  qJ14cvQcXVJK6e28Q8gZFvFpL2WUjaFzAyrWK0TCrKTM8oyU3MzNE1NDDQNTQ01jXSNTI000u
  s0k3USy3VTU7NKylKBMrqJZYX6xVX5ibnpOjlpZZsYgSGXkoh040djN9ef9A7xCjJwaQkyqvz
  qyBRiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvTvXCRCHBotT01Iq0zBxgHMCkJTh4lER4/ZWB0
  rzFBYm5xZnpEKlTjIpS4rzv5IESAiCJjNI8uDZY7F1ilJUS5mVkYGAQ4ilILcrNLEGVf8Uozs
  GoJMzbpQs0hSczrwRu+iugxUxAiwssCkAWlyQipKQamM5PvfZZq1m2V/W7gaiu2mTWoA/Mxzu
  0Y/a5PJz5Vey0heHsH/6zz9YWJh1xyGc+WB4695zAsy8fK8vPRu2WrTXOrhM7tXmaSULnpGgx
  pQi5WZdezlOt4XOXsPxnOn/34XMRdub2lj9eqz1s/+w88+ks906DnH/z11ee4TQIsddO/blRc
  eeVROaAf85r/y2MPXhL0Wm6pxFP3K2T7j3J6i8227n6Ttq6yuOuM9t3l69RD2yb0mX4uef8f2
  W7WqJneYT7XjWBpL2fLNvDb58/mNRc/G7XdamyM38YTrVtO2Zc/uvDr6uWZVK1gme+ZcQYste
  tvHhsK6uw3Qmd/2WfQ3xD/G8yWp8/zZzvL9bDqMRSnJFoqMVcVJwIAAKCk804AwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-232.messagelabs.com!1634807360!226148!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31954 invoked from network); 21 Oct 2021 09:09:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Oct 2021 09:09:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 90F95100241
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:09:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8187F10023B
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:09:19 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Thu, 21 Oct 2021 10:08:55 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cbor2: upgrade 5.4.1 -> 5.4.2
Date: Fri, 22 Oct 2021 05:08:49 +0800
Message-ID: <1634850529-4486-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Oct 2021 09:10:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93512

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-cbor2_5.4.1.bb => python3-cbor2_5.4.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.4.1.bb => python3-cbor2_5.4.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.4.1.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
index 9f0242de4..d3f6cd8c1 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
@@ -4,7 +4,7 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "a8bf432f6cb595f50aeb8fed2a4aa3b3f7caa7f135fb57e4378eaa39242feac9"
+SRC_URI[sha256sum] = "e283e70b55a049ff364cc5e648fde587e4d9b0e87e4b2664c69e639135e6b3b8"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


