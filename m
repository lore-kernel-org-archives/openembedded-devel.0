Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9478EC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 08:12:41 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.2412.1704701555633186681
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 00:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout01.t-online.de (Postfix) with SMTP id 3892613279
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 09:12:32 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.164.233]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rMkkJ-1zOYhV0; Mon, 8 Jan 2024 09:12:31 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libplist: make sure rm doesn't fail on nonexistent file
Date: Mon,  8 Jan 2024 09:12:21 +0100
Message-ID: <20240108081221.3537692-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704701551-A8FA299C-40185673/0/0 CLEAN NORMAL
X-TOI-MSGID: 0957fb4f-c879-413b-a3df-1a0bee574cc6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 08:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108126

I've seen this on a rebuild:
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| rm: cannot remove '/home/flk/poky/build-hypr/tmp/work/corei7-64-poky-li=
nux/libplist/2.3.0+git/git/m4/ax_python_devel.m4': No such file or direct=
ory

This was fixed after '-c cleansstate' but just in case

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb | 2 +-
 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb =
b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
index 3eefda733..78640934a 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
@@ -23,7 +23,7 @@ CVE_STATUS_LIBLIST =3D " \
 "
=20
 do_configure:prepend() {
-    rm ${S}/m4/ax_python_devel.m4
+    rm -f ${S}/m4/ax_python_devel.m4
 }
=20
 do_install:append () {
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/=
meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
index 0142bcbaf..6fbc28394 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -24,7 +24,7 @@ CVE_STATUS_LIBLIST =3D " \
 "
=20
 do_configure:prepend() {
-    rm ${S}/m4/ax_python_devel.m4
+    rm -f ${S}/m4/ax_python_devel.m4
 }
=20
 do_install:append () {
--=20
2.43.0


