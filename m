Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 20ED1731DB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Feb 2016 22:35:43 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p63so93805340wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2016 14:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=v8GWI23OyBfTo1dNm51ZH4/DNQAPBCNMXZeG+sUxWGQ=;
	b=h5JiHKS8H+gnw/V6VgSn5Tt5HAkh2QlDN19HVpPCZgGpI3XT/tUlcYymMq2CdYBxyE
	kqfSl9GiXncT0EMAIR7s1hNl4FxEedKFQ4IO+0QuSmnhT3mQWN9IAIsG9PAhy7O1ywl7
	53ARfvz9MLOqSU02yxR+1lj5yetKjs6gkKFcKnFpgTAjRQ0btaPb7mfPIXM4utqoVN9s
	X17rj0F0HgbWy+axkIK3yNudi/JLKkRqU9QJRpKNy8i2p10HsBa7BgRrFOkHslbMoicM
	IoRQVGFrX0JQ9BFcl80KqGxjHWlFlWVtyZuscsGNJq2wpOSOWqsA63LpSeh3Nche09KE
	FZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=v8GWI23OyBfTo1dNm51ZH4/DNQAPBCNMXZeG+sUxWGQ=;
	b=eKaAAnmM/8ALz06TlN61QuPV1oMnetg+ZryRPIRvb0ynOm8TVYiGzqd2hTsIeYqixO
	CCYHTMssguXEaxwDVcgym0m3ep8oqwe9GaOR3Hs7cEvJoNgjT30UDrldFFbulA/OuDaE
	7alpVeLpZsSr1TAZfAYhx6nVC2CmtDlkv4m5IoGeszo25oxB5H9IkvSLV51VOh6n8C0m
	6z8LVnhA65RgrMjKhBbcTC7ulfLcKtyFDQRYnMdGUWKvXLH7MYBBt6hdbF73NjOE96Fb
	qf6rKkZMCuqB/gU2MMJ1c9texXvEfz90xXNPgba5hm7lLvGRQLKsiJPe6ZQ/lIyncUPX
	CVmw==
X-Gm-Message-State: AG10YORtf93jrRIyI4ImU/OPtX1dFXS7Tyk9dk3pDiZrZSEnZRJMeSJrILta8p++2MS61A==
X-Received: by 10.28.53.138 with SMTP id c132mr29643342wma.93.1454884543732;
	Sun, 07 Feb 2016 14:35:43 -0800 (PST)
Received: from localhost.localdomain (p5B0A33CD.dip0.t-ipconnect.de.
	[91.10.51.205]) by smtp.googlemail.com with ESMTPSA id
	az10sm26865942wjc.28.2016.02.07.14.35.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Feb 2016 14:35:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Feb 2016 23:35:28 +0100
Message-Id: <1454884529-23770-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 1/2] abiword: update to 3.0.1
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
X-List-Received-Date: Sun, 07 Feb 2016 22:35:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* sources checked for debian_patches_boost54.patch: seems applied
* removing tailored configure does not show effects - plugins are build properly

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...saurus-Makefile.am-remove-uncomplete-opti.patch | 39 ++++++++++++++++++++++
 .../abiword/abiword/autogen-common.sh              | 28 ----------------
 .../abiword/abiword/debian_patches_boost54.patch   | 32 ------------------
 .../abiword/{abiword_3.0.0.bb => abiword_3.0.1.bb} | 18 +++-------
 4 files changed, 44 insertions(+), 73 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch
 delete mode 100755 meta-gnome/recipes-gnome/abiword/abiword/autogen-common.sh
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/debian_patches_boost54.patch
 rename meta-gnome/recipes-gnome/abiword/{abiword_3.0.0.bb => abiword_3.0.1.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword/0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch b/meta-gnome/recipes-gnome/abiword/abiword/0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch
new file mode 100644
index 0000000..0dff141
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword/0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch
@@ -0,0 +1,39 @@
+From c646159ce817506131b58fdab1cdc1cd6364df7a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 7 Feb 2016 21:45:20 +0100
+Subject: [PATCH] plugins/aiksaurus/Makefile.am: remove uncomplete options
+ WITH_BUILTIN_AIKSAURUS_GTK
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* with gtk2 we won't use it
+* it is missing in configure.ac causing
+
+| plugins/aiksaurus/Makefile.am:5: error: WITH_BUILTIN_AIKSAURUS_GTK does not appear in AM_CONDITIONAL
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ plugins/aiksaurus/Makefile.am | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/plugins/aiksaurus/Makefile.am b/plugins/aiksaurus/Makefile.am
+index d402c58..1034e2a 100644
+--- a/plugins/aiksaurus/Makefile.am
++++ b/plugins/aiksaurus/Makefile.am
+@@ -2,10 +2,6 @@ SUBDIRS =
+ 
+ if TOOLKIT_GTK
+ 
+-if WITH_BUILTIN_AIKSAURUS_GTK
+-SUBDIRS += aiksaurusgtk3
+-platform_lib = aiksaurusgtk3/libAiksaurusGtk3.la
+-endif
+ 
+ endif
+ 
+-- 
+2.5.0
+
diff --git a/meta-gnome/recipes-gnome/abiword/abiword/autogen-common.sh b/meta-gnome/recipes-gnome/abiword/abiword/autogen-common.sh
deleted file mode 100755
index c1f10e1..0000000
--- a/meta-gnome/recipes-gnome/abiword/abiword/autogen-common.sh
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/bin/sh
-
-# find plugins Makefile templates
-find plugins -name Makefile.am | sed  's|.am$||g' > plugin-makefiles.m4
-
-# create plugin list
-(cd plugins && find . -maxdepth 1 -type d | grep -v '^\.$' | grep -v '\./\.' | sed 's|\./||g' | xargs echo) > plugin-list.m4
-
-# create conditionals for builtin plugins
-(for plugin in `cat plugin-list.m4`; do
-	u=`echo $plugin | tr '[:lower:]' '[:upper:]'`
-	echo 'AM_CONDITIONAL(['$u'_BUILTIN], test "$enable_'$plugin'_builtin" == "yes")'
-done) > plugin-builtin.m4
-
-# create plugin configuration
-find plugins -name plugin.m4 | xargs cat > plugin-configure.m4
-#to debug if plugin configuration code misbehaves (instead of the above line):
-#rm plugin-configure.m4
-#for f in $(find plugins -name plugin.m4); do
-#	echo "AC_MSG_RESULT([plugin: $f])" >> plugin-configure.m4
-#	cat $f >> plugin-configure.m4
-#done
-
-# find extra m4 files provided by plugins and symlink them
-for f in ` find ./plugins -name '*.m4' | grep -v 'plugin\.m4'`; do
-    ln -sf $f
-done
-
diff --git a/meta-gnome/recipes-gnome/abiword/abiword/debian_patches_boost54.patch b/meta-gnome/recipes-gnome/abiword/abiword/debian_patches_boost54.patch
deleted file mode 100644
index cf50cb2..0000000
--- a/meta-gnome/recipes-gnome/abiword/abiword/debian_patches_boost54.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Last-Update: 2014-02-05
-Forwarded: yes
-Author: Dmitry Smirnov <onlyjob@member.fsf.org>
-Bug-Debian: http://bugs.debian.org/737551
-Bug-Abiword: http://bugzilla.abisource.com/13602
-Description: fix FTBFS with libboost1.54-dev
-Upstream-Status: Applied
-
---- a/plugins/collab/core/sync/xp/SynchronizedQueue.h
-+++ b/plugins/collab/core/sync/xp/SynchronizedQueue.h
-@@ -21,8 +21,9 @@
- 
- #include <deque>
- #include <boost/bind.hpp>
- #include <boost/function.hpp>
-+#include <boost/noncopyable.hpp>
- #include <sync/xp/lock.h>
- #include <sync/xp/Synchronizer.h>
- 
- class EmptyQueueException {};
---- a/plugins/collab/backends/tcp/xp/Session.h
-+++ b/plugins/collab/backends/tcp/xp/Session.h
-@@ -21,8 +21,9 @@
- 
- #include <boost/function.hpp>
- #include <boost/bind.hpp>
- #include <boost/enable_shared_from_this.hpp>
-+#include <boost/noncopyable.hpp>
- #include <deque>
- #include <sync/xp/lock.h>
- #include <sync/xp/Synchronizer.h>
- 
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
rename to meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index eb4bba2..d4c8c56 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -9,15 +9,15 @@ RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
                glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
 RCONFLICTS_${PN} = "${PN}-embedded"
 
-SRC_URI = "http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
-           file://debian_patches_boost54.patch \
-           file://autogen-common.sh \
+SRC_URI = " \
+    http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
+    file://0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c5edcc3ccd864b19004d14e9c1c9a26a"
 
-SRC_URI[md5sum] = "8d9c41cff3a8fbef8d0c835c65600e65"
-SRC_URI[sha256sum] = "d17e318c00ff4eb353e0e7994b098b1d4f9ddd8712ac0261a0e38b89081fac01"
+SRC_URI[md5sum] = "f3f8052e7b4979a43b75775a381e6cb8"
+SRC_URI[sha256sum] = "e094f6fbf0afc5c5538b4894888e7c346f8ee8f49c9d24821dd696d0734865c6"
 
 #want 3.x from 3.x.y for the installation directory
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
@@ -41,14 +41,6 @@ EXTRA_OECONF = " --disable-static  \
                  --with-libwmf-config=${STAGING_DIR} \
 "
 
-# AbiWord configure.ac does not play nicely with autoreconf
-# so use the autogen.sh script that comes with AbiWord
-do_configure() {
-    install -m 0755 ${WORKDIR}/autogen-common.sh ${B}/autogen-common.sh
-    ./autogen-common.sh
-    autotools_do_configure
-}
-
 do_compile() {
     cd goffice-bits2
     make goffice-paths.h
-- 
2.5.0


