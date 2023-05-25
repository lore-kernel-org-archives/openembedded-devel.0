Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DA0C7EE32
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10152.1685016845101644045
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFB5815BF;
	Thu, 25 May 2023 05:14:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B93A3F762;
	Thu, 25 May 2023 05:14:04 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 02/14] geoclue: the library doesn't need gobject-introspection
Date: Thu, 25 May 2023 13:13:45 +0100
Message-Id: <20230525121357.245812-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
References: <20230525121357.245812-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102845

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb b/meta-o=
e/recipes-navigation/geoclue/geoclue_2.7.0.bb
index d05a309455..6784b099aa 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.0.bb
@@ -27,7 +27,7 @@ PACKAGECONFIG[3g] =3D "-D3g-source=3Dtrue,-D3g-source=3D=
false,modemmanager"
 PACKAGECONFIG[modem-gps] =3D "-Dmodem-gps-source=3Dtrue,-Dmodem-gps-sour=
ce=3Dfalse,modemmanager"
 PACKAGECONFIG[cdma] =3D "-Dcdma-source=3Dtrue,-Dcdma-source=3Dfalse,mode=
mmanager"
 PACKAGECONFIG[nmea] =3D "-Dnmea-source=3Dtrue,-Dnmea-source=3Dfalse,avah=
i,avahi-daemon"
-PACKAGECONFIG[lib] =3D "-Dlibgeoclue=3Dtrue,-Dlibgeoclue=3Dfalse,gobject=
-introspection"
+PACKAGECONFIG[lib] =3D "-Dlibgeoclue=3Dtrue,-Dlibgeoclue=3Dfalse"
=20
 GTKDOC_MESON_OPTION =3D "gtk-doc"
=20
--=20
2.34.1


