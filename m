Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E01C54E67
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 09:28:07 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.5619.1711186085654478638
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 02:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout10.t-online.de (Postfix) with SMTP id 24DC240A2E
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 10:28:03 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnxfU-1TEO1a0; Sat, 23 Mar 2024 10:28:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gtksourceview5: update 5.10.0 -> 5.12.0
Date: Sat, 23 Mar 2024 10:28:23 +0100
Message-ID: <20240323092823.27010-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323092823.27010-1-f_l_k@t-online.de>
References: <20240323092823.27010-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711186080-2EFFAC95-F07D8BA4/0/0 CLEAN NORMAL
X-TOI-MSGID: 244b8ffc-5480-46d3-9ecc-e502b83713c7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109547

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gtksourceview5_5.10.0.bb =3D> gtksourceview5_5.12.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.10.0.bb =
=3D> gtksourceview5_5.12.0.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0=
.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.0.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.=
bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.0.bb
index a336b1909..f3267acbe 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.12.0.bb
@@ -23,12 +23,12 @@ inherit gnomebase lib_package gettext features_check =
gi-docgen gtk-icon-cache go
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/5.10/${PNA=
ME}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "b38a3010c34f59e13b05175e9d20ca02a3110443fec2b1e5=
747413801bc9c23f"
+SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/5.12/${PNA=
ME}-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "daf32ff5d3150d6385917d3503a85b9e047ba158b2b03079=
314c9c00813fa01f"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
-GTKDOC_MESON_OPTION =3D "gtk_doc"
+GIDOCGEN_MESON_OPTION =3D "documentation"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)}"
 PACKAGECONFIG[vulkan] =3D ",,vulkan-loader vulkan-headers"
--=20
2.44.0


