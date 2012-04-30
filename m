Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkIt-000409-9s
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:41:47 +0200
Received: by wgbds1 with SMTP id ds1so2012213wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qxWtb50nubpLT6yl3JuNI7n953KzH7UGX7kfrQdTfNc=;
	b=iCRbgAPJgrHzKx2ja19C37FrZFYcz4RVBCss/8FKa86cjztNYErQZBOSeZNlUxhZ/r
	ZRCNrFFCBN4ZhjtYmqi5uIlqyn0WQREzPBtIK00E4kYlR/TpKeSbf7bOJRSbLrUoO697
	Dj+pltA6CqMU6EVskvgJAvuiMNQndeYOQg7ffmXAHAy3QUzubACS9iQaVi8w64bXKl9V
	dMfqPDIdkBbxQ/m2wpfotPWWVcZ78DGt6fX91JdvXZHm7OIPSPT+0O8nxSooWO8ZSt+w
	z+PGjTtc6VBo24m7utxwSXIenWov510N7qc9I1Fk1VmEWlG0g82MK5P7eWRT3tvHe1o2
	Pa1w==
Received: by 10.216.132.140 with SMTP id o12mr11835982wei.67.1335767524178;
	Sun, 29 Apr 2012 23:32:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm41882796wiw.5.2012.04.29.23.32.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:32:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:31:13 +0200
Message-Id: <9bbfc40f3714462b063a0295670e2f771ffef1ce.1335766581.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 6/6] webkit-efl: fix build with gcc-4.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 06:41:47 -0000

* that patch is backport of
  http://trac.webkit.org/changeset/113786/trunk/
  to our SRCREV

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...t-pass-P-to-the-preprocessor-when-running.patch |   76 ++++++++++++++++++++
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |    3 +-
 2 files changed, 78 insertions(+), 1 deletions(-)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch
new file mode 100644
index 0000000..dcd3a46
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch
@@ -0,0 +1,76 @@
+From 3dfc99730b99472d642f19b825fb9794e32a05c4 Mon Sep 17 00:00:00 2001
+From: "rakuco@webkit.org"
+ <rakuco@webkit.org@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Tue, 10 Apr 2012 22:59:04 +0000
+Subject: [PATCH] [CMake] Do not pass -P to the preprocessor when running
+ make_names.pl.
+ https://bugs.webkit.org/show_bug.cgi?id=83225
+
+Reviewed by Rob Buis.
+
+This is necessary to make CMake-based ports build with the
+recently-released GCC 4.7.0, whose preprocessor seems to ignore
+empty lines when -P is passed to it.  Such behavior breaks
+make_names.pl (in fact, InFilesParser.pm), which expects an empty
+line to separate common and specific sections in .in files.
+
+A fix for this same problem has been supposedly done in r84123,
+but as the CMake-based ports always pass --preprocessor to the
+Perl tools the fix never reached us.
+
+The idea is to define CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS
+for (!MSVC && !QNX) and use it in the macros which call
+make_names.pl.
+
+* Source/cmake/OptionsCommon.cmake:
+* Source/cmake/WebKitMacros.cmake:
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk@113786 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+---
+ ChangeLog                        |   24 ++++++++++++++++++++++++
+ Source/cmake/OptionsCommon.cmake |    7 +++++++
+ Source/cmake/WebKitMacros.cmake  |    2 +-
+ 3 files changed, 32 insertions(+), 1 deletions(-)
+
+diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsCommon.cmake
+index 11581e6..37cb4a8 100644
+--- a/Source/cmake/OptionsCommon.cmake
++++ b/Source/cmake/OptionsCommon.cmake
+@@ -5,14 +5,21 @@ IF (WTF_OS_UNIX)
+     ADD_DEFINITIONS(-DXP_UNIX)
+ ENDIF (WTF_OS_UNIX)
+ 
++# CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS only matters with GCC >= 4.7.0.  Since this
++# version, -P does not output empty lines, which currently breaks make_names.pl in
++# WebCore. Investigating whether make_names.pl should be changed instead is left as an exercise to
++# the reader.
+ IF (MSVC)
+     # FIXME: Some codegenerators don't support paths with spaces. So use the executable name only.
+     GET_FILENAME_COMPONENT(CODE_GENERATOR_PREPROCESSOR_EXECUTABLE ${CMAKE_CXX_COMPILER} NAME)
+     SET(CODE_GENERATOR_PREPROCESSOR "${CODE_GENERATOR_PREPROCESSOR_EXECUTABLE} /nologo /EP")
++    SET(CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS "${CODE_GENERATOR_PREPROCESSOR}")
+ ELSEIF (CMAKE_SYSTEM_NAME MATCHES QNX)
+     SET(CODE_GENERATOR_PREPROCESSOR "${CMAKE_CXX_COMPILER} -E -Wp,-P -x c++")
++    SET(CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS "${CODE_GENERATOR_PREPROCESSOR}")
+ ELSE ()
+     SET(CODE_GENERATOR_PREPROCESSOR "${CMAKE_CXX_COMPILER} -E -P -x c++")
++    SET(CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS "${CMAKE_CXX_COMPILER} -E -x c++")
+ ENDIF ()
+ 
+ SET_PROPERTY(GLOBAL PROPERTY USE_FOLDERS ON)
+diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros.cmake
+index 3abe342..4e7ca9f 100644
+--- a/Source/cmake/WebKitMacros.cmake
++++ b/Source/cmake/WebKitMacros.cmake
+@@ -89,7 +89,7 @@ MACRO (GENERATE_DOM_NAMES _namespace _attrs)
+     ADD_CUSTOM_COMMAND(
+         OUTPUT  ${_outputfiles}
+         DEPENDS ${NAMES_GENERATOR} ${SCRIPTS_BINDINGS} ${_attrs} ${_tags}
+-        COMMAND ${PERL_EXECUTABLE} -I${WEBCORE_DIR}/bindings/scripts ${NAMES_GENERATOR} --preprocessor "${CODE_GENERATOR_PREPROCESSOR}" --outputDir ${DERIVED_SOURCES_WEBCORE_DIR} ${_arguments} ${_additionArguments}
++        COMMAND ${PERL_EXECUTABLE} -I${WEBCORE_DIR}/bindings/scripts ${NAMES_GENERATOR} --preprocessor "${CODE_GENERATOR_PREPROCESSOR_WITH_LINEMARKERS}" --outputDir ${DERIVED_SOURCES_WEBCORE_DIR} ${_arguments} ${_additionArguments}
+         VERBATIM)
+ ENDMACRO ()
+ 
+-- 
+1.7.7
+
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index c0e346c..cd38096 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -11,7 +11,7 @@ DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
 
 SRCREV = "105069"
 PV = "1.7.3+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRCREV_FORMAT = "source"
 
@@ -20,6 +20,7 @@ SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;proto=http;subdir=src \
   svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;proto=http;subdir=src \
   file://0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch \
+  file://0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch \
   file://CMakeLists.txt \
 "
 
-- 
1.7.8.6



