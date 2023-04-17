Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265D6C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:41:51 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.49047.1681717309960320735
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=b+TFWhwo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717308; i=@fujitsu.com;
	bh=qCylrOMeHbZMJSp+MF9k+S2WAk39EAQET2GNOI10V0I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=b+TFWhwoR1Vp/4Ie1fFbKduObl+Zo1WNE7rAMbfkSz/2wYGopIjDIDqJ7q7eY0YQZ
	 pdPhwhMo2nkFdIBPeynhiVyw6tFCgn3QoZ7lpf8Fclmv5+I43NRZGxkjt0nXVe9DTo
	 u7dMRCpc91hqF093u8yCN83wc2G7BA3PuCd0M+SlDR6KopDY017ixpxos/piS4Tk4+
	 wNvnjXlyZGa9ATPTjyzlFplDg5B7hD4vn2sy3lG+pcGpbQRllGhC9T1MaNO+5WCjt8
	 2Vk2SB3NVzLDKxN13qsy91CLKkxNdusiBI/l3nP48r8h3FdvQ7YhQNr+qLviqAmCPU
	 PB4xM4oJBBYzg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpGv9wyb
  F4MAPS4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePH3YNMBQ84K141X2VrYGzj7GLk4hASeMgo
  cefGbMYuRk4g5wqTRM+pBIjEXkaJL++us4Mk2ASkJG7c/88GYosI6Essnb2HGcRmFlCRePG7B
  6xGWMBP4siilWA1LAKqEt/OTQWL8wo4Sax8uAysXkJAQWLKw/dgNqeAs8SKhb9ZIRY7SUxa+I
  YRol5Q4uTMJywQ8yUkDr54AdWrKDH7cjMLhF0p0frhF5StJnH13CbmCYyCs5C0z0LSvoCRaRW
  jWXFqUVlqka6huV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5q
  ySZGYPCmFCsf2cG4o++v3iFGSQ4mJVHeF6nWKUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeM9/s
  0kREixKTU+tSMvMAUYSTFqCg0dJhNf4GVCat7ggMbc4Mx0idYpRUUqc1/87UEIAJJFRmgfXBo
  veS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEed+AbOfJzCuBm/4KaDET0GI5JbDFJYkIKak
  GJtHJd92/GX/fUSL7ueXmhe7/Ztc6S9bp3ivY9OYJ/z+T8ocS4iVMLyZval91ufLv3A9zDq6S
  zX51w6T39+Wtf7o29C+3bdM5dK0jteeP2xoGN7F211u8jxatm9Min1fxfU69NsNGF+ZCtVUOj
  VfPfVM3fTl/w6lDTT9q5+VW9t/cP/uHxwP+Bz1rLx7pWaN87/6PmxGhmnwz/n/c0b3q3o2Xl1
  pjVaMN1/xtbXeKnZTtXW1vtVGy7XfzswA1j9blR79Zti9O9zkybeptnfOKrKUbZdaHenadn9G
  R9OOm0u9Pv7U1Q44HC1VfS1Qo3tcrv3PDAtm3zpd0351j/uYSu2B/V/cc7rNLlGQmz+VUPL1J
  iaU4I9FQi7moOBEAIGw8QFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1681717307!434981!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21713 invoked from network); 17 Apr 2023 07:41:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:41:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id A570E1B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:41:47 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 99C287B
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:41:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:41:46 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.22.1 -> 4.22.3
Date: Mon, 17 Apr 2023 15:41:29 +0800
Message-ID: <1681717292-19167-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717292-19167-1-git-send-email-wangmy@fujitsu.com>
References: <1681717292-19167-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102113

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.22.1.bb => python3-protobuf_4.22.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.22.1.bb => python3-protobuf_4.22.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.22.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.22.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.22.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.22.3.bb
index add20c0e4..5b2ff302c 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.22.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "dce7a55d501c31ecf688adb2f6c3f763cf11bc0be815d1946a84d74772ab07a7"
+SRC_URI[sha256sum] = "23452f2fdea754a8251d0fc88c0317735ae47217e0d27bf330a30eec2848811a"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


