Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A860C982DB
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:37:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42668.1789659455314551935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 08:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=b7Ortefp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34F421596
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 74F3A3F7B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789659454; bh=aTyyCvm9X6VpP5PphA/8bw/44LawWYGkV4yh9xKr3KM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b7OrtefpWmNQdLDwK7C3F8fEvB5VUig4rrRkc+YTJYdf4x9BSqdriBFZB+bx8yM82
	 WZrxKPXwoxomNIqaS/gACDZ/cVJG1GNDlPqnToS1TdGGxG2rWHE0kuKSS+gBJLCUnt
	 GlN/ogWi5EzfL2BjjC2fca8q5bs9TCGn2NxVEuas=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 6/8] spice-gtk: upgrade 0.42 -> 0.43
Date: Thu, 17 Sep 2026 16:37:23 +0100
Message-ID: <20260917153727.3057505-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917153727.3057505-1-ross.burton@arm.com>
References: <20260917153727.3057505-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 15:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130103

Documentation is now built with gi-docgen instead of gtk-doc.

Drop python3-six build dependency, no longer needed.

Add udev build dependency to avoid it being dependend on what is in the
sysroot.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../spice/{spice-gtk_0.42.bb =3D> spice-gtk_0.43.bb}  | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/spice/{spice-gtk_0.42.bb =3D> spi=
ce-gtk_0.43.bb} (85%)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/me=
ta-networking/recipes-support/spice/spice-gtk_0.43.bb
similarity index 85%
rename from meta-networking/recipes-support/spice/spice-gtk_0.42.bb
rename to meta-networking/recipes-support/spice/spice-gtk_0.43.bb
index dcfbc69e51b..5dc30e58e27 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.43.bb
@@ -8,24 +8,23 @@ LIC_FILES_CHKSUM =3D " \
 	file://subprojects/keycodemapdb/LICENSE.GPL2;md5=3D751419260aa954499f7a=
baabaa882bbe \
 "
=20
-SRCREV =3D "f04479c16f0969fb394ebe74b6eff74e560a42f0"
+SRCREV =3D "f028f45a573926736223548887e18ac65dabb50b"
=20
-SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=
=3Dhttps;branch=3Dmaster"
+SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=
=3Dhttps;branch=3Dmaster;tag=3Dv${PV}"
=20
 CVE_STATUS[CVE-2012-4425] =3D "fixed-version: fixed since 0.15.3"
=20
-DEPENDS =3D "python3-six-native python3-pyparsing-native spice-protocol =
glib-2.0 pixman openssl jpeg zlib json-glib libcap-ng gstreamer1.0 gstrea=
mer1.0-plugins-base"
+DEPENDS =3D "python3-pyparsing-native spice-protocol glib-2.0 pixman ope=
nssl jpeg zlib json-glib libcap-ng gstreamer1.0 gstreamer1.0-plugins-base=
 udev"
 DEPENDS:append:libc-musl =3D " libucontext"
=20
-inherit meson pkgconfig vala gobject-introspection features_check gtk-do=
c
+inherit meson pkgconfig vala gobject-introspection features_check gi-doc=
gen
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
-GTKDOC_MESON_OPTION =3D 'gtk_doc'
-GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
-GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
+GIDOCGEN_MESON_ENABLE_FLAG =3D 'enabled'
+GIDOCGEN_MESON_DISABLE_FLAG =3D 'disabled'
=20
 do_configure:prepend() {
 	echo ${PV} > ${S}/.tarball-version
--=20
2.43.0


