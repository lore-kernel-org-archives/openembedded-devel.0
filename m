Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E2EC7EE31
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:34:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31020.1684514088828670015
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60C031FB;
	Fri, 19 May 2023 09:35:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C0503F793;
	Fri, 19 May 2023 09:34:47 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 09/13] libpeas: depend on gobject-introspection-data
Date: Fri, 19 May 2023 17:34:36 +0100
Message-Id: <20230519163440.2733149-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102683

From: Ross Burton <ross.burton@arm.com>

peas uses the G-I repository to load plugins.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb b/meta-oe/re=
cipes-gnome/libpeas/libpeas_1.36.0.bb
index 1282e93634..12c2868a58 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
@@ -24,3 +24,5 @@ FILES:${PN}-demo =3D " \
=20
 RDEPENDS:${PN}-python3 =3D "python3-pygobject"
 FILES:${PN}-python3 =3D "${libdir}/libpeas-1.0/loaders/libpython3loader.=
so"
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.34.1


