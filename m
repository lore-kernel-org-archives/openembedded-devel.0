Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10930C7EE29
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10015.1685016844452040378
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 217F01042;
	Thu, 25 May 2023 05:14:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8369B3F762;
	Thu, 25 May 2023 05:14:03 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 01/14] libpeas: requires gobject-introspection-data DISTRO_FEATURE
Date: Thu, 25 May 2023 13:13:44 +0100
Message-Id: <20230525121357.245812-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102844

From: Ross Burton <ross.burton@arm.com>

Until libpeas 2 is released, g-i is a hard requirement.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb b/meta-oe/re=
cipes-gnome/libpeas/libpeas_1.36.0.bb
index 3bc975a6fa..1e3b0021c3 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
@@ -11,6 +11,8 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
 inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_=
check
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+# FIXME: When upgrading to libpeas 2, g-i is no longer needed.
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
 SRC_URI +=3D "file://0001-Remove-builddir-and-srcdir-paths-from-test-bin=
aries.patch"
 SRC_URI[archive.sha256sum] =3D "297cb9c2cccd8e8617623d1a3e8415b4530b8e5a=
893e3527bbfd1edd13237b4c"
--=20
2.34.1


