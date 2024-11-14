Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD70D6A23D
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6506.1731621612903711636
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 621381474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:42 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B0123F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/21] blueman: inherit cython class
Date: Thu, 14 Nov 2024 21:59:49 +0000
Message-Id: <20241114220009.737413-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113824

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
index e7f0987e0f..974c563299 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
@@ -2,9 +2,9 @@ DESCRIPTION =3D "Blueman is a GTK+ Bluetooth Manager"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
=20
-DEPENDS =3D "gtk+3 glib-2.0 bluez5 python3-pygobject python3-cython-nati=
ve"
+DEPENDS =3D "gtk+3 glib-2.0 bluez5 python3-pygobject"
=20
-inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache features_check python3targetconfig
+inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache features_check python3targetconfig cython
=20
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
--=20
2.34.1


