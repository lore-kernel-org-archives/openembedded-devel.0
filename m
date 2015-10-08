Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3BC65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 06:23:20 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so10352363wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Oct 2015 23:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=feK8ZUwtvv4FcyNZl0yc2EBITC6bkAog3pwjYUCTWEY=;
	b=AgF+t7ZYwmn7QmDPRqGRGDBSEdXhBrhQnMS++OxTwzY8B5GozFH6pmhW9gqReZm0IQ
	PWXuFH69BxJsWjzv9FtqOIg1+qHEFlas4tjbvfJ1uNKHAYJLj8Uug0Hlx5EPPFvThctN
	6QvaJ+qHNT5OWFEY3u7qaooadnjvY9oqEReVl9h41SE6+Z5vvW5Vz5qoW1tnvVqDEXVM
	rSetf+0YU5PFu+8Z3GQ5/RtZj9A7rWWrN3Zl7/a3t81QRZ2t+oyrT7q5YQgl8cHrgM56
	vbOtVmjNNpjvFKLbP16+yk+sj0XwLv7G0JeEeYml/HP52r4aUYej4ndR5BuN5BFqg78J
	nxAg==
X-Received: by 10.194.87.129 with SMTP id ay1mr5365741wjb.110.1444285400468;
	Wed, 07 Oct 2015 23:23:20 -0700 (PDT)
Received: from localhost.localdomain (p5B0A29DA.dip0.t-ipconnect.de.
	[91.10.41.218]) by smtp.googlemail.com with ESMTPSA id
	h7sm43893269wjz.7.2015.10.07.23.23.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Oct 2015 23:23:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Oct 2015 08:23:03 +0200
Message-Id: <1444285384-21338-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 1/2] openbox: fix sporadic race on compile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2015 06:23:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| make: creating data/xsession/openbox-gnome-session
| make: creating data/xsession/openbox-session
| make: creating data/xsession/openbox-kde-session
| make: creating data/autostart/openbox-autostart
| make: creating doc/openbox.1
| make: creating data/autostart/autostart
| make: creating doc/openbox-session.1
| make: creating doc/openbox-gnome-session.1
| make: creating doc/openbox-kde-session.1
| make: creating doc/obxprop.1
| mkdir: cannot create directory './data/autostart': File exists
| Makefile:4329: recipe for target 'data/autostart/autostart' failed

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-avoid-race-when-creating-autostart-direc.patch | 54 ++++++++++++++++++++++
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb  |  5 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/openbox/files/0001-Makefile.am-avoid-race-when-creating-autostart-direc.patch

diff --git a/meta-oe/recipes-graphics/openbox/files/0001-Makefile.am-avoid-race-when-creating-autostart-direc.patch b/meta-oe/recipes-graphics/openbox/files/0001-Makefile.am-avoid-race-when-creating-autostart-direc.patch
new file mode 100644
index 0000000..2762e1c
--- /dev/null
+++ b/meta-oe/recipes-graphics/openbox/files/0001-Makefile.am-avoid-race-when-creating-autostart-direc.patch
@@ -0,0 +1,54 @@
+From 6bbde84a2197c97e49d9e64118a979728209e436 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 23 Sep 2015 23:21:42 +0200
+Subject: [PATCH] Makefile.am: avoid race when creating autostart directories
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fixes:
+
+| make: creating data/xsession/openbox-gnome-session
+| make: creating data/xsession/openbox-session
+| make: creating data/xsession/openbox-kde-session
+| make: creating data/autostart/openbox-autostart
+| make: creating doc/openbox.1
+| make: creating data/autostart/autostart
+| make: creating doc/openbox-session.1
+| make: creating doc/openbox-gnome-session.1
+| make: creating doc/openbox-kde-session.1
+| make: creating doc/obxprop.1
+| mkdir: cannot create directory './data/autostart': File exists
+| Makefile:4329: recipe for target 'data/autostart/autostart' failed
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ Makefile.am | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index f25bf8e..306e77d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -505,14 +505,12 @@ edit = $(SED) \
+ 
+ data/autostart/autostart: $(top_srcdir)/data/autostart/autostart.in Makefile
+ 	@echo make: creating $@
+-	@test -d $(shell dirname $(top_builddir)/$@) || \
+-	  mkdir $(shell dirname $(top_builddir)/$@)
++	mkdir -p $(shell dirname $(top_builddir)/$@)
+ 	@$(edit) $< >$(top_builddir)/$@
+ 
+ data/autostart/openbox-autostart: $(top_srcdir)/data/autostart/openbox-autostart.in Makefile
+ 	@echo make: creating $@
+-	@test -d $(shell dirname $(top_builddir)/$@) || \
+-	  mkdir $(shell dirname $(top_builddir)/$@)
++	mkdir -p $(shell dirname $(top_builddir)/$@)
+ 	@$(edit) $< >$(top_builddir)/$@
+ 
+ %.desktop: %.desktop.in Makefile
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index 44afed2..9f42177 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -4,7 +4,10 @@ DEPENDS = "glib-2.0 pango libxml2 virtual/libx11 libcroco librsvg gdk-pixbuf"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "http://icculus.org/openbox/releases/openbox-${PV}.tar.gz"
+SRC_URI = " \
+    http://icculus.org/openbox/releases/openbox-${PV}.tar.gz \
+    file://0001-Makefile.am-avoid-race-when-creating-autostart-direc.patch \
+"
 
 SRC_URI[md5sum] = "b72794996c6a3ad94634727b95f9d204"
 SRC_URI[sha256sum] = "8b4ac0760018c77c0044fab06a4f0c510ba87eae934d9983b10878483bde7ef7"
-- 
2.1.0


