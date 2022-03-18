Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9EFC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 01:32:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.4656.1647567125715988131
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 18:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tDcjAAHG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647567123; i=@fujitsu.com;
	bh=R8Rodznouan0pWftg7B7KD2JZ63uy88+KWIUbbVjauY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tDcjAAHGmg52TpPK7+VLGwNWgbX5G34QpfbKJaP+zjhkcx/DlIqRwDom9aI6s2X7P
	 730yYl9saErxtYpSA8WeXZdkc+KW50X0eFylrl2eP03o+IA5RjCsedmWTDjp4NEymP
	 EaE4qAYzTWjKMg6V8gPmcYzYGM4CuGou4QjHsHeU1E9lgttd7qiL2vf6sSrHUuZCiz
	 129DrUFr/CujV2gYLMJbCALMXnzA4ATW8Gp4emjxpmiW4ITEoy+7cxfSPrt8Uf7/Yp
	 O1Yl1f29k0wWPLi+596uZR8YELqxgJrHwKEIv+PxmMifWQkiNwz/EfOEj/m1bpwERU
	 LkK40LZIEfnwg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqCv00Dj
  JYOkDQ4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePibJeCu7wVf//eZ2tgnMDTxcjFISTwhFHi
  QeNEJgjnApPE1uanbBDOSUaJz/8+AjmcHGwC6hKPb75mBLFFBPQlls7ewwxiMwuoSnRfXMMOY
  gsLREisnDgXrIYFKH7p4XKgOAcHr4C7xOEJNiBhCQEFiSkP34O1cgp4SKy7f4EFxBYCKtk0fR
  eYzSsgKHFy5hMWiPESEgdfvGCG6FWSOLHiIxOEXSHx+vAlqLiaxNVzm5gnMArOQtI+C0n7Aka
  mVYzWSUWZ6RkluYmZObqGBga6hoamusaWukYGBnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIFBnFKsfmIH49OVP/UOMUpyMCmJ8ubdN04S4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMG7FSQnWJSanlqRlpkDjCiYtAQHj5II761rQGne4oLE3OLMdIjUKUZFKXHe39eBEgIgiY
  zSPLg2WBRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMq3MPaApPZl4J3PRXQIuZgBY3Chi
  BLC5JREhJNTBxnbhvabD64PZX0nbN9eoa/2yOLNH1mWWmrDlvqt6MY4zRJmLrGaWeL9bU6eRq
  FRHhODHj1pONH1ICu3U8Wne8sJT1m5R93tw401g7cFn+lI1l/fXGp/ifZ7AH8ExYkVx3N3TKP
  xazADcvxq23+P8LvbS3mbGRQaGJU7jJZ23N5Fa2PaLrFuSc5TtofuAop26MrUxXfaUwq/j9lY
  2rN1soMO0qb98QW7Yp6GpDwo26BxfWeHwOkorTdW5Z/YztQGxj3PWYn1vcFrc81D8ja7Rcvnp
  1Q9TD6bO0F+8OLjS//uiApVabQcs6oUM752f+kjpXMSvxzJsDllufhl+N8GyxeV9oGecXFnyn
  bELiWyWW4oxEQy3mouJEAPdnMYRdAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-571.messagelabs.com!1647567122!8199!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18250 invoked from network); 18 Mar 2022 01:32:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Mar 2022 01:32:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 69DED1001B7
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 01:32:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4ED591001B3
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 01:32:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 18 Mar 2022 01:31:44 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/2] [oe] [meta-python] [PATCH] python3-pycurl: upgrade 7.44.1
 -> 7.45.1
Date: Fri, 18 Mar 2022 09:32:13 +0800
Message-ID: <1647567133-25668-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647567133-25668-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1647567133-25668-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Mar 2022 01:32:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96053

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Update:
year updated to 2022

changelog:
===============================================================================
-Add CURLOPT_MAXLIFETIME_CONN
-Easy handle duplication support
-Support for unsetting a number of multi options
-pycurl classes can now be subclassed
-Multi callbacks' thread state management fixed
-Add CURL_LOCK_DATA_PSL
-Add support for SecureTransport SSL backend (MacOS)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pycurl_7.44.1.bb => python3-pycurl_7.45.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.44.1.bb => python3-pycurl_7.45.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb
index c9b3b71873..407c264845 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb
@@ -9,10 +9,10 @@ HOMEPAGE = "http://pycurl.io/"
 
 LICENSE = "LGPL-2.0-only | MIT"
 LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
-                    file://COPYING-MIT;md5=75f131c591546fd1277ca49c9a81ab1b \
+                    file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "5bcef4d988b74b99653602101e17d8401338d596b9234d263c728a0c3df003e8"
+SRC_URI[sha256sum] = "a863ad18ff478f5545924057887cdae422e1b2746e41674615f687498ea5b88a"
 
 DEPENDS = "curl"
 
-- 
2.25.1


