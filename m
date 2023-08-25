Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABE4C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 05:45:13 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.7648.1692942304629117139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 22:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout09.t-online.de (Postfix) with SMTP id B14A746ACA
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 07:45:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.212]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZPcz-2AQiNn0; Fri, 25 Aug 2023 07:45:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/5] flatpak: fix api-documentation build
Date: Fri, 25 Aug 2023 07:44:47 +0200
Message-ID: <20230825054449.2315061-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825054449.2315061-1-f_l_k@t-online.de>
References: <20230825054449.2315061-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692942301-EAFF4029-5F80B66F/0/0 CLEAN NORMAL
X-TOI-MSGID: bd7022bf-d499-45f7-a291-4836d5e6641a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 05:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104593

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.4.bb
index 163d732a86..f5a726a83d 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
@@ -12,7 +12,7 @@ SRCREV =3D "e936e3100d406c50ba49f3ad6a0ecae455345ec0"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit meson pkgconfig gettext systemd gobject-introspection python3nat=
ive useradd mime features_check
+inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native useradd mime features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
@@ -48,6 +48,9 @@ RDEPENDS:${PN} =3D " \
 EXTRA_OEMESON +=3D "-Dsystem_dbus_proxy=3D${bindir}/xdg-dbus-proxy -Dsys=
tem_bubblewrap=3D${bindir}/bwrap"
=20
 GIR_MESON_OPTION =3D ""
+GTKDOC_MESON_OPTION =3D 'gtkdoc'
+GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
+GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
=20
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,xauth socat-nat=
ive"
 PACKAGECONFIG[xauth] =3D "-Dxauth=3Denabled,-Dxauth=3Ddisabled,xauth"
--=20
2.41.0


