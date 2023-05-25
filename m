Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AC0C7EE2F
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10153.1685016846630894909
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 476771042;
	Thu, 25 May 2023 05:14:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A605F3F762;
	Thu, 25 May 2023 05:14:05 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 04/14] eog: requires gobject-introspection-data DISTRO_FEATURE
Date: Thu, 25 May 2023 13:13:47 +0100
Message-Id: <20230525121357.245812-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
References: <20230525121357.245812-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102847

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/eog/eog_44.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/eog/eog_44.1.bb b/meta-gnome/recipe=
s-gnome/eog/eog_44.1.bb
index 95e421c883..0b7cfca49b 100644
--- a/meta-gnome/recipes-gnome/eog/eog_44.1.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_44.1.bb
@@ -19,7 +19,8 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime=
-xdg features_check gtk-icon-cache
=20
-REQUIRED_DISTRO_FEATURES =3D "opengl"
+# FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed =
when libpeas2 is used.
+REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
=20
 SRC_URI +=3D "file://0001-Replace-filename-with-basename.patch"
 SRC_URI[archive.sha256sum] =3D "e2c963f232fe5a1091dcc18bec25a730e91b02af=
6e466601efa55e500cd74cab"
--=20
2.34.1


