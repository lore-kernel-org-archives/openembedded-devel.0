Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244C7C7EE32
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10023.1685016851446151379
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 414D51042;
	Thu, 25 May 2023 05:14:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4D533F762;
	Thu, 25 May 2023 05:14:10 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 11/14] menulibre: requires gobject-introspection-data DISTRO_FEATURE
Date: Thu, 25 May 2023 13:13:54 +0100
Message-Id: <20230525121357.245812-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
References: <20230525121357.245812-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102854

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb b/meta-x=
fce/recipes-apps/menulibre/menulibre_2.2.3.bb
index 65aa7a53e2..609caf3461 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
@@ -10,7 +10,7 @@ DEPENDS =3D " \
 "
=20
 inherit setuptools3_legacy gtk-icon-cache features_check
-REQUIRED_DISTRO_FEATURES =3D "x11"
+REQUIRED_DISTRO_FEATURES =3D "x11 gobject-introspection-data"
=20
 SRC_URI =3D "git://github.com/bluesabre/menulibre.git;protocol=3Dhttps;b=
ranch=3Dmaster"
 SRCREV =3D "86ee9ad7568128fe9555e54799933b2d3762331a"
--=20
2.34.1


