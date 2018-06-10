Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3D89976085
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:48 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id z6-v6so12697291wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8FO+99dw1U0tWjXP9+yokM0MbpJnVYfIZUBjE8zA98g=;
	b=tl4VN7ZtKuxfWDZSAXJIFVmlLI7Jn//yG5oFdCMIiHKNCQeuKrxDNpSryCAD7Cr+Nq
	3cR4Kp8b/TlkskL9D1yPmlVAlkociWEIqWV/nn0kqG7ykIkFzhnLxEFgM8G2aND3Y/A/
	VNUufi/9BaXj6zv/Ua5A3F1B0O8spiMCyc6kIKz9vhIN0Bj6BFSu+a0ui3q7PZPor1nH
	tbJ/86SBOGb67M85xJvRn+lDaBk9zfkASnHR2FjGOzwlDPBerl88WeaVvWYfa67qF0Uf
	wb9pG7tusRpZxOK4nLHVQ4X4NOQYZCwwgD9r6lH457BDPHrTFhsMHG1q9k8Ui3v8CgZH
	6tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8FO+99dw1U0tWjXP9+yokM0MbpJnVYfIZUBjE8zA98g=;
	b=TLn3IuMKjl8mEtcT0JJ908lplBe7SfNmLCRhkSQSO68sqenMNutEswcK7fbYBrnm9q
	GaGpoaiyVz7OG/M3GaplP1M+/aGiv8rNtoJdcr5BrniVGfdBQKTdEycTV6IiflTZpZj5
	qd9M6iSRXKsCWT0uGMfZj4UsO8yqTj5e9actMgHp8zqE2lK4tsAxj4P90dt29kLNw7ME
	460dWg90B1sk0w+J3fLtiFKP5Uo5TMw6nJgjpvAQ+xGcQYjF3JYbWWDEobuy6IMFjQRo
	Qo/f3M8H+xhL2sNnwxS30+1E2MeVPWY6xXLTjrVztz35Mvwd1TtqYvCCbXid9sThwuzK
	L0ug==
X-Gm-Message-State: APt69E1BUyVwzWSHs3K93DTCk9fO6xqviOpwC0ArebHRS9QcJi0etZ+f
	PuLNUMN2jHfFqbzf7/+mnXUp9A==
X-Google-Smtp-Source: ADUXVKKtJZZowKXpzqx44uXElBzZlXAugh/aWoe2KpOGPL3lA7OjMiSuTUsD64Uj7n3inuuSa2tg3Q==
X-Received: by 2002:a1c:124f:: with SMTP id 76-v6mr6174758wms.29.1528643328703;
	Sun, 10 Jun 2018 08:08:48 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:08 +0200
Message-Id: <20180610150821.9536-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 06/19] xfce4-settings: fix build after update of xfconf
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Jun 2018 15:08:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0002-Fix-linking-to-dbus-glib-bug-13633.patch  | 41 ++++++++++++++++++++++
 .../xfce4-settings/xfce4-settings_git.bb           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0002-Fix-linking-to-dbus-glib-bug-13633.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0002-Fix-linking-to-dbus-glib-bug-13633.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/0002-Fix-linking-to-dbus-glib-bug-13633.patch
new file mode 100644
index 000000000..109b7b145
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/0002-Fix-linking-to-dbus-glib-bug-13633.patch
@@ -0,0 +1,41 @@
+From b6e46e6a84e45f7bd954687be703987825a54c1e Mon Sep 17 00:00:00 2001
+From: Eric Koegel <eric.koegel@gmail.com>
+Date: Sun, 11 Jun 2017 11:38:26 +0300
+Subject: [PATCH] Fix linking to dbus-glib (bug #13633)
+
+With xfconf moving to GDBus nothing provides the libs for dbus-glib
+that xfce4-settings requires. This patch adds the libs back in until
+settings can be ported to GDBus.
+
+Signed-off-by: Sean Davis <smd.seandavis@gmail.com>
+
+Upstream-Status: Backport
+---
+ xfce4-settings-editor/Makefile.am | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/xfce4-settings-editor/Makefile.am b/xfce4-settings-editor/Makefile.am
+index 5964366..c2c7c4b 100644
+--- a/xfce4-settings-editor/Makefile.am
++++ b/xfce4-settings-editor/Makefile.am
+@@ -28,6 +28,7 @@ xfce4_settings_editor_CFLAGS = \
+ 	$(LIBXFCE4UTIL_CFLAGS) \
+ 	$(LIBXFCE4UI_CFLAGS) \
+ 	$(XFCONF_CFLAGS) \
++	$(DBUS_GLIB_CFLAGS) \
+ 	$(PLATFORM_CFLAGS)
+ 
+ xfce4_settings_editor_LDFLAGS = \
+@@ -39,7 +40,8 @@ xfce4_settings_editor_LDADD = \
+ 	$(DBUS_GLIB_LIBS) \
+ 	$(LIBXFCE4UTIL_LIBS) \
+ 	$(LIBXFCE4UI_LIBS) \
+-	$(XFCONF_LIBS)
++	$(XFCONF_LIBS) \
++	$(DBUS_GLIB_LIBS)
+ 
+ desktopdir = $(datadir)/applications
+ desktop_in_files = xfce4-settings-editor.desktop.in
+-- 
+2.14.3
+
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index bf9bd3102..d937653fa 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -15,6 +15,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = " \
     git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.3 \
     file://0001-xsettings.xml-Set-default-themes.patch \
+    file://0002-Fix-linking-to-dbus-glib-bug-13633.patch \
 "
 SRCREV = "b701ac8b66b83c17469dd5009da51eeb59eba442"
 S = "${WORKDIR}/git"
-- 
2.14.3


