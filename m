Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65313C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:36:40 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.29456.1661243799745145431
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U9gjHQCL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661243798; i=@fujitsu.com;
	bh=g4nd0eNi5XyGC1wR5a+j860hzEoIqcZH3eXiLpjfuxA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=U9gjHQCL154LCxSoLkE+fB2EoafVAVk1TAlTwN+Lq2/4fJ4C9C5M9X5qRUMJ/QGZv
	 4NFIqZFgMwvmVeT0sXTR9wrWisxlTS2mvarQd2HeOQvgdaXVaM8AfR5/LVVwfiNr8v
	 xal9LL82YSFDND//xwKhtu8/RTkmMbrg5D0ILDm8jILbmT/ghHV1h7e5bn1YUSaaMO
	 kZlwOz++bGnh6lNmawL7Ba0EDv0mFC/oart46Ot5ILBuuX+sJ3Af9q4n2IZuUfT+v+
	 hiVBv7Ydj54wA8dau+vMT6br6ekh3iYabKBwYGCgyGLfb7uRrU0rGMOT02Zll2Lu/+
	 amgZQ6VW2NREA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSXfqRJZ
  kg3X/1S0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz/y3eyFCzmqdh25xRjA+N5ri5GLg4hgSeM
  EkeWvWGHcG4wSdy7eQXK2csocWLmLNYuRk4ONgE1iem3boDZIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBbwkzpyZztjFyMHBIqAqceeYA0iYV8BRovXXQUYQW0JAQWLKw/dgrZwCThI9FyeygdhCQD
  XPH/xlhqgXlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0rsmdXPBGGrSVw9t4l5AqPgLCTts5C
  0L2BkWsVolVSUmZ5RkpuYmaNraGCga2hoqmuqa2RqqpdYpZuol1qqW55aXKJrqJdYXqyXWlys
  V1yZm5yTopeXWrKJERjEKcWs/3cwdvf91DvEKMnBpCTK61DPkizEl5SfUpmRWJwRX1Sak1p8i
  FGGg0NJgtejHygnWJSanlqRlpkDjCiYtAQHj5IIr/4EoDRvcUFibnFmOkTqFKMux8yvbQeYhV
  jy8vNSpcR59UCKBECKMkrz4EbAovsSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHegyCX8GT
  mlcBtegV0BBPQEUG7mUGOKElESEk1MB0681Gf/TqPXZg6+970J3PMjrrv+x1h1c9/bs7UZ3wX
  zjVG7xG+8ulxePzSDc0zBGfMby67U99zwqdi4c3aA9cVUtXn7ix5wLDE8nG4T3Ltoaerrr99/
  zsp78271bPy29wfLlcJz3592H++tefC5smsijeSi5rUuGLOSPdcTyp5PHfeD2WX2b/LGywOa6
  VmdsoVLPlxcv586fxnSWzrV8hqKa+M2BIr8zM0/1bp5Slmoe5Xf350k/E89P35LBUtid2LuE4
  edli+9liS45PC32Jv05+nR7777Lq5W9RS3GXenGm1T0+9K5usvKt/58bsrwtOvp5sv9v7XuPi
  mUdsxaTav2slikysNZux5BXLmuvTlViKMxINtZiLihMBk+zGSWkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1661243797!387420!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25526 invoked from network); 23 Aug 2022 08:36:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2022 08:36:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 442E11000C0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:36:37 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 38021100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:36:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 23 Aug 2022 09:36:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] grilo-plugins: upgrade 0.3.14 -> 0.3.15
Date: Tue, 23 Aug 2022 16:36:08 +0800
Message-ID: <1661243768-4595-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661243768-4595-1-git-send-email-wangmy@fujitsu.com>
References: <1661243768-4595-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 08:36:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98380

Changelog:
==========
  * !120 Detect libsoup version from grl-net and adds support to libsoup3
  * !123 youtube: port to API v3 by using libgdata 0.17.0
  * !122 tmdb: port to GUri, remove libsoup dependency
  * !122 dleyna: port to GUri, remove libsoup dependency

  * New translations
    * Abkhazian
    * Dutch
    * Galician
    * Georgian

  * Updated translations
    * Abkhazian
    * Basque
    * Bulgarian
    * Danish
    * Hebrew
    * Nepali
    * Occitan

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../grilo/{grilo-plugins_0.3.14.bb => grilo-plugins_0.3.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/grilo/{grilo-plugins_0.3.14.bb => grilo-plugins_0.3.15.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.14.bb b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.15.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.14.bb
rename to meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.15.bb
index d00e737f4a..b96194dec5 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.14.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.15.bb
@@ -17,6 +17,6 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gnome-help vala
 
 SRC_URI += "file://0001-Avoid-running-trackertestutils.patch"
-SRC_URI[archive.sha256sum] = "686844b34ec73b24931ff6cc4f6033f0072947a6db60acdc7fb3eaf157a581c8"
+SRC_URI[archive.sha256sum] = "8518c3d954f93095d955624a044ce16a7345532f811d299dbfa1e114cfebab33"
 
 FILES:${PN} += "${libdir}/grilo-0.3"
-- 
2.25.1


