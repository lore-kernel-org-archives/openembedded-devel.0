Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56581C79F85
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 17:39:44 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17913.1788716381697421635
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 10:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=GUWbKUz2;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout06.t-online.de (Postfix) with SMTP id 898D5672
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 19:39:38 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x3Gq9-3o5rRB0; Sun, 6 Sep 2026 19:39:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-control-center: conflict with gnome-online-accounts-gtk
Date: Sun,  6 Sep 2026 19:39:28 +0200
Message-ID: <20260906173928.130930-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906173928.130930-1-f_l_k@t-online.de>
References: <20260906173928.130930-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788716377-0AFFA9C8-363CBC3D/0/0 CLEAN NORMAL
X-TOI-MSGID: afb5bb6b-796b-4e55-b5ad-0b3abdc7cc83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788716378; i=f_l_k@t-online.de;
	bh=5HHAEmOR7hXchts0lWX/fs6HiSHYm9hnCXIMusNT1FM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GUWbKUz2fqT6QDmHQXxUC86lJlOh6VNwTb37rbdJxkKsTbxhqw6eoLh5XtbjZR3oA
	 rSL8/Rp7mGeTkeqGaolbOEysAkUcb4H/m5PoCSBfX+PRGzv6b7jaYDJdeWMJk32h3e
	 31mFjc+Xf93lRcL1auYY10A3y3HjVA0890N3DW4okYQjrRo3vu7WHCB6GDGg+CX34R
	 hZKJtBMN/galcigo5+fRpSXSG3kuTNWpHsqP4yh1U1wfTQdIwbFBpRqpUw0z2kXSNu
	 K4U5NUmlAbbpBY8fFohtXDo32zzTUUYhlSMTGNG3om8e+B4UYKihDs/Gp3OkjpzrpJ
	 1aajho/3JkCPQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 17:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129794

Both packages provide the org.gnome.Settings D-Bus name that GNOME
applications use to open the online accounts settings. Only one of them
can own it, so keep them from being installed together.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
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


