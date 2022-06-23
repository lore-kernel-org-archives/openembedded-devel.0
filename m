Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD82C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:09:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.4642.1655968177020350717
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LnIBORD3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968175; i=@fujitsu.com;
	bh=kEoFikQojJxiZX3G03zwm+7TsMSEXYWHOBykbYBS9AY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LnIBORD3oL5LkQIxesGlLd3IG5ZM5Ec7qsFXTNShNB7kBaFX2Jn3TqKNhAhaAy1Lb
	 cvwW2fkTwMJF8T89VshzM7+Kqbgc9bAHb9C3DMQsfyHF6TfOCZSG7FdXNAHzWBo2wL
	 957z/dkRiirc/Jao6bJs8EbNSvtmTdHnm2BiPZMlkWuiiBAB4/U85czz+Ajok/SzKo
	 UWC5GllCNMP4nlvOSxL8y1pVI3hJlhmIMMZ3sP27S6E4Wkm48IQQtFem7yGYYEPuvA
	 ak1lRUoL66VjA9X6M4fkUwqllfapN1isO+eFTSoqRr6LFuDnrQXUk0nzDR/3hnOlSr
	 fkf0wpY/ObQ5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORpLtOcEu
  SQeNuE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePsplb2ggkcFQ9aOBoY97B3MXJxCAk8ZJTY
  On05G4Rzi0mi7eNrIIcTyDnAKHHthASIzSagK/Hix2IWEFtEQF9i6ew9zCC2sICHxNE9JxlBb
  BYBVYnFb5exgti8Au4SzR2TwOISAgoSUx6+Z4aIC0qcnPkEbA6zgITEwRcvgOIcQDWKErOny0
  OUV0i8PnyJGcJWk7h6bhPzBEa+WUi6ZyHpXsDItIrRJqkoMz2jJDcxM0fX0MBA19DQVNfSEkh
  Z6iVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjlpZZsYgQGX0pxcvkOxu37fukdYpTk
  YFIS5X3GuyVJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvJX6gnGBRanpqRVpmDjASYNISHDxKI
  rxzQNK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy89LlRLnbWADKhIAKcoozYMbAYvKS4yyUsK8jA
  wMDEI8BalFuZklqPKvGMU5GJWEeX1BVvFk5pXAbXoFdAQT0BFPlm8AOaIkESEl1cC0N6Xih3a
  a0ZMv02b2PX/a8e7yjHf35uUstLgUmfCtrDkqa0HHunoD0/5y1iJF15QN/mcjH897KNUYFvtq
  jevirKWeW7uXMc7pN8pr3B376XJ1fOveZ64XbdXiZy9b/rdbZVn5AqNDk913Bpqcf8pgf1V29
  1+3mKd9E24s8jwSrXhS/K705zvL4xiv/59+f9+RAw/7UmWcO7dZpTdrqat9Kv5zZssNg4TrLa
  vFZ270PHlh4ovPvgvXNyuF9+uxHQxbffXUF9X9FdJX/NSPbHgkmnG/8YXDkhMc+14uy+blM61
  XcDSaYa+44Opl9potG/9d3/Qw7tKHquNCp/LWfdlykWGxtd2PKb13H04qtEg98lOJpTgj0VCL
  uag4EQCSSLUBRQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-732.messagelabs.com!1655968174!41315!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30578 invoked from network); 23 Jun 2022 07:09:34 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:09:34 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4727A1AF
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3B9301AD
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:34 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:09:33 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-nmap: upgrade 1.5.1 -> 1.5.4
Date: Thu, 23 Jun 2022 15:09:21 +0800
Message-ID: <1655968161-2571-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:09:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97578

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-nmap_1.5.1.bb => python3-nmap_1.5.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.5.1.bb => python3-nmap_1.5.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.5.1.bb b/meta-python/recipes-devtools/python/python3-nmap_1.5.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-nmap_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-nmap_1.5.4.bb
index ed0e980c8..828d7089b 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.5.4.bb
@@ -8,7 +8,7 @@ DEPENDS += "${PYTHON_PN}-wheel-native"
 
 PYPI_PACKAGE = "python3-nmap"
 
-SRC_URI[sha256sum] = "0e6667153a84938bdc0e95a64cd86397b4c46724c422873ea8f1d007d248926a"
+SRC_URI[sha256sum] = "cd5b0180d4d8cfe96c33e5e7956fa011379af108e2e8291b84e933b6385856e9"
 
 inherit pypi setuptools3
 
-- 
2.25.1


