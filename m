Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1114C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 15:09:11 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.29889.1652713749563951681
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 08:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UDeSBTu1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652713748; i=@fujitsu.com;
	bh=JlqqTvuswmqOk0CDIcQAX3/b7W046JrVZotLdqZhv4g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UDeSBTu1CfttQfpaQ+6M4iG9c6/vBJy6I6v1m8vGs3B3e+cYEbqh0MaXHeFfCtIqa
	 kQr7yJ9BZKN3f/+xHH7iIGjvXKOuFymUm2qoTUpG5M4jWG75BuWl32ONnmwn33K5+M
	 aN1qHhkiNN9ZnyB23OcxhwIeUYqZjsS9QBIQUmMepTzXNBvkFvLZ87ijKToXaNQ7mA
	 oZZESFLB2BX/tdFU7p35BBfcaP2eOtofGqsX18gsT7NibeClvzYBKBtxbNfWNUhoQx
	 a/QH6v8ECeeDFmHvxpx+93Gbo5xMfnNEFXE55+Wa/yiiRsEkmrzeC96cIYkq7Ix1C0
	 YphPU0NmNyUzA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8ORqCuc2ZR
  kMP+sosXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFgz3bmgru8FU/vLmBpYOzj6WLk4hASeMIo
  0TljFROEc4FJ4vC+x1DOHkaJry9OsHcxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPW
  I2wgL3E9H2f2UBsFqD4wa3PwGp4BZwkZt7tYQGxJQQUJKY8fA8VF5Q4OfMJC8QcCYmDL14wQ9
  QoSsy+3AxVXyExY8Y2NghbTeLquU3MExj5ZyFpn4WkfQEj0ypG66SizPSMktzEzBxdQwMDXUN
  DU11jU11DE0u9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSSTYzAwEwpVp66g/H0
  qp96hxglOZiURHnXJDclCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgbUgDygkWpaanVqRl5gCjB
  CYtwcGjJMJ7PB4ozVtckJhbnJkOkTrFqMtxd+HevcxCLHn5ealS4rwnE4CKBECKMkrz4EbAIv
  YSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFe5QygKTyZeSVwm14BHcEEdISIfiPIESWJCCm
  pBiaBWTEGkWY35t47WvXh8j+eJ5ElE3OZLl39FrUp41xZ6e2ur5U7pp6++H6fTsG1++pNU7V+
  2+Ylp3DnXPp5d82fxfEsFz2TtrTqnt0Wf2JKddWn2/sPqFy7+nF1R0aTwRSfVxLG6q7WB5o1D
  7IHnMq6vaaw9vIzweMy6s3tL1asWxVSsCJ5dvSN9Jcz/ig8Y7gu53f/wAtVzfpNxvuYniaI3t
  V0Wfdxo6W3M699bN1KD0nZJqu76yftuRP6QadB/OcS7pqQ6xN8Nrpwa9gl/o6f3HW3It/ebtm
  6/JcLetti/cVmuc+e2ZMePuPRDCbVwpmFum8PLpgoLvDVb1Ks1Okrcf35qj25K3vvzL7vtPqH
  EktxRqKhFnNRcSIAyEAje1MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1652713747!85431!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9098 invoked from network); 16 May 2022 15:09:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 May 2022 15:09:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2FD25100187
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:09:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2326410004E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:09:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 16 May 2022 16:08:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gtk4: upgrade 4.6.3 -> 4.6.4
Date: Fri, 6 May 2022 22:51:00 +0800
Message-ID: <1651848662-13051-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 15:09:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97132

Overview of Changes in 4.6.4, 13-05-2022
========================================

* GtkFileChooser:
 - Fix select button sensitivity in select_folder mode
 - Fix some fallout from list model porting

* GtkListView, GtkColumnView:
 - Optimize scrolling

* print-to-file:
 - Handle nonexisting files better in the dialog

* Avoid infinite loops in size allocation

* CSS:
 - Optimize a case of reparenting that is important in GtkListView

* GSK:
 - Check for half-float support before using it

* Wayland:
 - Ignore empty preedit updates This fixes a problem with
   textview scrolling
 - Freeze popups when hidden. This addresses a frame rate drop

* Translation updates
 Hebrew
 Nepali


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gtk4/{gtk4_4.6.3.bb => gtk4_4.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtk4/{gtk4_4.6.3.bb => gtk4_4.6.4.bb} (98%)

diff --git a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.3.bb b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.4.bb
similarity index 98%
rename from meta-gnome/recipes-gnome/gtk4/gtk4_4.6.3.bb
rename to meta-gnome/recipes-gnome/gtk4/gtk4_4.6.4.bb
index a0a60fd45..9f4737168 100644
--- a/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.3.bb
+++ b/meta-gnome/recipes-gnome/gtk4/gtk4_4.6.4.bb
@@ -33,7 +33,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a57acd0e4482981700fdf86596c7413cb61ef47f75e4747fda809e8231b8d96c"
+SRC_URI[sha256sum] = "a79a2bbcc7931b703fc4fa1fcbe1b906e229a1522d854d522801766a79bcac9f"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.25.1


