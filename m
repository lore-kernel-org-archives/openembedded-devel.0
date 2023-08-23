Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD063EE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 12:20:16 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.10031.1692793211391601686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 05:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout07.t-online.de (Postfix) with SMTP id DE59852964
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 14:20:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.236]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qYmqE-0tEM2j0; Wed, 23 Aug 2023 14:20:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] usbredir: upgrade 0.9.0 -> 0.13.0
Date: Wed, 23 Aug 2023 14:19:53 +0200
Message-ID: <20230823121957.5626-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692793206-6F7FDE98-4E41E3AF/0/0 CLEAN NORMAL
X-TOI-MSGID: 718b5c0e-b23f-443c-99e6-433b07d6a52f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 12:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104541

-switch to meson buildsystem

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../spice/{usbredir_0.9.0.bb =3D> usbredir_0.13.0.bb}    | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-support/spice/{usbredir_0.9.0.bb =3D> usb=
redir_0.13.0.bb} (61%)

diff --git a/meta-networking/recipes-support/spice/usbredir_0.9.0.bb b/me=
ta-networking/recipes-support/spice/usbredir_0.13.0.bb
similarity index 61%
rename from meta-networking/recipes-support/spice/usbredir_0.9.0.bb
rename to meta-networking/recipes-support/spice/usbredir_0.13.0.bb
index 452491023e..3a73f9b189 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.13.0.bb
@@ -5,16 +5,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
     file://COPYING.LIB;md5=3D4b54a1fd55a448865a0b32d41598759d \
 "
=20
-DEPENDS =3D "libusb1"
+DEPENDS =3D "libusb1 glib-2.0"
=20
-SRCREV =3D "bca484fc6f206ab9da2f73e8a0118fad45374d4e"
+SRCREV =3D "5fc0e1c43194d948545941d408f4c10d084eb6ed"
=20
-SRC_URI =3D " \
-    git://anongit.freedesktop.org/spice/usbredir;branch=3Dmaster \
-"
+SRC_URI =3D "git://gitlab.freedesktop.org/spice/usbredir;branch=3Dmain;p=
rotocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools pkgconfig
+inherit meson pkgconfig
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.41.0


