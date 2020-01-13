Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 49C9F7FCDC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 19:01:06 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y17so9770213wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GnNx2XSEnJTteRxKoP1wqGNi8QlgSsDcpCzJYqPhAJo=;
	b=YZrYYt8Z4H9i8kIhOl1CzkTJw/6QgpCzTQc+Ze3hUQLj+Wk6EMi8Z2jyp8bUqTnmdF
	3lCsd0+2TQC9GpyIH+2GgOAT4Wft+XSAJ6mwcV1FMvqa00wtSVFYY6SJR99XT3atAUHg
	4PubkppFF6OFB2wIu9Fc+Cv5Jtd3qA4DEkNQvnDevVoJFicUIO9KiJk+rsa2XYcgRdXk
	BeddRS52k55vidskY2Jo4LFTVFknxiDC/xpOAqcfIHlwcxiC4UlaUEXMjsu+I04HG+ZZ
	OaGIXqEcbNSM8xJPCSh6YmOKYkgJ9jhSf3MAhox6dayHqzZjUvCe3BH97fkMKObVqTId
	SIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GnNx2XSEnJTteRxKoP1wqGNi8QlgSsDcpCzJYqPhAJo=;
	b=pxAGkYLB7kp3S5nLeqLGrIrrAAnqTTFxjdsVr4I43LPQZjZzex5ct4fzZBv54rE5zc
	lHPT3iiSkJEGi8ICAoxxh0yaWxLjpF0UQ8zfvk5rXfO3HTg1rPZt+TGyCPPxUeYo8sMf
	9l/owFkjk9GPesijEZazK3bJYJ6luHaVfyq5zZRD6GFLyotHIspKRTZgMx0+pwo0TsfR
	PXPQvbM7sFKwSLdA+pznZQefENKH+ic1reeZAsyrqY537/hfeBm3rrQvEwASTZ4yJ8zj
	Qw/RE1D8PXkIVIZv0Kw9WxY/5cjfsXRMVVMm4SQJou1AGXAjCtipObAw7hsUx66MdEKF
	gDjA==
X-Gm-Message-State: APjAAAXEv3zlF/znH9d//785gTSmVvFIxkOh2+qIw/oHJwKHY8ZzegwY
	MPgSDgS8BYgERVGkPRKxRErZ9TJDy6o=
X-Google-Smtp-Source: APXvYqxj2XkYYDp0Ed1tZJZ3C3mvFM/9K12/t3+iAwZRlwI0Cb8NgyXOst0q4DIe3IYG/R7BoLf9/g==
X-Received: by 2002:adf:cd03:: with SMTP id w3mr19848529wrm.191.1578942066673; 
	Mon, 13 Jan 2020 11:01:06 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	d10sm16804614wrw.64.2020.01.13.11.01.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 11:01:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2020 20:01:02 +0100
Message-Id: <20200113190102.22584-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113190102.22584-1-Martin.Jansa@gmail.com>
References: <CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
	<20200113190102.22584-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCHv2 2/2] sysprof: update to 3.34.1
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
X-List-Received-Date: Mon, 13 Jan 2020 19:01:06 -0000
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
is replaced by a meson option.

Enable all options, as polkit is now available.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...thing-in-help-as-it-requires-itstool.patch | 27 --------------
 ...-Define-NT_GNU_BUILD_ID-if-undefined.patch | 35 +++++++++++++++++++
 .../files/define-NT_GNU_BUILD_ID.patch        | 22 ------------
 .../{sysprof_3.32.0.bb => sysprof_3.34.1.bb}  | 18 ++++++----
 4 files changed, 46 insertions(+), 56 deletions(-)
 delete mode 100644 meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
 create mode 100644 meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
 delete mode 100644 meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
 rename meta-gnome/recipes-kernel/sysprof/{sysprof_3.32.0.bb => sysprof_3.34.1.bb} (54%)

diff --git a/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
deleted file mode 100644
index ade51cf864..0000000000
--- a/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
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
diff --git a/meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch b/meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
new file mode 100644
index 0000000000..75aa86cdbf
--- /dev/null
+++ b/meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
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
diff --git a/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
deleted file mode 100644
index f75ddad43a..0000000000
--- a/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
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
diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
similarity index 54%
rename from meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
rename to meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
index b92933806c..b7e7bee6bb 100644
--- a/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
+++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
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
2.20.1


