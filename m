Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF18EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 16:11:49 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.715.1692807106740907144
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 09:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id A472739C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 18:11:44 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.236]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qYqSN-4eyCVl0; Wed, 23 Aug 2023 18:11:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] spice-gtk: fix api-documentation build
Date: Wed, 23 Aug 2023 18:11:37 +0200
Message-ID: <20230823161137.8131-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692807103-1F7F616C-93ACFFB2/0/0 CLEAN NORMAL
X-TOI-MSGID: fefd34b4-c46e-4e36-bd60-c9f57421ef6e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 16:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104551

- add support for smartcard
- add missing rdepend on usbids

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/spice/spice-gtk_0.42.bb          | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/me=
ta-networking/recipes-support/spice/spice-gtk_0.42.bb
index 27504392a6..3d34f222d0 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -40,19 +40,23 @@ DEPENDS =3D " \
 "
 DEPENDS:append:libc-musl =3D " libucontext"
=20
-RDEPENDS:${PN} =3D "python3-pyparsing python3-six"
+RDEPENDS:${PN} =3D "python3-pyparsing python3-six usbids"
=20
-inherit meson pkgconfig vala gobject-introspection features_check
+inherit meson pkgconfig vala gobject-introspection features_check gtk-do=
c
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
+GTKDOC_MESON_OPTION =3D 'gtk_doc'
+GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
+GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'va=
pi', '', d)}"
+PACKAGECONFIG ??=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'va=
pi', '', d)} smartcard"
 PACKAGECONFIG[vapi] =3D "-Dvapi=3Denabled,-Dvapi=3Ddisabled"
+PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Denabled,-Dsmartcard=3Ddisabl=
ed,libcacard"
=20
-EXTRA_OEMESON =3D "-Dpie=3Dtrue"
+EXTRA_OEMESON =3D "-Dpie=3Dtrue -Dusb-ids-path=3D${datadir}/usb.ids "
 EXTRA_OEMESON:append:libc-musl =3D " -Dcoroutine=3Dlibucontext"
=20
 LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl=
,--undefined-version', '', d)}"
--=20
2.41.0


