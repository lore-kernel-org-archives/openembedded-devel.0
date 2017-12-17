Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1FFAB77E87
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 18:22:01 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z34so12119530wrz.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 10:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kdZhoVhdyzqqa6XsGYPWPdBOZZayoSDRl1mk2pI7Ufo=;
	b=r4mVNI2hvVgSPXh0cc9rW6t1z5SMhQPHB2hpO/v/vjR0gS8yMQAHbab46SLF0deY6g
	4GZQ01ac783OUK49rj6kJOQ3s7+7+a/7zTzKECxihrmqm9xPc7iAIL5E648lloP8OG+8
	NUEcc6+V1wNHMmY9Imwsybsb/GdBfTJ6OmZS+0IYcM5+NVrgsbx70/3PQG6uNUG//XsC
	k3++6vyHxrTTLskMXP/KloNWBLQUFmTfEl8UbBUXK2RP19ewmrWGfwkBip2uVlfzHk4U
	Bq6dNd7pIuBSLmpIgMQMaAu2EwmlZjkZCirDVL6dScqj64dSNqW16UyB8O3MrMBL+Q3H
	fcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kdZhoVhdyzqqa6XsGYPWPdBOZZayoSDRl1mk2pI7Ufo=;
	b=dj2fZxQAorflXeL7mLl+fuFHrY5nGNOuCMCPrTmjRiJn0ljA+N+lWyCO6p59MdvS5v
	XLOkX5wI6fkLdhu3n1xvEKe/Cfk4mITAMUoC460G9A3djQxFhCkIIbUV5CSkce3/VCur
	jBR8++Ryt50LhogtUCSfXrJGL4aTjyXJ0QpKdIYdFZJcaBfKSimiL5nRylSBm8AsLIsX
	MmGii1RKMNLDBI+4EgVmlgUwW41eoT9s7mE1ijlScsmQwWlBxQVEPRVq/Y0QLaoMmGIc
	qQumx2IWlWICoF5Md3iGe9hSuKyMJvXeJMMK82V1M2J4PLO0NMdYnQ76z0uoLTMBl17r
	7rCQ==
X-Gm-Message-State: AKGB3mJwvrPCcpx43hac36EjFywmCzOEfj6QT6017UOWJ7hM2osAVOzk
	lo4mvhhdASokciZldPQoQ95zLg==
X-Google-Smtp-Source: ACJfBovXXZRngD3VYzatR4aY90hkI3qTqE0YmSm9S2VyK2qAL4HzDBO1H+aACHKXF18U6wYUJajw1Q==
X-Received: by 10.223.196.243 with SMTP id o48mr6741439wrf.246.1513534922605; 
	Sun, 17 Dec 2017 10:22:02 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC3E4151E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc3:e415:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 139sm7762637wmp.7.2017.12.17.10.22.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 10:22:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Dec 2017 19:21:43 +0100
Message-Id: <20171217182144.21123-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171217182144.21123-1-schnitzeltony@gmail.com>
References: <20171217182144.21123-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][V2 7/8] fltk: do not suffix shared library names with '_SHARED'
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
X-List-Received-Date: Sun, 17 Dec 2017 18:22:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This avoids unwanted linking against static libraries as happened for yoshimi.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.bb               |  3 ++
 ...d-Force-shared-libs-with-unsuffixed-names.patch | 41 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/fltk/fltk/0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch

diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index 619d142..6a3d1c9 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -4,6 +4,8 @@ DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 
 inherit binconfig lib_package gtk-icon-cache mime
 
+SRC_URI += "file://0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch"
+
 EXTRA_OECMAKE = " \
     -DOPTION_BUILD_SHARED_LIBS=ON \
     -DOPTION_USE_THREADS=ON \
@@ -15,6 +17,7 @@ EXTRA_OECMAKE = " \
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
 PACKAGECONFIG[examples] = "-DOPTION_BUILD_EXAMPLES=ON,-DOPTION_BUILD_EXAMPLES=OFF,"
+PACKAGECONFIG[cairo] = "-DOPTION_CAIRO=ON,-DOPTION_CAIRO=OFF,cairo"
 PACKAGECONFIG[opengl] = "-DOPTION_USE_GL=ON,-DOPTION_USE_GL=OFF,virtual/libgl"
 PACKAGECONFIG[xinerama] = "-DOPTION_USE_XINERAMA=ON,-DOPTION_USE_XINERAMA=OFF,libxinerama"
 PACKAGECONFIG[xfixes] = "-DOPTION_USE_XFIXES=ON,-DOPTION_USE_XFIXES=OFF,libxfixes"
diff --git a/meta-oe/recipes-support/fltk/fltk/0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch b/meta-oe/recipes-support/fltk/fltk/0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch
new file mode 100644
index 0000000..1f2f8ae
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk/0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch
@@ -0,0 +1,41 @@
+From bc38fb41044503c9debf5710910c51dd29674b6a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 15 Dec 2017 22:14:01 +0100
+Subject: [PATCH] CMake build: Force shared libs with unsuffixed names
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+For windows build sake CMake complains when a project wants to build shared and
+static libraries with same name. This caused the authors of fltk to generate
+libraries with names suffixed by '_SHARED' when building fltk with cmake -
+autotools builds do not suffix.
+
+Reasons to build shared libs with correct names:
+
+* Shared libraries are the preferred choice for embedded devices
+* There are projects (e.g yoshimi) expecting shared libraries with unsuffixed
+  names - as created by autotools build. These projects link against static
+  libraries by accident causing unusable binaries.
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ CMake/macros.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMake/macros.cmake b/CMake/macros.cmake
+index 4def62d..ab675f0 100644
+--- a/CMake/macros.cmake
++++ b/CMake/macros.cmake
+@@ -49,7 +49,7 @@ macro(FL_ADD_LIBRARY LIBNAME LIBTYPE LIBFILES)
+ 	    PROPERTIES
+ 	    VERSION ${FLTK_VERSION_FULL}
+ 	    SOVERSION ${FLTK_VERSION_MAJOR}.${FLTK_VERSION_MINOR}
+-	    PREFIX "lib"    # for MSVC static/shared coexistence
++	    OUTPUT_NAME ${LIBNAME} CLEAN_DIRECT_OUTPUT 1
+ 	    )
+     endif (${LIBTYPE} STREQUAL "SHARED")
+ 
+-- 
+2.9.5
+
-- 
2.9.5


