Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7652DC433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 13:53:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7286.1642168434919042108
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F4F8ED1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:53:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19C823F774
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:53:53 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] python3-smbbus: use DISTUTILS_SETUP_PATH
Date: Fri, 14 Jan 2022 13:53:51 +0000
Message-Id: <20220114135352.3996274-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 13:53:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94835

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-smbus_4.3.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb b/m=
eta-python/recipes-devtools/python/python3-smbus_4.3.bb
index e2fd20fc00..a09a108b36 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
@@ -1,11 +1,14 @@
 SUMMARY =3D "Set of i2c tools for linux - Python module"
 LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://smbusmodule.c;beginline=3D1;endline=3D18;md=
5=3D46e424fb045901ab25e0f92c28c80055"
+LIC_FILES_CHKSUM =3D "file://py-smbus/smbusmodule.c;beginline=3D1;endlin=
e=3D18;md5=3D46e424fb045901ab25e0f92c28c80055"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV=
}.tar.gz "
 SRC_URI[sha256sum] =3D "eec464e42301d93586cbeca3845ed61bff40f560670e5b35=
baec57301d438148"
=20
 DEPENDS +=3D "i2c-tools"
=20
-S =3D "${WORKDIR}/i2c-tools-${PV}/py-smbus"
+S =3D "${WORKDIR}/i2c-tools-${PV}"
+
 inherit distutils3
+
+DISTUTILS_SETUP_PATH =3D "${S}/py-smbus"
--=20
2.25.1


