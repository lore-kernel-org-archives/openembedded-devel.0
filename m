Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BFAC4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 07:05:52 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42576.1784703950231191116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 00:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=g3OdFRuX;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout04.t-online.de (Postfix) with SMTP id 8F822254
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 09:05:01 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.162.124]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wmR0g-2OJgVl0; Wed, 22 Jul 2026 09:04:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] xdg-desktop-portal-wlr: update 0.8.1 -> 0.8.2
Date: Wed, 22 Jul 2026 09:04:48 +0200
Message-ID: <20260722070448.290821-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1784703895-01FF89D2-A7AC6EE6/0/0 CLEAN NORMAL
X-TOI-MSGID: 2444c61d-cdb0-407f-ba84-004de58b636b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1784703901; i=f_l_k@t-online.de;
	bh=se5pu7UyUdbrsaB4+1H1RukaUrRMSGSnJ6hFMgHAGMs=;
	h=From:To:Subject:Date;
	b=g3OdFRuXkcAK1D/DalRAeZOhdrDDxeRUw3B2ocFGFwq4vp/qqwJRnkfXasN84VG8a
	 wVhSm5jMS4kr7ISPjBonG5yxtNNPtn+rkwycwJFJ/MUStdc1k/nHu74YX2WX53Su9W
	 bpy8Ja6OmbFPfHlSMdH5C/q/WjTcGkHfEobTKaFcJlTfO8Iyqo9gMaRtFiVlkcH9rd
	 yPzLpJupO7cadRP64oiRfN5CObL0zka4BQ0Lhw115ks5A+25g1E/h0KKejqaxdY42x
	 yHcxv9K9WdgBbd6sMBN3pyzys2+/NVLhOFLJyxbc3UepYNA+L4srcyIvRlG4qPnpgd
	 ZdPYAFk2adi3A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 07:05:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128364

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...portal-wlr_0.8.1.bb =3D> xdg-desktop-portal-wlr_0.8.2.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-multimedia/recipes-support/xdg-desktop-portal-wlr/{xdg-deskt=
op-portal-wlr_0.8.1.bb =3D> xdg-desktop-portal-wlr_0.8.2.bb} (90%)

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-d=
esktop-portal-wlr_0.8.1.bb b/meta-multimedia/recipes-support/xdg-desktop-=
portal-wlr/xdg-desktop-portal-wlr_0.8.2.bb
similarity index 90%
rename from meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-de=
sktop-portal-wlr_0.8.1.bb
rename to meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desk=
top-portal-wlr_0.8.2.bb
index 3deeb1078d..ce5a92da14 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.8.1.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.8.2.bb
@@ -14,12 +14,11 @@ DEPENDS =3D " \
 "
=20
 inherit meson pkgconfig features_check manpages
-REQUIRED_DISTRO_FEATURES =3D "opengl wayland"
=20
-SRC_URI =3D "git://github.com/emersion/xdg-desktop-portal-wlr.git;protoc=
ol=3Dhttps;branch=3Dmaster"
+REQUIRED_DISTRO_FEATURES =3D "opengl wayland"
=20
-PV .=3D "+git"
-SRCREV =3D "256eb4a9f6ecffd64289d6501d036c2094b47db6"
+SRC_URI =3D "git://github.com/emersion/xdg-desktop-portal-wlr.git;protoc=
ol=3Dhttps;nobranch=3D1;tag=3Dv${PV}"
+SRCREV =3D "01171a150b705cf07066ebc0fb7e1ff537027bec"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
systemd', 'basu', d)}"
=20
--=20
2.55.0


