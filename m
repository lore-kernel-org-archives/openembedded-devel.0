Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53C0C7EE2D
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:14:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.297.1684948485144814423
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 10:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D22D21042;
	Wed, 24 May 2023 10:15:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4AD873F6C4;
	Wed, 24 May 2023 10:14:44 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/6] blueman: add features_check on gobject-introspection-data
Date: Wed, 24 May 2023 18:14:36 +0100
Message-Id: <20230524171438.122588-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230524171438.122588-1-ross.burton@arm.com>
References: <20230524171438.122588-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 17:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102788

From: Ross Burton <ross.burton@arm.com>

This project uses gobject-introspection, so depend on the DISTRO_FEATURE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
index eb42e62f45..dc7f2b6f7f 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
=20
 DEPENDS =3D "gtk+3 glib-2.0 bluez5 python3-pygobject python3-cython-nati=
ve"
=20
-inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache useradd
+inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache useradd features_check
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection"
=20
 SRC_URI =3D " \
     git://github.com/blueman-project/blueman.git;protocol=3Dhttps;branch=
=3D2-3-stable \
--=20
2.34.1


