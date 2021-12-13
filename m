Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7001EC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9811.1639393518175519361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6F7AD6E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6215D3F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/12] gnome-themes-extra: set correct SRC_URI
Date: Mon, 13 Dec 2021 11:05:01 +0000
Message-Id: <20211213110511.3274555-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213110511.3274555-1-ross.burton@arm.com>
References: <20211213110511.3274555-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94316

gnome-themes-extra uses an unconventional version for GNOME as it doesn't
have three parts, it's just 3.28 instead of 3.28.0.

Because of this the default SRC_URI from gnomebase doesn't work, so
manually set the correct SRC_URI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.b=
b b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
index 3a018bb519..bba972006a 100644
--- a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
@@ -12,6 +12,8 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK2DISTROFEATURES}"
=20
 DEPENDS +=3D "intltool-native gtk+"
=20
+# PV is 3.28 not 3.28.0, so the gnomebase SRC_URI isn't right.
+SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.xz;name=3Darc=
hive"
 SRC_URI[archive.md5sum] =3D "f9f2c6c521948da427f702372e16f826"
 SRC_URI[archive.sha256sum] =3D "7c4ba0bff001f06d8983cfc105adaac42df1d126=
7a2591798a780bac557a5819"
=20
--=20
2.25.1


