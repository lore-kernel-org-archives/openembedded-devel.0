Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13F7C3A5A7
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 19:36:25 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.932.1670355384231386266
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Dec 2022 11:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id 1C0524C5E
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Dec 2022 20:36:03 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.136]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2djU-1Ur1vO0; Tue, 6 Dec 2022 20:36:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-xfce][PATCH 2/4] thunar-shares-plugin: update to latest commit
Date: Tue,  6 Dec 2022 20:35:45 +0100
Message-Id: <20221206193547.144679-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206193547.144679-1-f_l_k@t-online.de>
References: <20221206193547.144679-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670355360-793AD9DD-F0ACE08F/0/0 CLEAN NORMAL
X-TOI-MSGID: d5a7d3de-3beb-416d-8525-c9ae475be32c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 19:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99965

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../shares/thunar-shares-plugin_0.3.1.bb               | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin=
_0.3.1.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_=
0.3.1.bb
index fb7589637..b80a23e4f 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.=
bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.=
bb
@@ -2,12 +2,14 @@ SUMMARY =3D "Quickly share a folder using Samba from Th=
unar"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
=20
-inherit thunar-plugin features_check
+inherit xfce thunar-plugin features_check xfce-git
+
+DEPENDS =3D "xfce4-dev-tools-native gtk+3 intltool-native thunar"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "pam"
=20
-SRC_URI[md5sum] =3D "0884855d60cf1031b9013b6f5b125372"
-SRC_URI[sha256sum] =3D "dc1d8c7caa727e76d033d4653dc0742613f57a1711d00509=
00659c90a84452a0"
-
+SRC_URI =3D "git://github.com/xfce-mirror/thunar-shares-plugin.git;branc=
h=3Dmaster;protocol=3Dhttps"
+SRCREV =3D "e4bce21a1bd744ccfde84de4669ac30aa1d72135"
+S =3D "${WORKDIR}/git"
 RDEPENDS:${PN} +=3D "samba-server"
--=20
2.34.1


