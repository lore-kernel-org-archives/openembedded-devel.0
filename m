Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B10C7EE2D
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10020.1685016849290427440
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 238ED15DB;
	Thu, 25 May 2023 05:14:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 856513F762;
	Thu, 25 May 2023 05:14:08 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 08/14] nautilus: requires gobject-introspection-data DISTRO_FEATURE
Date: Thu, 25 May 2023 13:13:51 +0100
Message-Id: <20230525121357.245812-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
References: <20230525121357.245812-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102851

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_44.1.bb
index f7eeb5f5d0..65bef45da7 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
@@ -29,7 +29,7 @@ def gnome_verdir(v):
 SRC_URI +=3D "file://0001-Replace-filename-with-basename.patch"
 SRC_URI[archive.sha256sum] =3D "360802a595e3edbad962c8cea353b62baa8be407=
513b5162c89c933ca5387aa9"
=20
-REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
+REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
=20
 EXTRA_OEMESON +=3D " \
     -Dtests=3Dnone \
--=20
2.34.1


