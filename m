Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C1BC6FD18
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:24:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.42830.1682306696195690118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v5gTYtvL;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306694; i=@fujitsu.com;
	bh=GuZ6u1VbP6AEHYm46LAtCApXh2Ee7GCy1abg9nc263o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=v5gTYtvL/avbW1RZGE/n5Sh8LmuxtVsf4IYoKQTE5unqh/jz0dpf7XJ5/cjzBU9bU
	 9zdWAZ+pzFi5qUX6HCaQYHuCsFim/CUeg269X8JGHYBVAwh5bH9HVaGYl838S+Kdk2
	 enrOTb9xbP09RnKg2/OoIPYKpmelOE40tZY6G5R/yH2KdIia/jjxkS9Fo4c5RGDIjN
	 EY4ZlLAM0k9rT9DSYL1E3Gm8k5BMGLh7lJZe1L4jXs5H+jip3ypvtkdIM3Z+tYhgjA
	 bhK5QtQ1RYBqS/YCfdNili8E7C4dftDNcedWA/CqlSI735N2ls/gltm7MjK6dd4BF8
	 aNG+YiwVzCNtw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqNv6zTX
  FYOItfouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePBrG1sBRO5K/73H2VrYNzO1cXIxSEk8IRR
  YvmTi2wQzg0miYYLn1kgnL2MEo3t65m7GDk52ASkJG7c/88GYosI6Essnb0HLM4soCLx4ncPe
  xcjB4ewQJzE56e6IGEWAVWJxoYZTCA2r4CTxLzHZ8BsCQEFiSkP3zNDxAUlTs58wgIxRkLi4I
  sXzBA1ihKzLzezQNiVEq0ffkHZahJXz21insDIPwtJ+ywk7QsYmVYxmhWnFpWlFuma6iUVZaZ
  nlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZjSnHy1B2MT3f+
  1TvEKMnBpCTKu2SDS4oQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6iT64pQoJFqempFWmZOcDIg
  ElLcPAoifAu+wKU5i0uSMwtzkyHSJ1iVJQS55X4CpQQAElklObBtcGi8RKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYV7JD0BTeDLzSuCmvwJazAS0eBe3C8jikkSElFQDky6r1Jk/p/5Mdb4
  dMyXml9nnjrkRDIG5HHFmS1fs5va/HP873/vG0cS+9uiH+zVnsa5eX34huCKObd369NQzJ1j8
  YnhNWaKbVz7N5xCRjGUIZkorSjhYnfihQGa2v+itYyEX6tr2yN68oK2/YM+J7iUr36k2m3Doe
  s2WU3g1ffmUpD2buCoDft2SeGzxY+1x7ZINZ40+n8v7M2WlQPqK88mNt1fnfYou9r9kc1/9+4
  OlEtPXHe4yLBL/u3rLx8TNattmOnF58+g9vL4xd6owI2P2afn2uAueN9lvnKkQ2bfC9fX2Q0E
  H16pOmG/rl/sm5IelhdCMjzuTRaWNZazKowysmmKTdhzvruK57WS+VomlOCPRUIu5qDgRAJYZ
  WAxBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-728.messagelabs.com!1682306692!286888!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17706 invoked from network); 24 Apr 2023 03:24:53 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:24:53 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B8AFE1001A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:24:52 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9EEDB1001A1
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:24:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:24:51 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.85.0 -> 2.86.0
Date: Mon, 24 Apr 2023 11:24:32 +0800
Message-ID: <1682306676-11881-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102164

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.85.0.bb => python3-google-api-python-client_2.86.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.85.0.bb => python3-google-api-python-client_2.86.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.85.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.86.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.85.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.86.0.bb
index 6acac0647..119ed0fd2 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.85.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.86.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "07b21ef21a542dd69cd7c09817a6079b2769cc2a791981402e8f0fcdb2d47f90"
+SRC_URI[sha256sum] = "3ca4e93821f4e9ac29b91ab0d9df168b42c8ad0fb8bff65b8c2ccb2d462b0464"
 
 inherit pypi setuptools3
 
-- 
2.34.1


