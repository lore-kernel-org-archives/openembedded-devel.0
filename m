Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id EB73C605FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:56:35 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g62so182536559wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TgVtBMTV1A2z3egminQYzqvdtY+peYIox8+p77TbF8w=;
	b=a9tYr8UiDbXt5zq3e01kcBlFE2gfTIiEf1+WI5ok3Z0YZNbYsYd+nHFG287n9A/z5b
	osMSoYgEwOGTz+wKRUeqbagBZINKSzpNkAPpOPESGHucuQvLuNapNaMXQ9pFeNuvevRK
	tYPXJJzo8q7RQY+QT9dS3qBJ0r7EH80Ga9V9wUwha86s19/QlzgY1TAG/NWSXw45CZ61
	wrPTwFHVFQJk/8vgN2qq9+u+YI0wB2HbjJbT3y8xRw+am2pfKVDNDRB+/fwghIJbnorV
	DswVr9eIcOJoRgETzs1tOTmMnuPtnV8gI3NmeEka0ugUAr5jhH36onXy3kFmKXQF6EM/
	qzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TgVtBMTV1A2z3egminQYzqvdtY+peYIox8+p77TbF8w=;
	b=HS+Yz8gFf7Xm4ZbnqLhI0SBZ5E0xznH9ZjjuEIhmsCxm/uGQs75emT2BKs4vLBBhOw
	5cMzDMXYyvFhoWD223M5x47m0H01z0VhAYoHnVmoI0fQqdOcX1ncuSsAVBmSu7y01KoA
	LSfPufYvXYvoedl5xKQk4cwdrXlmgVLVQvGnVclwUJrzH5HV/r3Ympt6xC1dskkLNNTB
	SmBLhtX0FysrJV/y0Zrjk6M+lhb6Ii88BNa+T3oM4bf16CGvUJ1Z9m33Ku9epfYl6tji
	P/w9F2i9inNFvNjlLYUvE4YsaXn2THyNeB9Y4m6fItp8ASt7ga6PP6ip2ZJ2eLhwhOrY
	O9hg==
X-Gm-Message-State: AG10YOQMNslDsfKkqEWUSqgD8Q3NJDgjW+MzVQ9eP9zJuiiHFV9tkTqlH3SJH8KZYReZOg==
X-Received: by 10.194.186.232 with SMTP id fn8mr4002179wjc.93.1455746196019;
	Wed, 17 Feb 2016 13:56:36 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	az10sm3457727wjc.28.2016.02.17.13.56.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Feb 2016 13:56:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Feb 2016 22:56:45 +0100
Message-Id: <1455746205-31727-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455746205-31727-1-git-send-email-Martin.Jansa@gmail.com>
References: <1455746205-31727-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 5/5] qtbase: Don't install libQt* files twice
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
X-List-Received-Date: Wed, 17 Feb 2016 21:56:36 -0000

* they are installed by make correctly (at least with latest 5.6 revisions)
* I wanted to remove .la files (in qmake5_base_do_install) and this copies them back to ${D} which is annoying.
So I've removed this cp line and checked what gets missing and it turns
out that nothing important is missing and even more importantly the fixed *prl files
are overwritten with their original version.

OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase $ diff -rq 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0*/image
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5Bootstrap.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5BootstrapDBus.a
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5BootstrapDBus.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5BootstrapDBus.prl
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5Concurrent.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5Core.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5DBus.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5Gui.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5Network.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5OpenGL.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5OpenGLExtensions.la
Files 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5OpenGLExtensions.prl and
5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/lib/libQt5OpenGLExtensions.prl differ
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5PlatformSupport.la
Files 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5PlatformSupport.prl and
5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/lib/libQt5PlatformSupport.prl differ
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5PrintSupport.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5Sql.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5Test.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5Widgets.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5XcbQpa.la
Only in 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib: libQt5Xml.la

OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase $ diff -uNr 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5OpenGLExtensions.prl
5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/lib/libQt5OpenGLExtensions.prl
--- 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5OpenGLExtensions.prl      2016-02-17 22:34:16.397812156 +0100
+++ 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/lib/libQt5OpenGLExtensions.prl   2016-02-17 22:38:56.637811683 +0100
@@ -3,4 +3,4 @@
 QMAKE_PRL_TARGET = libQt5OpenGLExtensions.a
 QMAKE_PRL_CONFIG = silent lex yacc depend_includepath testcase_targets import_plugins import_qpa_plugin qt warn_on release link_prl incremental cross_compile
qpa no_mocdepend release qt_no_framework linux unix posix \$(OE_QMAKE_COMPILER) gcc cross_compile compile_examples qpa largefile use_gold_linker sse2 sse3
ssse3 sse4_1 sse4_2 avx avx2 pcre prefix_build force_independent force_bootstrap create_prl link_prl prepare_docs qt_docs_targets
no_private_qt_headers_warning QTDIR_build exceptions_off testcase_exceptions qt_example_installs warning_clean c++11 static opengl relative_qt_rpath git_build
qmake_cache target_qt c++11 strict_c++ c++14 c++1z hide_symbols bsymbolic_functions qt_install_headers need_fwd_pri qt_install_module create_cmake
compiler_supports_fpmath create_pc create_libtool have_target staticlib thread opengl moc resources
 QMAKE_PRL_VERSION = 5.6.0
-QMAKE_PRL_LIBS = -L/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/build/lib -lQt5Gui -lQt5Core -lpthread -lGL
+QMAKE_PRL_LIBS =  -lQt5Gui -lQt5Core -lpthread -lGL

OE @ ~/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase $ diff -uNr 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5PlatformSupport.prl
5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/lib/libQt5PlatformSupport.prl
--- 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0.orig/image/usr/lib/libQt5PlatformSupport.prl       2016-02-17 22:34:16.438812156 +0100
+++ 5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/image/usr/lib/libQt5PlatformSupport.prl    2016-02-17 22:38:56.969811683 +0100
@@ -3,4 +3,4 @@
 QMAKE_PRL_TARGET = libQt5PlatformSupport.a
 QMAKE_PRL_CONFIG = silent lex yacc depend_includepath testcase_targets import_plugins import_qpa_plugin qt warn_on release link_prl incremental cross_compile
qpa no_mocdepend release qt_no_framework linux unix posix \$(OE_QMAKE_COMPILER) gcc cross_compile compile_examples qpa largefile use_gold_linker sse2 sse3
ssse3 sse4_1 sse4_2 avx avx2 pcre prefix_build force_independent force_bootstrap create_prl link_prl prepare_docs qt_docs_targets
no_private_qt_headers_warning QTDIR_build exceptions_off testcase_exceptions qt_example_installs warning_clean c++11 static internal_module egl opentype
qpa/genericunixfontdatabase relative_qt_rpath git_build qmake_cache target_qt c++11 strict_c++ c++14 c++1z hide_symbols bsymbolic_functions qt_install_headers
need_fwd_pri qt_install_module compiler_supports_fpmath create_libtool have_target staticlib qpa/basicunixfontdatabase thread opengl dbusadaptors
dbusinterfaces moc resources
 QMAKE_PRL_VERSION = 5.6.0
-QMAKE_PRL_LIBS = -L/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.5.99+5.6.0-rc+gitAUTOINC+ac8a3b948d-r0/build/lib -lQt5Gui -lQt5DBus -lQt5Core
-lpthread -lgthread-2.0 -pthread -lglib-2.0 -lqtfreetype -lz -lpng -lXrender -lXext -lX11 -lm -ludev -lEGL -lGL
+QMAKE_PRL_LIBS =  -lQt5Gui -lQt5DBus -lQt5Core -lpthread -lgthread-2.0 -pthread -lglib-2.0 -lqtfreetype -lz -lpng -lXrender -lXext -lX11 -lm -ludev -lEGL
-lGL

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 31ef793..b4c6c1f 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -212,7 +212,6 @@ do_install_append() {
         cp -d ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
         chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
     fi
-    cp -d ${B}/lib/libQt* ${D}${libdir}
     # Remove example.pro file as it is useless
     rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
 
-- 
2.7.1


