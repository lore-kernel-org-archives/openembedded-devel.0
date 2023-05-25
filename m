Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A883C7EE31
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10018.1685016847255080968
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 004AB15BF;
	Thu, 25 May 2023 05:14:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 629943F762;
	Thu, 25 May 2023 05:14:06 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 05/14] gnome-desktop: gobject-introspection is not in fact mandatory
Date: Thu, 25 May 2023 13:13:48 +0100
Message-Id: <20230525121357.245812-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
References: <20230525121357.245812-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102848

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb=
 b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
index eae9d9d065..03411c88d9 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
@@ -11,8 +11,6 @@ GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-int=
rospection features_check gtk-doc
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
-# gobject-introspection is mandatory and cannot be configured
-REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
 GIR_MESON_OPTION =3D ""
=20
--=20
2.34.1


