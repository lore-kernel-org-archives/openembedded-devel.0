Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D713C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:35:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31166.1684514090198085556
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C63EC15DB;
	Fri, 19 May 2023 09:35:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 71A1F3F793;
	Fri, 19 May 2023 09:34:49 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 11/13] python3-pyatspi: make dependent on gobject-introspection-data being enabled
Date: Fri, 19 May 2023 17:34:38 +0100
Message-Id: <20230519163440.2733149-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102685

From: Ross Burton <ross.burton@arm.com>

Any user of pygobject needs to support gobject-introspection.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.b=
b b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb
index 4595eafc6d..aa3000bf6b 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.46.0.bb
@@ -15,6 +15,7 @@ S =3D "${WORKDIR}/git"
 # Same restriction as gtk+
 inherit features_check setuptools3
 ANY_OF_DISTRO_FEATURES =3D "${GTK2DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
 inherit pkgconfig autotools python3native
=20
--=20
2.34.1


