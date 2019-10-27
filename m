Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id EEA147FA81
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id c22so7273842wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=w21x7sXeIFmnXxi7GviOWNJF3P8o9m0ceG9hI4ADcVs=;
	b=vSbT6RXDNiZISh5extIYlnKGqqASKIRkjWzGFoox0V98Zm1YoFBnyq9F1C+dkXXrF/
	I0/TzRlZzqddOUr1KDFdjpVWmiv6EV/JvjlAPzkQPFVp6AA9qcf2j9k4KXF6Wjr7nNaN
	j33RvHAyeS+6EBmx0kRuPX0aNRGE/surxUEMQMZC90VIoG0NherAf5zWqfFLrg3ma89F
	GeX9Kq8tNcFMLLDRhVNPdwIq2FMLHy3Ezj2OyIGOVzpdfXvfhPWcO0Tf0bqcTp3x4h2J
	zssVlisuYK/IORYx4fnfU18ivDl93KwBxCQwgTAhzoMisuuGUcm8SeUxn+v6Ra4mMgCs
	Cphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=w21x7sXeIFmnXxi7GviOWNJF3P8o9m0ceG9hI4ADcVs=;
	b=ophXl8Q2xnh0VqMCi0H1uNBam7SuIZpAAyXnJrr9HlsYm/3Z7aUWgdXEWztumraIdb
	12df4WtwtZRtpsqiCe7KPkMSpJpnrbZpKEppRJBOqMrKZ/zDMly1L1dHcX5iBPCKqXYN
	F3MTylP5UC4bUiDRDNKcPkhebfhz8K6riNFneMiCyFh78bIry1vSWNEqWl0V1jKNCeRy
	Xq4IEoD1WfyVxoUaEGhK8CE8yhMPRJEGfsYrqQah6BK+71s09ncDQdlQxOFObJ36r1Op
	N64ChWmwxFfK6tTwCz1YSvORKtJVjC10ziwBPsaMcUM/xOLhRP5w/D5ca3t7jvxnquu0
	GlBg==
X-Gm-Message-State: APjAAAV94oX9xtMpbb8XpOVwhGCJI1W9QwU5iRw9IG1N6gAKmSCvI1O4
	zEXESh6EsgSKlbpg6NrXYLJZBygC
X-Google-Smtp-Source: APXvYqzQinRnI7EWJ4v02nhchxJ/G4hneOfSxJAaJsPObXptMbCzWBFgTP3+nmedyplqA/vMaxg9kg==
X-Received: by 2002:a1c:7719:: with SMTP id t25mr12678462wmi.56.1572219375401; 
	Sun, 27 Oct 2019 16:36:15 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:43 +0100
Message-Id: <20191027233545.4146-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/19] gnome-system-monitor: upgrade 3.32.0 -> 3.32.1
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* pack help files optionally
* add upstream-version-is-even to inherit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...t-build-help-we-do-not-have-yelp-yet.patch | 30 -------------------
 ...32.0.bb => gnome-system-monitor_3.32.1.bb} |  8 ++---
 2 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_3.32.0.bb => gnome-system-monitor_3.32.1.bb} (64%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
deleted file mode 100644
index f2e720e9e..000000000
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c6649fdcfb2f44807089741557f8e527ab9751e4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Sun, 24 Mar 2019 02:46:07 +0100
-Subject: [PATCH] Do not build help - we do not have yelp yet
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [embedded-specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index d60ced7..6a0ab4b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -183,7 +183,6 @@ subdir('data')
- subdir('po')
- subdir('scripts')
- subdir('src')
--subdir('help')
- 
- 
- message('\n'.join(['',
--- 
-2.20.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb
similarity index 64%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb
index 8930e1222..a9cbf22d7 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb
@@ -3,7 +3,6 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = " \
-    itstool-native \
     gnome-common-native \
     libxml2-native \
     glib-2.0-native \
@@ -15,13 +14,12 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gconf gtk-icon-cache distro_features_check gettext
+inherit gnomebase gnome-help itstool gtk-icon-cache distro_features_check gettext upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit"
 
-SRC_URI[archive.md5sum] = "6c2c5c5bf8f15d3e6985faacbd3055dd"
-SRC_URI[archive.sha256sum] = "af00c4a42dd1db17d9abe88edb11c7751b20982db1a8a2a467bab206fd8a77e3"
-SRC_URI += "file://0001-Do-not-build-help-we-do-not-have-yelp-yet.patch"
+SRC_URI[archive.md5sum] = "37356a1b8c20939adc6f47f739d2e49a"
+SRC_URI[archive.sha256sum] = "48c131335091bd927862f40ef56400f997981df2acfc82abea662bf91a1ea4f1"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
-- 
2.21.0


