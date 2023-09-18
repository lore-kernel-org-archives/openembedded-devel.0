Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37970CD13CF
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 01:26:09 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.42674.1695000366865666929
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 18:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout01.t-online.de (Postfix) with SMTP id 598D821F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 03:25:38 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qi317-2nb5Hd0; Mon, 18 Sep 2023 03:25:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] polkit: upgrade 122 -> 123
Date: Mon, 18 Sep 2023 03:25:42 +0200
Message-ID: <20230918012542.13650-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695000337-1301F931-3B80CFD7/0/0 CLEAN NORMAL
X-TOI-MSGID: 0e3d62a9-ebc8-4d3b-a0fa-3f2d78bd9ccc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 01:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104920

- Add a patch to disable an offensive hardening option
  that causes polkit to segfault

- better safety with deeper resctiction of the configuration files
- better safety with restricting the daemon's owner under systemd
- better safety with the systemd unit sandboxing
- less thread races during upload of the configuration

- glib, gobject, gio >=3D 2.32
- mozjs-102 OR duktape
- gobject-introspection >=3D 0.6.2 (optional)
- pam (optional)
- ConsoleKit OR systemd
- gettext
- meson

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ce.in-disable-MemoryDenyWriteExecute.patch | 33 +++++++++++++++++++
 .../polkit/{polkit_122.bb =3D> polkit_123.bb}   |  7 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-polkit.se=
rvice.in-disable-MemoryDenyWriteExecute.patch
 rename meta-oe/recipes-extended/polkit/{polkit_122.bb =3D> polkit_123.bb=
} (89%)

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-polkit.service.i=
n-disable-MemoryDenyWriteExecute.patch b/meta-oe/recipes-extended/polkit/=
polkit/0001-polkit.service.in-disable-MemoryDenyWriteExecute.patch
new file mode 100644
index 000000000..9a097274a
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0001-polkit.service.in-disab=
le-MemoryDenyWriteExecute.patch
@@ -0,0 +1,33 @@
+From 046d853818f18bac5df4dfc007151e06fd64a5b3 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sun, 17 Sep 2023 23:26:59 +0200
+Subject: [PATCH] polkit.service.in: disable MemoryDenyWriteExecute
+
+A few momths ago some hardening options have been added to polkit.servic=
e.in
+https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/177/diffs?=
commit_id=3Dafecbd53696e32bbadd60f431fc7d285f3edd265
+
+and polkitd segfaults with MemoryDenyWriteExecute=3Dyes, at least in my =
environment
+
+Upstream-Status: Inappropriate [needs further investigation]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ data/polkit.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/data/polkit.service.in b/data/polkit.service.in
+index 2113ff7..42dfd90 100644
+--- a/data/polkit.service.in
++++ b/data/polkit.service.in
+@@ -14,7 +14,7 @@ Group=3D@polkitd_user@
+ IPAddressDeny=3Dany
+ LimitMEMLOCK=3D0
+ LockPersonality=3Dyes
+-MemoryDenyWriteExecute=3Dyes
++#MemoryDenyWriteExecute=3Dyes
+ NoNewPrivileges=3Dyes
+ PrivateDevices=3Dyes
+ PrivateNetwork=3Dyes
+--=20
+2.41.0
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_122.bb b/meta-oe/reci=
pes-extended/polkit/polkit_123.bb
similarity index 89%
rename from meta-oe/recipes-extended/polkit/polkit_122.bb
rename to meta-oe/recipes-extended/polkit/polkit_123.bb
index 290640626..4fc23559f 100644
--- a/meta-oe/recipes-extended/polkit/polkit_122.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_123.bb
@@ -4,10 +4,13 @@ HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/=
polkit"
 LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f39040928=
3eb"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/polkit/polkit.git;protocol=3Dh=
ttps;branch=3Dmaster"
+SRC_URI =3D " \
+	git://gitlab.freedesktop.org/polkit/polkit.git;protocol=3Dhttps;branch=3D=
master \
+	file://0001-polkit.service.in-disable-MemoryDenyWriteExecute.patch \
+"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "da87c5698019897dd731bb2cbb54ebd9c9481f52"
+SRCREV =3D "fc8b07e71d99f88a29258cde99b913b44da1846d"
=20
 DEPENDS =3D "expat glib-2.0"
=20
--=20
2.41.0


