Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9CBC79FA3
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10848.1788687444055411199
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WPHq7Q/C;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout05.t-online.de (Postfix) with SMTP id 826BD5AA
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JO-22AhJm0; Sun, 6 Sep 2026 11:37:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 07/15] gexiv2-0.14: add recipe for the 0.14 series
Date: Sun,  6 Sep 2026 11:37:05 +0200
Message-ID: <20260906093713.797648-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687438-E77F5956-E6BA71CA/0/0 CLEAN NORMAL
X-TOI-MSGID: 68ce4763-0115-4d81-9ffb-7462592e7282
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=aL/NYUkpMfgJ/v+fX4JrwoFpv2wwdtSHQ5zrSRdvbTo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WPHq7Q/CgoqKJ5UsZ2V3c8p6tjejdxmx2Zk8t5NEM1qxdPoXZ9GLmLJnaHzMk/z3B
	 C/fOKLukb9g54e1Mu026sesYS3lgf4Ln+wA7bABu91DBjk9X5cAV97g4lbw5XUwop2
	 fEwThJ0X60UoezJLCo/HVZl2T00DxSvxNroXP8vvyD36ylwxa6yUj9Lm3qCi9A5Jyy
	 rKNJ6n0cYjK7rax94fmtfnMAkRbKXL7Gfp7OrefL/cbsQ1kHMBtzbBiJ9IC/qCkthI
	 Q/Pbzvs25zBrQEFn8b9NbkxQGrERKneKasSEKNfxHcDBQef9C/W3/StESlPKgq0SkN
	 O0nId0FhMjMcQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129788

gexiv2 0.16 switched to a versioned library, pkg-config module, header
directory and GIR namespace, so it installs in parallel to 0.14. GNOME 50
applications need 0.16 while GIMP still requires gexiv2 < 0.15, so keep
the 0.14 series under its own name. The command line tool and the python
override are disabled here to avoid file clashes with the main recipe.

Build tested on corei7-64.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gexiv2/gexiv2-0.14_0.14.6.bb              | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb b/meta=
-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb
new file mode 100644
index 0000000000..a193831a23
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2-0.14_0.14.6.bb
@@ -0,0 +1,34 @@
+SUMMARY =3D "A GObject-based Exiv2 wrapper"
+DESCRIPTION =3D "The 0.14 series of gexiv2 for applications that don't s=
upport the \
+versioned gexiv2-0.16 API yet, most notably GIMP. It installs in paralle=
l to the \
+current gexiv2 recipe: the library, pkg-config module, header directory =
and GIR \
+namespace version differ. The command line tool and the python override =
are not \
+built here because their files would clash with the current version."
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D625f055f41728f84a8d7938acc35b=
dc2"
+
+DEPENDS =3D "exiv2"
+
+GNOMEBN =3D "gexiv2"
+
+GTKDOC_MESON_OPTION =3D "gtk_doc"
+
+inherit gnomebase gobject-introspection gtk-doc vala
+
+SRC_URI[archive.sha256sum] =3D "606c28aaae7b1f3ef5c8eabe5e7dffd7c5a1c866=
d25b7671fb847fe287a72b8b"
+
+# The command line tool and the python override would clash with the fil=
es
+# installed by the current gexiv2 recipe.
+# AI-Generated: this recipe was created with Claude Code.
+EXTRA_OEMESON =3D " \
+    -Dpython3=3Dfalse \
+    -Dtools=3Dfalse \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=3Dtrue', '-D=
vapi=3Dfalse', d)} \
+"
+
+PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess"
+src_package_preprocess () {
+        # Trim build paths from code in generated sources to ensure repr=
oducibility
+        sed -i -e "s,${B}/../sources/${GNOMEBN}-${PV},${TARGET_DBGSRC_DI=
R},g" \
+            ${B}/gexiv2/gexiv2-enums.cpp
+}
--=20
2.55.0


