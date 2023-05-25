Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98192C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 16:58:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17437.1685033909788195021
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 09:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59FFB1042;
	Thu, 25 May 2023 09:59:14 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B90893F6C4;
	Thu, 25 May 2023 09:58:28 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] networkmanager: add dependency on pyhthon3-pygobject-native
Date: Thu, 25 May 2023 17:58:27 +0100
Message-Id: <20230525165827.510680-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 16:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102859

From: Ross Burton <ross.burton@arm.com>

The build of NM involves running Python that uses PyGObject, so add that
to DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.42.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.42.6.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_1.42.6.bb
index b52a47540f..3196b0c244 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.42.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.42.6.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
 "
=20
 DEPENDS =3D " \
+    python3-pygobject-native \
     coreutils-native \
     intltool-native \
     libxslt-native \
--=20
2.34.1


