Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339E7C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 06:37:06 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.81196.1657003016281371434
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 23:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=o0+iAaip;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657003014; i=@fujitsu.com;
	bh=oAY9ZdwJjBEute7zwBBWdMyKJMgZniJbvlUdK9Np5xM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=o0+iAaip50BrxleaYd/M6wpyNgbHgvEGoGhlUyUWzs4NVhkxzS9OOq6xT6/TIo8QL
	 GWRYUER/4H/ZfG0zKitWv0x+J2EG4Z0kvI7fwHDWxHKEk1+8f9E4oV/0ccB6ACifGf
	 pkJzAO3lMBsCWBfPMxCRrPA0ErdLtsYnv/gLWIVmpWuRyMYRy/oxpD2UKp2nyM2b6m
	 +bQJHZRhQYg+gfJFcVlqfal+gQxXsNZUe+fKWyLP191KCZqBFix/r+2tQPReVZ0UDW
	 yomczHKbFSB0L189gsy02nOykM9cq5LkMyPmnSokeCUbDQ63h+6mxjadFo2cGqCWFh
	 89ND24HXX+37A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRWlGSWpSXmKPExsViZ8ORpMt253C
  SQcsuPouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNHd0rBX+6K9WdOMzcwvuLqYuTiEBJ4yChx
  +eV/VgjnMpPE8t+t7BDObkaJqW//sXQxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAlsWjzdrAaFpD4u1awOK+Ak8TjcwvB6iUEFCSmPHwPZnMKOEvs29TLBmILAdW8vHGACa
  JeUOLkzCcsEPM1JVq3/2aHsOUlmrfOhpqjKDH7cjMLhF0hMWPGNjYIW03i6rlNzBMYhWYhGTU
  LyahZSEYtYGRexWiZVJSZnlGSm5iZo2toYKBraGiqa6xraKGXWKWbqJdaqlueWlyia6iXWF6s
  l1pcrFdcmZuck6KXl1qyiREY8inFzEI7GNf3/dQ7xCjJwaQkyht39XCSEF9SfkplRmJxRnxRa
  U5q8SFGGQ4OJQle5itAOcGi1PTUirTMHGD8waQlOHiURHhXnAZK8xYXJOYWZ6ZDpE4x6nLM/N
  p2gFmIJS8/L1VKnHf3LaAiAZCijNI8uBGwVHCJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjD
  v3+tAU3gy80rgNr0COoIJ6IgbVQdAjihJREhJNTBlJJ03unrlL4/I+isLwy+mTBBVDDmsdoRt
  FmfwWeHQ+73rjppsZunPPnn5geCm7Tn9Hd13HsrnVzE0P3Zvz2+ezVZ4a2ZmucMRuZ2ZaoyhO
  sEK0Z9DA4/8rjx19BLfs9Wtl5Y/s53DUHlOdsoqwV/t0v8UGgNqa2U0+kP3fza9tGv3Yrsj6Q
  036lsbhB6Fq3jZ9H9Qn7t6Rzd/T1hnz6qnipIH8pQXHy8KqFAryOLxYtGxTVf5lvj40ez7NX6
  80iXGDw9W3SzR0GuxminI3m6T2r37LJMui+3pn56Re/8bbXt6z7raiImFR1zT+f4CNS4pZrm5
  Pny5GwUflOldEf475anp2f8nTjDy5j0qU2Ipzkg01GIuKk4EAAqVez2AAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-591.messagelabs.com!1657003014!205925!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27630 invoked from network); 5 Jul 2022 06:36:54 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Jul 2022 06:36:54 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D542F1AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:36:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C9DA57C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:36:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Jul 2022 07:36:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-text-editor: upgrade 42.1 -> 42.2
Date: Tue, 5 Jul 2022 14:36:22 +0800
Message-ID: <1657002982-14427-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657002982-14427-1-git-send-email-wangmy@fujitsu.com>
References: <1657002982-14427-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 06:37:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97707

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =E2=80=A2 Fix a crash at shutdown after saving state. This didn't cause any data
   loss, but could be annoying.
 =E2=80=A2 Spellcheck underline fixes for various languages
 =E2=80=A2 Various robustness fixes for GTK 4
 =E2=80=A2 Fixes for inconsistent line-endings
 =E2=80=A2 Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-text-editor_42.1.bb =3D> gnome-text-editor_42.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_42.1.bb =3D> gnome-text-editor_42.2.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
index 7efc6867d..1446b151c 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
@@ -19,7 +19,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_check
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
 
-SRC_URI[archive.sha256sum] =3D "a3c8508033bfb63a8b48a062ac1e67b2c333ba0153879b38c661968a103ad15c"
+SRC_URI[archive.sha256sum] =3D "e56d4a8cdcbce8a8f1c0881b45de799f8b25205ec0cbf2269e532025761cc5da"
 
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
-- 
2.25.1


