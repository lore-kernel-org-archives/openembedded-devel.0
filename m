Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpmM-0005XY-Ln
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:01:30 +0200
Received: by wibhq4 with SMTP id hq4so1198425wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Kr+1BZ827tU83MCs6J9b0V4PpSqYMOGL8D3fCO32UUE=;
	b=pbRQJ3b3QFsg9zyLBMvySoHQShhEryrYBnS6b6VSl+q63IccoSNZTZXzJghOTGQqs4
	uw4OyxzShJRSu6f5z4UYO74moFdSUfAAqtuMDJFoalTZBzU5krUb6J2vk6nNAOb2RtWt
	sOjJyav6EDcow9SOVhnhTELWepuFpdXSnHajFs5Qjz6TIcepeHP1qoguhRaL2pVlZTJo
	6GkHi+35zsf1Dmwzri5u2jtAHU+DxdEbVOv/D/jMsPj4KGxqeSE+sbKq20MIvcRLBjXW
	t3sCn0wIQx9ZQ0xqzo8nz1ZZu7OCwilp9ZmqAu94X7p/kUW+EeAjDNJ3d/hFC/tXanZr
	SULw==
Received: by 10.180.104.197 with SMTP id gg5mr6283371wib.9.1344606581155;
	Fri, 10 Aug 2012 06:49:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm11651989wib.8.2012.08.10.06.49.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:49:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:40 +0200
Message-Id: <25b00c3cb8888d4cfe99b1bc342ead35f2251c10.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 45/46] meta-efl: introduce 1.6.99-alpha releases
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
X-List-Received-Date: Fri, 10 Aug 2012 14:01:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass                    |    3 +
 meta-efl/recipes-efl/e17/expedite_1.2.0.bb         |   10 ----
 meta-efl/recipes-efl/e17/expedite_1.6.99-alpha.bb  |   12 +++++
 meta-efl/recipes-efl/e17/expedite_svn.bb           |    2 +-
 .../ecore-1.2.1/fix-ecore-fb-initialization.patch  |   41 ------------------
 meta-efl/recipes-efl/efl/ecore.inc                 |    2 +-
 ...01-ecore_exe-fix-compilation-on-fedora-18.patch |   45 --------------------
 meta-efl/recipes-efl/efl/ecore_1.2.1.bb            |   12 -----
 meta-efl/recipes-efl/efl/ecore_1.6.99-alpha.bb     |   13 ++++++
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edbus.inc                 |    4 ++
 meta-efl/recipes-efl/efl/edbus_1.2.0.bb            |   11 -----
 meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb     |   12 +++++
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    7 +---
 meta-efl/recipes-efl/efl/edje.inc                  |    5 +-
 meta-efl/recipes-efl/efl/edje_1.2.1.bb             |   10 ----
 meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb      |   12 +++++
 meta-efl/recipes-efl/efl/edje_svn.bb               |    6 +--
 meta-efl/recipes-efl/efl/eet.inc                   |    2 +-
 meta-efl/recipes-efl/efl/eet_1.6.1.bb              |   10 ----
 meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb       |   12 +++++
 meta-efl/recipes-efl/efl/eet_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/eeze.inc                  |    2 +-
 meta-efl/recipes-efl/efl/eeze_1.2.0.bb             |   10 ----
 meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb      |   12 +++++
 meta-efl/recipes-efl/efl/eeze_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/efreet.inc                |    2 +-
 meta-efl/recipes-efl/efl/efreet_1.2.0.bb           |   10 ----
 meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb    |   12 +++++
 meta-efl/recipes-efl/efl/efreet_svn.bb             |    4 +-
 meta-efl/recipes-efl/efl/eina_1.2.1.bb             |   10 ----
 meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb      |   12 +++++
 meta-efl/recipes-efl/efl/eina_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eio_1.0.1.bb              |   10 ----
 meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb       |   12 +++++
 meta-efl/recipes-efl/efl/eio_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/elementary.inc            |    4 +-
 meta-efl/recipes-efl/efl/elementary_1.0.1.bb       |   10 ----
 .../recipes-efl/efl/elementary_1.6.99-alpha.bb     |   12 +++++
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    3 +-
 meta-efl/recipes-efl/efl/embryo_1.2.0.bb           |   10 ----
 meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb    |   12 +++++
 meta-efl/recipes-efl/efl/embryo_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/emotion.inc               |    4 +-
 meta-efl/recipes-efl/efl/emotion_1.0.1.bb          |   10 ----
 meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb   |   12 +++++
 meta-efl/recipes-efl/efl/emotion_svn.bb            |    4 +-
 meta-efl/recipes-efl/efl/ethumb.inc                |    2 +-
 meta-efl/recipes-efl/efl/ethumb_1.0.1.bb           |   10 ----
 meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb    |   12 +++++
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |    2 +-
 .../recipes-efl/efl/evas-generic-loaders_1.2.0.bb  |   10 ----
 .../efl/evas-generic-loaders_1.6.99-alpha.bb       |   12 +++++
 .../recipes-efl/efl/evas-generic-loaders_svn.bb    |    2 +-
 meta-efl/recipes-efl/efl/evas.inc                  |    7 +++-
 meta-efl/recipes-efl/efl/evas_1.2.1.bb             |   10 ----
 meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb      |   12 +++++
 meta-efl/recipes-efl/efl/evas_svn.bb               |    9 +---
 58 files changed, 222 insertions(+), 286 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/expedite_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/e17/expedite_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ecore-1.2.1/fix-ecore-fb-initialization.patch
 delete mode 100644 meta-efl/recipes-efl/efl/ecore/0001-ecore_exe-fix-compilation-on-fedora-18.patch
 delete mode 100644 meta-efl/recipes-efl/efl/ecore_1.2.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/ecore_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.2.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.6.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.2.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.0.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.0.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.0.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.0.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-alpha.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.2.1.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 4708fdd..4213098 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,9 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
+SRCVER ?= "${PV}"
 
 EFL_SRCREV ?= "75097"
 
 ARM_INSTRUCTION_SET = "arm"
+
+S = "${WORKDIR}/${SRCNAME}-${SRCVER}"
diff --git a/meta-efl/recipes-efl/e17/expedite_1.2.0.bb b/meta-efl/recipes-efl/e17/expedite_1.2.0.bb
deleted file mode 100644
index c3890ff..0000000
--- a/meta-efl/recipes-efl/e17/expedite_1.2.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "e9dfdf3dc35fdbec189914e3960c9949"
-SRC_URI[sha256sum] = "533b18a823c8e417bd3b04db8d4f3ad7dcb4596e14397e38dd1788d39d98fe3d"
diff --git a/meta-efl/recipes-efl/e17/expedite_1.6.99-alpha.bb b/meta-efl/recipes-efl/e17/expedite_1.6.99-alpha.bb
new file mode 100644
index 0000000..ffe6546
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/expedite_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "fdd425395b8380b5c3b39186f9ef7ff3"
+SRC_URI[sha256sum] = "738eed02cefa2c57cb7ac0fc8103d1680b6d3a4a17d620dd5fc503b0128bf1a5"
diff --git a/meta-efl/recipes-efl/e17/expedite_svn.bb b/meta-efl/recipes-efl/e17/expedite_svn.bb
index 594de4a..06cf950 100644
--- a/meta-efl/recipes-efl/e17/expedite_svn.bb
+++ b/meta-efl/recipes-efl/e17/expedite_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.0+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/ecore-1.2.1/fix-ecore-fb-initialization.patch b/meta-efl/recipes-efl/efl/ecore-1.2.1/fix-ecore-fb-initialization.patch
deleted file mode 100644
index a2ce285..0000000
--- a/meta-efl/recipes-efl/efl/ecore-1.2.1/fix-ecore-fb-initialization.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From c36cd1201711560b914e567922903083c3b46ff1 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 29 Oct 2011 00:16:55 +0200
-Subject: [PATCH] ecore-fb: fix ts init
-
-Upstream-Status: Pending
-
-The whole ecore-fb init logic is somewhat flawed; with this patch we
-get at least a working touchscreen w/ tslib again.
-
-Signed-off-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/lib/ecore_fb/ecore_fb.c |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/src/lib/ecore_fb/ecore_fb.c b/src/lib/ecore_fb/ecore_fb.c
-index ca7d73d..5b99989 100644
---- a/src/lib/ecore_fb/ecore_fb.c
-+++ b/src/lib/ecore_fb/ecore_fb.c
-@@ -39,6 +39,9 @@ ecore_fb_init(const char *name __UNUSED__)
-    if (!ecore_fb_vt_init())
-       return --_ecore_fb_init_count;
- 
-+   if (!ecore_fb_ts_init())
-+      return --_ecore_fb_init_count;
-+
-    _ecore_fb_size_get(&_ecore_fb_console_w, &_ecore_fb_console_h);
- 
-    return _ecore_fb_init_count;
-@@ -59,6 +62,7 @@ ecore_fb_shutdown(void)
-    if (--_ecore_fb_init_count != 0)
-       return _ecore_fb_init_count;
- 
-+   ecore_fb_ts_shutdown();
-    ecore_fb_vt_shutdown();
- 
-    return _ecore_fb_init_count;
--- 
-1.7.7.1
-
diff --git a/meta-efl/recipes-efl/efl/ecore.inc b/meta-efl/recipes-efl/efl/ecore.inc
index 1c8da18..9faaf3a 100644
--- a/meta-efl/recipes-efl/efl/ecore.inc
+++ b/meta-efl/recipes-efl/efl/ecore.inc
@@ -10,7 +10,7 @@ DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
 inherit efl gettext
 
 BBCLASSEXTEND = "native"
-INC_PR = "r1"
+INC_PR = "r0"
 
 do_configure_prepend() {
     touch ${S}/po/Makefile.in.in || true
diff --git a/meta-efl/recipes-efl/efl/ecore/0001-ecore_exe-fix-compilation-on-fedora-18.patch b/meta-efl/recipes-efl/efl/ecore/0001-ecore_exe-fix-compilation-on-fedora-18.patch
deleted file mode 100644
index 613cf5e..0000000
--- a/meta-efl/recipes-efl/efl/ecore/0001-ecore_exe-fix-compilation-on-fedora-18.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 2ad957d5da1fc91faf7c2c6562139d19f29f5b9c Mon Sep 17 00:00:00 2001
-From: caro <caro@7cbeb6ba-43b4-40fd-8cce-4c39aea84d33>
-Date: Fri, 22 Jun 2012 05:36:00 +0000
-Subject: [PATCH] ecore_exe: fix compilation on fedora 18.
-
-setpriority needs sys/resource.h. See:
-
-http://linux.die.net/man/2/setpriority
-
-I let sys/time.h, it does not hurt on linux and is anyway needed for BSD systems.
-
-
-git-svn-id: svn+ssh://svn.enlightenment.org/var/svn/e/trunk@72684 7cbeb6ba-43b4-40fd-8cce-4c39aea84d33
----
- src/lib/ecore/ecore_exe.c |    7 ++-----
- 2 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/src/lib/ecore/ecore_exe.c b/src/lib/ecore/ecore_exe.c
-index 7931a96..6db32a9 100644
---- a/src/lib/ecore/ecore_exe.c
-+++ b/src/lib/ecore/ecore_exe.c
-@@ -2,11 +2,6 @@
- # include <config.h>
- #endif
- 
--#if defined (__FreeBSD__) || defined (__OpenBSD__) || defined (__NetBSD__)
--# include <sys/time.h>
--# include <sys/resource.h>
--#endif
--
- #include <stdlib.h>
- #include <stdio.h>
- #include <string.h>
-@@ -14,6 +9,8 @@
- #include <sys/types.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <sys/time.h>
-+#include <sys/resource.h>
- 
- #ifdef HAVE_SYS_PRCTL_H
- # include <sys/prctl.h>
--- 
-1.7.8.6
-
diff --git a/meta-efl/recipes-efl/efl/ecore_1.2.1.bb b/meta-efl/recipes-efl/efl/ecore_1.2.1.bb
deleted file mode 100644
index bec47a7..0000000
--- a/meta-efl/recipes-efl/efl/ecore_1.2.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-  file://fix-ecore-fb-initialization.patch \
-  file://0001-ecore_exe-fix-compilation-on-fedora-18.patch \
-"
-
-SRC_URI[md5sum] = "557f8411d323b14ed7bf1be368ab302a"
-SRC_URI[sha256sum] = "78d8374e5f901f1dd4c89e99508a5a3470b8a0cb2510ab5b7e45d670e6621ef8"
diff --git a/meta-efl/recipes-efl/efl/ecore_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/ecore_1.6.99-alpha.bb
new file mode 100644
index 0000000..33e3976
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ecore_1.6.99-alpha.bb
@@ -0,0 +1,13 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+  file://fix-ecore-fb-initialization.patch \
+"
+
+SRC_URI[md5sum] = "c40c25f2638677191bb95a628743209d"
+SRC_URI[sha256sum] = "8742fdcb725ac1494650577f75bbd36d3bf42d8d5c1f8d96a9d541f310a46c44"
diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index ad724d0..e00a0cc 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/edbus.inc b/meta-efl/recipes-efl/efl/edbus.inc
index cca9c5e..ae558f0 100644
--- a/meta-efl/recipes-efl/efl/edbus.inc
+++ b/meta-efl/recipes-efl/efl/edbus.inc
@@ -14,6 +14,8 @@ INC_PR = "r0"
 SRCNAME = "e_dbus"
 
 EXTRA_OECONF += "--enable-build-test-gui"
+# it needs to be disabled, because creates circular dependency on elementary
+EXTRA_OECONF += "--disable-edbus-performance-test"
 
 PACKAGES =+ "${PN}-enotify ${PN}-edbus ${PN}-enm ${PN}-ehal ${PN}-econnman ${PN}-eofono ${PN}-eukit ${PN}-ebluez ${PN}-test-gui"
 FILES_${PN}-enotify = "${libdir}/libenotify.so.* ${bindir}/e-notify-send"
@@ -25,3 +27,5 @@ FILES_${PN}-eofono = "${libdir}/libeofono.so.*"
 FILES_${PN}-eukit = "${libdir}/libeukit.so.*"
 FILES_${PN}-ebluez = "${libdir}/libebluez.so.*"
 FILES_${PN}-test-gui = "${bindir}/e_dbus_hal"
+FILES_${PN} += "${datadir}/e_dbus/logo.png"
+
diff --git a/meta-efl/recipes-efl/efl/edbus_1.2.0.bb b/meta-efl/recipes-efl/efl/edbus_1.2.0.bb
deleted file mode 100644
index 9137115..0000000
--- a/meta-efl/recipes-efl/efl/edbus_1.2.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-SRC_URI[md5sum] = "19dc0e43cd9defd5b8fdc7c8610bfe2c"
-SRC_URI[sha256sum] = "2f72b3710ae66604e37e6f6b20857caae9e2ddc7002fa402806dce14b6acbd4c"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb
new file mode 100644
index 0000000..7b56e12
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edbus_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "6833e32681db6630a4a50d98cf5cac88"
+SRC_URI[sha256sum] = "8810a40568df9c068c1606821f24a95fb409e0f99459a45b18ee07077f432cc2"
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index b99f79d..06cf950 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -1,16 +1,11 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
-# it needs to be disabled, because creates circular dependency on elementary
-EXTRA_OECONF += "--disable-edbus-performance-test"
-
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
-
-FILES_${PN} += "${datadir}/e_dbus/logo.png"
diff --git a/meta-efl/recipes-efl/efl/edje.inc b/meta-efl/recipes-efl/efl/edje.inc
index b3011b4..6f50ea8 100644
--- a/meta-efl/recipes-efl/efl/edje.inc
+++ b/meta-efl/recipes-efl/efl/edje.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Edje is the Enlightenment graphical design & layout library"
-DEPENDS = "lua5.1 eet evas ecore embryo edje-native eina libsndfile1"
+DEPENDS = "lua5.1 eet evas ecore embryo edje-native eina libsndfile1 eio"
 DEPENDS_virtclass-native = "lua5.1-native evas-native ecore-native eet-native embryo-native eina-native"
 DEPENDS_virtclass-nativesdk = "evas-native ecore-native eet-native embryo-native eina-native"
 # GPLv2 because of epp in PN-utils
@@ -60,6 +60,7 @@ FILES_${PN}-utils = "\
   ${datadir}/edje/include/edje.inc \
 "
 
-FILES_${PN} += "${libdir}/${PN}/modules/*/*/module.so"
+FILES_${PN} += "${libdir}/${PN}/modules/*/*/module.so \
+                ${datadir}/mime/packages/edje.xml"
 FILES_${PN}-dev += "${libdir}/${PN}/modules/*/*/module.la"
 FILES_${PN}-dbg += "${libdir}/${PN}/modules/*/*/.debug"
diff --git a/meta-efl/recipes-efl/efl/edje_1.2.1.bb b/meta-efl/recipes-efl/efl/edje_1.2.1.bb
deleted file mode 100644
index 8f22e50..0000000
--- a/meta-efl/recipes-efl/efl/edje_1.2.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "b9df053b327cb41d2de2485bd596bb44"
-SRC_URI[sha256sum] = "b793e98e9f65dfe7d007563e9d4cba84807a4473dfa9c94cdaee1ed9752cf6e0"
diff --git a/meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb
new file mode 100644
index 0000000..1ba83c0
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edje_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "b4c063f673394bda3f24b1a894001224"
+SRC_URI[sha256sum] = "4b8aeb5e59b493e9cfce30c91acf9b55f4774b417349c8291fda6e35265ee311"
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index 435b899..06cf950 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -1,15 +1,11 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS += "eio"
-
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
-
-FILES_${PN} += "${datadir}/mime/packages/edje.xml"
diff --git a/meta-efl/recipes-efl/efl/eet.inc b/meta-efl/recipes-efl/efl/eet.inc
index 089e92e..0f6a9fe 100644
--- a/meta-efl/recipes-efl/efl/eet.inc
+++ b/meta-efl/recipes-efl/efl/eet.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=da947f414a2ca4323245f1abb1980953"
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r1"
+INC_PR = "r0"
 
 EXTRA_OECONF = "\
   --enable-openssl \
diff --git a/meta-efl/recipes-efl/efl/eet_1.6.1.bb b/meta-efl/recipes-efl/efl/eet_1.6.1.bb
deleted file mode 100644
index 36894ea..0000000
--- a/meta-efl/recipes-efl/efl/eet_1.6.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "eaa6c1088b60d2177b57554690507eb7"
-SRC_URI[sha256sum] = "376056473e2d5d1873381b5782f50f7755ab8d1243f113f02c0e147f36203807"
diff --git a/meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb
new file mode 100644
index 0000000..39663f9
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eet_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "06a65f37117607ba24e4f4a9d3420f0a"
+SRC_URI[sha256sum] = "29b6717404131b30882ae5f7947f5705da972f07576ad4c6c6c378a7592b5f68"
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
index de8af5f..06cf950 100644
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ b/meta-efl/recipes-efl/efl/eet_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eeze.inc b/meta-efl/recipes-efl/efl/eeze.inc
index 1b0f489..5d523c9 100644
--- a/meta-efl/recipes-efl/efl/eeze.inc
+++ b/meta-efl/recipes-efl/efl/eeze.inc
@@ -6,7 +6,7 @@ DEPENDS = "ecore eet udev"
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r1"
+INC_PR = "r0"
 
 # Some upgrade path tweaking
 AUTO_LIBNAME_PKGS = ""
diff --git a/meta-efl/recipes-efl/efl/eeze_1.2.0.bb b/meta-efl/recipes-efl/efl/eeze_1.2.0.bb
deleted file mode 100644
index 9fb4e89..0000000
--- a/meta-efl/recipes-efl/efl/eeze_1.2.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "4a5a12514e8c2de5d88d31bf4c34cac4"
-SRC_URI[sha256sum] = "4df8ace51385ab15932c856b121b14fb93f2f5a87a08004078fdff5fee451cec"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb
new file mode 100644
index 0000000..4f8ecb4
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eeze_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "25c36ea710d61b2f6a732ec44f9f5dbb"
+SRC_URI[sha256sum] = "3440e11e9edbe234d207a8791a6c6502968ce642bd8d4821da77be71c11bd432"
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
index 720703e..06cf950 100644
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/efreet.inc b/meta-efl/recipes-efl/efl/efreet.inc
index 9aaeaa7..6c68526 100644
--- a/meta-efl/recipes-efl/efl/efreet.inc
+++ b/meta-efl/recipes-efl/efl/efreet.inc
@@ -3,7 +3,7 @@ DEPENDS = "ecore"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9594ec75c5a57e71fccedcbe10dd3ef4"
 
-inherit efl
+inherit efl gettext
 
 INC_PR = "r0"
 
diff --git a/meta-efl/recipes-efl/efl/efreet_1.2.0.bb b/meta-efl/recipes-efl/efl/efreet_1.2.0.bb
deleted file mode 100644
index d1c850a..0000000
--- a/meta-efl/recipes-efl/efl/efreet_1.2.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "20fc8b8d364f518adf6d92c2e31650f9"
-SRC_URI[sha256sum] = "cc23bfc65528e3bc7ba078db739653d95bd9b255d565b09745a161d338d699e4"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb
new file mode 100644
index 0000000..afe123a
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "d18062fb8831334323b00123fe93ac5b"
+SRC_URI[sha256sum] = "28372b8b3c064fc0f6c50964d1199aee28b06102d796c1546de7c7bf8d41b97c"
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index 503dc52..06cf950 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -1,9 +1,7 @@
 require ${BPN}.inc
 
-inherit gettext
-
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eina_1.2.1.bb b/meta-efl/recipes-efl/efl/eina_1.2.1.bb
deleted file mode 100644
index 4714db8..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.2.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "5dc2712b71f202d32c07394ad253a071"
-SRC_URI[sha256sum] = "013ee257f4be3acfb94ef3f2e5b06aedd48ed528e66833fb5e3ca71479912bea"
diff --git a/meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb
new file mode 100644
index 0000000..ba7bab3
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "b4fdbb79b92496829b921d46762344ac"
+SRC_URI[sha256sum] = "51a7799ba61036072be646e1fcaa742d9c5f39bb499155012bc177a9f561f2b5"
diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/efl/eina_svn.bb
index 720703e..06cf950 100644
--- a/meta-efl/recipes-efl/efl/eina_svn.bb
+++ b/meta-efl/recipes-efl/efl/eina_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eio_1.0.1.bb b/meta-efl/recipes-efl/efl/eio_1.0.1.bb
deleted file mode 100644
index 54a35a8..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "a079913877d79417bc06dfecbf57c949"
-SRC_URI[sha256sum] = "8a7079bf1e980e0d00fa9656e641e4a8a5aabf66986e76dcf06882ccf9623ed0"
diff --git a/meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb
new file mode 100644
index 0000000..f4de7af
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "741d2a2211a66cba0986b1dbcc12118f"
+SRC_URI[sha256sum] = "1d3cbbc48b0970a8b7327d1d74ca44bc0a6f5852e26d348bc9793421675ca23f"
diff --git a/meta-efl/recipes-efl/efl/eio_svn.bb b/meta-efl/recipes-efl/efl/eio_svn.bb
index eb28d9a..06cf950 100644
--- a/meta-efl/recipes-efl/efl/eio_svn.bb
+++ b/meta-efl/recipes-efl/efl/eio_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.0.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
index 50c708d..34338e8 100644
--- a/meta-efl/recipes-efl/efl/elementary.inc
+++ b/meta-efl/recipes-efl/efl/elementary.inc
@@ -1,11 +1,11 @@
 DESCRIPTION = "EFL based widget set for mobile devices"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10a051c72424b80bc784a3903651b43b"
-DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb poppler"
+DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb poppler eio"
 
 inherit efl gettext
 
-INC_PR = "r1"
+INC_PR = "r0"
 
 EXTRA_OECONF = "\
   --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
diff --git a/meta-efl/recipes-efl/efl/elementary_1.0.1.bb b/meta-efl/recipes-efl/efl/elementary_1.0.1.bb
deleted file mode 100644
index d4e3960..0000000
--- a/meta-efl/recipes-efl/efl/elementary_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "df978462103b1b6a5af374ea22296d80"
-SRC_URI[sha256sum] = "24af1521fee4a18e1039a908e5f9aefa2f767854c5075d06bb5d268cfde1e2be"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/elementary_1.6.99-alpha.bb
new file mode 100644
index 0000000..2351360
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "7509fb6bc2d814066deed3d97c2d0118"
+SRC_URI[sha256sum] = "a262b9723f4491e4fbb43b285d7845a6dc8daab53d97e68cd8b0df69737ff69e"
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index fa8a8e8..06cf950 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -1,10 +1,9 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.0.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
-DEPENDS += "eio"
 
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
diff --git a/meta-efl/recipes-efl/efl/embryo_1.2.0.bb b/meta-efl/recipes-efl/efl/embryo_1.2.0.bb
deleted file mode 100644
index d3956ac..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.2.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "6c070a16d61141d695397fc248e6176e"
-SRC_URI[sha256sum] = "432838f5f02c86da785beff0a1e0210a1d3f28121bfb6d6c70300839df31a70c"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb
new file mode 100644
index 0000000..8cd4f8c
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "1505a60e8e446d55ab1887f3832063f2"
+SRC_URI[sha256sum] = "6b6999e29836c56f079f84617133cc9b8d9bb1ea826577eebdc29f7ebeb6ffe5"
diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-efl/efl/embryo_svn.bb
index 720703e..06cf950 100644
--- a/meta-efl/recipes-efl/efl/embryo_svn.bb
+++ b/meta-efl/recipes-efl/efl/embryo_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/emotion.inc b/meta-efl/recipes-efl/efl/emotion.inc
index 20a8852..08a24b2 100644
--- a/meta-efl/recipes-efl/efl/emotion.inc
+++ b/meta-efl/recipes-efl/efl/emotion.inc
@@ -2,9 +2,9 @@ DESCRIPTION = "The Enlightenment multimedia library"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
 # we no longer build the libxine backend, since the gstreamer backend seems more promising
-DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base"
+DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base eio"
 
-INC_PR = "r1"
+INC_PR = "r0"
 
 inherit efl
 
diff --git a/meta-efl/recipes-efl/efl/emotion_1.0.1.bb b/meta-efl/recipes-efl/efl/emotion_1.0.1.bb
deleted file mode 100644
index c142b5b..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "6bed064cc88b060e79e9418c557eac8c"
-SRC_URI[sha256sum] = "e8f95696c87731b26a199990f190476acd94da103c6538f76ade30abd0db850d"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb
new file mode 100644
index 0000000..d5f9412
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "55bea7e3c3e5d503a98f336d829b47bb"
+SRC_URI[sha256sum] = "b54e9ea93c248885b56e5b6dbf8161bf9cd04103dcd06d72eb2579d83a48ad7f"
diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index bf75d9e..06cf950 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -1,12 +1,10 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.0.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS += "eio"
-
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
diff --git a/meta-efl/recipes-efl/efl/ethumb.inc b/meta-efl/recipes-efl/efl/ethumb.inc
index 0c3080c..92a83ee 100644
--- a/meta-efl/recipes-efl/efl/ethumb.inc
+++ b/meta-efl/recipes-efl/efl/ethumb.inc
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
 DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
 
-INC_PR = "r1"
+INC_PR = "r0"
 
 inherit efl
 
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.0.1.bb b/meta-efl/recipes-efl/efl/ethumb_1.0.1.bb
deleted file mode 100644
index e976238..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "20bd55bfa05d0c20e985f1031a683677"
-SRC_URI[sha256sum] = "67449d0521d3c806b57e4d8ea121089dcbdf4fbcc2fb451ae881bd05025f6715"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb
new file mode 100644
index 0000000..69f8e33
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "356b996537136c6504daf1358509e5a8"
+SRC_URI[sha256sum] = "1bdeff24945f67c5685bd526a2ba7a951a97fe3aff8aea2f6efc9cf8503c431b"
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index f6b3f3e..892b298 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.0.1+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.2.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.2.0.bb
deleted file mode 100644
index de0ce1c..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.2.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "340a8c2f42c82ecd10f0204cdb291a70"
-SRC_URI[sha256sum] = "9a3aad43269f34513765b04ed3e8db5a18d3545da010b2f6066aeaf90bf442d4"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-alpha.bb
new file mode 100644
index 0000000..5ac0b94
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e8444bb1ddebd337a8d0bd8a14d83951"
+SRC_URI[sha256sum] = "84f1d1e3b8a232c849f91ff70e2b5ad2154a5c2e9904469b3b1ec5b41dd700c7"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
index 594de4a..06cf950 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.0+svnr${SRCPV}"
+PV = "1.6.99+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index 5254ee4..89ae1a4 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -8,7 +8,7 @@ DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-na
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r1"
+INC_PR = "r0"
 FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
 
 python populate_packages_prepend () {
@@ -42,6 +42,11 @@ FILES_${PN}-cserve2 += "${libexecdir}/evas_cserve2* ${libexecdir}/dummy_slave"
 PACKAGES += "${PN}-cserve2"
 PACKAGES_DYNAMIC = "evas-engine-* evas-loader-* evas-saver-* evas-cserve2-*"
 
+# evas-loader-svg is gone as we don't have esvg and probably won't have anytime soon
+# http://www.intesis.hr/news/16-esvg-source
+# http://blog.gmane.org/gmane.comp.window-managers.enlightenment.user/page=3
+RRECOMMENDS_${PN} += "evas-loader-generic evas-generic-loader-svn"
+
 RRECOMMENDS_${PN} = " \
   evas-engine-fb \
   evas-engine-software-generic \
diff --git a/meta-efl/recipes-efl/efl/evas_1.2.1.bb b/meta-efl/recipes-efl/efl/evas_1.2.1.bb
deleted file mode 100644
index ddac920..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.2.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "830161bd790c2c5f17aa47e3a1c3abe1"
-SRC_URI[sha256sum] = "a019b410dba86e616163bafb6524d8734ac8c97aab7c41409f5176f23944bae6"
diff --git a/meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb b/meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb
new file mode 100644
index 0000000..df777f5
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.6.99-alpha.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCVER = "1.7.0-alpha"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "3f4f1f87fa16dd4db121ce9c2e056131"
+SRC_URI[sha256sum] = "25a905c90650e8d53a2b0cf90ef453dc7410f0143fd2fe1c11f5ccd50e107f70"
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index fb0342f..06cf950 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -1,15 +1,10 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.1+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PV = "1.6.99+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
-# evas-loader-svg is gone as we don't have esvg and probably won't have anytime soon
-# http://www.intesis.hr/news/16-esvg-source
-# http://blog.gmane.org/gmane.comp.window-managers.enlightenment.user/page=3
-RRECOMMENDS_${PN} += "evas-loader-generic evas-generic-loader-svn"
-
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
-- 
1.7.8.6



