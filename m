Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A43CD4F3F
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:52:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4839.1778669539479051800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 03:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sbZMxQWA;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC9831655
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9AFC3F7B4
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778669539; bh=JvJEMup56r90AD9L/W2K4oTmFHSUfWaLJzF1GaRmt+U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sbZMxQWARI2s2EZDHOr4+g0Hz4s8DJZ/CsAEcBJG43E7NVSub/TKHFmq++UIbGJgw
	 ToOzg29WdhN3K972055KSy6gFxY7wgc08t3/ovR3tXz2KR/nx7tkFbUnDRcctV2DSb
	 DAAG1VvVQr5/P2tGpKsFJBf1eAKCezSFNgczTmWc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 7/7] nautilus: update dependencies
Date: Wed, 13 May 2026 11:52:10 +0100
Message-ID: <20260513105210.2109216-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513105210.2109216-1-ross.burton@arm.com>
References: <20260513105210.2109216-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 10:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126971

libhandy was removed when g-s-m ported to GTK 4.

Update the DISTRO_FEATURES checks to use GTK3DISTROFEATURES.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_49.5.bb
index 45e0969d66..9597ce5136 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb
@@ -14,7 +14,6 @@ DEPENDS =3D " \
     gtk4 \
     libadwaita \
     libcloudproviders \
-    libhandy \
     libportal \
     libxml2 \
     tinysparql \
@@ -26,7 +25,8 @@ inherit gnomebase gsettings gobject-introspection gi-do=
cgen gettext features_che
=20
 SRC_URI[archive.sha256sum] =3D "fa5655e73ee7953aecfe71fea67bfec0c67447e1=
4e6df135aa3f80334386872c"
=20
-REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
+REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 GIDOCGEN_MESON_OPTION =3D "docs"
 GIDOCGEN_MESON_ENABLE_FLAG =3D 'true'
--=20
2.43.0


