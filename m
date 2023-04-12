Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827F5C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 17:32:19 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.50188.1681320735174947365
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Apr 2023 10:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout03.t-online.de (Postfix) with SMTP id D21C0183CB
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 19:32:12 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.43.117]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pmeKJ-0qs41Z0; Wed, 12 Apr 2023 19:32:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] xdg-desktop-portal-wlr: update
Date: Wed, 12 Apr 2023 19:31:57 +0200
Message-Id: <20230412173157.365778-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1681320731-EB7FDC73-E2379764/0/0 CLEAN NORMAL
X-TOI-MSGID: e8881c6c-244f-4e18-8bbc-c46b82b6cb02
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 17:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102065

There is not a new version released yet, but this update has lots of fixe=
s
and adds features for recent pipewire and hyprland support.
But most important ... without the update it will cause a 30 sec. delay t=
o
the start of various gtk apps in combination with current xdg-desktop-por=
tal
release.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-d=
esktop-portal-wlr_0.6.0.bb b/meta-multimedia/recipes-support/xdg-desktop-=
portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb
index a72116154..38389276f 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.6.0.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.6.0.bb
@@ -19,7 +19,7 @@ REQUIRED_DISTRO_FEATURES =3D "opengl wayland"
 SRC_URI =3D "git://github.com/emersion/xdg-desktop-portal-wlr.git;protoc=
ol=3Dhttps;nobranch=3D1"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "0a8bfa14607022a080f8b6eabc4757d1918d3cd9"
+SRCREV =3D "6737c209578e7f17536dbcb8fb2169dcf86ce528"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
systemd', 'basu', d)}"
=20
--=20
2.34.1


