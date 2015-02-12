Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 60FEE733B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:23 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id l18so12881316wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=9M9nllnt1w8YyT84z0OEfcw1btgZXNMv+qFRyKnYRaI=;
	b=pTYrDlNfxixBR0OrC6AlP9uKiS9j+OUTcdcUPQ3KyrhHKrTENjiw/jNHDcmmblqM6t
	WQ5RcnM596l8mi/fmauk6GfybPfw5ITD4TOw1I20G437zsP6q8yaz8RTlLqogCCQNQAY
	iK9Y2Frpq0ld3pv8V2B2hzao2I5VDanaf45I44jM4orh7tM28gtTGbACsiVaZOkFWX/b
	NE6YtWSdFLNOlQ6DhhImN7TXJOnkM4+Uf/lNPaikXPR4zJYlqUesss0eVQ519/6dnWrs
	dp26axPKksfcCuklWokMXcS4roPkLqrMlbiZFQ5REmw0Ae1qLS8Dutt1vPynb/q2gFys
	sllA==
X-Received: by 10.194.8.2 with SMTP id n2mr11868000wja.46.1423776144153;
	Thu, 12 Feb 2015 13:22:24 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:23 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:48 +0100
Message-Id: <1423776119-14981-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/19] xfce4-screenshooter: update to 1.8.2
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0001-Fix-panel-plugin-build.patch was applied mainline

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/0001-Fix-panel-plugin-build.patch        | 43 ----------------------
 ...ooter_1.8.1.bb => xfce4-screenshooter_1.8.2.bb} | 12 +++---
 2 files changed, 7 insertions(+), 48 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.8.1.bb => xfce4-screenshooter_1.8.2.bb} (59%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch b/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch
deleted file mode 100644
index 98ce875..0000000
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 08053be7adc6d4a83191efed735c3f565bcbcf1f Mon Sep 17 00:00:00 2001
-From: Samuli Suominen <ssuominen@gentoo.org>
-Date: Sat, 5 May 2012 17:13:45 +0200
-Subject: [PATCH] Fix panel plugin build.
-
-- Don't use a versioned library.
-- Build as a module.
-- Only export needed symbols.
----
-Upstream-Status: applied
- Makefile.am |   12 +++++++++---
- 1 files changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 45100fd..d0c0adb 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -132,13 +132,19 @@ panel_plugin_libscreenshooterplugin_la_CFLAGS =	\
- 	@SOUP_CFLAGS@
- 
- panel_plugin_libscreenshooterplugin_la_LDFLAGS = \
-+	-avoid-version \
-+	-module \
-+	-no-undefined \
-+	-export-symbols-regex '^xfce_panel_module_(preinit|init|construct)' \
-+	$(PLATFORM_LDFLAGS)
-+
-+panel_plugin_libscreenshooterplugin_la_LIBADD = \
- 	@EXO_LIBS@ \
- 	@LIBXFCE4PANEL_LIBS@ \
- 	@GTHREAD_LIBS@ \
- 	@SOUP_LIBS@ \
--	@LIBXFCE4UI_LIBS@
--
--panel_plugin_libscreenshooterplugin_la_LIBADD = lib/libscreenshooter.la
-+	@LIBXFCE4UI_LIBS@ \
-+	lib/libscreenshooter.la
- 
- panel_plugin_libscreenshooterplugin_la_SOURCES = \
- 	panel-plugin/screenshooter-plugin.c
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb
similarity index 59%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb
index 0e2e327..ae19492 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.2.bb
@@ -7,13 +7,15 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
-SRC_URI += "file://0001-Fix-panel-plugin-build.patch"
-SRC_URI[md5sum] = "d0ffea2052a8e70154cf13789070711f"
-SRC_URI[sha256sum] = "40419892bd28989315eed053c159bba0f4264ed8c6c6738806024e481eab9492"
+SRC_URI[md5sum] = "3a32ecc5566453a58f6a4ddd70649444"
+SRC_URI[sha256sum] = "9dce2ddfaa87f703e870e29bae13f3fc82a1b3f06b44f8386640e45a135f5f69"
 
 do_compile_prepend() {
 	mkdir -p lib
 }
 
-FILES_${PN} += "${datadir}/xfce4/panel/plugins \
-        ${libdir}/xfce4/panel/plugins"
+FILES_${PN} += " \
+    ${datadir}/appdata \
+    ${datadir}/xfce4/panel/plugins \
+    ${libdir}/xfce4/panel/plugins \
+"
-- 
1.9.3


