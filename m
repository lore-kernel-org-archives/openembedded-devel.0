Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B542C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 05:45:23 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.7651.1692942318310083387
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 22:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout03.t-online.de (Postfix) with SMTP id BDA385D430
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 07:45:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.212]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZPd0-2AQiNp0; Fri, 25 Aug 2023 07:45:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/5] libdecor: update to latest commit
Date: Fri, 25 Aug 2023 07:44:49 +0200
Message-ID: <20230825054449.2315061-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825054449.2315061-1-f_l_k@t-online.de>
References: <20230825054449.2315061-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692942302-EAFF4029-A55D09A1/0/0 CLEAN NORMAL
X-TOI-MSGID: 76faa304-a120-40db-b0d2-2c9f6b60b49b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 05:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104596

https://gitlab.freedesktop.org/libdecor/libdecor/-/commit/bb2ec856aa2ffe3=
0530d6b655d9accec53bbf87d

The check for conflicting symbols has been fixed and thus the nasty hack =
can be removed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ....c-dont-skip-for-conflicting-symbols.patch | 33 -------------------
 .../libdecor/libdecor_0.1.99.bb               |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libdecor/libdecor/0001-libde=
cor-gtk.c-dont-skip-for-conflicting-symbols.patch

diff --git a/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk=
.c-dont-skip-for-conflicting-symbols.patch b/meta-oe/recipes-graphics/lib=
decor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patc=
h
deleted file mode 100644
index 9ecbdf3b37..0000000000
--- a/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont=
-skip-for-conflicting-symbols.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From fb6eb15b34b5b07a431bb4c3585341411a3e088f Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Tue, 28 Feb 2023 13:42:18 +0100
-Subject: [PATCH] libdecor-gtk.c: dont skip for conflicting_symbols
-
-This is a hack that should be removed, once the underlying bug in glibc =
was fixed and
-libdecor was updated to use dlmopen() instead of dlopen()
-
-https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/47
-https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/44
-
----
-Upstream-Status: Pending
-
- src/plugins/gtk/libdecor-gtk.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/plugins/gtk/libdecor-gtk.c b/src/plugins/gtk/libdecor-g=
tk.c
-index 228161e..fd91afb 100644
---- a/src/plugins/gtk/libdecor-gtk.c
-+++ b/src/plugins/gtk/libdecor-gtk.c
-@@ -2606,7 +2606,7 @@ libdecor_plugin_description =3D {
- 	.priorities =3D priorities,
- 	.constructor =3D libdecor_plugin_new,
- 	.conflicting_symbols =3D {
--		"png_free",
-+		//"png_free",
- 		NULL,
- 	},
- };
---=20
-2.34.1
-
diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb b/meta-=
oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
index ed0b05f41f..078058e8ba 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7ae2be7fb16371=
41840314b51970a9f7"
=20
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/libdecor/libdecor.git;protocol=3Dhttps;=
branch=3Dmaster \
-    file://0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch \
 "
=20
 DEPENDS =3D " \
@@ -16,7 +15,7 @@ DEPENDS =3D " \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "a254d0c2ff0cbfcf0bbf14cc67cc403640880c01"
+SRCREV =3D "0d63d125f899dbb1b932468f2f3b911f9c121e58"
=20
 PACKAGECONFIG ?=3D "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk+3', =
d)}"
=20
--=20
2.41.0


