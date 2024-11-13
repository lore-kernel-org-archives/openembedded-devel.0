Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B9CD41C06
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 12:41:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10523.1731501679710979155
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 04:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A368F1655
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 04:41:48 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 514DD3F66E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 04:41:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] gnome-desktop: remove X11 dependencies
Date: Wed, 13 Nov 2024 12:41:10 +0000
Message-Id: <20241113124111.2042331-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 12:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113808

The dependencies on libxext and xrandr were removed in 3.21.4 (2016).

This also means we can remove the check for the X11 DISTRO_FEATURE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb=
 b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
index 63847fe3e5..994dfabf3c 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.LIB;md5=3D5f30f0716dfdd0d91eb439ebec522ec2 \
 "
=20
-
 inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-int=
rospection features_check gtk-doc
=20
-REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 GIR_MESON_OPTION =3D ""
=20
@@ -25,11 +24,9 @@ DEPENDS +=3D " \
     gtk+3 \
     gtk4 \
     iso-codes \
-    xext \
     libseccomp \
     libxkbcommon \
     xkeyboard-config \
-    xrandr \
 "
=20
 DEPENDS:remove:riscv32 =3D "libseccomp"
--=20
2.34.1


