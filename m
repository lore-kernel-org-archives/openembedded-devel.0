Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A6FC88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 10:20:40 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19793.1789467631948121790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 03:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=KYjNcmIF;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout08.t-online.de (Postfix) with SMTP id 992CBE14A
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 12:20:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6QH2-0GNEZ60; Tue, 15 Sep 2026 12:20:24 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] localsearch: fix a build race on the generated D-Bus header
Date: Tue, 15 Sep 2026 12:20:16 +0200
Message-ID: <20260915102017.5106-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789467624-D57F99A7-6BC60D98/0/0 CLEAN NORMAL
X-TOI-MSGID: f5b55514-527e-4364-bcc3-6ad5ff489bb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789467629; i=f_l_k@t-online.de;
	bh=8p1D57VYWSQ3W+i05m8r6env2rpfBrrtb88UUITz/Xg=;
	h=From:To:Subject:Date;
	b=KYjNcmIFUNvYF1enPFDtKnxg8YmelWhD6JSFHiMfEGCtd5r1l2SxUs/bp5DmYxUkB
	 3h9gAVD0VmjPsuP7C64Ey6nFjmasyIa6MIUs56AEE+3+xCnmvm5MVgS8fvNd06NHdF
	 RSZkkIU/vvBjTwxBpzgGNJbqq3eOj4OuVwiFpUc4scflj21qeDQYiopwA5w3hdZR2V
	 QwTxdUGq0fqWPEAyZuRNdr9Dpxk/gdffwBHGwYSFEAUTuta25sq6tUpP27ti7Bf+Eq
	 rFBlXX/V3vvyySa5jGXfbFEqgbEEawFwny3UXrfnuV2NXQ05cwYTpIPV+uSM0unIWu
	 09AwwpckBM1Sg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 10:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130068

tracker_miner_dep only lists the generated enum types header in its
sources, so targets that merely use the dependency - the localsearch-3
executable among them - get no build order edge to the gdbus-codegen
output. In a parallel build tracker-application.c is then compiled
before tracker-dbus-interface.h exists and the build fails.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...the-generated-D-Bus-header-as-a-depe.patch | 37 +++++++++++++++++++
 .../tracker/localsearch_3.12.0.bb             |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/tracker/localsearch/0002-ind=
exer-declare-the-generated-D-Bus-header-as-a-depe.patch

diff --git a/meta-gnome/recipes-gnome/tracker/localsearch/0002-indexer-de=
clare-the-generated-D-Bus-header-as-a-depe.patch b/meta-gnome/recipes-gno=
me/tracker/localsearch/0002-indexer-declare-the-generated-D-Bus-header-as=
-a-depe.patch
new file mode 100644
index 0000000000..5d73ade638
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/localsearch/0002-indexer-declare-t=
he-generated-D-Bus-header-as-a-depe.patch
@@ -0,0 +1,37 @@
+From 717698ec1be791092ff3ffb7791205eafbe6c75b Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 15 Sep 2026 11:24:59 +0200
+Subject: [PATCH] indexer: declare the generated D-Bus header as a depend=
ency
+ source
+
+tracker_miner_dep only lists the generated enum types header in its
+sources, so targets that merely use the dependency - the localsearch-3
+executable among them - get no build order edge to the gdbus-codegen
+output. In a parallel build tracker-application.c can therefore be
+compiled before tracker-dbus-interface.h exists:
+
+  tracker-application.c:25:10: fatal error: tracker-dbus-interface.h:
+  No such file or directory
+
+Add the header to the declared sources.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ src/indexer/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/indexer/meson.build b/src/indexer/meson.build
+index 9ea9cff..cf9fbae 100644
+--- a/src/indexer/meson.build
++++ b/src/indexer/meson.build
+@@ -48,7 +48,7 @@ libtracker_miner_private =3D static_library(
+ )
+=20
+ tracker_miner_dep =3D declare_dependency(
+-    sources: miner_fs_enums[1],
++    sources: [miner_fs_enums[1], indexer_dbus_sources[1]],
+     link_with: libtracker_miner_private,
+     include_directories: include_directories('.')
+ )
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.12.0.bb b/met=
a-gnome/recipes-gnome/tracker/localsearch_3.12.0.bb
index e9cb1ff10a..d0ac0d575b 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.12.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.12.0.bb
@@ -16,6 +16,7 @@ inherit gnomebase gsettings gobject-introspection vala =
bash-completion features_
=20
 SRC_URI:append =3D " \
 	file://0001-build-add-an-option-to-disable-the-uninstalled-helper.patch=
 \
+	file://0002-indexer-declare-the-generated-D-Bus-header-as-a-depe.patch =
\
 "
 SRC_URI[archive.sha256sum] =3D "4bf45440ce7a899f2eca4d20343d31fc620fa2a3=
fe53bb929de244305330e930"
=20
--=20
2.55.0


