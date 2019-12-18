Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id EF25D7F942
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:31:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q10so2507883wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AhwOGiVmfD6Vv/V9JH9D0SGEXFAUG1+4k9WvZgqSCWY=;
	b=LhjsPDf91sm/H9SyjEtw+GnWcq4ZMtQpm46TZQMLGqQl0ccr5snYqeSi4nB7i7ZPXV
	3HyIzeT8Q+rE026hKUX6ElrULjFcKrUWdbpQq/nwAZBs+3GT5y/ka4fWo/Wr8zzwBj8n
	+khSWCtyAMUVfct5I5swdyiAwzXAwWcxxM8yDEpv7APHpK43GoXYUCE3XuaLLZ58HBQ2
	cb75st023bRfZSQ1e9eiaKVmGtQBJ1mkdWtO8HtgBwt4zz+/pvSPFcC4WnvIe1pZmjXy
	boiypCgyMEV4uRLu7u6Ih+0bT3ZbgzZeINQptS8bNuOvBaKyAm9sI+lfwqCEc6NpJ26l
	hDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AhwOGiVmfD6Vv/V9JH9D0SGEXFAUG1+4k9WvZgqSCWY=;
	b=DSTNAW+vpOKPzVoXA95SD7aoXG0z99vizcRPn472XWj5D7cciIh/E+Y7kwwPX6wuRg
	KppPh6drNAOT7z9vG8rFMRyHNLAGyjn6tdUgnkosHun4UE73iC1ThyVwH1WYMkem/pc0
	hv1gO18FnHjTwKv45qzAPH3fyBOFBay7jyqWo718ZhlcTkvh6YmDA52yktlbtOpjhxjM
	x+HXQyNKbUzBDPXIiXr5w/TErLA436RQ6vDH+ZZ8nWiVX1TQjknnibUlyKNwfMz58jqE
	uCAAfXwINWsIYDhYE76z1lyGRZoM97ITGg4dwwoCpsdhuQbNeRRHenYHNr/B4XuvQDPw
	KCSQ==
X-Gm-Message-State: APjAAAW7F+3VDce+VQokClC0bPrbceR8b3HNv1R1tEWgfNT4QzSpnDMQ
	w3nHCoJiVzHGqu1MA0oQZd7hnx5Mwwc=
X-Google-Smtp-Source: APXvYqwctgbZwu1JtPwiBDlNIhnHrKZZT4zruFdIK/74yVH4enJ5zI2pcwpqtL8iSC9+TjIvbM+Nuw==
X-Received: by 2002:adf:f78e:: with SMTP id q14mr3245311wrp.186.1576679471222; 
	Wed, 18 Dec 2019 06:31:11 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x7sm2738464wrq.41.2019.12.18.06.31.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:31:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:31:05 +0100
Message-Id: <20191218143106.128574-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] sysprof: add a recipe from oe-core
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
X-List-Received-Date: Wed, 18 Dec 2019 14:31:11 -0000

Latest version (3.34) of sysprof have a hard dependency on polkit,
which in turn requires mozjs, which pulls in a number of other
meta-oe packages including python2. This makes it difficult
to keep sysprof in oe-core, so for the time being it is moved to
meta-oe.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...thing-in-help-as-it-requires-itstool.patch | 27 ++++++++++++++++
 .../files/define-NT_GNU_BUILD_ID.patch        | 22 +++++++++++++
 .../recipes-kernel/sysprof/sysprof_3.32.0.bb  | 32 +++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
 create mode 100644 meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
 create mode 100644 meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb

diff --git a/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
new file mode 100644
index 000000000..ade51cf86
--- /dev/null
+++ b/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
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
diff --git a/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
new file mode 100644
index 000000000..f75ddad43
--- /dev/null
+++ b/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
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
diff --git a/meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb b/meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb
new file mode 100644
index 000000000..b92933806
--- /dev/null
+++ b/meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb
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
2.17.1


