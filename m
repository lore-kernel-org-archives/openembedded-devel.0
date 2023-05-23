Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9535C7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 12:01:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20124.1684843262837247254
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 05:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E88B139F;
	Tue, 23 May 2023 05:01:47 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4EED3F6C4;
	Tue, 23 May 2023 05:01:01 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] gnome-menu: remove redundant dependencies
Date: Tue, 23 May 2023 13:01:00 +0100
Message-Id: <20230523120100.1549988-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 12:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102731

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb b=
/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
index dbc6e962eb..fa162510cb 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
@@ -4,11 +4,9 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
                     file://COPYING.LIB;md5=3D5f30f0716dfdd0d91eb439ebec5=
22ec2"
=20
-DEPENDS =3D "python3 libxml2 popt gtk+3 gnome-common-native"
+DEPENDS =3D "glib-2.0"
=20
-inherit features_check gnomebase gettext pkgconfig gobject-introspection=
 upstream-version-is-even
-
-REQUIRED_DISTRO_FEATURES =3D "x11"
+inherit gnomebase gettext pkgconfig gobject-introspection upstream-versi=
on-is-even
=20
 SRC_URI[archive.md5sum] =3D "a8fd71fcf31a87fc799d80396a526829"
 SRC_URI[archive.sha256sum] =3D "d9348f38bde956fc32753b28c1cde19c175bfdbf=
1f4d5b06003b3aa09153bb1f"
--=20
2.34.1


