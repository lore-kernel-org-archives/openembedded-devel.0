Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E10D11195
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 22:11:38 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.45082.1730671897621030303
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Nov 2024 14:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout11.t-online.de (Postfix) with SMTP id 0B887774
	for <openembedded-devel@lists.openembedded.org>; Sun,  3 Nov 2024 23:11:33 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.125]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t7iol-2KWIe90; Sun, 3 Nov 2024 23:11:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] snapper: use nonarch_libdir in FILES
Date: Sun,  3 Nov 2024 23:13:43 +0100
Message-ID: <20241103221343.138008-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1730671892-277FC5DD-02777F01/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b2d9b61-2f2d-4300-8f11-1d66cb838d82
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 22:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113400

This avoids an 'installed vs.shipped' issue for multilib

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/snapper/snapper_0.11.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/=
recipes-support/snapper/snapper_0.11.2.bb
index 840c60730..d8987eead 100644
--- a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
+++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
@@ -30,12 +30,12 @@ export RMBIN =3D "${bindir}/rm"
 export TOUCHBIN =3D "${bindir}/touch"
 export CPBIN =3D "${bindir}/cp"
=20
-
 do_install:append() {
 	install -d ${D}${sysconfdir}/sysconfig
 	install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sysconfig/sna=
pper
 }
=20
-FILES:${PN} +=3D "${libdir}/pam_snapper ${libdir}/systemd ${libdir}/secu=
rity ${datadir}"
+FILES:${PN} +=3D "${nonarch_libdir} ${systemd_system_unitdir} ${datadir}=
"
+
 # bash is needed for the testsuite
 RDEPENDS:${PN} =3D "bash diffutils util-linux util-linux-mount"
--=20
2.47.0


