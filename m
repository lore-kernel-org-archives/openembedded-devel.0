Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 919317FC23
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:32 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id d16so15107474wre.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lCJ1RYCtIQIYeHkJAKF06MpAOx+tLmYqJ7Q2kfQJfxo=;
	b=U2uL1d9d8xhgQT3TFnf/tA/4u1IhA7kWqkaw8R6mwr9WkNArSbaPTZjujslAuOe4tT
	AHc8q1DDhomps89erygLA7piisSs3FJQ0tO5FiUJkuBP/2Tvza1U8JeNasYBS5L5I0Oe
	dbjRE3Vh3XCVTJX18+Rr7m++R8wh9ZzYQ2trJHQIjfp2/QGFjkikDyv9toW03vPxNXyp
	VaNUd2KZhVcRTzmAv7BAXTRHbS+MrXXWLbRLLRvobpJWow8vxM/xId3ZxT0fjfmhlbz0
	nXsDcDOfIgJyhlOSXeZZei78b8oqKrtdMtoedRmqeTLif/P3zzvHar3G4ECM31GdzJ8i
	9cZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lCJ1RYCtIQIYeHkJAKF06MpAOx+tLmYqJ7Q2kfQJfxo=;
	b=XZ/xyGCevRnu83cM8KT4UMHRMhN5n1/tzII5co7R3NEZV6JKlFKkCoQ/iGFNEzbPyt
	FWaxvtnA90GS2ICcwMz50/8KcgOIefKZis9ktaWgpstKY48vQMQU3tthDu5q17NPECtz
	LJ74njtCH8MZ2e/XEx9s19zJrgAjXTrMt3+ITSqjyp15LqiWV5ga8n8Us6wIzrajfuTE
	5+7HncxwtFRlmwockvYwWVHrVXaW+MX4Tu6wLq8zcR/hqmOG00oG6kD966vlJHQ1+VgP
	JELVROY5gbVT1565FknpDA6vPI535gYUFKHtfz57eoPtTFa0/5KSn2IZnQQTHexz7S8X
	FWsA==
X-Gm-Message-State: APjAAAUgGfQmlHR9F6UvmmDSOPbA+Mh+S22UJKOypaG4NtQd8NC95N0A
	7IKcXnWQqvdQUOp1oju556sIvVX/
X-Google-Smtp-Source: APXvYqwK1WoUIJRRUG66ZHsQEeXSW2sfQ8xVxRH/nfDjGOm2cftQRymEqjO8RLkXwIDJ+nUUxqTy/g==
X-Received: by 2002:adf:c746:: with SMTP id b6mr681094wrh.298.1575880592708;
	Mon, 09 Dec 2019 00:36:32 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:02 +0100
Message-Id: <20191209083612.23922-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 10/20] gnome-panel: (re)add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:32 -0000
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


