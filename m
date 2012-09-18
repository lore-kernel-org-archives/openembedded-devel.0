Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDyls-0001lE-VY
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:29 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=/PCGCgfl7lXvJE5J7NUyapIWa8ODkIKBosTF+JmUtNg=;
	b=y3U2K121AvvKEZO2cGi9FVz7ompwHAB4kwY6GWcYZtclF8h1JDkACE7JTGTcGp0syr
	xKCe+KCFFn96OHGTL8WAXqhjt8dwoi/QaAjk3IE1+ovTjfcjfSYshSBdfbVRmVfbfuOG
	jFj/pRYGzs1m6xJO+eIJ1+ik60r3D/0QgQaP+ZLjYHrAgz7jZ7qaVVnen6flpFD5XfUd
	eJ/ZoBzonqb3PNN2yAfz5xjag02ZFr9HD81zp+x81o9foi4/laR00uFAWagI/knwkb8k
	IPZXZMzkgiTjRv4aMlc0gyzelFt3PKJze4e8oCL3fT+Ye/ACQ9MPFApj5bhFVWZnak+X
	FLig==
Received: by 10.204.157.8 with SMTP id z8mr181461bkw.58.1347977691237;
	Tue, 18 Sep 2012 07:14:51 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:06 +0200
Message-Id: <1347977601-28665-26-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 25/40] xfce4-screenshooter: update to 1.8.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 14:27:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/0001-Fix-panel-plugin-build.patch        |   43 ++++++++++++++++++++
 ...ooter_1.8.0.bb => xfce4-screenshooter_1.8.1.bb} |   11 ++---
 2 files changed, 48 insertions(+), 6 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.8.0.bb => xfce4-screenshooter_1.8.1.bb} (58%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch b/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch
new file mode 100644
index 0000000..c30f9cb
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch
@@ -0,0 +1,43 @@
+From 08053be7adc6d4a83191efed735c3f565bcbcf1f Mon Sep 17 00:00:00 2001
+From: Samuli Suominen <ssuominen@gentoo.org>
+Date: Sat, 5 May 2012 17:13:45 +0200
+Subject: [PATCH] Fix panel plugin build.
+
+- Don't use a versioned library.
+- Build as a module.
+- Only export needed symbols.
+---
+Upstream-status: applied
+ Makefile.am |   12 +++++++++---
+ 1 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 45100fd..d0c0adb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -132,13 +132,19 @@ panel_plugin_libscreenshooterplugin_la_CFLAGS =	\
+ 	@SOUP_CFLAGS@
+ 
+ panel_plugin_libscreenshooterplugin_la_LDFLAGS = \
++	-avoid-version \
++	-module \
++	-no-undefined \
++	-export-symbols-regex '^xfce_panel_module_(preinit|init|construct)' \
++	$(PLATFORM_LDFLAGS)
++
++panel_plugin_libscreenshooterplugin_la_LIBADD = \
+ 	@EXO_LIBS@ \
+ 	@LIBXFCE4PANEL_LIBS@ \
+ 	@GTHREAD_LIBS@ \
+ 	@SOUP_LIBS@ \
+-	@LIBXFCE4UI_LIBS@
+-
+-panel_plugin_libscreenshooterplugin_la_LIBADD = lib/libscreenshooter.la
++	@LIBXFCE4UI_LIBS@ \
++	lib/libscreenshooter.la
+ 
+ panel_plugin_libscreenshooterplugin_la_SOURCES = \
+ 	panel-plugin/screenshooter-plugin.c
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
similarity index 58%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
index 2362b8a..b05c298 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
@@ -5,12 +5,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
 DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11"
 
-PR = "r0"
-
 inherit xfce-app
 
-FILES_${PN} += "${datadir}/xfce4/panel-plugins/*"
-FILES_${PN}-dbg += "${libexecdir}/xfce4/panel-plugins/.debug"
+SRC_URI += "file://0001-Fix-panel-plugin-build.patch"
+SRC_URI[md5sum] = "d0ffea2052a8e70154cf13789070711f"
+SRC_URI[sha256sum] = "40419892bd28989315eed053c159bba0f4264ed8c6c6738806024e481eab9492"
 
-SRC_URI[md5sum] = "b51ab5725418e7258273c4a6402adb02"
-SRC_URI[sha256sum] = "68748a42ae68c5a8e9ed1c14ec5c741a344ab30b5b325b8812220539548ad83e"
+FILES_${PN} += "${datadir}/xfce4/panel/plugins \
+		${libdir}/xfce4/panel/plugins"
-- 
1.7.6.5



