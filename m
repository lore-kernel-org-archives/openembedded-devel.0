Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCF6CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 16:37:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80303.1778603853880917594
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 09:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=T0gZowdE;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE29F1655
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 09:37:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A37BD3F836
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778603853; bh=7P4HjEDDZ5YjvnU/dehe3qcK7dSgpdIUAc+MbkycKiM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T0gZowdEi6MIAKvVgO+7km3f/DdXesTheYcMer8B25yxMJjpnqaZ23uaK1h8E63JW
	 KmPhaktLifHnwstqyrqqWVRwIdHtZt+cqwjwbczw4h5QC5PPRmXYDiVKLOgN/URDgf
	 5z6ZNXTbKK3tNbgRvg62ByfkZWk2mHV3in6X2lOY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] libhandy: add recipe (from oe-core)
Date: Tue, 12 May 2026 17:37:27 +0100
Message-ID: <20260512163727.3832144-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512163727.3832144-1-ross.burton@arm.com>
References: <20260512163727.3832144-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 16:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126874

This was previously in oe-core but is being removed as it is no longer
used by anything in that layer.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libhandy/libhandy_1.8.3.bb                | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libhandy/libhandy_1.8.3.bb

diff --git a/meta-gnome/recipes-support/libhandy/libhandy_1.8.3.bb b/meta=
-gnome/recipes-support/libhandy/libhandy_1.8.3.bb
new file mode 100644
index 0000000000..cf2c64f8d0
--- /dev/null
+++ b/meta-gnome/recipes-support/libhandy/libhandy_1.8.3.bb
@@ -0,0 +1,26 @@
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
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=3Dhttps;=
branch=3Dlibhandy-1-8"
+SRCREV =3D "9b0071408ce86a3ef843806fddd723a85f6f2416"
+
+UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+
+inherit meson gobject-introspection vala gettext gi-docgen features_chec=
k pkgconfig
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+
+DEPENDS +=3D "gtk+3"
+
+PACKAGES =3D+ "${PN}-examples"
+FILES:${PN}-examples =3D "${bindir}"
--=20
2.43.0


