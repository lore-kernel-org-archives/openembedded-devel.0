Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEACC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 12:53:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6208.1705064023974641758
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 04:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E20B91FB
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 04:54:29 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4365B3F73F
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 04:53:43 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] gtksourceview4: remove obsolete workaround for build failures
Date: Fri, 12 Jan 2024 12:53:40 +0000
Message-Id: <20240112125340.495067-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112125340.495067-1-ross.burton@arm.com>
References: <20240112125340.495067-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 12:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108239

From: Ross Burton <ross.burton@arm.com>

This was likely fixed in 9bea9d1 upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gtksourceview/gtksourceview4_4.8.4.bb            | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
index 5d7d02a2c9..38ca4a39e6 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
@@ -21,16 +21,4 @@ SRC_URI[sha256sum] =3D "7ec9d18fb283d1f84a3a3eff3b7a72=
b09a10c9c006597b3fbabbb59584
 GIR_MESON_OPTION =3D 'gir'
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
-# Override the definition in meson.bbclass.  The dependencies in mason.b=
uild are incomplete
-# and the recipe will not build with "-j 1".  This fix is benign but sho=
uld be reviewed when
-# updating versions.
-#
-meson_do_compile() {
-    bbnote "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D generating gtksourceview-gres=
ources.h =3D=3D=3D=3D=3D=3D=3D=3D"
-    bbnote "PARALLEL_MAKE is ${PARALLEL_MAKE}"
-    ninja ${PARALLEL_MAKE} gtksourceview/gtksourceview-gresources.h
-    bbnote "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D compiling target all =3D=3D=3D=
=3D=3D=3D=3D=3D"
-    ninja ${PARALLEL_MAKE}
-}
-
 FILES:${PN} +=3D "${datadir}/gtksourceview-4"
--=20
2.34.1


