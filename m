Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F1DC61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 07:07:44 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.9344.1675321654492325942
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Feb 2023 23:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout01.t-online.de (Postfix) with SMTP id 40CBAF91F
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Feb 2023 08:06:10 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.179]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pNTfc-1tP3cv0; Thu, 2 Feb 2023 08:06:08 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] rtkit: add recipe
Date: Thu,  2 Feb 2023 08:05:54 +0100
Message-Id: <20230202070554.1287801-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675321568-70EA07D8-5F28BC09/0/0 CLEAN NORMAL
X-TOI-MSGID: 50aea74b-a60b-4c48-8d9c-79959dc7a401
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 07:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100911

rtkit is a runtime dependency for xdg-desktop-portal
---
 meta-oe/recipes-support/rtkit/rtkit_0.13.bb | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/rtkit/rtkit_0.13.bb

diff --git a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb b/meta-oe/recipe=
s-support/rtkit/rtkit_0.13.bb
new file mode 100644
index 000000000..7ae992503
--- /dev/null
+++ b/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
@@ -0,0 +1,23 @@
+DESCRIPTION =3D "REALTIMEKIT Realtime Policy and Watchdog Daemon"
+LICENSE =3D "GPL-3.0-only & BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da8e768468b658b3ed44971b53d4a6=
716"
+
+SRC_URI =3D "git://github.com/heftig/rtkit.git;protocol=3Dhttps;branch=3D=
master"
+
+SRCREV =3D "b9169402fe5e82d20efb754509eb0b191f214599"
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig features_check useradd
+
+REQUIRED_DISTRO_FEATURES =3D "polkit"
+
+DEPENDS =3D "dbus libcap polkit xxd-native"
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
+PACKAGECONFIG[systemd] =3D ",,systemd"
+
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --shell =
/bin/nologin rtkit"
+
+FILES:${PN} +=3D "${libdir} ${datadir}"
+
--=20
2.34.1


