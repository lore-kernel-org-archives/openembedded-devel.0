Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98150C433FE
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:36:35 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.2683.1653615389857667054
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pExoXIVL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615388; i=@fujitsu.com;
	bh=LSG1dvPSBlCJ2olCYdR76kl3w8rB9KCyIvvCtnrXJk0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pExoXIVL+0d6iy5eYVFjxkQy/i7pZPzUieEMVien77ApeuKeBqVhXt3n0QMHrH8qb
	 eQCyQRLl8889zJv7HFWsnVMQaU11S1IBb1MY3+1Cu2znM47NhXC8nIwmijrfKF40a6
	 SVnymRDsvMJnGRgRNGxzxJh94J74dHJYeuV/RJt4x1x98uUEaXXmNrz9Ir5RIvcbKa
	 7HFxV7l4MLKguH/jTzHxZGfSIKzkkQpKC3EsKKoWPf9bfVWuERWNN3XX9xhP2ILNdj
	 3cNZlYBEt7c9XhSA4l0qFPtW/d0BjSlAUY+yErU3F7twX0Ja4QKGSN1wjpVQAhx1KP
	 MMIgYkQMf8stg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqCutPSH
  J4HO/rMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtG6PqPgIlfFtJ+zmBoYb3J2MXJxCAk8YZTY
  9n4DM4RzgUni+L1mNghnD6NEc9MioAwnB5uAmsT0WzdYQWwRAX2JpbP3gMWZBVQkXvzuYQexh
  QX8JfYdusYIYrMIqEqsXngMzOYVcJL4NesqmC0hoCAx5eF7sF5OAWeJ5Vs3g8WFgGpe3VvIAl
  EvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpCYMWMbG4StJnH13CbmCYyCs5C0z0LSvoCRaRW
  jVVJRZnpGSW5iZo6uoYGBrqGhqS6QNDLWS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknR
  y0st2cQIDOKUYobqHYz/e3/qHWKU5GBSEuXNvNefJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC9
  47ahCQhwaLU9NSKtMwcYETBpCU4eJREeJVkgNK8xQWJucWZ6RCpU4yKUuK8VzSBEgIgiYzSPL
  g2WBRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+xRkCk9mXgnc9FdAi5mAFufz9oIsLkl
  ESEk1MLEHvN3TeCPSMEY9mPHv6Qd6qb/Yz1s8VPSf1Lvs2Om1h1/s9bxifPdxlM1nVYbfLvns
  vZ/a54S91pi/nT0pJmLLnQsVxxd/3reDe2tY2c4kXZettfqyB6/Fq7cmrPixplBSdT+L2u8sf
  S1Na5WJm1Ny1udGyBgwurIuLJu8dKp+iu0t6bjq5EmLPx9fwcS6Q7GI/y5/2vHC/bKBfcfiHn
  R+MuUST/tifab6AAdHeCCv4KKFN8621dTxhPF2ubjH83lNsn15Ofj6tcUM76KNuuYEC5ZuUpX
  puTf50Vmpy4qXLvPcneK7/30L99YvSbMFL6/z2bpJRfxm+uupS4WZf8Wu4Hz4lSdk+4zrvQ+t
  jyqxFGckGmoxFxUnAgD7Ma6HXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1653615387!20694!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27189 invoked from network); 27 May 2022 01:36:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:36:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F22A310018E
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C7C25100192
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:36:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 1.10.0 ->
 1.11.0
Date: Fri, 27 May 2022 09:35:44 +0800
Message-ID: <1653615344-24799-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653615344-24799-1-git-send-email-wangmy@fujitsu.com>
References: <1653615344-24799-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:36:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97295

Changelog:
=========
    Add localization for XSD parsing and validation related error messages
    Add full Italian translation
    Add Russian partial translation (from PR #293)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xmlschema_1.10.0.bb => python3-xmlschema_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.10.0.bb => python3-xmlschema_1.11.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.10.0.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.11.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.11.0.bb
index 84050dc32..759cf029c 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "be1eedce6a4b911fd3a7f4060d0811951820a13410e61f0454b30e9f4e7cf197"
+SRC_URI[sha256sum] = "319f5e3e77beb6ab3b4166f699d9dafd59141487bd1a07675fd01af6483211a4"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


