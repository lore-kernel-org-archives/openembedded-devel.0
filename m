Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760D6C98310
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 06:45:40 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2016.1790232336199728489
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 23:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=hI6m8pUz;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 14120DFDB
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 08:45:34 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.151]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x9dCz-1Cw6L20; Thu, 24 Sep 2026 08:45:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] influxdb: inherit go-mod-update-modules
Date: Thu, 24 Sep 2026 08:45:22 +0200
Message-ID: <20260924064523.165613-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790232329-457F990A-E7FB9588/0/0 CLEAN NORMAL
X-TOI-MSGID: 9419e42d-b18e-41f7-bdeb-4f3e846d96ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790232334; i=f_l_k@t-online.de;
	bh=e0tmNupb9TVcLXnDUSatKy7LWn9GNukzH0ClVNbpgtU=;
	h=From:To:Subject:Date;
	b=hI6m8pUzTPJ0pY8WyQrdr8kFUG4HsGQSM6yjzaz/01jAHw+Gp2B7vtdCnIzPG31m0
	 joXvNKclbCg2/B34Mv+T9IZ6xwfE/ecSK5hEomG4A5G2u43+LoaPIOUFKI8GnwMg4u
	 DshAL1DBh2EQ/HskexsUboCsjI4Q2Vw3ToSutNOp9FZz7xNsy+yfcCwtgpEqSRnSy9
	 PdnUQtBGLEcGhubUNHHuYK0Y3eUVio28sH6wUaTiQsosLQXnkcCAFNDamm8abYbc90
	 2F8Zk/bQwUBVkeGN2ZPFbGK0bG15z7dSsaqE+3hZ2RUtGuLLybkKPQbbgqKwoToWPJ
	 hIaukzJ3U4LDg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 06:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130279

The class includes the generated -licenses.inc and -go-mods.inc files
itself and provides the update_modules task to regenerate them, so the
recipe no longer needs to require them.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/re=
cipes-dbs/influxdb/influxdb_1.8.10.bb
index 4ce8e3681c..dc57afd0ad 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://www.influxdata.com/products/influxd=
b-overview/"
=20
 LICENSE =3D "MIT AND ${GO_MOD_LICENSES}"
 LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Df39a8d10930f=
b37bd59adabb3b9d0bd6"
-require ${BPN}-licenses.inc
=20
 SRC_URI =3D "\
     git://${GO_IMPORT};protocol=3Dhttps;branch=3D1.8;destsuffix=3D${GO_S=
RCURI_DESTSUFFIX} \
@@ -12,7 +11,6 @@ SRC_URI =3D "\
     file://influxdb \
     file://influxdb.conf \
 "
-require ${BPN}-go-mods.inc
=20
 SRCREV =3D "688e697c51fd5353725da078555adbeff0363d01"
=20
@@ -22,7 +20,7 @@ GO_INSTALL =3D "\
     ${GO_IMPORT}/cmd/influxd \
 "
=20
-inherit go-mod pkgconfig systemd update-rc.d useradd
+inherit go-mod go-mod-update-modules pkgconfig systemd update-rc.d usera=
dd
=20
 INITSCRIPT_PACKAGES =3D "${PN}"
 INITSCRIPT_NAME =3D "influxdb"
--=20
2.55.0


