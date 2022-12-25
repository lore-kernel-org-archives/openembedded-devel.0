Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27CAC4167B
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 14:45:23 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.118480.1671979513832159817
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout05.t-online.de (Postfix) with SMTP id 1059D3412
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 15:45:11 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.127]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p9SFS-0QN2np0; Sun, 25 Dec 2022 15:45:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-xfce][PATCH] thunar-shares-plugin: add backport patch to fix build after xfce update
Date: Sun, 25 Dec 2022 15:45:02 +0100
Message-Id: <20221225144502.2559419-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671979510-E77DC07E-2059B9F8/0/0 CLEAN NORMAL
X-TOI-MSGID: 75f64603-e5cb-4abc-9284-58ad190de1ce
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 14:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100228

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...d-Bump-GLib-minimum-required-to-2.26.patch | 30 +++++++++++++++++++
 .../shares/thunar-shares-plugin_0.3.1.bb      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-xfce/recipes-thunar-plugins/shares/thunar-shares=
-plugin/0001-build-Bump-GLib-minimum-required-to-2.26.patch

diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin=
/0001-build-Bump-GLib-minimum-required-to-2.26.patch b/meta-xfce/recipes-=
thunar-plugins/shares/thunar-shares-plugin/0001-build-Bump-GLib-minimum-r=
equired-to-2.26.patch
new file mode 100644
index 000000000..7b1f01915
--- /dev/null
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin/0001-b=
uild-Bump-GLib-minimum-required-to-2.26.patch
@@ -0,0 +1,30 @@
+From e4bce21a1bd744ccfde84de4669ac30aa1d72135 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Ga=3DC3=3DABl=3D20Bonithon?=3D <gael@xfce.org>
+Date: Fri, 2 Dec 2022 20:18:46 +0100
+Subject: [PATCH] build: Bump GLib minimum required to 2.26
+
+This is the minimum required to build since xfce4-dev-tools >=3D 4.17.1
+set GLIB_VERSION_MAX_ALLOWED to the GLib version found in
+configure.ac.
+
+MR: !3
+
+Upstream-Status: Backport
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a458785..bc6d24c 100644
+@@ -66,7 +66,7 @@
+ dnl Packages checks
+ dnl -------------------------------------------------------
+ XDT_CHECK_PACKAGE([GTK], [gtk+-3.0], [3.22.0])
+-XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.18.0])
++XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.26.0])
+ XDT_CHECK_PACKAGE([THUNARX], [thunarx-3], [1.0.1])
+=20
+ dnl -------------------------------------------------------
+--=20
+2.34.1
+
diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin=
_0.3.1.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_=
0.3.1.bb
index fb7589637..f39c843dc 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.=
bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.=
bb
@@ -7,6 +7,7 @@ inherit thunar-plugin features_check
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "pam"
=20
+SRC_URI +=3D "file://0001-build-Bump-GLib-minimum-required-to-2.26.patch=
"
 SRC_URI[md5sum] =3D "0884855d60cf1031b9013b6f5b125372"
 SRC_URI[sha256sum] =3D "dc1d8c7caa727e76d033d4653dc0742613f57a1711d00509=
00659c90a84452a0"
=20
--=20
2.34.1


