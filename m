Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CF1C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 18:17:01 +0000 (UTC)
Received: from webmail.gomspace.com (webmail.gomspace.com [79.171.149.170])
 by mx.groups.io with SMTP id smtpd.web10.57808.1684347415050000818
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 May 2023 11:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gomspace.com, ip: 79.171.149.170, mailfrom: mns@gomspace.com)
Received: from DK-AAL-EX02.gomspace.lan (10.0.1.86) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 20:16:51 +0200
Received: from mns-T460s.gomspace.lan (10.0.8.155) by DK-AAL-EX02.gomspace.lan
 (10.0.1.86) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 17 May 2023 20:16:51 +0200
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH] libiio: update to version 0.24
Date: Wed, 17 May 2023 20:16:48 +0200
Message-ID: <20230517181648.1765602-1-mns@gomspace.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EndpointSecurity-0xde81-EV: v:7.9.1.285, d:out, a:y, w:t, t:6, sv:1684337209, ts:1684347411
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 18:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102650

 - drop 0001-CMake-Move-include-CheckCSourceCompiles-before-its-m.patch
   (integrated upstream)

 - updated CMakeLists.txt requires pkgconfig

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes=
-support/libiio/libiio_git.bb
index c8ff0d34b..ea51c19f4 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,12 +4,10 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7c13b3376cea0ce68d2d2da0a1b=
3a72c"
=20
-SRCREV =3D "92d6a35f3d8d721cda7d6fe664b435311dd368b4"
-PV =3D "0.23"
+SRCREV =3D "c4498c27761d04d4ac631ec59c1613bfed079da5"
+PV =3D "0.24"
=20
-SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhttps=
;branch=3Dmaster \
-           file://0001-CMake-Move-include-CheckCSourceCompiles-before-its-=
m.patch \
-"
+SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhttps=
;branch=3Dmaster"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 S =3D "${WORKDIR}/git"
@@ -20,7 +18,7 @@ DEPENDS =3D " \
     flex-native bison-native libaio \
 "
=20
-inherit cmake python3native systemd setuptools3
+inherit cmake python3native systemd setuptools3 pkgconfig
=20
 EXTRA_OECMAKE =3D " \
     -DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
--=20
2.25.1


________________________
This email was scanned by Bitdefender

