Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 40C1A770A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 13:43:13 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so31641003wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2015 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4sGN0P+mVoL/tnffRwcAgF0KcWREEWwo3wqXySDk03E=;
	b=cM0nTIKgArRujNsyx6P1xqN55BL6r/VmGqO5ZcgSvHyrpj4dOCTZ4v7E3zrwslrQV3
	zwagFK2Ull+Foiwks4+cLj2EkNGojrad3Wt0XQ/w0yFgxXKfTN4U+CGIl7oA1ObmAW7Z
	WkzdToK+fMDMy4czGl5PVrUxIm6AWXccvtAw3mrilB17SHI1k3xaZ3DlyZGpBGE5aROi
	P+BuL7JazhPiPHqfs9CppRhCyKWC7xDE2kPJDBLhj0KW5YYQzRYJKzaNlq+CBXwlEdM3
	KBWCpAuh4HaLFXdwxZJTsqKk5PjOqfeowycaumdvE8a8wJaOY7dh7/ZaJ97+0Z6H60Te
	H5Fg==
X-Received: by 10.180.76.170 with SMTP id l10mr4916662wiw.68.1443793393872;
	Fri, 02 Oct 2015 06:43:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ft3sm8466515wib.17.2015.10.02.06.43.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Oct 2015 06:43:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Oct 2015 15:44:15 +0200
Message-Id: <1443793455-31883-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <20150918115458.GA11095@jama>
References: <20150918115458.GA11095@jama>
Subject: [PATCH][meta-efl] webkit-efl: fix build with cmake-3*
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Oct 2015 13:43:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0005-Fix-the-build-with-cmake-3.patch          | 104 +++++++++++++++++++++
 meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb   |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0005-Fix-the-build-with-cmake-3.patch

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0005-Fix-the-build-with-cmake-3.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0005-Fix-the-build-with-cmake-3.patch
new file mode 100644
index 0000000..7e8e295
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0005-Fix-the-build-with-cmake-3.patch
@@ -0,0 +1,104 @@
+From a00a7097b85567ae6eb7a00b3ce7ef021841203c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 24 Sep 2015 18:03:52 +0200
+Subject: [PATCH 5/5] Fix the build with cmake 3
+
+* the same issue as in GTK port:
+  https://bugs.webkit.org/show_bug.cgi?id=141796
+  http://trac.webkit.org/changeset/180502
+
+* otherwise linking fails with couple undefined symbols
+| CMakeFiles/WebKit2.dir/PluginProcess/unix/PluginProcessMainUnix.cpp.o: In function `WebKit::webkitXError(_XDisplay*, XErrorEvent*)':
+| ewebkit/Source/WebKit2/PluginProcess/unix/PluginProcessMainUnix.cpp:63: undefined reference to `XGetErrorText'
+| CMakeFiles/WebKit2.dir/PluginProcess/unix/PluginProcessMainUnix.cpp.o: In function `WebKit::PluginProcessMain::parseCommandLine(int, char**)':
+| ewebkit/Source/WebKit2/PluginProcess/unix/PluginProcessMainUnix.cpp:102: undefined reference to `XSetErrorHandler'
+| ewebkit/Source/WebKit2/PluginProcess/unix/PluginProcessMainUnix.cpp:102: undefined reference to `XSetErrorHandler'
+| CMakeFiles/WebKit2.dir/WebProcess/efl/WebProcessMainEfl.cpp.o: In function `WebKit::WebProcessMain::platformInitialize()':
+| ewebkit/Source/WebKit2/WebProcess/efl/WebProcessMainEfl.cpp:67: undefined reference to `XSetExtensionErrorHandler'
+| ewebkit/Source/WebKit2/WebProcess/efl/WebProcessMainEfl.cpp:67: undefined reference to `XSetExtensionErrorHandler'
+| CMakeFiles/WebKit2.dir/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp.o: In function `WebKit::NetscapePlugin::platformPostInitializeWindowed(bool, unsigned long)':
+| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:170: undefined reference to `XFlush'
+| CMakeFiles/WebKit2.dir/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp.o: In function `WebKit::NetscapePlugin::platformPostInitializeWindowless()':
+| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:195: undefined reference to `XGetVisualInfo'
+| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:199: undefined reference to `XFree'
+| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:202: undefined reference to `XCreateColormap'
+| CMakeFiles/WebKit2.dir/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp.o: In function `WebKit::NetscapePlugin::platformDestroy()':
+| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:251: undefined reference to `XFreeColormap'
+| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:255: undefined reference to `XFreePixmap'
+| CMakeFiles/WebKit2.dir/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp.o: In function `WebKit::NetscapePlugin::platformGeometryDidChange()':
+| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:293: undefined reference to `XCreatePixmap'
+| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:286: undefined reference to `XFreePixmap'
+| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:295: undefined reference to `XSync'
+| CMakeFiles/WebKit2.dir/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp.o: In function `WebKit::NetscapePlugin::platformPaint(WebCore::GraphicsContext*, WebCore::IntRect const&, bool)':
+| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:343: undefined reference to `XSync'
+| collect2: error: ld returned 1 exit status
+| Source/WebKit2/CMakeFiles/WebKit2.dir/build.make:16145: recipe for target 'lib/libewebkit2.so.1.11.0' failed
+| make[2]: *** [lib/libewebkit2.so.1.11.0] Error 1
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Source/WebCore/PlatformEfl.cmake         | 1 +
+ Source/WebKit2/PlatformEfl.cmake         | 3 +++
+ Source/cmake/OptionsEfl.cmake            | 1 +
+ Tools/WebKitTestRunner/PlatformEfl.cmake | 1 +
+ 4 files changed, 6 insertions(+)
+
+diff --git a/Source/WebCore/PlatformEfl.cmake b/Source/WebCore/PlatformEfl.cmake
+index 41ffc15..63b7861 100644
+--- a/Source/WebCore/PlatformEfl.cmake
++++ b/Source/WebCore/PlatformEfl.cmake
+@@ -404,6 +404,7 @@ if (WTF_USE_3D_GRAPHICS)
+         )
+     endif ()
+ 
++    find_package(X11 REQUIRED)
+     list(APPEND WebCore_LIBRARIES
+         ${X11_X11_LIB}
+     )
+diff --git a/Source/WebKit2/PlatformEfl.cmake b/Source/WebKit2/PlatformEfl.cmake
+index 8c66d1b..d96f0bd 100644
+--- a/Source/WebKit2/PlatformEfl.cmake
++++ b/Source/WebKit2/PlatformEfl.cmake
+@@ -331,12 +331,15 @@ if (ENABLE_SECCOMP_FILTERS)
+ endif ()
+ 
+ if (ENABLE_ECORE_X)
++    find_package(X11 REQUIRED)
+     list(APPEND WebProcess_LIBRARIES
+         ${ECORE_X_LIBRARIES}
+         ${X11_Xext_LIB}
+     )
+     list(APPEND WebKit2_LIBRARIES
+         ${ECORE_X_LIBRARIES}
++        ${X11_X11_LIB}
++        ${X11_Xext_LIB}
+     )
+ endif ()
+ 
+diff --git a/Source/cmake/OptionsEfl.cmake b/Source/cmake/OptionsEfl.cmake
+index 8585f19..1aa9002 100644
+--- a/Source/cmake/OptionsEfl.cmake
++++ b/Source/cmake/OptionsEfl.cmake
+@@ -181,6 +181,7 @@ endif ()
+ 
+ if (WTF_OS_UNIX)
+     set(ENABLE_X11_TARGET ON)
++    find_package(X11 REQUIRED)
+     add_definitions(-DXP_UNIX)
+ endif (WTF_OS_UNIX)
+ 
+diff --git a/Tools/WebKitTestRunner/PlatformEfl.cmake b/Tools/WebKitTestRunner/PlatformEfl.cmake
+index 1873279..a905f2a 100644
+--- a/Tools/WebKitTestRunner/PlatformEfl.cmake
++++ b/Tools/WebKitTestRunner/PlatformEfl.cmake
+@@ -53,6 +53,7 @@ list(APPEND WebKitTestRunnerInjectedBundle_LIBRARIES
+ )
+ 
+ if (ENABLE_ECORE_X)
++    find_package(X11 REQUIRED)
+     list(APPEND WebKitTestRunner_INCLUDE_DIRECTORIES
+         ${ECORE_X_INCLUDE_DIRS}
+     )
+-- 
+2.6.0
+
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb b/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb
index 068c0d9..07cbd89 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb
@@ -5,6 +5,7 @@ SRC_URI += "\
     file://0002-WebKitHelpers.cmake-Add-Wno-error-deprecated-declara.patch \
     file://0003-FEBlendNEON.h-fix-missing-semicolon.patch \
     file://0004-Fix-the-build-with-EFL-1.12-https-bugs.webkit.org-sh.patch \
+    file://0005-Fix-the-build-with-cmake-3.patch \
 "
 SRC_URI[md5sum] = "90fa970ebf8646319d292c2bb5bff5db"
 SRC_URI[sha256sum] = "d8d21e27f4a21cd77c41914548c184ddb98693ba23851aa66c8e51c0be4b90b7"
-- 
2.6.0


