Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BFFC4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 13:00:02 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.17779.1713790794623422649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 05:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id E52FF3F9C
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 14:59:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.11]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rytGw-0in2un0; Mon, 22 Apr 2024 14:59:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] spice-gtk: use hwdata instead of usbids
Date: Mon, 22 Apr 2024 15:00:00 +0200
Message-ID: <20240422130000.1172993-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713790790-F20FFD0F-C530BBA2/0/0 CLEAN NORMAL
X-TOI-MSGID: 60f2e2de-b4d5-4954-aa59-6f9e6bb35a6d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 13:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110099

spice-gtk seems to be the last recipe in meta-openembedded that uses
usbids instead of hwdata.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/me=
ta-networking/recipes-support/spice/spice-gtk_0.42.bb
index 82ce7067d..b7c43bf2d 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -40,7 +40,7 @@ DEPENDS =3D " \
 "
 DEPENDS:append:libc-musl =3D " libucontext"
=20
-RDEPENDS:${PN} =3D "python3-pyparsing python3-six usbids"
+RDEPENDS:${PN} =3D "python3-pyparsing python3-six hwdata"
=20
 inherit meson pkgconfig vala gobject-introspection features_check gtk-do=
c
=20
@@ -60,7 +60,7 @@ PACKAGECONFIG ??=3D "${@bb.utils.contains('GI_DATA_ENAB=
LED', 'True', 'vapi', '', d
 PACKAGECONFIG[vapi] =3D "-Dvapi=3Denabled,-Dvapi=3Ddisabled"
 PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Denabled,-Dsmartcard=3Ddisabl=
ed,libcacard"
=20
-EXTRA_OEMESON =3D "-Dpie=3Dtrue -Dusb-ids-path=3D${datadir}/usb.ids "
+EXTRA_OEMESON =3D "-Dpie=3Dtrue -Dusb-ids-path=3D${datadir}/hwdata/usb.i=
ds "
 EXTRA_OEMESON:append:libc-musl =3D " -Dcoroutine=3Dlibucontext"
=20
 LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl=
,--undefined-version', '', d)}"
--=20
2.44.0


