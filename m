Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDEFCD11C2
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 00:23:25 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.3552.1712103799560202900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 17:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout04.t-online.de (Postfix) with SMTP id 1ECE314B3F
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Apr 2024 02:23:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.235.201]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rroPJ-2RUZWr0; Wed, 3 Apr 2024 02:23:13 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gnome-control-center: restore Upstream-Status line
Date: Wed,  3 Apr 2024 02:23:30 +0200
Message-ID: <20240403002330.3794-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1712103793-09FF8923-E7F7685A/0/0 CLEAN NORMAL
X-TOI-MSGID: d47831d4-1647-4f8e-9032-f86435fe3c24
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Apr 2024 00:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109792

It got accidentially wiped out (by using devtool I think)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Add-meson-option-to-pass-sysroot.patch                 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-g=
nome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-p=
ass-sysroot.patch
index a2c237c18..4ae923f87 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
@@ -4,6 +4,8 @@ Date: Mon, 18 Mar 2024 05:50:21 +0100
 Subject: [PATCH] Add meson option to pass sysroot
=20
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [OE specific]
 ---
  meson_options.txt             | 1 +
  panels/background/meson.build | 2 +-
--=20
2.44.0


