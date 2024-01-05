Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD8AC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 19:06:17 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.31934.1704481576791511799
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 11:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout10.t-online.de (Postfix) with SMTP id 4614B30F17
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Jan 2024 20:06:14 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.175.203]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rLpWH-0PCRtJ0; Fri, 5 Jan 2024 20:06:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] luajit: upgrade 2.1beta -> 2.1
Date: Fri,  5 Jan 2024 20:06:05 +0100
Message-ID: <20240105190605.885033-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704481573-317F9937-E2138EDD/0/0 CLEAN NORMAL
X-TOI-MSGID: 213ae600-f9bb-4013-8922-13f512f0657c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 19:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108053

drop clang.patch
https://github.com/LuaJIT/LuaJIT/blob/c525bcb9024510cad9e170e12b6209aedb3=
30f83/src/lj_arch.h#L472

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../luajit/luajit/clang.patch                 | 19 -------------------
 meta-oe/recipes-devtools/luajit/luajit_git.bb |  5 ++---
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/luajit/luajit/clang.patch

diff --git a/meta-oe/recipes-devtools/luajit/luajit/clang.patch b/meta-oe=
/recipes-devtools/luajit/luajit/clang.patch
deleted file mode 100644
index 807cc4417..000000000
--- a/meta-oe/recipes-devtools/luajit/luajit/clang.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-clang pretends to be gcc 4.2.0 which is a big lie when it comes
-to features, its same as latest gcc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: LuaJIT-2.0.5/src/lj_arch.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- LuaJIT-2.0.5.orig/src/lj_arch.h
-+++ LuaJIT-2.0.5/src/lj_arch.h
-@@ -436,7 +436,7 @@
- #endif
- #endif
- #elif !LJ_TARGET_PS3
--#if (__GNUC__ < 4) || ((__GNUC__ =3D=3D 4) && __GNUC_MINOR__ < 3)
-+#if (__GNUC__ < 4) || ((__GNUC__ =3D=3D 4) && __GNUC_MINOR__ < 3) && !d=
efined(__clang__)
- #error "Need at least GCC 4.3 or newer"
- #endif
- #endif
diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/reci=
pes-devtools/luajit/luajit_git.bb
index 06df0690a..72cd04b14 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -5,13 +5,12 @@ HOMEPAGE =3D "http://luajit.org"
=20
 SRC_URI =3D "git://luajit.org/git/luajit-2.0.git;protocol=3Dhttp;branch=3D=
v2.1 \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripp=
ing.patch \
-           file://clang.patch \
            file://0001-Use-builtin-for-clear_cache.patch \
            "
=20
 # Set PV to a version tag and date (YYMMDD) associated with SRCREV if it=
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


