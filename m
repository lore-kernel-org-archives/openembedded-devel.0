Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 023EA7FCD9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 19:01:04 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id f129so10927640wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 11:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EQpmEzoZvcIfAGPlAjnYkc5yue/9pzFWbiSyOykFses=;
	b=StTWu9OXUlP5AfhZ51wSxiYRRC5VN+/PvceRiN/sSnBACQAy3/aOSbfWxvBAWeDlXq
	eQdIpXv7jjzjoheY6zCDkvySxcRNoJNBupjsshjFJfLPWtvPUm4CKNEyoh6pXAc/qnIJ
	kfjROZOXVrLAVzJ+S1cNk6Hp4b9BUgkG/2VaZ0ReTouUHOGPB4TxqEw9tm+cr6k3+B5r
	1cjVWfyko1wWFn5hs10g7iEEg1sZCnNGHwEyGtdFhGuZ1gMGxjz1Km1U7eAjlMIrpBet
	vjgwV+r7a6u7nUvG9NYtFKxum/KOWZs7JOvRrc1H5prdTtd4YhqrZmvwB3vYXe2CEDjf
	G3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EQpmEzoZvcIfAGPlAjnYkc5yue/9pzFWbiSyOykFses=;
	b=W6WwJvO7ZD2O3O6URzblTz9QXZOD8YUVX3FZ00rBmZoU1kqeJMgueLBlIsfa5UPs62
	JcuMkYy7h2qPePPJZiihOdkn7ocN+K6ymruKfMC0ljDzzdIDNFiVod2E8stWuzvj4BPv
	wMKoJ8ogbWPGw3QPC+TZ3cCTXLtteJq/7Dn4Qq2IG7eJaKx8wMAvVGnnJT1uMZ/9XTZX
	gO0fC0oS1hfrceInjvyuEiFVDUjU5F3bPFDpdvdYwIXXlj6u+O0Hne3d3hR437jfj0dY
	rGlpV8ckD7VLEWgCCxQbbUjlgYDBGoU59c0idNRgOCY8vMETGgYOGUy3kGpB+mmj2ShJ
	fMwQ==
X-Gm-Message-State: APjAAAWn6p+qP5b+ZizTq9jcD6GVjC2GAGCzQkHJsp2PHvVZo5OzjGp2
	tGw41wubyugV511EW+P+9MJDWUIX9Uo=
X-Google-Smtp-Source: APXvYqzATNgXcW/uCXV7cK4YRoDHzDJFrQJFhPnFkmN4jljLlrH67GH2jHvP60mylpiVqno1RuWebQ==
X-Received: by 2002:a1c:2355:: with SMTP id j82mr22518771wmj.135.1578942065514;
	Mon, 13 Jan 2020 11:01:05 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	o16sm16020024wmc.18.2020.01.13.11.01.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 11:01:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2020 20:01:01 +0100
Message-Id: <20200113190102.22584-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
References: <CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCHv2 1/2] sysprof: add a recipe from oe-core
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
X-List-Received-Date: Mon, 13 Jan 2020 19:01:05 -0000
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Latest version (3.34) of sysprof have a hard dependency on polkit,
which in turn requires mozjs, which pulls in a number of other
meta-oe packages including python2. This makes it difficult
to keep sysprof in oe-core, so for the time being it is moved to
meta-oe.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...thing-in-help-as-it-requires-itstool.patch | 27 ++++++++++++++++
 .../files/define-NT_GNU_BUILD_ID.patch        | 22 +++++++++++++
 .../recipes-kernel/sysprof/sysprof_3.32.0.bb  | 32 +++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
 create mode 100644 meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
 create mode 100644 meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb

diff --git a/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
new file mode 100644
index 0000000000..ade51cf864
--- /dev/null
+++ b/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
@@ -0,0 +1,27 @@
+From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 23 Aug 2017 18:38:26 +0300
+Subject: [PATCH 2/2] Do not build anything in help/ as it requires itstool.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 3986273..ae2f65e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -164,7 +164,6 @@ subdir('tools')
+ subdir('tests')
+ 
+ subdir('data')
+-subdir('help')
+ subdir('po')
+ 
+ meson.add_install_script('build-aux/meson/post_install.sh')
+-- 
+2.7.4
+
diff --git a/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
new file mode 100644
index 0000000000..f75ddad43a
--- /dev/null
+++ b/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
@@ -0,0 +1,22 @@
+On uclibc elf.h does not have GNU extentions but we need this define
+so we define it locally if its not getting it from elf.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: git/elfparser.h
+===================================================================
+--- git.orig/lib/util/elfparser.h	2011-07-16 18:57:41.000000000 -0700
++++ git/lib/util/elfparser.h	2011-07-16 20:28:54.733829895 -0700
+@@ -17,6 +17,10 @@
+  */
+ #include <glib.h>
+ 
++#ifndef NT_GNU_BUILD_ID
++#define NT_GNU_BUILD_ID 3
++#endif
++
+ typedef struct ElfSym ElfSym;
+ typedef struct ElfParser ElfParser;
+ 
diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
new file mode 100644
index 0000000000..b92933806c
--- /dev/null
+++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "System-wide Performance Profiler for Linux"
+HOMEPAGE = "http://www.sysprof.com"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
+
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase gettext systemd upstream-version-is-even gsettings
+
+DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
+
+SRC_URI[archive.md5sum] = "d1fa9ad216419d722770ca36713ad3af"
+SRC_URI[archive.sha256sum] = "fc22a69e468701c5ec9036e960c6273afa1ed6a89df1f889fed49417add5554d"
+SRC_URI += " \
+           file://define-NT_GNU_BUILD_ID.patch \
+           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
+           "
+
+PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
+PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
+
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
+
+FILES_${PN} += " \
+               ${datadir}/dbus-1/system-services \
+               ${datadir}/dbus-1/system.d \
+               ${datadir}/metainfo \
+               "
-- 
2.20.1


