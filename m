Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4A7C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:08:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.66342.1680516532157172111
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F3elKpdp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516532; i=@fujitsu.com;
	bh=Id9Eoiv3lv3NIspH8Yl6ORtgnKZZwxT9TbUg/usScJs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=F3elKpdpelmt+t1V9olsIfX6+qXC60MUDz0z1SX43Bt4faXk5ylHvBaYz+BD4r1wU
	 fCNBuuamqY6ZfebKSVBjeAqlDbRKHRZ+yrYYPcsBwXXEv/HalftZnN2V1Q/LmdcRTG
	 HS2fG4h8sL7FuCurwOLgaxmsBL+AjH++G2TUgSRP5/K3oqvvujwVuGLeT7oBVBld86
	 A/mZBaM9RJCQPyQcyjpx5LMa8WTgNcQ84huEBhTwSOjcDVNYjTK2KVwV3mh+gcplfx
	 QXUerJvXWTNRBPqyU6/Ecdd6suIsIgDZg9hrUbjw9yzBDJQxR/g2EyIiWRWPOzg2pi
	 fGtkK8GKUGQAg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqLtlqVa
  KwfMnEhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ajR33MBRt4K3beecvcwPiVu4uRk0NI4Amj
  xN3ZCl2MXED2dSaJcy+/sUAkdjNK7N1kAWKzCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAr8fTAXjCbBSh+6H0XI4jNK+Ak8eTLUlYQW0JAQWLKw/dgvZwCzhJt/a2MELucJFpWnW
  OBqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSDROP8QEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhenFpUllqka2iil1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOi
  l5dasokRGLwpxYnHdzC+6vurd4hRkoNJSZRXsF4rRYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  7xFQDnBotT01Iq0zBxgJMGkJTh4lER4FRcApXmLCxJzizPTIVKnGBWlxHnjlgAlBEASGaV5cG
  2w6L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhXbDHQFJ7MvBK46a+AFjMBLW6N0gBZXJK
  IkJJqYNozYcktjvTtxou7l283+zqppirjtuPpE0vEVnfqX38lE7H/kHEDb7Tqf1n2cCfp6y6O
  p0JV7rhMaGBdYJ0sc0+pi6Hsf3iI6EduA7MuyRBbmVtmEnMvX47e+/bEym2hVxrvn3xSKtZ2c
  NdmpZ08q764/bvtFrbn5JfVPj/FhIP2q8hIZqhd7Co4HPvZKqliLbOJTLv02Zf8Qqos147+69
  7HEuol7uNb4CtcNz+Z0fX5H17ZqvNC8k4mJx9tqI1pWe7yvizANOZt1dYL36pP8DTpTwr31hD
  7l2QqusMh1VlNI2/2QVddYYEP9yWctn96275ww4N5p9xYFbILzxecrD3MvjI/ZbdAF6fcE/2j
  SizFGYmGWsxFxYkAjUFt2FkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1680516532!1029718!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13417 invoked from network); 3 Apr 2023 10:08:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:08:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CB6001001A8
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:08:51 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BF21F10019A
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:08:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:08:50 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-typeguard: upgrade 3.0.1 -> 3.0.2
Date: Mon, 3 Apr 2023 18:08:09 +0800
Message-ID: <1680516490-31075-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516490-31075-1-git-send-email-wangmy@fujitsu.com>
References: <1680516490-31075-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101932

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    Improved warnings by ensuring that they target user code and not Typeguard internal code
    Fixed warn_on_error() not showing where the type violation actually occurred
    Fixed local assignment to *args or **kwargs being type checked incorrectly
    Fixed TypeError on check_type(..., None)
    Fixed unpacking assignment not working with a starred variable (x, *y = ...) in the target tuple
    Fixed variable multi-assignment (a = b = c = ...) being type checked incorrectly

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_3.0.1.bb => python3-typeguard_3.0.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_3.0.1.bb => python3-typeguard_3.0.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_3.0.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_3.0.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-typeguard_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_3.0.2.bb
index 932b6f0c6..1661e7123 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_3.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "beb0e67c5dc76eea4a6d00a6606d444d899589908362960769d0c4a1d32bca70"
+SRC_URI[sha256sum] = "fee5297fdb28f8e9efcb8142b5ee219e02375509cd77ea9d270b5af826358d5a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


