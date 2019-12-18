Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id E1A4B7F897
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:31:11 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id q9so2057931wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HUhPCTztfM5W79O0jJGyS/qBRa8IEiepnuPdZ7rnIfY=;
	b=rUTjgWWLgZd54tAsjEUBMy1NZI9hKhYZiDxKptzw8xBlsfpssIuK6/ajgIR5+/2YWE
	cJxfD4+XTRrVQUR1BRZAe4nIfbEL83FOxWFRxOaHGBTM7yOE+GAtuaSNipBngFUbtqUQ
	4DBgcLB7jggrCEX1R3PSIsXdYdQpVeI3NFuHC5s/2SgmiVKWqHzxDljCgPED8GLlupq8
	SqSIeeAIkuXdGTiMoVqzeTzCWj9M7lnBT8oj0AlNRMw5dAi/VG07Dvm+UxdjM2UWsR2l
	5mdtC4F2qXTLRc7I+INOzIvIGi4NSmImuGT0h0TbNmRMNoM9Rw62s4KEQ3L4R9of5xnm
	djfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HUhPCTztfM5W79O0jJGyS/qBRa8IEiepnuPdZ7rnIfY=;
	b=gJ/DOONFxgDtOLkUWLR4/nnlI1WTvq7YOC/h0g+9YnLuVAKf9ZaROxAqNoUCN21Wqc
	xBhpxHjxfx74RnumS2BDMtA3v0vIir7zHVUP+HBNG/O6dzVeB2a1DDlBXez9d7WzqDb+
	MPjFnOiBJ/mkjP02MabvURQMAcUiI2q7+yh0poj/8+QhxE8wsmkTeL05M+Ib2wMguijR
	7tPKV/YdJTqVmQkLl3lxzbdwAinfekCIfFEeeSr2yqg/NNQhrkVkEz3xDf63OHDL1ukp
	QF9+g6VP6IvShw29nQOCgs1UezpY/v0b9TikgsDaMWnQMEo1T2C8qsdGmy7Bve+Gt8Dp
	3YrQ==
X-Gm-Message-State: APjAAAVxjMNl4dk/HtPoEaCQ6PY5Wv6BWX5EYoPJ5T5w3SxSaII49C51
	BtqNr/gsmekkF7+c0/I5FgLra4LTJ08=
X-Google-Smtp-Source: APXvYqzjhHfCYJy/NT5q/Q80dovzkiv7OHZrvnRWk4MO1xVDudvrvrH/eSwzDQsSGWaojmRtt8AVfw==
X-Received: by 2002:a05:600c:230d:: with SMTP id
	13mr3634654wmo.12.1576679472329; 
	Wed, 18 Dec 2019 06:31:12 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x7sm2738464wrq.41.2019.12.18.06.31.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:31:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:31:06 +0100
Message-Id: <20191218143106.128574-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143106.128574-1-alex.kanavin@gmail.com>
References: <20191218143106.128574-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] sysprof: update to 3.34.1
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
X-List-Received-Date: Wed, 18 Dec 2019 14:31:12 -0000

0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
is replaced by a meson option.

Enable all options, as polkit is now available.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...thing-in-help-as-it-requires-itstool.patch | 27 --------------
 ...-Define-NT_GNU_BUILD_ID-if-undefined.patch | 35 +++++++++++++++++++
 .../files/define-NT_GNU_BUILD_ID.patch        | 22 ------------
 .../{sysprof_3.32.0.bb => sysprof_3.34.1.bb}  | 18 ++++++----
 4 files changed, 46 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
 create mode 100644 meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
 delete mode 100644 meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
 rename meta-oe/recipes-kernel/sysprof/{sysprof_3.32.0.bb => sysprof_3.34.1.bb} (54%)

diff --git a/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
deleted file mode 100644
index ade51cf86..000000000
--- a/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 23 Aug 2017 18:38:26 +0300
-Subject: [PATCH 2/2] Do not build anything in help/ as it requires itstool.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 3986273..ae2f65e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -164,7 +164,6 @@ subdir('tools')
- subdir('tests')
- 
- subdir('data')
--subdir('help')
- subdir('po')
- 
- meson.add_install_script('build-aux/meson/post_install.sh')
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch b/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
new file mode 100644
index 000000000..75aa86cdb
--- /dev/null
+++ b/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
@@ -0,0 +1,35 @@
+From 3025d80aaacc5f67aa9eb1e6fde30f71d9c5b04b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Jul 2011 16:00:17 -0700
+Subject: [PATCH 1/2] sysprof: Define NT_GNU_BUILD_ID if undefined
+
+On uclibc elf.h does not have GNU extentions but we need this define
+so we define it locally if its not getting it from elf.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+%% original patch: define-NT_GNU_BUILD_ID.patch
+---
+ src/libsysprof/elfparser.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libsysprof/elfparser.h b/src/libsysprof/elfparser.h
+index 160e4c9..94fa5c0 100644
+--- a/src/libsysprof/elfparser.h
++++ b/src/libsysprof/elfparser.h
+@@ -18,6 +18,10 @@
+ 
+ #include <glib.h>
+ 
++#ifndef NT_GNU_BUILD_ID
++#define NT_GNU_BUILD_ID 3
++#endif
++
+ typedef struct ElfSym ElfSym;
+ typedef struct ElfParser ElfParser;
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
deleted file mode 100644
index f75ddad43..000000000
--- a/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-On uclibc elf.h does not have GNU extentions but we need this define
-so we define it locally if its not getting it from elf.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: git/elfparser.h
-===================================================================
---- git.orig/lib/util/elfparser.h	2011-07-16 18:57:41.000000000 -0700
-+++ git/lib/util/elfparser.h	2011-07-16 20:28:54.733829895 -0700
-@@ -17,6 +17,10 @@
-  */
- #include <glib.h>
- 
-+#ifndef NT_GNU_BUILD_ID
-+#define NT_GNU_BUILD_ID 3
-+#endif
-+
- typedef struct ElfSym ElfSym;
- typedef struct ElfParser ElfParser;
- 
diff --git a/meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb b/meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
similarity index 54%
rename from meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb
rename to meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
index b92933806..b7e7bee6b 100644
--- a/meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb
+++ b/meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
@@ -2,23 +2,26 @@ SUMMARY = "System-wide Performance Profiler for Linux"
 HOMEPAGE = "http://www.sysprof.com"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
+                    file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext systemd upstream-version-is-even gsettings
 
 DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
 
-SRC_URI[archive.md5sum] = "d1fa9ad216419d722770ca36713ad3af"
-SRC_URI[archive.sha256sum] = "fc22a69e468701c5ec9036e960c6273afa1ed6a89df1f889fed49417add5554d"
+SRC_URI[archive.md5sum] = "cc32455277b31afb1965d627ae3e3629"
+SRC_URI[archive.sha256sum] = "844bbb8d8b65071b3bca96f8e921319ceef81f2d2c51fcc9da63a4b355c893d0"
 SRC_URI += " \
-           file://define-NT_GNU_BUILD_ID.patch \
-           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
+           file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
            "
 
-PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
-PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
+PACKAGECONFIG ?= "sysprofd libsysprof ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3 libdazzle"
 PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
+PACKAGECONFIG[libsysprof] = "-Dlibsysprof=true,-Dlibsysprof=false,polkit"
+
+# Enablig this requries yelp
+EXTRA_OEMESON += "-Dhelp=false -Dsystemdunitdir=${systemd_unitdir}"
 
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
@@ -28,5 +31,6 @@ SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysp
 FILES_${PN} += " \
                ${datadir}/dbus-1/system-services \
                ${datadir}/dbus-1/system.d \
+               ${datadir}/dbus-1/interfaces \
                ${datadir}/metainfo \
                "
-- 
2.17.1


