Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B7AC79F8C
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 17:47:44 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18513.1788716863541414706
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 10:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=GfgKvVhl;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout01.t-online.de (Postfix) with SMTP id AD87E1C0A9
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 19:47:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x3Gxv-0xE76n0; Sun, 6 Sep 2026 19:47:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2 2/2] gnome-control-center: conflict with gnome-online-accounts-gtk
Date: Sun,  6 Sep 2026 19:47:29 +0200
Message-ID: <20260906174729.209553-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906174729.209553-1-f_l_k@t-online.de>
References: <20260906174729.209553-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788716859-73FFC956-D3902CE4/0/0 CLEAN NORMAL
X-TOI-MSGID: d71d0854-d376-4957-a909-385fd82997ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788716861; i=f_l_k@t-online.de;
	bh=VkiOSOln15zHS5cpdkBYbgvdUMHWyPrfzL7xW8a94y8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GfgKvVhlCD2uG7Ms/7Y2CTBqP2TjPk9cG48VliYbTCGZmJtb3OjW+3N8E94zPMqjE
	 qm/Yp23HXiUEsFnpeWc+KyqGwB+ceLPmt2i9jsO54XgPR7nwCZ2IwNvXuy5RCaCrv9
	 Cd8BZ9pK/qw750rrxRAu7g9OtnC7Z+ms6crC4q72KIJ6FIhJ7YOrJRVlL93Zs9QUBQ
	 7XsURIGbWRE/zHzze6q/hT/Ej6wJRSNwvaBZiZHIgUUJ5QypI9Y8yZZ6NyXlDJDAtd
	 0Wh9/DV2hxQEnCKltRXs08gJuWDvLCk11B1r29J/IepJAcrtH8cV4fwN7TUhw35a1C
	 aCpM5tOrimiWA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 17:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129796

Both packages provide the org.gnome.Settings D-Bus name that GNOME
applications use to open the online accounts settings. Only one of them
can own it, so keep them from being installed together.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center/gnome-control-center_50.4.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_50.4.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_50.4.bb
index e66f11a2b1..ea45485b69 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
50.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
50.4.bb
@@ -70,3 +70,4 @@ FILES:${PN} +=3D " \
 FILES:${PN}-dev +=3D "${datadir}/gettext"
=20
 RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla"
+RCONFLICTS:${PN} +=3D "gnome-online-accounts-gtk"
--=20
2.55.0


