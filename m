Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8155.1598430798371279155
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 01:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48290 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAqrn-0003q4-NC; Wed, 26 Aug 2020 11:33:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCHv2] doxygen: Upgrade 1.8.17 -> 1.8.20
Date: Wed, 26 Aug 2020 11:33:07 +0300
Message-Id: <20200826083307.31775-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.8.20:

- Add configuration setting to have docstrings not as preformatted
  text but as normal documentation
- Bug fix: void return type reported as not documented
- Bug fix: Doxywizard 1.8.19 (Windows): Source code directory
  seems to be ignored
- Bug fix: The Doxygen uses too much memory (or has probably a
  memory leak)
- Bug fix: Doxygen doesn't stop on errors
- Bug fix: C++ grouped functions in namespace have disappeard
- Improvement of line count for e.g. warnings
- Improved layout on the bibliography page
- Updated the swedish language translation to 1.8.19

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../doxygen-native-only-check-python3.patch   | 359 ++++--------------
 .../{doxygen_1.8.17.bb => doxygen_1.8.20.bb}  |   4 +-
 2 files changed, 85 insertions(+), 278 deletions(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.17.bb => doxygen_1.8.20.bb} (79%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch b/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
index a9650c232..53f88885f 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
@@ -1,5 +1,10 @@
-It fails to compile doxygen-native when /usr/bin/python is a link to python3 on
-build host:
+From aa833cf56c5cc2e87a1d91881eb2286beb34e417 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Wed, 26 Aug 2020 10:52:10 +0300
+Subject: [PATCH] doxygen: Fix Python issues for doxygen-native
+
+It fails to compile doxygen-native when /usr/bin/python is a link
+to python3 on build host:
 
 | Failed to import the site module
 | Traceback (most recent call last):
@@ -21,21 +26,31 @@ build host:
 |     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
 | ModuleNotFoundError: No module named '_sysconfigdata'
 
-Replace find_package PythonInterp with Python3 to fix this issue that
-it uses python3 from python3-native. And it also replaces the result
-variable PYTHON_EXECUTABLE with Python3_EXECUTABLE.
+Replace find_package PythonInterp with Python3 to fix this issue
+that it uses python3 from python3-native. And it also replaces the
+result variable PYTHON_EXECUTABLE with Python3_EXECUTABLE.
 
 This patch is only needded by doxygen-native.
 
 Upstream-Status: Inappropriate[oe specific]
 
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Co-Authored-By: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
+ CMakeLists.txt                  |  2 +-
+ addon/doxywizard/CMakeLists.txt |  6 +++---
+ doc/CMakeLists.txt              |  6 +++---
+ examples/CMakeLists.txt         |  4 ++--
+ libmscgen/CMakeLists.txt        |  2 +-
+ src/CMakeLists.txt              | 12 ++++++------
+ testing/CMakeLists.txt          |  4 ++--
+ 7 files changed, 18 insertions(+), 18 deletions(-)
+
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 969ae58..604400f 100644
+index 35e6a0c2..9aaebbdf 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -93,7 +93,7 @@ else ()
+@@ -100,7 +100,7 @@ else ()
  endif ()
  
  find_program(DOT NAMES dot)
@@ -45,7 +60,7 @@ index 969ae58..604400f 100644
  find_package(BISON REQUIRED)
  if (BISON_VERSION VERSION_LESS 2.7)
 diff --git a/addon/doxywizard/CMakeLists.txt b/addon/doxywizard/CMakeLists.txt
-index 6aacd8b..fa197e9 100644
+index 6aacd8b6..fa197e9e 100644
 --- a/addon/doxywizard/CMakeLists.txt
 +++ b/addon/doxywizard/CMakeLists.txt
 @@ -58,7 +58,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/settings.h PROPERTIES GENERA
@@ -76,7 +91,7 @@ index 6aacd8b..fa197e9 100644
  	OUTPUT  ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
      )
 diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
-index 032c16a..332f1b2 100644
+index a094c570..8a757c20 100644
 --- a/doc/CMakeLists.txt
 +++ b/doc/CMakeLists.txt
 @@ -132,7 +132,7 @@ configure_file(${CMAKE_SOURCE_DIR}/doc/doxyindexer.1      ${PROJECT_BINARY_DIR}/
@@ -85,7 +100,7 @@ index 032c16a..332f1b2 100644
  add_custom_command(
 -        COMMAND ${PYTHON_EXECUTABLE} translator.py ${CMAKE_SOURCE_DIR}
 +        COMMAND ${Python3_EXECUTABLE} translator.py ${CMAKE_SOURCE_DIR}
-         DEPENDS ${PROJECT_BINARY_DIR}/doc/maintainers.txt ${PROJECT_BINARY_DIR}/doc/language.tpl ${PROJECT_BINARY_DIR}/doc/translator.py
+         DEPENDS ${CMAKE_SOURCE_DIR}/doc/maintainers.txt ${CMAKE_SOURCE_DIR}/doc/language.tpl ${PROJECT_BINARY_DIR}/doc/translator.py ${LANG_FILES}
          OUTPUT language.doc
          WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc
 @@ -141,7 +141,7 @@ set_source_files_properties(language.doc PROPERTIES GENERATED 1)
@@ -107,235 +122,19 @@ index 032c16a..332f1b2 100644
      COMMAND ${CMAKE_COMMAND} -E rename ${PROJECT_BINARY_DIR}/chm/index.chm ${PROJECT_BINARY_DIR}/chm/doxygen_manual.chm
          DEPENDS ${PROJECT_BINARY_DIR}/doc/language.doc ${PROJECT_BINARY_DIR}/doc/config.doc
 diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
-index 967f3d4..a8d1aad 100644
+index 3f1c79b8..d5866ee1 100644
 --- a/examples/CMakeLists.txt
 +++ b/examples/CMakeLists.txt
-@@ -52,196 +52,196 @@ add_custom_target(examples
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen class.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/class/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/class/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/class/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/class/latex/refman_doc.tex
- 	DEPENDS doxygen class.h class.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/class/html/index.html ${PROJECT_BINARY_DIR}/html/examples/class/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen define.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/define/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/define/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/define/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/define/latex/refman_doc.tex
- 	DEPENDS doxygen define.h define.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/define/html/index.html ${PROJECT_BINARY_DIR}/html/examples/define/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen enum.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/enum/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/enum/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/enum/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/enum/latex/refman_doc.tex
- 	DEPENDS doxygen enum.h enum.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/enum/html/index.html ${PROJECT_BINARY_DIR}/html/examples/enum/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen file.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/file/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/file/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/file/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/file/latex/refman_doc.tex
- 	DEPENDS doxygen file.h file.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/file/html/index.html ${PROJECT_BINARY_DIR}/html/examples/file/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen func.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/func/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/func/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/func/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/func/latex/refman_doc.tex
- 	DEPENDS doxygen func.h func.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/func/html/index.html ${PROJECT_BINARY_DIR}/html/examples/func/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen javadoc-banner.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/javadoc-banner/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/javadoc-banner/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/javadoc-banner/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/javadoc-banner/latex/refman_doc.tex
- 	DEPENDS doxygen javadoc-banner.h javadoc-banner.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/javadoc-banner/html/index.html ${PROJECT_BINARY_DIR}/html/examples/javadoc-banner/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen page.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/page/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/page/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/page/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/page/latex/refman_doc.tex
- 	DEPENDS doxygen page.doc page.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/page/html/index.html ${PROJECT_BINARY_DIR}/html/examples/page/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen relates.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/relates/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/relates/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/relates/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/relates/latex/refman_doc.tex
- 	DEPENDS doxygen relates.cpp relates.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/relates/html/index.html ${PROJECT_BINARY_DIR}/html/examples/relates/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen author.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/author/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/author/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/author/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/author/latex/refman_doc.tex
- 	DEPENDS doxygen author.cpp author.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/author/html/index.html ${PROJECT_BINARY_DIR}/html/examples/author/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen par.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/par/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/par/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/par/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/par/latex/refman_doc.tex
- 	DEPENDS doxygen par.cpp par.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/par/html/index.html ${PROJECT_BINARY_DIR}/html/examples/par/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen overload.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/overload/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/overload/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/overload/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/overload/latex/refman_doc.tex
- 	DEPENDS doxygen overload.cpp overload.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/overload/html/index.html ${PROJECT_BINARY_DIR}/html/examples/overload/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen example.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/example/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/example/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/example/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/example/latex/refman_doc.tex
- 	DEPENDS doxygen example.cpp example_test.cpp example.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/example/html/index.html ${PROJECT_BINARY_DIR}/html/examples/example/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen include.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/include/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/include/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/include/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/include/latex/refman_doc.tex
- 	DEPENDS doxygen include.cpp include_test.cpp include.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/include/html/index.html ${PROJECT_BINARY_DIR}/html/examples/include/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen qtstyle.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/qtstyle/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/qtstyle/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/qtstyle/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/qtstyle/latex/refman_doc.tex
- 	DEPENDS doxygen qtstyle.cpp qtstyle.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/qtstyle/html/index.html ${PROJECT_BINARY_DIR}/html/examples/qtstyle/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen jdstyle.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/jdstyle/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/jdstyle/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/jdstyle/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/jdstyle/latex/refman_doc.tex
- 	DEPENDS doxygen jdstyle.cpp jdstyle.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/jdstyle/html/index.html ${PROJECT_BINARY_DIR}/html/examples/jdstyle/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen structcmd.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/structcmd/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/structcmd/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/structcmd/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/structcmd/latex/refman_doc.tex
- 	DEPENDS doxygen structcmd.h structcmd.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/structcmd/html/index.html ${PROJECT_BINARY_DIR}/html/examples/structcmd/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen autolink.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/autolink/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/autolink/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/autolink/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/autolink/latex/refman_doc.tex
- 	DEPENDS doxygen autolink.cpp autolink.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/autolink/html/index.html ${PROJECT_BINARY_DIR}/html/examples/autolink/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen tag.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/tag/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/tag/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/tag/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/tag/latex/refman_doc.tex
- 	DEPENDS doxygen tag.cpp tag.cfg ${PROJECT_BINARY_DIR}/html/examples/example/html/index.html ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/tag/html/index.html ${PROJECT_BINARY_DIR}/html/examples/tag/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen restypedef.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/restypedef/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/restypedef/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/restypedef/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/restypedef/latex/refman_doc.tex
- 	DEPENDS doxygen restypedef.cpp restypedef.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/restypedef/html/index.html ${PROJECT_BINARY_DIR}/html/examples/restypedef/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen afterdoc.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/afterdoc/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/afterdoc/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/afterdoc/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/afterdoc/latex/refman_doc.tex
- 	DEPENDS doxygen afterdoc.h afterdoc.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/afterdoc/html/index.html ${PROJECT_BINARY_DIR}/html/examples/afterdoc/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen templ.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/template/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/template/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/template/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/template/latex/refman_doc.tex
- 	DEPENDS doxygen templ.cpp templ.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/template/html/index.html ${PROJECT_BINARY_DIR}/html/examples/template/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen group.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/group/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/group/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/group/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/group/latex/refman_doc.tex
- 	DEPENDS doxygen group.cpp group.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/group/html/index.html ${PROJECT_BINARY_DIR}/html/examples/group/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen memgrp.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/memgrp/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/memgrp/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/memgrp/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/memgrp/latex/refman_doc.tex
- 	DEPENDS doxygen memgrp.cpp memgrp.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/memgrp/html/index.html ${PROJECT_BINARY_DIR}/html/examples/memgrp/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen pyexample.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/pyexample/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/pyexample/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/pyexample/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/pyexample/latex/refman_doc.tex
- 	DEPENDS doxygen pyexample.py pyexample.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/pyexample/html/index.html ${PROJECT_BINARY_DIR}/html/examples/pyexample/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen tclexample.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/tclexample/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/tclexample/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/tclexample/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/tclexample/latex/refman_doc.tex
- 	DEPENDS doxygen tclexample.tcl tclexample.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/tclexample/html/index.html ${PROJECT_BINARY_DIR}/html/examples/tclexample/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen mux.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/mux/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/mux/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/mux/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/mux/latex/refman_doc.tex
- 	DEPENDS doxygen mux.vhdl mux.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/mux/html/index.html ${PROJECT_BINARY_DIR}/html/examples/mux/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen manual.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/manual/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/manual/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/manual/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/manual/latex/refman_doc.tex
- 	DEPENDS doxygen manual.c manual.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/manual/html/index.html ${PROJECT_BINARY_DIR}/html/examples/manual/latex/refman_doc.tex
- )
- 
- add_custom_command(
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen docstring.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/docstring/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/docstring/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/docstring/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/docstring/latex/refman_doc.tex
- 	DEPENDS doxygen docstring.py docstring.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/docstring/html/index.html ${PROJECT_BINARY_DIR}/html/examples/docstring/latex/refman_doc.tex
- )
-@@ -249,7 +249,7 @@ add_custom_command(
+@@ -51,7 +51,7 @@ foreach (f_inp  ${BASIC_EXAMPLES})
+         string(REGEX REPLACE ":.*" "" f ${f_inp})
+     add_custom_command(
+ 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen ${f}.cfg
+-        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/${f}/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/${f}/latex/refman_doc.tex
++        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/${f}/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/${f}/latex/refman_doc.tex
+ 	DEPENDS doxygen ${f}.${f_ext} ${f}.cfg ${TOP}/examples/strip_example.py
+ 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/${f}/html/index.html ${PROJECT_BINARY_DIR}/html/examples/${f}/latex/refman_doc.tex
+     )
+@@ -68,7 +68,7 @@ add_custom_target(examples
  if (DOT)
    add_custom_command(
  	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen diagrams.cfg
@@ -345,7 +144,7 @@ index 967f3d4..a8d1aad 100644
  	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/diagrams/html/index.html ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman_doc.tex
    )
 diff --git a/libmscgen/CMakeLists.txt b/libmscgen/CMakeLists.txt
-index 079fcfc..e6d86f6 100644
+index 079fcfc8..e6d86f61 100644
 --- a/libmscgen/CMakeLists.txt
 +++ b/libmscgen/CMakeLists.txt
 @@ -7,7 +7,7 @@ include_directories(
@@ -358,76 +157,84 @@ index 079fcfc..e6d86f6 100644
          OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
      )
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 23460d0..58f679a 100644
+index cb289116..356741ff 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -35,7 +35,7 @@ set_source_files_properties(${GENERATED_SRC}/settings.h PROPERTIES GENERATED 1)
+@@ -39,7 +39,7 @@ set_source_files_properties(${GENERATED_SRC}/settings.h PROPERTIES GENERATED 1)
  
  # configvalues.h
  add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -maph ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configvalues.h
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -maph ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configvalues.h
-     DEPENDS ${CMAKE_SOURCE_DIR}/src/config.xml ${CMAKE_SOURCE_DIR}/src/configgen.py
+-    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maph ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.h
++    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maph ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.h
+     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
      OUTPUT ${GENERATED_SRC}/configvalues.h
  )
-@@ -47,7 +47,7 @@ add_custom_target(
+@@ -51,7 +51,7 @@ add_custom_target(
  
  # configvalues.cpp
  add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -maps ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configvalues.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -maps ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configvalues.cpp
-     DEPENDS ${CMAKE_SOURCE_DIR}/src/config.xml ${CMAKE_SOURCE_DIR}/src/configgen.py
+-    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maps ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.cpp
++    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maps ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.cpp
+     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
      OUTPUT ${GENERATED_SRC}/configvalues.cpp
  )
-@@ -55,7 +55,7 @@ set_source_files_properties(${GENERATED_SRC}/configvalues.cpp PROPERTIES GENERAT
+@@ -59,7 +59,7 @@ set_source_files_properties(${GENERATED_SRC}/configvalues.cpp PROPERTIES GENERAT
  
  # configoptions.cpp
  add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -cpp ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configoptions.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -cpp ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configoptions.cpp
-     DEPENDS ${CMAKE_SOURCE_DIR}/src/config.xml ${CMAKE_SOURCE_DIR}/src/configgen.py
+-    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -cpp ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configoptions.cpp
++    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -cpp ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configoptions.cpp
+     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
      OUTPUT ${GENERATED_SRC}/configoptions.cpp
  )
-@@ -86,7 +86,7 @@ file(GLOB RESOURCES ${CMAKE_SOURCE_DIR}/templates/*/*)
+@@ -94,7 +94,7 @@ endif()
  # resources.cpp
  add_custom_command(
      COMMENT  "Generating ${GENERATED_SRC}/resources.cpp"
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/res2cc_cmd.py ${CMAKE_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/res2cc_cmd.py ${CMAKE_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
-     DEPENDS ${RESOURCES}
+-    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py ${CMAKE_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
++    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py ${CMAKE_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
+     DEPENDS ${RESOURCES} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py
      OUTPUT ${GENERATED_SRC}/resources.cpp
  )
-@@ -94,7 +94,7 @@ set_source_files_properties(${GENERATED_SRC}/resources.cpp PROPERTIES GENERATED
+@@ -102,7 +102,7 @@ set_source_files_properties(${GENERATED_SRC}/resources.cpp PROPERTIES GENERATED
  
  # layout_default.xml
  add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/to_c_cmd.py < ${CMAKE_SOURCE_DIR}/src/layout_default.xml > ${GENERATED_SRC}/layout_default.xml.h
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/to_c_cmd.py < ${CMAKE_SOURCE_DIR}/src/layout_default.xml > ${GENERATED_SRC}/layout_default.xml.h
-     DEPENDS ${CMAKE_SOURCE_DIR}/src/layout_default.xml
+-    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/to_c_cmd.py < ${CMAKE_CURRENT_LIST_DIR}/layout_default.xml > ${GENERATED_SRC}/layout_default.xml.h
++    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/to_c_cmd.py < ${CMAKE_CURRENT_LIST_DIR}/layout_default.xml > ${GENERATED_SRC}/layout_default.xml.h
+     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/layout_default.xml ${CMAKE_CURRENT_LIST_DIR}/to_c_cmd.py
      OUTPUT  ${GENERATED_SRC}/layout_default.xml.h
  )
-@@ -124,7 +124,7 @@ foreach(lex_file ${LEX_FILES})
+@@ -131,7 +131,7 @@ foreach(lex_file ${LEX_FILES})
      set(LEX_FILES_H ${LEX_FILES_H} " " ${GENERATED_SRC}/${lex_file}.l.h CACHE INTERNAL "Stores generated files")
      set(LEX_FILES_CPP ${LEX_FILES_CPP} " " ${GENERATED_SRC}/${lex_file}.cpp CACHE INTERNAL "Stores generated files")
      add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/scan_states.py ${CMAKE_SOURCE_DIR}/src/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-+        COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/scan_states.py ${CMAKE_SOURCE_DIR}/src/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-         DEPENDS ${CMAKE_SOURCE_DIR}/src/scan_states.py ${CMAKE_SOURCE_DIR}/src/${lex_file}.l
+-        COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/scan_states.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
++        COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/scan_states.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
+         DEPENDS ${CMAKE_CURRENT_LIST_DIR}/scan_states.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l
          OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
      )
 diff --git a/testing/CMakeLists.txt b/testing/CMakeLists.txt
-index 40cb40b..a301acd 100644
+index b354e78f..28d45e11 100644
 --- a/testing/CMakeLists.txt
 +++ b/testing/CMakeLists.txt
-@@ -1,9 +1,9 @@
+@@ -1,7 +1,7 @@
+ # run all tests sequentially (keep for backward compatibility)
  add_custom_target(tests
-          COMMENT "Running doxygen tests..."
--	 COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
-+	 COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
-          DEPENDS doxygen
- )
- add_test(NAME suite
--	COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --doxygen $<TARGET_FILE:doxygen> --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
-+	COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --doxygen $<TARGET_FILE:doxygen> --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
- )
- 
+ 	COMMENT "Running doxygen tests..."
+-	COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
++	COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
+ 	DEPENDS doxygen
+ )
+ 
+@@ -19,6 +19,6 @@ foreach(TEST_FILE ${TEST_FILES})
+ 	string(REGEX REPLACE "^.*/([0-9][0-9][0-9]*).*$" "\\1" TEST_ID "${TEST_FILE}")
+ 	# add a test target for each test
+ 	add_test(NAME ${TEST_NAME}
+-		 COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
++		 COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
+ 	)
+ endforeach()
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
similarity index 79%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
index 45de71826..d4ac3b720 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
@@ -10,8 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch \
 "
 SRC_URI_append_class-native = " file://doxygen-native-only-check-python3.patch"
-SRC_URI[md5sum] = "7997a15c73a8bd6d003eaba5c2ee2b47"
-SRC_URI[sha256sum] = "2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599"
+SRC_URI[md5sum] = "8729936a843232a66fe970ef65f3c3e4"
+SRC_URI[sha256sum] = "e0db6979286fd7ccd3a99af9f97397f2bae50532e4ecb312aa18862f8401ddec"
 
 inherit cmake python3native
 
-- 
2.17.1

