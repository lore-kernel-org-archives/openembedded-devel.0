Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0F4C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:01:41 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.49311.1681718493032634756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e7gYFXFu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718491; i=@fujitsu.com;
	bh=INDxEEM1fknOzI5DfgprUGGrmlqr3NZhLbaPZTcb4SM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=e7gYFXFuqNjZUkci6b3Xbb9qhuNcSxzHEv8hHeDIZCAOiUPuAo2wDrxUbH8APLWdu
	 MyR5TmpnrVjGNKM7Vt98IfD6wNrIhMvEu8ckWKmjwxCsQGAB8xpvu+hSTLa6JkmnPI
	 GXKe3yYDhUssOTP67qxp8UTcF16AQN+RxURW9bYIlHseRliqmQ0bc+48qcd6kpuDLe
	 wWP2E2dHall+HvcTqLWjos9QyxwYunr8E1A7C91epQky0u6kdb3CsgoB49iMq/cJMY
	 gTFdPXeJYyt0vHn6iRogWrKA6ugKnK1+GvVHTEwTc0wboslXuDOk89CJYnfBfuIcPJ
	 8+EltrakBAdaA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqHvrj02
  Kwd7LJhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bCj1PZCl5zVJy8/Z2xgfEPexcjF4eQwBNG
  iTPtHSwQzg0miRmbZwFlOIGcvYwSf9oEQGw2ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O4Bq
  xcWcJB4+a2PtYuRg4NFQFXixoRMkDCvgJPE7Z73rCC2hICCxJSH75lBSjgFnCUmzQ+D2OQkcf
  H6PHaIckGJkzOfsEBMl5A4+OIFM0SrosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMZsWpRWWpRbrmeklFmekZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgYGbUpzKuYNxZd9fvUOMkhxMSqK8L1KtU4T4kvJTKjMSizPii0pzUosPMcpwcChJ8
  L78aZMiJFiUmp5akZaZA4wimLQEB4+SCK/xM6A0b3FBYm5xZjpE6hSjopQ4Lysw9oQEQBIZpX
  lwbbDIvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcfyHaezLwSuOmvgBYzAS2WUwJbXJK
  IkJJqYEq7wL6jRXlqa/5O/pnbV8S72M23kbBbcihtqs/es+a5d/xVP7rrMVz2jjkxwT3gmtSH
  mQp3rBvXf0+pPOrBIXb3ofDU7wbh3Gf/9HaVvXNvX2Xgv4sr+dmUD7tqVU/laP1uUMq+FLeFp
  3j54ReLp5hXiXQb5oZwTIw8nvC48aiXp3RR6U6t9a4aJkcSfnhxiJza5PfTu2lT6+P4JM51Ov
  1BcyXPb569IVZRZ02PGq9oVMwjp3aNiEt+6WZRrJHSfAK9erWfsgt0qmOluK1T/nqp7j+ouWu
  9de2eK8Xb3S9UsW2svlSW5/tof8xs5dq0Tw+kPxSphq+sfLLt5PlaQbkFEtvKX69grpF5fkFc
  iaU4I9FQi7moOBEAVC3Zy1cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-728.messagelabs.com!1681718490!219557!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25757 invoked from network); 17 Apr 2023 08:01:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:01:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 39F131001A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 09:01:30 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2C739100194
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 09:01:30 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:01:27 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tcsh: upgrade 6.24.07 -> 6.24.10
Date: Mon, 17 Apr 2023 16:01:04 +0800
Message-ID: <1681718464-19357-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681718464-19357-1-git-send-email-wangmy@fujitsu.com>
References: <1681718464-19357-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102127

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
   - Avoid non-default settings in system-wide init files.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-shells/tcsh/{tcsh_6.24.07.bb => tcsh_6.24.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/tcsh/{tcsh_6.24.07.bb => tcsh_6.24.10.bb} (94%)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.24.07.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.24.10.bb
similarity index 94%
rename from meta-oe/recipes-shells/tcsh/tcsh_6.24.07.bb
rename to meta-oe/recipes-shells/tcsh/tcsh_6.24.10.bb
index f136c06b7..abeb6e803 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.24.07.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.24.10.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
 "
-SRC_URI[sha256sum] = "74e4e9805cbd9413ed34b4ffa1d72fc8d0ef81a5b79476854091416ce9336995"
+SRC_URI[sha256sum] = "13475c0fbeb74139d33ed793bf00ffbbb2ac2dc9fb1d44467a410760aba36664"
 
 EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}'"
 inherit autotools
-- 
2.34.1


