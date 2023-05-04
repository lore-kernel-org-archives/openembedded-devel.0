Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3629C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 09:16:45 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.45136.1683191796693051777
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 May 2023 02:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id 9BD80F1A
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 May 2023 11:16:34 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.175.157]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1puV4k-25GMPB0; Thu, 4 May 2023 11:16:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-openembedded][PATCH 1/2] xdg-desktop-portal-wlr: update 0.6.0 -> 0.7.0
Date: Thu,  4 May 2023 11:16:20 +0200
Message-Id: <20230504091621.2607413-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683191794-10C4EC01-198C4849/0/0 CLEAN NORMAL
X-TOI-MSGID: 78560313-daf0-4531-97bc-f0f8b87570ae
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 09:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102306

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ktop-portal-wlr_0.6.0.bb =3D> xdg-desktop-portal-wlr_0.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/xdg-desktop-portal-wlr/{xdg-deskt=
op-portal-wlr_0.6.0.bb =3D> xdg-desktop-portal-wlr_0.7.0.bb} (94%)

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-d=
esktop-portal-wlr_0.6.0.bb b/meta-multimedia/recipes-support/xdg-desktop-=
portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
similarity index 94%
rename from meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-de=
sktop-portal-wlr_0.6.0.bb
rename to meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desk=
top-portal-wlr_0.7.0.bb
index 38389276f..cfc7109c0 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.6.0.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.7.0.bb
@@ -19,7 +19,7 @@ REQUIRED_DISTRO_FEATURES =3D "opengl wayland"
 SRC_URI =3D "git://github.com/emersion/xdg-desktop-portal-wlr.git;protoc=
ol=3Dhttps;nobranch=3D1"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "6737c209578e7f17536dbcb8fb2169dcf86ce528"
+SRCREV =3D "776113a4f014639c29d8de8fcb513493ef7b491f"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
systemd', 'basu', d)}"
=20
--=20
2.34.1


