Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0752E6FE53
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 08:33:36 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.3723.1725698009354753906
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 01:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id 6D5F73DE44
	for <openembedded-devel@lists.openembedded.org>; Sat,  7 Sep 2024 10:33:06 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.86]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1smqsU-42T4wj0; Sat, 7 Sep 2024 10:33:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] iwd: use internal ell
Date: Sat,  7 Sep 2024 10:34:46 +0200
Message-ID: <20240907083446.80928-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1725697986-137FC5A6-0F4F8FF5/0/0 CLEAN NORMAL
X-TOI-MSGID: 22a6f352-1e86-4257-8a8b-da9e9bb14963
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 08:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112113

iwd and ell need to be updated in sync. This is regularly neglected.
Also the fact that they reside in different layers compicates the update =
process.

Beside iwd, there are not a lot of consumers for ell.

Building with internal ell makes iwd updates easier

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/iwd/iwd_2.20.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_2.20.bb
index ffdab0260..16d900ddc 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://iwd.wiki.kernel.org/"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb504b67c50331fc78734fed90fb0=
e09"
=20
-DEPENDS =3D "ell"
+DEPENDS =3D "dbus"
=20
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
@@ -24,8 +24,6 @@ PACKAGECONFIG[wired] =3D "--enable-wired,--disable-wire=
d"
 PACKAGECONFIG[ofono] =3D "--enable-ofono,--disable-ofono"
 PACKAGECONFIG[systemd] =3D "--with-systemd-unitdir=3D${systemd_system_un=
itdir},--disable-systemd-service,systemd"
=20
-EXTRA_OECONF =3D "--enable-external-ell"
-
 SYSTEMD_SERVICE:${PN} =3D " \
     iwd.service \
     ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)=
} \
--=20
2.46.0


