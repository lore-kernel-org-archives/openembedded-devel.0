Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3590C4725D
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 12:53:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6207.1705064023442449060
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 04:53:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56A9712FC
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 04:54:29 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B49403F73F
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 04:53:42 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] gtksourceview4: remove check for target gtk-doc
Date: Fri, 12 Jan 2024 12:53:39 +0000
Message-Id: <20240112125340.495067-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112125340.495067-1-ross.burton@arm.com>
References: <20240112125340.495067-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 12:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108238

From: Ross Burton <ross.burton@arm.com>

Packages that use gtk-doc want to find a native gtk-doc not a target
gtk-doc, so remove the pointless check for a target gtk-doc package.

This only worked before as it was being pulled in via DEPENDS in
glib-2.0, but as of oe-core f91694f this no longer happens.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../files/0001-remove-pointless-check.patch   | 38 +++++++++++++++++++
 .../gtksourceview/gtksourceview4_4.8.4.bb     |  4 +-
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/files/0001-rem=
ove-pointless-check.patch

diff --git a/meta-gnome/recipes-gnome/gtksourceview/files/0001-remove-poi=
ntless-check.patch b/meta-gnome/recipes-gnome/gtksourceview/files/0001-re=
move-pointless-check.patch
new file mode 100644
index 0000000000..8230bbbd16
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtksourceview/files/0001-remove-pointless-=
check.patch
@@ -0,0 +1,38 @@
+From 397751846130f79d5fbe8d617b788f3bcbb36816 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 9 Jan 2024 22:20:03 +0000
+Subject: [PATCH] meson: remove pointless gtk-doc check
+
+There's no point explicitly checking for gtk-doc, for two reasons:
+
+1) In cross-compiled environments this looks for a target gtk-doc, not a
+   native gtk-doc, so it should set native:true.
+
+2) The gnome.gtkdoc() function checks for gtk-doc itself.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gtksourceview/=
-/merge_requests/351]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ meson.build | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index ba07da70..1109daea 100644
+--- a/meson.build
++++ b/meson.build
+@@ -107,12 +107,6 @@ else
+   vapigen_dep =3D []
+ endif
+=20
+-if build_gtk_doc
+-  gtk_doc_dep =3D dependency('gtk-doc', version: gtk_doc_req)
+-else
+-  gtk_doc_dep =3D []
+-endif
+-
+ # Look for the libxml2 library manually on Visual Studio if
+ # its pkg-config file could not be found, as the NMake
+ # Makefiles of libxml2 do not generate the pkg-config files
+--=20
+2.34.1
+
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
index 353f02f1ba..5d7d02a2c9 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
@@ -10,12 +10,12 @@ PNAME =3D "gtksourceview"
=20
 S =3D "${WORKDIR}/${PNAME}-${PV}"
=20
-
 inherit gnomebase lib_package gettext features_check gtk-doc gobject-int=
rospection vala
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/4.8/${PNAM=
E}-${PV}.tar.xz"
+SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/4.8/${PNAM=
E}-${PV}.tar.xz \
+           file://0001-remove-pointless-check.patch"
 SRC_URI[sha256sum] =3D "7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c006597b3f=
babbb5958420a87d"
=20
 GIR_MESON_OPTION =3D 'gir'
--=20
2.34.1


