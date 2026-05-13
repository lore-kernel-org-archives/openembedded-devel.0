Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66DACD4F3D
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:52:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4716.1778669536737708536
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 03:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Przw6Fyr;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E69E1655
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7DB73F7B4
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778669536; bh=C+Phs692SECpeURNrq3b62nd1T5TQrhuoiLDWVGC7j0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Przw6FyrJdty6L0komLZAlpdaRE4bD/zgaUuMe74WpkbGhZQPEfS4oTCYNhm+ltsU
	 dkS1f6q4jSZgB7PkmCD0DXKQJOy95dd4+wKv+NLHZ6ACIVQJ8hC5Uuzq2bTxTVUB+Y
	 xqtDU7j/EgxyUDTETWnf5uR1w2jHNz38qvxHiA44=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 3/7] libhandy: add recipe (from oe-core)
Date: Wed, 13 May 2026 11:52:06 +0100
Message-ID: <20260513105210.2109216-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513105210.2109216-1-ross.burton@arm.com>
References: <20260513105210.2109216-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 10:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126967

This was previously in oe-core but is being removed as it is no longer
used by anything in that layer. Some changes were made in the process of
moving the recipe to meta-oe:

- Inherit gnomebase, as this is a GNOME package
- Download the release tarball instead of a git clone
- Set the correct license, this is -or-later not -only. Add handy.h to
  the license checksum to provide verification.

The final output is identical to the recipe in oe-core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libhandy/libhandy_1.8.3.bb                | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libhandy/libhandy_1.8.3.bb

diff --git a/meta-gnome/recipes-support/libhandy/libhandy_1.8.3.bb b/meta=
-gnome/recipes-support/libhandy/libhandy_1.8.3.bb
new file mode 100644
index 0000000000..0c525bcae3
--- /dev/null
+++ b/meta-gnome/recipes-support/libhandy/libhandy_1.8.3.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "A library full of GTK+ widgets for mobile phones"
+DESCRIPTION =3D "Library with GTK widgets for mobile phones. Libhandy pr=
ovides \
+GTK widgets and GObjects to ease developing applications for mobile phon=
es. \
+It was developed by Purism (and used by several official GNOME projects)=
 \
+to extend Gtk by providing mobile-friendly widgets and make the creation=
 of \
+responsive apps easier."
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libhandy"
+BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
+                    file://src/handy.h;beginline=3D4;endline=3D4;md5=3D2=
0a35c7a7509753627b8c372765d5f22"
+
+DEPENDS =3D "gtk+3"
+
+inherit gnomebase gobject-introspection vala gettext gi-docgen features_=
check
+
+SRC_URI[archive.sha256sum] =3D "05b497229073ff557f10b326e074c5066f8743a3=
02d4820ab97bcb5cd2dab087"
+
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+
+PACKAGES =3D+ "${PN}-examples"
+FILES:${PN}-examples =3D "${bindir}"
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
--=20
2.43.0


