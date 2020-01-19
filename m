Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9766D7F971
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 20:50:12 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id a6so12259595plm.3
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 12:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TP2l6ZFL9EjZaR+fb1L+1fvcnYKhdwGWs5sj+CvmAD0=;
	b=czmSh3QT+wsZpS/FYgVB+4oxYS4JoOYThC2fNs467GGxbchHBJktbbEL/HAiIFJTxs
	+5CtNIDcYec7K78OW0W+Q9uY2zd+/kABAlUOP0X875P3k79OmI5MeLlpBT2epTplGBh9
	fjgkF+B2QgFP/IouKUXegxdB8YJW6+84HXHrZZNdXAFZQUkZkNZ5X21UwvzwRzNtzLnd
	+ak786Tf1BbM5uGpzldQxY4Zf7UD651zek0x5ysiYv08iWOsiE8OgQWFhh8uzBTlEsSX
	avdXUboWAPkvIfBPmr4/HGBageDJzJomnyhvLJT0y6iDCvZ00138vIDRI8aRIRVS7q1D
	hLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TP2l6ZFL9EjZaR+fb1L+1fvcnYKhdwGWs5sj+CvmAD0=;
	b=APTcO9tgm3ChBfOzCrVzymqUoxhKFmNKmMPSsNwy1v56XnVkEaw1jCoiaOgJ64QMFL
	yAsRrrZhGv28Vk8kl+uMuY4XIO2uQ5FKkWLn0U6tWkcTH38dAcA4G4NynmosRu64TcPD
	A1yvmvZPlGRojE6veWRnddGeSIRncp9UFHU4YC4DzUxkwTCWwBYE4OeDJmpxBxmij3aB
	i1WE+fM8T/lmPdV8KDib7rrZL5SxvKAlP9E3yfgOiZ07mpQ1cmQCEGZHRay6+EdXYk4G
	k+VFEiXKNXI38D+F8xMM95q7MrTrbInp3lDttfhi5Ce6+fBsHRVh62pyZEijSD3618ib
	gQyA==
X-Gm-Message-State: APjAAAX0LSD1GFz7v7VxsCqv+TatSZe1Ywrw7CraxegbFDBVj4bLRl4B
	3KNnXApmlP8ORb497BpQFyUm8zzl
X-Google-Smtp-Source: APXvYqzLNTeSravVCxpDbztXrenQJE6xnJDucN9/a2XLZy6nbIhuCoRu22O9rtEmUpWluwnhdstZZA==
X-Received: by 2002:a17:90b:d94:: with SMTP id
	bg20mr18752987pjb.99.1579467013581; 
	Sun, 19 Jan 2020 12:50:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	k9sm14701403pjo.19.2020.01.19.12.50.12
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 12:50:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun, 19 Jan 2020 12:50:02 -0800
Message-Id: <636660b7b2431da724d391d237d3680a72470121.1579466920.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579466920.git.akuster808@gmail.com>
References: <cover.1579466920.git.akuster808@gmail.com>
Subject: [zeus 4/8] websocketapp: Fix multilib build
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
X-List-Received-Date: Sun, 19 Jan 2020 20:50:12 -0000

From: Khem Raj <raj.khem@gmail.com>

Fixes

ERROR: websocketpp-0.8.1-r0 do_package: QA Issue: websocketpp: Files/directories were installed but not shipped in any package:
/usr/lib
/usr/lib/cmake
/usr/lib/cmake/websocketpp
/usr/lib/cmake/websocketpp/websocketpp-configVersion.cmake
/usr/lib/cmake/websocketpp/websocketpp-config.cmake

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b1a85631279b8f04b38562f9cf076f4cc0561a71)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-cmake-Use-GNUInstallDirs.patch       | 35 +++++++++++++++++++
 .../websocketpp/websocketpp_0.8.1.bb          |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch
new file mode 100644
index 0000000000..0ef2e12375
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/0001-cmake-Use-GNUInstallDirs.patch
@@ -0,0 +1,35 @@
+From 771d79eeb0ac5079482a4b3a131bbda744793e7d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Dec 2019 20:07:11 -0800
+Subject: [PATCH] cmake: Use GNUInstallDirs
+
+Helps install cmakefiles in right libdir
+
+Upstream-Status: Submitted [https://github.com/zaphoyd/websocketpp/pull/854]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2786aba..080be3e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -39,11 +39,13 @@ endif()
+ 
+ set_property(GLOBAL PROPERTY USE_FOLDERS ON)
+ 
++include(GNUInstallDirs)
++
+ set(INSTALL_INCLUDE_DIR include CACHE PATH "Installation directory for header files")
+ if (WIN32 AND NOT CYGWIN)
+   set (DEF_INSTALL_CMAKE_DIR cmake)
+ else ()
+-  set (DEF_INSTALL_CMAKE_DIR lib/cmake/websocketpp)
++  set (DEF_INSTALL_CMAKE_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/websocketpp)
+ endif ()
+ set (INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directory for CMake files")
+ 
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
index 551621708c..05f14d2f42 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
@@ -8,6 +8,7 @@ DEPENDS = "openssl boost zlib"
 SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https \
            file://0001-Replace-make_shared-with-new-in-some-cases.patch \
            file://0002-Fix-missed-entries-fix-testing.patch \
+           file://0001-cmake-Use-GNUInstallDirs.patch \
           "
 
 # tag 0.8.1
-- 
2.17.1


