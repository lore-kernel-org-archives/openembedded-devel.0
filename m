Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A35C46CD2
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 07:04:11 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.44093.1704524642126353621
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 23:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout03.t-online.de (Postfix) with SMTP id 18C2A10140
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 Jan 2024 08:04:00 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.174.51]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rM0is-24JmzJ0; Sat, 6 Jan 2024 08:03:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] luajit: upgrade 2.1beta -> 2.1
Date: Sat,  6 Jan 2024 08:03:48 +0100
Message-ID: <20240106070348.37664-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704524638-CCFF6957-B74995DE/0/0 CLEAN NORMAL
X-TOI-MSGID: 647552f3-d7c8-4954-bcd6-048bb75ff0bb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jan 2024 07:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108060

- license checksum changed
  https://github.com/LuaJIT/LuaJIT/commit/158a284cc9c33ade9054df976018401=
e4996cfbd

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/reci=
pes-devtools/luajit/luajit_git.bb
index 06df0690a..cadc9843d 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -1,17 +1,15 @@
 SUMMARY =3D "Just-In-Time Compiler for Lua"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D23d6278200de9b48fd1439f8050=
7cba8"
+LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D076b97f5c7e61532f7f6f3865f0=
4da57"
 HOMEPAGE =3D "http://luajit.org"
=20
 SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=3D=
v2.1 \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripp=
ing.patch \
-           file://clang.patch \
            file://0001-Use-builtin-for-clear_cache.patch \
            "
=20
-# Set PV to a version tag and date (YYMMDD) associated with SRCREV if it=
 is later.
-PV =3D "2.1.0~beta3-220721"
-SRCREV =3D "32984282ddae666b3c94cd27538e1c78b49a1877"
+PV =3D "2.1"
+SRCREV =3D "c525bcb9024510cad9e170e12b6209aedb330f83"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.43.0


