Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADADC43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 06:51:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.3267.1667371905734464421
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 23:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pI5eABEm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667371904; i=@fujitsu.com;
	bh=3+awjYmHIYobqR+Tt9LCBSzJBt7DCsOnI7aIPcxbmiY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pI5eABEmnQfmgFgUeFVIOZ2n4HqZH4oyKI97raYM5XcSX69SCpyZ9tynnHvl9bGLJ
	 HhTBUugVrYDzWb+OK+mSNn2wH2S6jy1EcTvZNK7zQ9yPPqlzlEMyvFGlEqyt1+lqzP
	 9hy6vrtL0FLttlF8n37x9pzlEjTvAXiJHSBduKwIeX5mcmU+kdSMxNxaVZN4bGBteR
	 4u+voPakoJBRTSkbapUzKjJq5YicY4QWomeZDX3NBRXKO0skcmJnDIHCmbbNf3Ehjh
	 AnIefrbnyWB9NMLepDwyQkQhDJhR+8OcPCP5ENqQARGNEp9mEhUsgYaZsp4nZdZbpD
	 hTN4FQj2vaPBg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSbdeOCn
  Z4N5ObouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPq/Q72gi1cFTPW/WVuYLzK2cXIxSEk8IRR
  4tD8r2xdjJxAznUmiXe/xCESuxkl5i+aywSSYBOQkrhx/z9YkYiAvsTS2XuYQWxmARWJF7972
  LsYOTiEBZwlVhxlBQmzAIX7L3Uwg4R5BZwkTq7OBwlLCChITHn4HqyTE6j6+KYmZoi1ThKb3r
  aBTecVEJQ4OfMJC8R0CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFacWlSWWqRraKqXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yT
  opeXWrKJERi4KcXsxTsYHyz7o3eIUZKDSUmUN5k9KVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  O8nPqCcYFFqempFWmYOMIpg0hIcPEoivJosQGne4oLE3OLMdIjUKUZjjrUNB/Yyc8z82naAWY
  glLz8vVUqcd5oQUKkASGlGaR7cIFh0X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzOvFDzS
  FJzOvBG7fK6BTmIBOYWuPAzmlJBEhJdXApBljf3r1w9SjR5f/3eBzik3s1qyfk8LjGo1ESvSL
  Lq2bHp8puuOVQZxMh8zGmmX1N6Y7L75iaLrlHM//LX/1div2lyxRzNwYmlDDu+qLhTy31IKcA
  xVtUw5tU8n99U5VxXTRI1nuw4q9Kof98j60JupF8FwLKSqZ28Pzem+FKLPgDQujq+6P2T9sSR
  efkr75lYrOzSv7w+RYpCINVr7dcWDGyfmVrIdCxHfE/pI8c37an8uPJ/bn+F1Se5HMZnv32rx
  X6nbmq1J2HfNJbeKIcXwnqrnBaNmOh9s7FW/8PiHH1pxx5Hj+ksx8C8nvJyNeJ5+bfjCoXNWz
  zUG7wqo/asety+JHxDgtL603vcp2TomlOCPRUIu5qDgRAJMJVfNpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1667371902!981664!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21570 invoked from network); 2 Nov 2022 06:51:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Nov 2022 06:51:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C907B1000FB
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Nov 2022 06:51:42 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B21581000D7
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Nov 2022 06:51:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 2 Nov 2022 06:51:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libxpresent: upgrade 1.0.0 -> 1.0.1
Date: Wed, 2 Nov 2022 14:51:23 +0800
Message-ID: <1667371885-20154-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667371885-20154-1-git-send-email-wangmy@fujitsu.com>
References: <1667371885-20154-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 06:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99407

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxpresent_1.0.0.bb => libxpresent_1.0.1.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-lib/{libxpresent_1.0.0.bb => libxpresent_1.0.1.bb} (63%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.0.bb b/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.1.bb
similarity index 63%
rename from meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.0.bb
rename to meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.1.bb
index 4fe9992f20..2a59a80e49 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.0.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.1.bb
@@ -4,8 +4,7 @@ DEPENDS += "xorgproto libxfixes libxrandr"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3c1ce42c334a6f5cccb0277556a053e0"
 
-SRC_URI = "http://xorg.freedesktop.org/archive/individual/lib/libXpresent-${PV}.tar.bz2"
-SRC_URI[md5sum] = "edd87ac15bb666081898dd7382fcbff5"
-SRC_URI[sha256sum] = "c11ae015141a9afbe10f4f2b8ee00b11adca6373dc1b9808d7c6c138b2da7b8a"
+SRC_URI = "http://xorg.freedesktop.org/archive/individual/lib/libXpresent-${PV}.tar.xz"
+SRC_URI[sha256sum] = "b964df9e5a066daa5e08d2dc82692c57ca27d00b8cc257e8e960c9f1cf26231b"
 
 XORG_PN = "libXpresent"
-- 
2.25.1


