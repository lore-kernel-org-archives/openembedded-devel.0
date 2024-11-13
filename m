Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567BAD41C3C
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 12:41:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10524.1731501679711191039
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 04:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 531DB165C
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 04:41:49 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0324D3F66E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 04:41:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] gnome-desktop: add PACKAGECONFIGs for gtk3/gtk4 libraries
Date: Wed, 13 Nov 2024 12:41:11 +0000
Message-Id: <20241113124111.2042331-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113124111.2042331-1-ross.burton@arm.com>
References: <20241113124111.2042331-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 12:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113809

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb=
 b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
index 994dfabf3c..629fe929a1 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
@@ -21,8 +21,6 @@ DEPENDS +=3D " \
     gdk-pixbuf \
     glib-2.0 \
     gsettings-desktop-schemas \
-    gtk+3 \
-    gtk4 \
     iso-codes \
     libseccomp \
     libxkbcommon \
@@ -34,6 +32,10 @@ DEPENDS:remove:riscv32 =3D "libseccomp"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
 EXTRA_OEMESON =3D "-Ddesktop_docs=3Dfalse"
=20
+PACKAGECONFIG ??=3D "gtk4 legacy"
+PACKAGECONFIG[gtk4] =3D "-Dbuild_gtk4=3Dtrue,-Dbuild_gtk4=3Dfalse,gtk4"
+PACKAGECONFIG[legacy] =3D "-Dlegacy_library=3Dtrue,-Dlegacy_library=3Dfa=
lse,gtk+3"
+
 PACKAGES =3D+ "libgnome-desktop"
 RDEPENDS:${PN} +=3D "libgnome-desktop"
 FILES:libgnome-desktop =3D " \
--=20
2.34.1


