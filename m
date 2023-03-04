Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3238C6FA8E
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:07:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.6882.1677928017924415041
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pOS2U/um;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928016; i=@fujitsu.com;
	bh=aL/ugLlZhHUdl0gvBCb55LghinVeANEdJRWyLhe+P8I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pOS2U/umzB0UYELvP/qFROcu/UssbbjG5XZG2s2oXnS6457wTnO83ROGHZrkTQzII
	 Lc2XmRwKecOsgXJgvEIwgNUo+9RyTguQI3adN0SoCMJd5xVKiVX4WZc+q3SUWe4Dhd
	 rdg00EK8NQcKnuDNPpx9wRs8TRsZ/7Yy0f86NL+xLMG4oJl3NXlFjUEjmS/NvogMYT
	 KfFCyFyPnwLlNMCd5x+rjwx39Lg3xiVhmA3Yayu/AL4UG+loWVIFz5JcFJVQTJOKqU
	 XRuPEc8ZtNAfOM6R3h7eYbQdud1yocotDjflRJ6FiEcJeXTORGlVFUDnfELpeJIgln
	 1JuODwW2S21PA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWddfjTn
  FYPY2DYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePOzl3MBRO5Kw4vOsHawLidq4uRi0NI4CGj
  xMsTX5kgnCtMEhNW/2GDcPYwSvTPXc3axcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAnMTG81vB4ixA8dePzoDFeQWcJO6f28YCYksIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25Gaq+UqL1wy8oW03i6rlNzBMY+WchaZ+FpH0BI9MqRtPi1KKy1CJdY72kosz0jJL
  cxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwGBMKVYT3sH4pfev3iFG
  SQ4mJVHeSawMKUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeGVUmVOEBItS01Mr0jJzgJEBk5bg4
  FES4d0iApTmLS5IzC3OTIdInWJUlBLnFVAGSgiAJDJK8+DaYNF4iVFWSpiXkYGBQYinILUoN7
  MEVf4VozgHo5Iw7xYVoCk8mXklcNNfAS1mAlqscZoBZHFJIkJKqoFJ8vkCo9tZjFbTS/Ur/9U
  /Of3oQvCchmqOBpZz2dn741v+nps1rZhTyr/0783nXiE2+zIeLnW3vSAm1lDZqCrAbRg/Z0fo
  oRXfls25+uPHQxmns3WM68s2xFy5d+ri/Ou37vF/mnR2HZ/gPruc1zrTpGJSd7zkdfrSeTQqO
  vPCOulMHua6EstPa5L19P3KH11fsGvNjZrHXz13Jp74eYzpV4neqQkHLd/ULNxU+8HP5GiamB
  LPoZmvVvVFb344MZpt9QnPnaeFgwLFGD9P0DD8bdpo78f6olrQOkOnQOTsmtu/f/LcDSvrbnP
  6WuDecGj66Tzm6TM2/OA7U+HOlzfl9Zze+R9m79Y5GtS96oboHSWW4oxEQy3mouJEAIammE1B
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1677928015!148987!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27025 invoked from network); 4 Mar 2023 11:06:55 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:06:55 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5F442142
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:06:55 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4722373
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:06:55 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:06:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.79.0 -> 2.80.0
Date: Sat, 4 Mar 2023 19:06:41 +0800
Message-ID: <1677928005-22986-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101366

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.79.0.bb => python3-google-api-python-client_2.80.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.79.0.bb => python3-google-api-python-client_2.80.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.79.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.80.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.79.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.80.0.bb
index 5c9ade091..75f9cf143 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.79.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.80.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "577c0aeae1eb3c754eacb9122d369d67609fef759bc6a4fa16cafeab4f30019b"
+SRC_URI[sha256sum] = "51dd62d467da7ad3df63c3f0e6fca84266ce50c2218691204b2e8cd651a0719a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


