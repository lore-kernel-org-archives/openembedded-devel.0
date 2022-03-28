Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD76C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 12:26:44 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.10157.1648470402534250155
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 05:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PdeuqonQ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648470400; i=@fujitsu.com;
	bh=014Zb9JNzbrBG3Iw9lYJSQr6vEFI/ZTXBfY5IoOOZ5k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PdeuqonQChrs8BxpTTOabUR8mhwizZCrKIJq8yba4F0bCN2y1SkxqcdHKzNGxLL2P
	 JFg5e/YyEhUYOqBsj07fpSZ6VCEq9nvRGZjXMW2ypr1iDW2kdIRozBDMsXzRR881yr
	 4yUcfcDdVNT1ZiF8IZzp66Ta7B0OxlKGVFjKxEqbgyQa6IgQ39wYDXDjVD5JKyC2N4
	 riOQoTDBnCW+OhrBFjcEVvgYzjOCfKn3xzyFPZCZXrUOsz6OHHHB213ddV4+Wl6rJU
	 kgu3NbBFzcD7IOJZT4QKkVJeTYmRsZTCAn7Ig/Blqay7bt2wv0vyMuNW9PfkYDZlSw
	 HLj+WUGlMvXWQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8MxSbdhpWO
  SweSXIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a9BXeZCt5zVHzp3sLewDiHo4uRi0NI4Amj
  xNPFzxkhnAtMElufHINy9jBKvH18hrWLkZODTUBNYvqtG2C2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhAT+Jq9/fsoHYLAKqEucW/GUCsXkFnCQuzL0LFpcQUJCY8vA9M0RcUOLkzCcsEHMkJA6+eM
  EMUaMoMftyMwuEXSExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjXVJRZnpGSW5iZo6uoYG
  BrqGhqa45kDKw0Eus0k3USy3VTU7NKylKBErrJZYX66UWF+sVV+Ym56To5aWWbGIEhmdKsVvO
  DsaPfT/1DjFKcjApifJenOuYJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC13MpUE6wKDU9tSItM
  wcYKzBpCQ4eJRHegNlAad7igsTc4sx0iNQpRkUpcd76FUAJAZBERmkeXBssPi8xykoJ8zIyMD
  AI8RSkFuVmlqDKv2IU52BUEub9uBxoCk9mXgnc9FdAi5mAFq99ZwuyuCQRISXVwFQU6FO3xXO
  37fX8l5Ymc7itD+uz2GQ4tu46stPYJnrfsvXOF6IOn3s1w15dMv2P2gILVasQHuUJx2s2BJ/U
  S4pWYDz+pyC642Hdn+V2Fk1ct358/CrtGhp+btKlabMc836ZNDcxb7dKUzxSlyk0Vcdi6i8WO
  0vJ2bbnmo1rdjhFFb55ZnnuYLlEbucti6d32RVYRFxy3VIftfs+FM7e/OaAT+zc4kcm1XV1d3
  bG+McyXctmjPOqWGUv77L3O4uWtOeFHfKe24KbAhgfMqjE7Hn8ZLuK65Hy75MWTFb1uz8zmSX
  qXLtsZMkLY8+n85iTa54eVZnwp8x5rcIjzXZRj6XZVQEMzSflZn1exHtGiaU4I9FQi7moOBEA
  Tqb880oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-532.messagelabs.com!1648470400!48796!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5820 invoked from network); 28 Mar 2022 12:26:40 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 12:26:40 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D814410033B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 13:26:39 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CA6AD1000FF
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 13:26:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 13:26:28 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-autobahn: upgrade 22.2.2 -> 22.3.2
Date: Mon, 28 Mar 2022 20:26:16 +0800
Message-ID: <1648470376-16602-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 12:26:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96236

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-autobahn_22.2.2.bb => python3-autobahn_22.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_22.2.2.bb => python3-autobahn_22.3.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_22.2.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_22.2.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb
index c63770564c..78514a412f 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_22.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "60e1f4c602aacd052ffe3d46ae40b6b75f8286b3c46922c213b523162e58c17e"
+SRC_URI[sha256sum] = "58a887c7a196bb08d8b6624cb3695f493a9e5c9f00fd350d8d6f829b47ff9036"
 
 inherit pypi setuptools3
 
-- 
2.25.1


