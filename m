Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB307FCAF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 17:02:15 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q6so9326239wro.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 09:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HUhPCTztfM5W79O0jJGyS/qBRa8IEiepnuPdZ7rnIfY=;
	b=MtmCfVvQIdRlb6iuk4G9HqThHoxxbPimbWm68yeHqFWdzZCbfbGZos0K3kJAdkiqRr
	Q35vqdU/+fYfovO362PHoZK3zdkoEu7qAl2oqUMiM+9q7ZyTxytNoKHTa3y/MMqRQkeb
	pzmwyMuwkW97EG02/eYVEuO2xA2njuinHidfF+EA6iisgVPc9K1WW5BSpv9lkoKBwxCj
	rq3tERJEYfg1/vSNgqK6rpk6QrmQCC1o84QIkNPXY04amr27BP0E6n+LAH/AnevhCUsh
	O4oktaeNnuk7p55jEvIPh8UATxPpe4kdevfJt9+Co1BqSAIJ50A0ZkmyOFHWQbkNtuBn
	jykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HUhPCTztfM5W79O0jJGyS/qBRa8IEiepnuPdZ7rnIfY=;
	b=NWuxwuO3le2cC12798EYf4i+OvNL4loCHrLfxFMuMg5YzTtRSSUESf5Sd/oJeoL+Uf
	qtVi1hYTPD0b8Q0A7VFUhs+OVgjpvPKBvcOsSd2PRGXDJ1ir4QmKjkV0MBb86VwISAsu
	Z0oUTtHC4WKU+jfBv3HHJqsvBvIBIQzCVHbvcq4vw/xPZIkbKM6WMiL54UzVgjkOdUwM
	EJuDlq3blLmR2x1LRwaUPXIeJgFPp6rKOKgA8/CuzP3in9EWz1N02LzmvTcmSmE1LkEN
	YTVuvOiNmcVN8BJbsuQew4t7IMAa8m5ibg1Pq0ve4Oodd3TjBYExG75LBJYKGlONwHpv
	aJMQ==
X-Gm-Message-State: APjAAAVkPg0LXXJXHXxAN+XF+6lcmK+jt3Z9MP2jlts4dha60UXNsqO+
	BziK67SAQlsYdaqdAJl3F7rtIY91
X-Google-Smtp-Source: APXvYqw8vARsmFh1mRpqWKO6fn0XYoPN67FXFJl9Q4dxAdH7/HkPtzqS/p8Lt3VkMWXuSSyAsMibGw==
X-Received: by 2002:adf:f70b:: with SMTP id r11mr20840286wrp.388.1578934935561;
	Mon, 13 Jan 2020 09:02:15 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	k16sm16050396wru.0.2020.01.13.09.02.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 09:02:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2020 18:02:08 +0100
Message-Id: <20200113170209.95601-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113170209.95601-1-alex.kanavin@gmail.com>
References: <20200113170209.95601-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/3] sysprof: update to 3.34.1
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
X-List-Received-Date: Mon, 13 Jan 2020 17:02:15 -0000

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


