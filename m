Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 50829786C1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:49 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id c24so16219223wrc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rw4+m2rnPfR7sTe7MeNBGlIkQCWyTliDhLajEGLLW4Q=;
	b=NHWG/2LzWqHj3Q7JpmTv/OHB5VVXZ65rueFSEx4fA7nY2kFHGAF3eTZj4cgMmOcISU
	n4dxyaqPhMImS59wJ2hv3rg6PuvKCPzilyoHMH0TsbiAIzdqpEz1yCbuSnFhFyV/Qu9q
	mqn2aKOY67yOXc/s77mEqKAtOgG/NTtPtfs0V0vk4U/ayHMJN5BimWAol8bQmX68JJgx
	Z5np/V9X0wYQghholRR1M0tLw6ZRb0KFAyubxvYnQAJgtUnB+uhzPaIDX7bGmnifH2BK
	Fs1IasJzVeg3WHyziDMmIJv30j8occheDPaffCOstyfFg5IbpQ/3LeFBPN1IC2X7ievJ
	jCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rw4+m2rnPfR7sTe7MeNBGlIkQCWyTliDhLajEGLLW4Q=;
	b=rjMOAZzsC7DiZibB/WXd6NS65qHa+vOQb6TjGnVLChUey6MdIeLVBqp5SOAHCLRyn5
	qXFyRboKUvj/f/y5UrYSXVYS7343O1+EQ50IFKbK8L7YVAsTLK0x4H3lPzpMmiSA/27m
	f0477tXQ5zcud1/QLtH6pd+KdWz00Sa0cg1bXRfwCKegmJ0AzgyIfLTDHQg+v6GV+QRq
	gM1RZWWPRs4++G13C1YVJTQg6A/AjrS0l1ORIKplMKrCfJBll/MW9s2HJ7mkteMFfa7D
	QoeTID6rHhxWYEDfzbI9ZLoGbFHX/LlNT9/Y/tWhIAnf6T3oQmUkP6CWQvj0c/YHWzQY
	o0Ew==
X-Gm-Message-State: AElRT7FyKaJ8zbJ6sEjLh6vlGHs+wlmEmR9oJlcnGy+W7ECKQupoZmun
	GA4mNItFCCL4J8RJNnSTCh13Bw==
X-Google-Smtp-Source: AG47ELvN6jM2vg5ENge4XcNN8eaIbmmbVq8CEIonjZ5qmOj/5C0eMdUY9FKmEejPh1yAH0a8Mb7t0A==
X-Received: by 10.223.196.132 with SMTP id m4mr30577603wrf.9.1521981350071;
	Sun, 25 Mar 2018 05:35:50 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:20 +0200
Message-Id: <20180325123520.16452-21-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 20/20] xdg-user-dirs: 0.15 -> 0.17
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* This version ships autostart by default -> our file can go
* man pages are not build if disable-documentation is configured so
  0001-...patch can go

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...disable-man-generation-disable-documentat.patch | 31 ----------------------
 .../xdg-user-dirs/files/xdg-user-dirs.desktop      |  9 -------
 .../xdg-user-dirs/xdg-user-dirs_0.15.bb            | 25 -----------------
 .../xdg-user-dirs/xdg-user-dirs_0.17.bb            | 16 +++++++++++
 4 files changed, 16 insertions(+), 65 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch
 delete mode 100644 meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
 delete mode 100644 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
 create mode 100644 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb

diff --git a/meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch b/meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch
deleted file mode 100644
index b2b0e4998..000000000
--- a/meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 41093d9634bfeddcaec866745d8d4022f4c6f8c1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 19 Feb 2017 21:01:39 +0100
-Subject: [PATCH] explicitly disable man generation --disable-documentation is
- not enough
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index c01c54f..dcdf7a2 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,6 +1,6 @@
- NULL =
- 
--SUBDIRS=po man
-+SUBDIRS=po
- 
- INCLUDES =					\
- 	-I$(top_srcdir)				\
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop b/meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
deleted file mode 100644
index a9a22d3be..000000000
--- a/meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
+++ /dev/null
@@ -1,9 +0,0 @@
-[Desktop Entry]
-Type=Application
-Name=User folders update
-Exec=xdg-user-dirs-update
-StartupNotify=false
-NoDisplay=true
-X-GNOME-Autostart-Phase=Initialization
-X-KDE-autostart-phase=1
-
diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
deleted file mode 100644
index c05675976..000000000
--- a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "xdg-user-dirs is a tool to help manage user directories like the desktop folder and the music folder"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI = " \
-    http://user-dirs.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
-    file://0001-explicitly-disable-man-generation-disable-documentat.patch \
-    file://xdg-user-dirs.desktop \
-"
-SRC_URI[md5sum] = "f5aaf5686ad7d8809a664bfb4566a54d"
-SRC_URI[sha256sum] = "20b4a751f41d0554bce3e0ce5e8d934be98cc62d48f0b90a894c3e1916552786"
-
-inherit autotools gettext
-
-EXTRA_OECONF = "--disable-documentation"
-
-do_install_append () {
-    install -d ${D}${sysconfdir}/xdg/autostart
-    install -m 644 ${WORKDIR}/xdg-user-dirs.desktop ${D}${sysconfdir}/xdg/autostart
-}
-
-CONFFILES_${PN} += " \
-    ${sysconfdir}/xdg/user-dirs.conf \
-    ${sysconfdir}/xdg/user-dirs.defaults \
-"
diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb
new file mode 100644
index 000000000..e3ce9268c
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "xdg-user-dirs is a tool to help manage user directories like the desktop folder and the music folder"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://user-dirs.freedesktop.org/releases/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "e0564ec6d838e6e41864d872a29b3575"
+SRC_URI[sha256sum] = "2a07052823788e8614925c5a19ef5b968d8db734fdee656699ea4f97d132418c"
+
+inherit autotools gettext
+
+EXTRA_OECONF = "--disable-documentation"
+
+CONFFILES_${PN} += " \
+    ${sysconfdir}/xdg/user-dirs.conf \
+    ${sysconfdir}/xdg/user-dirs.defaults \
+"
-- 
2.14.3


