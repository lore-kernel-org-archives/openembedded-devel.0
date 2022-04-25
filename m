Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D12CC3A5A1
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.26829.1650871805677791798
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SMjEoISN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650871803; i=@fujitsu.com;
	bh=y156V/OkD/h8dwDlHtB6C0IAL4cRSjXsh1e4UXn1XHk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SMjEoISN5lvHsYorjDODqx1c0BNtej1Rdwqik2OUqC4JMRxJaM+xggsZl/zD58MlU
	 dRanNfEcZJUpEVhuAw0Qr5Di2ykDKv4wcSgzGhuHVu8HOz+DS5xF9qebrkiE22sr75
	 STL+4RhM/FxEaDM4BZ0rXSrKXh4XSmdmWrNtJXEJUAESU3FdP6FtVJbsq02Napb8Nb
	 WRL0MT/HsGkw1kz/5r/7K9C+LrxpWI++SiyIDqtdJYVigBFdY4hy6L6gW15jWFDWlx
	 93/EYlRY879vvpxCtVto++wZwwnkHHlOYsWsDe/kXBgpFZ1hMLrAg/5jS3cWIcSyrF
	 OhT68ZfvHXM1Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSfe3b1q
  SwY9N8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bhlhtsBas4K9ZNX8DYwLifo4uRi0NI4Amj
  xMz+DlYI5wKTxP8984AcTiBnD6NEx2omEJtNQE1i+q0bYHERAX2JpbP3MIPYzAIqEi9+97CD2
  MICThIf1y8Hs1kEVCWerDzOBmLzAsVfrP8HNkdCQEFiysP3YL2cAs4SExqvsEDscpL4MesHVL
  2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLWrDaomWoSV89tYp7AKDgLSfssJO0LGJlWMVo
  lFWWmZ5TkJmbm6BoaGOgaGprqGlvqWhjpJVbpJuqlluqWpxaX6AK55cV6qcXFesWVuck5KXp5
  qSWbGIFBnFKsHrSD8duKn3qHGCU5mJREee+ZpCUJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDl8
  gLKCRalpqdWpGXmACMKJi3BwaMkwpvuDZTmLS5IzC3OTIdInWJUlBLnLfQBSgiAJDJK8+DaYF
  F8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwbzrIFJ7MvBK46a+AFjMBLf5UmwqyuCQRISX
  VwNQj98Wl7+uByPkuOVK5Pcy3gvaqNsxi2iUs2K/zOlOe4cUm3ixJxoK+L4vY+Pjn23Usk19f
  bP1gz5I1X4/vs4s0S2KJapPyZA768NKnoOxp7IHbC9TOiokvEun03fT56S62Y7tYt+nI/ilo5
  g/L8Wz4LZVbsFqRtyX+OvNBwbVeezasEL1WY59tl7O9/UFOyeq4x8dDPocmrfcNLfIOytrJbu
  1dvMhCbR43zzfnyDd80kYtPqpu61L2bdmpLn6zOFtXwPH+Wr+/M0+e2yT6edff/+82CZ+uNrk
  V0lt3+E5cwgYXp4fOKZEPbsf//W3kPk80aZ5H7ZeQRyfX84lKfukSX6Zza/ZvlgPnJ7cuUGIp
  zkg01GIuKk4EAD6koTtdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1650871803!82952!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7766 invoked from network); 25 Apr 2022 07:30:03 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:30:03 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C2787100470
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:30:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8AA75100458
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:30:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:29:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gspell: upgrade 1.9.1 -> 1.10.0
Date: Mon, 25 Apr 2022 15:29:35 +0800
Message-ID: <1650871776-31335-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650871776-31335-1-git-send-email-wangmy@fujitsu.com>
References: <1650871776-31335-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96765

News in 1.10.0, 2022-04-16
--------------------------
* Build from git: some updates, take newer version of autoconf-archive.
* Build: distribute more files in tarballs.
* Documentation improvements.
* Translation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gspell/{gspell_1.9.1.bb => gspell_1.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.9.1.bb => gspell_1.10.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.10.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
rename to meta-gnome/recipes-gnome/gspell/gspell_1.10.0.bb
index 15f1cadbab..fe1b3ea67c 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.10.0.bb
@@ -7,4 +7,4 @@ DEPENDS = "gtk+3 iso-codes enchant2"
 
 inherit gnomebase gettext gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "dcbb769dfdde8e3c0a8ed3102ce7e661abbf7ddf85df08b29915e92cd723abdd"
+SRC_URI[archive.sha256sum] = "803bb884c0215d3fd22a85d7f30423aff88d9792f05a5199d8a489a2ffaae1da"
-- 
2.25.1


