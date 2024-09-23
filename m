Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE518CF9C71
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 08:02:11 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.31442.1727078523314597631
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 01:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout10.t-online.de (Postfix) with SMTP id 7AC613BA3F
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 10:01:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.224.177]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sse0p-1DkyO20; Mon, 23 Sep 2024 10:01:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-desktop: update 44.0 -> 44.1
Date: Mon, 23 Sep 2024 10:03:26 +0200
Message-ID: <20240923080326.123106-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923080326.123106-1-f_l_k@t-online.de>
References: <20240923080326.123106-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1727078499-79FF945E-006BE5E2/0/0 CLEAN NORMAL
X-TOI-MSGID: 2fe0a2d3-7bc9-43f3-93de-a41c17fbe725
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 08:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112455

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 44.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Fix compatibility with muslc (!158, Pablo Correa Gomez)
- Fix GNOME_DESKTOP_IS_THUMBNAIL_FACTORY (!160, Matthijs Velsink)
- Update default Indic input methods (!163, Parag Nemade)
- Use ibus-chewing as the default input source for zh_TW (!164, Kan-Ru Ch=
en)
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-desktop_44.0.bb =3D> gnome-desktop_44.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.0.bb =3D=
> gnome-desktop_44.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb=
 b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
index 19bae74ce..63847fe3e 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
@@ -15,7 +15,7 @@ GIR_MESON_OPTION =3D ""
=20
 SRC_URI +=3D "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long=
.patch \
             file://0001-meson-Add-riscv32-to-seccomp-unsupported-list.pa=
tch"
-SRC_URI[archive.sha256sum] =3D "42c773745d84ba14bc1cf1c4c6f4606148803a5c=
d337941c63964795f3c59d42"
+SRC_URI[archive.sha256sum] =3D "ae7ca55dc9e08914999741523a17d29ce2239156=
26bd2462a120bf96f47a79ab"
=20
 DEPENDS +=3D " \
     fontconfig \
--=20
2.46.0


