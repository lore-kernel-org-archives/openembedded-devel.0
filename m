Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA4DC54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 11:56:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.20726.1709639770746574345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 03:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout01.t-online.de (Postfix) with SMTP id 9572A2601F
	for <openembedded-devel@lists.openembedded.org>; Tue,  5 Mar 2024 12:56:08 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.242]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rhTOt-0Zhskk0; Tue, 5 Mar 2024 12:56:03 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] polkit: update 123 -> 124
Date: Tue,  5 Mar 2024 12:56:13 +0100
Message-ID: <20240305115613.1149738-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305115613.1149738-1-f_l_k@t-online.de>
References: <20240305115613.1149738-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709639763-CBFFCDC7-C4213E99/0/0 CLEAN NORMAL
X-TOI-MSGID: 4e332da2-4e01-4942-9fb0-dded632f1988
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 11:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109119

- support for mozjs-115 was added, remove the patch
- update 0001-polkit.service.in-disable-MemoryDenyWriteExecute.patch
- include missing files to avoid:

ERROR: polkit-124-r0 do_package: QA Issue: polkit: Files/directories were=
 installed but not shipped in any package:
  /usr/lib/pam.d
  /usr/lib/sysusers.d
  /usr/lib/pam.d/polkit-1
  /usr/lib/sysusers.d/polkit.conf
Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
---
 .../0001-jsauthority-Bump-mozjs-to-115.patch  | 26 -------------------
 ...ce.in-disable-MemoryDenyWriteExecute.patch | 11 +++-----
 .../polkit/{polkit_123.bb =3D> polkit_124.bb}   | 13 +++++++---
 3 files changed, 14 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-jsauthori=
ty-Bump-mozjs-to-115.patch
 rename meta-oe/recipes-extended/polkit/{polkit_123.bb =3D> polkit_124.bb=
} (89%)

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-jsauthority-Bump=
-mozjs-to-115.patch b/meta-oe/recipes-extended/polkit/polkit/0001-jsautho=
rity-Bump-mozjs-to-115.patch
deleted file mode 100644
index 163a03cfc..000000000
--- a/meta-oe/recipes-extended/polkit/polkit/0001-jsauthority-Bump-mozjs-=
to-115.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2f0de2a831ab106fce210c1d65baef041256bc18 Mon Sep 17 00:00:00 2001
-From: Xi Ruoyao <xry111@xry111.site>
-Date: Mon, 18 Sep 2023 01:53:04 +0800
-Subject: [PATCH] jsauthority: Bump mozjs to 115
-
-No code change is needed!
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/=
-/commit/b340f50b7bb963863ede7c63f9a0b5c50c80c1e1]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 3b96562..92b68fd 100644
---- a/meson.build
-+++ b/meson.build
-@@ -153,7 +153,7 @@ if js_engine =3D=3D 'duktape'
-   func =3D 'pthread_condattr_setclock'
-   config_h.set('HAVE_' + func.to_upper(), cc.has_function(func, prefix =
: '#include <pthread.h>'))
- elif js_engine =3D=3D 'mozjs'
--  js_dep =3D dependency('mozjs-102')
-+  js_dep =3D dependency('mozjs-115')
-=20
-   _system =3D host_machine.system().to_lower()
-   if _system.contains('freebsd')
diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-polkit.service.i=
n-disable-MemoryDenyWriteExecute.patch b/meta-oe/recipes-extended/polkit/=
polkit/0001-polkit.service.in-disable-MemoryDenyWriteExecute.patch
index 9a097274a..4f008f7a9 100644
--- a/meta-oe/recipes-extended/polkit/polkit/0001-polkit.service.in-disab=
le-MemoryDenyWriteExecute.patch
+++ b/meta-oe/recipes-extended/polkit/polkit/0001-polkit.service.in-disab=
le-MemoryDenyWriteExecute.patch
@@ -1,4 +1,4 @@
-From 046d853818f18bac5df4dfc007151e06fd64a5b3 Mon Sep 17 00:00:00 2001
+From 95148a804be66092564f81306a02f625d5b8a5d0 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sun, 17 Sep 2023 23:26:59 +0200
 Subject: [PATCH] polkit.service.in: disable MemoryDenyWriteExecute
@@ -16,11 +16,11 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/data/polkit.service.in b/data/polkit.service.in
-index 2113ff7..42dfd90 100644
+index e6db351..4390cce 100644
 --- a/data/polkit.service.in
 +++ b/data/polkit.service.in
-@@ -14,7 +14,7 @@ Group=3D@polkitd_user@
- IPAddressDeny=3Dany
+@@ -12,7 +12,7 @@ ExecStart=3D@libprivdir@/polkitd --no-debug
+ User=3D@polkitd_user@
  LimitMEMLOCK=3D0
  LockPersonality=3Dyes
 -MemoryDenyWriteExecute=3Dyes
@@ -28,6 +28,3 @@ index 2113ff7..42dfd90 100644
  NoNewPrivileges=3Dyes
  PrivateDevices=3Dyes
  PrivateNetwork=3Dyes
---=20
-2.41.0
-
diff --git a/meta-oe/recipes-extended/polkit/polkit_123.bb b/meta-oe/reci=
pes-extended/polkit/polkit_124.bb
similarity index 89%
rename from meta-oe/recipes-extended/polkit/polkit_123.bb
rename to meta-oe/recipes-extended/polkit/polkit_124.bb
index df9d25e9f..3eb0d5280 100644
--- a/meta-oe/recipes-extended/polkit/polkit_123.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_124.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbaf=
a7532b41f390409283eb"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/polkit/polkit.git;protocol=3Dh=
ttps;branch=3Dmaster \
            file://0001-polkit.service.in-disable-MemoryDenyWriteExecute.=
patch \
-           file://0001-jsauthority-Bump-mozjs-to-115.patch \
            "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "fc8b07e71d99f88a29258cde99b913b44da1846d"
+SRCREV =3D "82f0924dc0eb23b9df68e88dbaf9e07c81940a5a"
=20
 DEPENDS =3D "expat glib-2.0"
=20
@@ -51,4 +50,12 @@ do_install:append() {
 	chown polkitd:root ${D}/${sysconfdir}/polkit-1/rules.d
 }
=20
-FILES:${PN} +=3D "${libdir}/polkit-1 ${nonarch_libdir}/polkit-1 ${datadi=
r}"
+FILES:${PN} +=3D " \
+	${libdir}/pam.d/polkit-1 \
+	${libdir}/sysusers.d \
+	${libdir}/polkit-1 \
+	${nonarch_libdir}/pam.d/polkit-1 \
+	${nonarch_libdir}/sysusers.d \
+	${nonarch_libdir}/polkit-1 \
+	${datadir} \
+"
--=20
2.43.0


