Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 275F97E6EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:11 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t2so14153966wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lCJ1RYCtIQIYeHkJAKF06MpAOx+tLmYqJ7Q2kfQJfxo=;
	b=OgqeS8JU7GMPqsxX4hVaRD0IFKCm2JHgre1rANFbBwAmjJXE6F1R04h+IG2DDr4qmk
	C9jvLPwsV+5mwbNhbMSxoxCt2AbE8tnmFXeVhK6M45lj7ZbueqjxA0/RksAzfNqxgxBN
	PqN8kBwO77/yTSya3UE7U0RkGsP4ZgRjYJuwKboE83E4sRrMBttgpnBt+LnNUEUJIIVH
	JsEq1qUaJMsyM6AgcGcXte813cm+sK5BZDkllJAioQmKt4nAg4NgNWYG4GcDEu3jmpNE
	wE1tUHhwaQlTin9pmSFMKnpTd8KFtQ/RzF9AWMwBvD3xmbm3cV1yknVIM18AnSqqDQbo
	nNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lCJ1RYCtIQIYeHkJAKF06MpAOx+tLmYqJ7Q2kfQJfxo=;
	b=Q9SeroI/VK9HU6hLtLxx2CAHc8nkd7dS02tk/NAh7MAtkGylunacLLfS8lor2Y6f+l
	by5+OzZ70faDK0XI/wUbhl/Spvf6u2OK9lFM6Vv76LnAxHPcGOYepoK2LrMzWywKqdw0
	HwIpJEoQSvkxj3aNL174NutDY5FSEPNAOHVJWHNkHmQsO61i/l7AF8tl9VgiAV+T9o8N
	rOZgUar5U/KrFFqsU0rOJ7lzYXX8rZD8pufcABOI7izj9JN2UgkoR/pL2faNNWaQ8ihC
	LJI1H5FVLRABdz7+cCqkhx1XSWDzdGt045VzECaJg9LjhnpBPKgVBvXFhJgmHVk/A2R+
	cx9Q==
X-Gm-Message-State: APjAAAUTmeAv2C4dzmr2RenMqFc+dwAyZg3u1sdIito2gTnECVJ7jhdx
	EPVP+xARK7jJnCxpZJd4q4c0nwkO
X-Google-Smtp-Source: APXvYqwCIMS6PimIKhwRlLkHGQ9zYOVGt/KHtwxkQYC7IrtOy/+zj34fTzZCf/soFkakoexgm+zwbw==
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr28466683wrh.371.1575851951889; 
	Sun, 08 Dec 2019 16:39:11 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:30 +0100
Message-Id: <20191209003840.3383-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 19/29] gnome-panel: (re)add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is required for gnome-flashback

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...nd-ZONEINFO-it-tries-to-run-compiled.patch | 37 +++++++++++++++++++
 .../gnome-panel/gnome-panel_3.34.1.bb         | 28 ++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
new file mode 100644
index 000000000..6ab4daf02
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
@@ -0,0 +1,37 @@
+From d4b2f0922dfdd6040e5e9f62a2565452cf855c42 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 21 Oct 2019 22:10:56 +0200
+Subject: [PATCH] Do not try to find ZONEINFO - it tries to run compiled code
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Missing configutation does not cause issues: The fallback in modules/clock/system-timezone.c
+matches our default.
+
+Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c75a9fa..0c9d945 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -249,11 +249,6 @@ dnl yelp-tools stuff
+ 
+ YELP_HELP_INIT
+ 
+-dnl **************************************************************************
+-dnl Find zoneinfo directory
+-dnl **************************************************************************
+-
+-AX_ZONEINFO
+ 
+ dnl **************************************************************************
+ dnl Process .in files
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
new file mode 100644
index 000000000..4d5fdb65a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
@@ -0,0 +1,28 @@
+SUMMARY = "GNOME flashback panel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit gnomebase gsettings itstool gnome-help gtk-icon-cache gtk-doc gettext upstream-version-is-even features_check
+
+REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam"
+
+DEPENDS += " \
+    yelp-tools-native \
+    libwnck3 \
+    polkit \
+    dconf \
+    libgweather \
+    gnome-menus3 \
+    gnome-desktop3 \
+    gdm \
+"
+
+SRC_URI[archive.md5sum] = "cfd5d3fd548a2afdd8bd3bbdf9646bbd"
+SRC_URI[archive.sha256sum] = "a6bc0255252eeb4b964bcbe55fd7908b69f914c062c5ec8dff5ac0262d29b90d"
+SRC_URI += " \
+    file://0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch \
+"
+
+PACKAGECONFIG[eds] = "--enable-eds,--disable-eds,evolution-data-server"
+
+RDEPENDS_${PN} += "gdm-base"
-- 
2.21.0


