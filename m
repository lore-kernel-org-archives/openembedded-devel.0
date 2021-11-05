Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCE1C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 14:33:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6363.1636122824423283092
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 07:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5CB02F
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  5 Nov 2021 07:33:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43D223F7F5
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  5 Nov 2021 07:33:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] modemmanager: remove intltool-native DEPENDS
Date: Fri,  5 Nov 2021 14:33:38 +0000
Message-Id: <20211105143338.3561229-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 14:33:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93843

The use of intltool was removed in the 1.8.0 release, back in 2018.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-connectivity/modemmanager/modemmanager_1.16.8.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.=
8.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.8.bb
index a97c94e5c3..5aaa55c7af 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.8.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 inherit gnomebase gettext systemd vala gobject-introspection bash-comple=
tion
=20
-DEPENDS =3D "glib-2.0 libgudev intltool-native libxslt-native"
+DEPENDS =3D "glib-2.0 libgudev libxslt-native"
=20
 SRC_URI =3D "http://www.freedesktop.org/software/ModemManager/ModemManag=
er-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "21fdfaf94171261ad9d99771894f5ade4bc39ef3d1ff1d42=
1054d14713e97880"
--=20
2.25.1


