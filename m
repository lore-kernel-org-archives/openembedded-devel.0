Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AA0CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:52:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4836.1778669536118026864
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 03:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Fo4JVUkF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AAB71C14
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 42F1C3F7B4
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778669535; bh=0SxkOJVvHKMVbJhzi36csz+ZEwiDzdZmHyDKYqqa37U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Fo4JVUkF1TrZS9gMOMzaeHyV93d/2SQLKxuE3Llr3Y3X4s5x3S8lHTiWH2FcRHv1Z
	 /LS0KrfuYVW+GbugyFJybNbfYlXsCtPJ3JB6KYypnaSW0xMNyfvAuqp+m1v+PQzWJw
	 benHHwezRK5xRnwFw5mSlxrUsobLfux5ZSuG4FRE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 2/7] libdazzle: add recipe (from oe-core)
Date: Wed, 13 May 2026 11:52:05 +0100
Message-ID: <20260513105210.2109216-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513105210.2109216-1-ross.burton@arm.com>
References: <20260513105210.2109216-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 10:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126966

This was previously in oe-core but is being removed as it is no longer
used by anything in that layer.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libdazzle/libdazzle_3.44.0.bb              | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libdazzle/libdazzle_3.44.0=
.bb

diff --git a/meta-gnome/recipes-support/libdazzle/libdazzle_3.44.0.bb b/m=
eta-gnome/recipes-support/libdazzle/libdazzle_3.44.0.bb
new file mode 100644
index 0000000000..9bca7e9dce
--- /dev/null
+++ b/meta-gnome/recipes-support/libdazzle/libdazzle_3.44.0.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "The libdazzle library is a companion library to GObject and=
 Gtk+."
+DESCRIPTION =3D "A wide range of components from utilities for GIO, widg=
ets for \
+GTK+, an animation framework, state machines, paneling and high-performa=
nce \
+counters are included."
+LICENSE =3D "GPL-3.0-or-later"
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libdazzle"
+BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libdazzle/issues"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e05189ec81232da84bd6=
e1a"
+
+inherit gnomebase upstream-version-is-even vala features_check gobject-i=
ntrospection
+
+DEPENDS =3D "glib-2.0-native glib-2.0 gtk+3"
+
+SRC_URI[archive.sha256sum] =3D "3cd3e45eb6e2680cb05d52e1e80dd8f9d59d4765=
212f0e28f78e6c1783d18eae"
+
+GIR_MESON_OPTION =3D 'with_introspection'
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
--=20
2.43.0


