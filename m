Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AA3C7EE2D
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10155.1685016848664178938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A72B15BF;
	Thu, 25 May 2023 05:14:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC6323F762;
	Thu, 25 May 2023 05:14:07 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 07/14] grilo-plugins: add PACKAGECONFIG for tracker
Date: Thu, 25 May 2023 13:13:50 +0100
Message-Id: <20230525121357.245812-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
References: <20230525121357.245812-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102850

From: Ross Burton <ross.burton@arm.com>

Add a PACKAGECONFIG for the tracker plugin, and enable it only if
gobject-introspection is enabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb b/met=
a-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
index 00474ce446..91cbe82ea9 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
@@ -7,7 +7,6 @@ DEPENDS =3D " \
     gperf-native \
     itstool-native \
     grilo \
-    tracker \
     lua \
     liboauth \
 "
@@ -19,4 +18,7 @@ inherit gnomebase gnome-help vala
 SRC_URI +=3D "file://0001-Avoid-running-trackertestutils.patch"
 SRC_URI[archive.sha256sum] =3D "fe6f4dbe586c6b8ba2406394e202f22d009d642a=
96eb3a54f32f6a21d084cdcb"
=20
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-in=
trospection-data', 'tracker', '', d)}"
+PACKAGECONFIG[tracker] =3D "-Denable-tracker3=3Dyes,-Denable-tracker3=3D=
no,tracker"
+
 FILES:${PN} +=3D "${libdir}/grilo-0.3"
--=20
2.34.1


