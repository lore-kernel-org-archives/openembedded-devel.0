Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA0DC25B74
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 21:35:34 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.3440.1715290526077970084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 14:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UwGQjBlx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20240509213523222db41c3a0f762a38-n7u8t8@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240509213523222db41c3a0f762a38
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 09 May 2024 23:35:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qePIJjUl7nsr1E6a5GNaDdKP7lYDnHNkGHmQI1cRUkA=;
 b=UwGQjBlxLYBaaJcXgVXolcQGHZqxqavWXOSz2XcY5vcFiXpfTb0fkFLyF3SH5m6NNBPKe+
 SKiIRI25HQmSXpyxH/5BS5cHRavXcKGlPKvIL2RUerCHri7Qkv6T1UwHk2FWS/25TyQkuocd
 9nsA7BsQsLb9wrK7t7FWM+mqYLSHM=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-gnome][scarthgap][PATCH] gnome-shell: correct regression with glib-2.0 2.78.5
Date: Thu,  9 May 2024 23:34:34 +0200
Message-Id: <20240509213434.704361-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 21:35:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110297

From: Peter Marko <peter.marko@siemens.com>

Backport fix to work with new glib-2.0.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...orrect-expected-bus-name-for-streams.patch | 38 +++++++++++++++++++
 .../gnome-shell/gnome-shell_46.1.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screencast-Correct-expected-bus-name-for-streams.patch

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screencast-Correct-expected-bus-name-for-streams.patch b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screencast-Correct-expected-bus-name-for-streams.patch
new file mode 100644
index 0000000000..736594716a
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
+@@ -340,7 +340,7 @@ class Recorder extends Signals.EventEmitter {
+                 });
+ 
+             this._streamProxy = new ScreenCastStreamProxy(Gio.DBus.session,
+-                'org.gnome.ScreenCast.Stream',
++                'org.gnome.Mutter.ScreenCast',
+                 streamPath);
+ 
+             this._streamProxy.connectSignal('PipeWireStreamAdded',
+-- 
+2.30.2
+
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb
index ed86cbcb6a..1bc9b6b394 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb
@@ -34,6 +34,7 @@ REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 
 SRC_URI[archive.sha256sum] = "64f999844c101e63bf294d45b138de56319ad2f326282721aad0fa860653b369"
 SRC_URI += "file://0001-Introduce-options-gjs_path-to-optionally-set-path-to.patch"
+SRC_URI += "file://0002-screencast-Correct-expected-bus-name-for-streams.patch"
 
 PACKAGECONFIG ??= "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[bluetooth] = ",,gnome-bluetooth"
-- 
2.30.2


