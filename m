Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B363AFD065A
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:27:19 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16159.1773217621484034109
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout09.t-online.de (Postfix) with SMTP id 649DA37D09
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 09:26:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.229.163]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w0Eu8-3Fqip70; Wed, 11 Mar 2026 09:26:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] mypaint-brushes: add recipe for v2
Date: Wed, 11 Mar 2026 09:26:49 +0100
Message-ID: <20260311082649.97159-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1773217616-AF7D2793-794D3A30/0/0 CLEAN NORMAL
X-TOI-MSGID: 45e114bb-9c40-4fc6-855f-1603e201c2dd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125068

This recipe is required to build the upcoming gimp-3.2.0 update

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb     | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2=
.bb

diff --git a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb b/m=
eta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb
new file mode 100644
index 0000000000..b3ad94b4d7
--- /dev/null
+++ b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes_2.0.2.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "MyPaint brushes"
+LICENSE =3D "CC0-1.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D65d3616852dbf7b1a6d4b53b00626=
032"
+
+inherit autotools allarch
+
+SRC_URI =3D "git://github.com/mypaint/mypaint-brushes.git;protocol=3Dhtt=
ps;branch=3Dmaster"
+SRCREV =3D "0df6d130152a94c3bd67709941978074a1303cc5"
+PV =3D "2.0.2"
+
+FILES:${PN} +=3D "${datadir}/mypaint-data"
--=20
2.53.0


