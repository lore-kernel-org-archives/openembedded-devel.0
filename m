Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39289C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10158.1685016852196187686
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFE6115BF;
	Thu, 25 May 2023 05:14:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C8553F762;
	Thu, 25 May 2023 05:14:11 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 12/14] xfce4-panel-profiles: requires gobject-introspection-data DISTRO_FEATURE
Date: Thu, 25 May 2023 13:13:55 +0100
Message-Id: <20230525121357.245812-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
References: <20230525121357.245812-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102855

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-prof=
iles_1.0.13.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-=
profiles_1.0.13.bb
index ab1b827266..9624f90f92 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.=
0.13.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.=
0.13.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
=20
 inherit python3native gettext gtk-icon-cache features_check
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+REQUIRED_DISTRO_FEATURES =3D "x11 gobject-distro-features"
=20
 DEPENDS +=3D "intltool-native"
=20
--=20
2.34.1


