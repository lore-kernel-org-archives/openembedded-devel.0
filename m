Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkLI-0004oZ-BB
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:44:16 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2042856wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PhqvZnPS81lHLm7oXQhcLDtNbneZqsrw5btqGyHhe1Q=;
	b=vk2X3a+ztsgakENGXFuifh+32STVPNtcKw00xD8gd89/P+iveVBY05RHhfdX+vPpZS
	j3YKI7tmkxkEvpxJxPiFrFtSvHe+SEGYBntiFvEm+wZmBEgXxpDrJxzUYEkzVYqfCBH1
	mZQQKxFztAwfxf/p4Eew9NnyR5VCfMAnIFBY4KC0tPswdRUCpdKRAo+DLsZsP/U5GiZQ
	StrBUzrzFM/xk4/MQvgb1l2D79k+ncB03C/2ig53EPhVlPAdaGJM4sGHDEfSmzs/MplS
	qU2VV5DKKvX3IhSgcgxIxWCgdTWGizNJA37lPl+CRxowkelReXCX2wlhVz0ldZUdJZIJ
	AhCQ==
Received: by 10.180.104.230 with SMTP id gh6mr12638931wib.22.1335767677101;
	Sun, 29 Apr 2012 23:34:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ea6sm26400850wib.5.2012.04.29.23.34.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:34:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:07 +0200
Message-Id: <3c2d95022b62adf82216f05ef5749d4aaf22bddf.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/16] gpsd: remove RPATH from binaries instead of replacing it with redundant /usr/lib
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
X-List-Received-Date: Mon, 30 Apr 2012 06:44:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gpsd/gpsd/0004-SConstruct-remove-rpath.patch   |   41 ++++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |    1 +
 2 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0004-SConstruct-remove-rpath.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0004-SConstruct-remove-rpath.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0004-SConstruct-remove-rpath.patch
new file mode 100644
index 0000000..add624b
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/0004-SConstruct-remove-rpath.patch
@@ -0,0 +1,41 @@
+From b59f8c5bf8519a5ca114696e79b8690ebb68e0d3 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 24 Apr 2012 16:24:35 +0200
+Subject: [PATCH 4/4] SConstruct: remove rpath
+
+* even with correct prefix (without DESTDIR) included it's redundant
+  WARNING: QA Issue: libgps:
+  /work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/packages-split/libgps/usr/lib/libgps.so.20.0
+  contains probably-redundant RPATH /usr/lib
+* and with prefix from scons.bbclass it's invalid
+  WARNING: QA Issue: package libgps contains bad RPATH
+  /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/image/usr/lib
+  in file
+  /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/packages-split/libgps/usr/lib/libgps.so.20.0
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ SConstruct |    7 +++++--
+ 1 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 0cf5799..3c919fc 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -1152,8 +1152,11 @@ if qt_env:
+ 
+ # We don't use installdir here in order to avoid having DESTDIR affect the rpath
+ if env["shared"]:
+-    env.AddPostAction(binaryinstall, '$CHRPATH -r "%s" "$TARGET"' \
+-                      % (installdir('libdir', False), ))
++    if env['sysroot']:
++        env.AddPostAction(binaryinstall, '$CHRPATH -d "$TARGET"')
++    else:
++        env.AddPostAction(binaryinstall, '$CHRPATH -r "%s" "$TARGET"' \
++                         % (installdir('libdir', False), ))
+ 
+ if not env['debug'] and not env['profiling'] and env['strip']:
+     env.AddPostAction(binaryinstall, '$STRIP $TARGET')
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index fae3492..0796c34 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch \
   file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
+  file://0004-SConstruct-remove-rpath.patch \
   file://gpsd-default \
   file://gpsd \
   file://60-gpsd.rules \
-- 
1.7.8.6



