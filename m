Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D6CC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:37:00 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.1193.1667810212011968196
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QgkYBNFD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810210; i=@fujitsu.com;
	bh=N4+lMNqLwQbqZ6DBn3le0sR90HLw2E1ILGRMkPtN8pI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QgkYBNFDkGehQCMwFTnu8F/LcmtI8LtWvQZqBYqyE6uugVnYSt1xpu8pIr2d27BMB
	 RazYJl1IV4BnkWj74oCtQdlt67IUrMtuY2o5ru3q3YyWXoFYh+GPnMgqCO66InXqbe
	 Y+Q/fAB5C6Jbes+nj2895LtE7zqofaOvgn1+/JGBkAGb4RS7D/I5orHG7hjGpHpZEr
	 EDY5LtnI9Lzbp4bdi8kEeQ32l5L8pPonXC+TALarLO/kPcSXtn+k6u3KbGM/uVE2Oc
	 vWpWWvxR1Ik0pvUPxM4jAo/adIFZmfI1G0Wo18PvkxwLAw2sW5JSKlFocNatB15Z7a
	 Fyec3FbrF53+A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8OxWXfh4Yx
  kgwsHrS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozrO4+xFrTxVCze2c7cwPieq4uRi0NI4CGj
  xJav65ggnCtMEq/ufmKBcHYzSix9cpSti5GTg01ASuLG/f9gtoiAvsTS2XuYQWxmARWJF7972
  EFsYQFvibYd3UwgNgtQfN7JDhYQm1fASeLkqydgvRICChJTHr4H6+UUcJY4t3UPWFwIqObm8+
  nsEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdA1N9JKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECwzelmG3VDsZfy/7oHWKU5GBSEuX9vTwjWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  42NQDnBotT01Iq0zBxgLMGkJTh4lER42YHxJMRbXJCYW5yZDpE6xWjJMXX2v/3MHMvB5MyvbQ
  eYhVjy8vNSpcR5r+0GahAAacgozYMbB4v3S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeSM
  PAU3hycwrgdv6CuggJqCDqgvSQA4qSURISTUwlRezCBjzaYq/sbo07VqyehzXjBcOr1dNFXm+
  q/7M/tAp/z7eqUrO7jMWzD0sHd6Z3/aJTTnt8I4WLt17Rq9vXL9zq2Za+LPddx0ffvvQJqAXL
  TvrU9ERcU7x+GUf7z5ibbrkc3SNxlbtkyfsb6p/uM2fEiJWLWOWVrCBIWirxTkWDR3p0AtV0k
  b97mZZhkIS9lq2R9WWlBexyGzXu6Pyxuyan89WG0/hF6v/tBfnnzwR+HYRw+ubzrzreZRyNht
  J3rtnsq0+4O6MtRO2ch2Xi/0xh6vh4NT/uY8db34XPFGz7jzbFZXosv5Q9wfmH+UfGEapSclZ
  Si15+L/kRAn/x8dOBVxKAetczi67r+yoxFKckWioxVxUnAgATxwPXXIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1667810209!320929!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12280 invoked from network); 7 Nov 2022 08:36:49 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:36:49 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 921D1153
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:36:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8FCA8151
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:36:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:36:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-jsonref: upgrade 0.3.0 -> 1.0.1
Date: Mon, 7 Nov 2022 16:36:19 +0800
Message-ID: <1667810179-31041-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667810179-31041-1-git-send-email-wangmy@fujitsu.com>
References: <1667810179-31041-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99466

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
replace_refs is now a function rather than a class method of JsonRef
        New options were also added to replace_refs
jsonloader is now a plan function rather than an instance of a class.
Fix issue with proxies=False where it would not recurse through references to remove the proxies. #48

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-jsonref_0.3.0.bb => python3-jsonref_1.0.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python-jsonref/{python3-jsonref_0.3.0.bb => python3-jsonref_1.0.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb
rename to meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb
index 4daaf521f..5b842a462 100644
--- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.3.0.bb
+++ b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gazpachoking/jsonref"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
 
-SRC_URI[sha256sum] = "68b330c6815dc0d490dbb3d65ccda265ddde9f7856fd2f3322f971d456ea7549"
+SRC_URI[sha256sum] = "51d3e18b83ca7170ff51286a0e1a6719d8b7fcc7abdb16b189395a8536996b97"
 
 inherit pypi setuptools3
 
-- 
2.25.1


