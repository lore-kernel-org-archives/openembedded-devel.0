Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED139C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 07:56:17 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.57072.1710143776526205597
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Mar 2024 00:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout09.t-online.de (Postfix) with SMTP id 94A6B49317
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 08:56:12 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.172.233]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjaW3-2NXHu50; Mon, 11 Mar 2024 08:56:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] polkit: remove unneeded workaround
Date: Mon, 11 Mar 2024 08:56:31 +0100
Message-ID: <20240311075631.943227-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710143771-DA7FB94C-B08C6B00/0/0 CLEAN NORMAL
X-TOI-MSGID: 544722ce-4d09-4318-99b4-0e995e04c345
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 07:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109265

polkitd doesn't segfault with MemoryDenyWriteExecute=3Dyes anymore

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ce.in-disable-MemoryDenyWriteExecute.patch | 30 -------------------
 meta-oe/recipes-extended/polkit/polkit_124.bb |  4 +--
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-polkit.se=
rvice.in-disable-MemoryDenyWriteExecute.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-polkit.service.i=
n-disable-MemoryDenyWriteExecute.patch b/meta-oe/recipes-extended/polkit/=
polkit/0001-polkit.service.in-disable-MemoryDenyWriteExecute.patch
deleted file mode 100644
index 4f008f7a9..000000000
--- a/meta-oe/recipes-extended/polkit/polkit/0001-polkit.service.in-disab=
le-MemoryDenyWriteExecute.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 95148a804be66092564f81306a02f625d5b8a5d0 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Sun, 17 Sep 2023 23:26:59 +0200
-Subject: [PATCH] polkit.service.in: disable MemoryDenyWriteExecute
-
-A few momths ago some hardening options have been added to polkit.servic=
e.in
-https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/177/diffs?=
commit_id=3Dafecbd53696e32bbadd60f431fc7d285f3edd265
-
-and polkitd segfaults with MemoryDenyWriteExecute=3Dyes, at least in my =
environment
-
-Upstream-Status: Inappropriate [needs further investigation]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- data/polkit.service.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/data/polkit.service.in b/data/polkit.service.in
-index e6db351..4390cce 100644
---- a/data/polkit.service.in
-+++ b/data/polkit.service.in
-@@ -12,7 +12,7 @@ ExecStart=3D@libprivdir@/polkitd --no-debug
- User=3D@polkitd_user@
- LimitMEMLOCK=3D0
- LockPersonality=3Dyes
--MemoryDenyWriteExecute=3Dyes
-+#MemoryDenyWriteExecute=3Dyes
- NoNewPrivileges=3Dyes
- PrivateDevices=3Dyes
- PrivateNetwork=3Dyes
diff --git a/meta-oe/recipes-extended/polkit/polkit_124.bb b/meta-oe/reci=
pes-extended/polkit/polkit_124.bb
index 3eb0d5280..9e2eb05c6 100644
--- a/meta-oe/recipes-extended/polkit/polkit_124.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_124.bb
@@ -4,9 +4,7 @@ HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/po=
lkit"
 LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f39040928=
3eb"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/polkit/polkit.git;protocol=3Dh=
ttps;branch=3Dmaster \
-           file://0001-polkit.service.in-disable-MemoryDenyWriteExecute.=
patch \
-           "
+SRC_URI =3D "git://gitlab.freedesktop.org/polkit/polkit.git;protocol=3Dh=
ttps;branch=3Dmaster"
=20
 S =3D "${WORKDIR}/git"
 SRCREV =3D "82f0924dc0eb23b9df68e88dbaf9e07c81940a5a"
--=20
2.44.0


