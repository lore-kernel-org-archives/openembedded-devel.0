Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8DD103E2F8
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 00:49:03 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11421.1773276539251518024
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 17:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd92.mgt.mul.t-online.de (fwd92.aul.t-online.de [10.223.144.118])
	by mailout05.t-online.de (Postfix) with SMTP id 2C11527DD
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 01:48:57 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.229.163]) by fwd92.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w0UET-19pc6T0; Thu, 12 Mar 2026 01:48:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] mypaint-brushes: add recipe for v2
Date: Thu, 12 Mar 2026 01:48:44 +0100
Message-ID: <20260312004844.5513-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1773276537-527FA476-8D252706/0/0 CLEAN NORMAL
X-TOI-MSGID: 9792bad8-24aa-42ea-9ade-679cca698594
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 00:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125093

This recipe is required to build the upcoming gimp-3.2.0 update

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb      | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2=
.bb

diff --git a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb b/m=
eta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb
new file mode 100644
index 0000000000..4e444938b1
--- /dev/null
+++ b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb
@@ -0,0 +1,10 @@
+SUMMARY =3D "MyPaint brushes"
+LICENSE =3D "CC0-1.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D65d3616852dbf7b1a6d4b53b00626=
032"
+
+inherit autotools allarch
+
+SRC_URI =3D "git://github.com/mypaint/mypaint-brushes.git;protocol=3Dhtt=
ps;branch=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "0df6d130152a94c3bd67709941978074a1303cc5"
+
+FILES:${PN} +=3D "${datadir}/mypaint-data"
--=20
2.53.0


