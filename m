Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F13C7EE31
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:14:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.312.1684948486464849839
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 10:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C1011042;
	Wed, 24 May 2023 10:15:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A90873F6C4;
	Wed, 24 May 2023 10:14:45 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 6/6] python3-asyncio-glib: add features_check on gobject-introspection-data
Date: Wed, 24 May 2023 18:14:38 +0100
Message-Id: <20230524171438.122588-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230524171438.122588-1-ross.burton@arm.com>
References: <20230524171438.122588-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 17:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102790

From: Ross Burton <ross.burton@arm.com>

This project uses gobject-introspection, so depend on the DISTRO_FEATURE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-asyncio-glib_0.1.bb       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1=
.bb b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
index 2314f72845..02ace02a3d 100644
--- a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
@@ -3,7 +3,9 @@ AUTHOR =3D "James Henstridge"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING.LGPL;md5=3D4fbd65380cdd255951079008=
b364516c"
=20
-inherit setuptools3 pypi
+inherit setuptools3 pypi features_check
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
 SRC_URI[md5sum] =3D "60153055e76ceaacdfbaeafb03d61dd9"
 SRC_URI[sha256sum] =3D "fe3ceb2ba5f541330c07ca1bd7ae792468d625bad1acf535=
4a3a7a0b9fd87521"
--=20
2.34.1


