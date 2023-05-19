Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2173C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:34:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31022.1684514091601044722
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30CB92F4;
	Fri, 19 May 2023 09:35:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D006B3F793;
	Fri, 19 May 2023 09:34:50 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 13/13] imsettings: add missing DEPENDS on autoconf-archive-native
Date: Fri, 19 May 2023 17:34:40 +0100
Message-Id: <20230519163440.2733149-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102687

From: Ross Burton <ross.burton@arm.com>

This can be satisfied via transitive dependencies, but make it an
explicit DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb b/=
meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb
index cdf4557cd3..21e9b3908f 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa34=
95befef8f17206a5b0a1"
=20
 inherit autotools gtk-doc gobject-introspection gettext features_check
=20
-DEPENDS =3D "gtk+3 libnotify"
+DEPENDS =3D "autoconf-archive-native gtk+3 libnotify"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
--=20
2.34.1


