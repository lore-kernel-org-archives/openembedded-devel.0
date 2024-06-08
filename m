Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0972CC25B76
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 22:24:00 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.7344.1717885432922198285
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Jun 2024 15:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=hO81y47G;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20240608222349d57810120c3c0eba31-yceaxv@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20240608222349d57810120c3c0eba31
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 09 Jun 2024 00:23:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=eHPYsw9CDnI+ttHVTqdREQo9ga8hTm4jvtiyCWQG/94=;
 b=hO81y47GfFtmXi00yo5vabbAquO5lymFPF7yoqgaK9nXpEEosmIMD2LFn+V91eMEP7i8Vc
 U4YTVYuxz0ImRpcJYEAy2vMNB3h6WdbNVgk81g5llriDGLespfP//IeHewMl8z4oMyhMI2t5
 28Hkp0DRtKCfOGUcd100gAMVWfB+c=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-gnome][kirkstone][PATCH] gnome-shell: correct regression with glib-2.0 fix for CVE-2024-34397
Date: Sun,  9 Jun 2024 00:22:49 +0200
Message-Id: <20240608222249.52754-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 22:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110781

From: Peter Marko <peter.marko@siemens.com>

Backport fix to work with new glib-2.0.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...orrect-expected-bus-name-for-streams.patch | 38 +++++++++++++++++++
 .../gnome-shell/gnome-shell_42.0.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screencast-Correct-expected-bus-name-for-streams.patch

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screencast-Correct-expected-bus-name-for-streams.patch b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screencast-Correct-expected-bus-name-for-streams.patch
new file mode 100644
index 0000000000..a4178b87e0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screencast-Correct-expected-bus-name-for-streams.patch
@@ -0,0 +1,38 @@
+From 50a011a19dcc6997ea6173c07bb80b2d9888d363 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Mon, 6 May 2024 21:58:09 +0100
+Subject: [PATCH] screencast: Correct expected bus name for streams
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Previously, this only worked because GDBusConnection was not filtering
+signals by their sender correctly (GNOME/glib#3268).
+
+Thanks: Alicia Boya García
+Signed-off-by: Simon McVittie <smcv@debian.org>
+Part-of: <https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/3303>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-shell/-/commit/50a011a19dcc6997ea6173c07bb80b2d9888d363]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ js/dbusServices/screencast/screencastService.js | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/dbusServices/screencast/screencastService.js b/js/dbusServices/screencast/screencastService.js
+index d664a51b083..0645811fa0a 100644
+--- a/js/dbusServices/screencast/screencastService.js
++++ b/js/dbusServices/screencast/screencastService.js
+@@ -166,7 +166,7 @@ var Recorder = class {
+             });
+ 
+         this._streamProxy = new ScreenCastStreamProxy(Gio.DBus.session,
+-            'org.gnome.ScreenCast.Stream',
++            'org.gnome.Mutter.ScreenCast',
+             streamPath);
+ 
+         this._streamProxy.connectSignal('PipeWireStreamAdded',
+-- 
+2.30.2
+
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb
index f54d966c73..b58058ed86 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.0.bb
@@ -33,6 +33,7 @@ REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 
 SRC_URI[archive.sha256sum] = "33d404fb3c93b9de42984f0110a2969d6a4a7247c27fe7f5e24c67ecfec75094"
 SRC_URI += "file://0001-Introduce-options-gjs_path-to-optionally-set-path-to.patch"
+SRC_URI += "file://0002-screencast-Correct-expected-bus-name-for-streams.patch"
 
 PACKAGECONFIG ??= "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[bluetooth] = ",,gnome-bluetooth"
-- 
2.30.2


