Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6FBD17138
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 20:39:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.2883.1729543155985632917
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Oct 2024 13:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=anUcVxV/;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d461162b8so3260446f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729543154; x=1730147954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UC/8FTl7kQOxlAwtFk0QZ260OXjG0S6yrJqgkQDaVq4=;
        b=anUcVxV/NOOE/ynzjiKjV7oPlTjivEMYeKoNe852R/HVekhlwNaRMN6o5cOeCkFxrQ
         RXeozmaA9oijTNuuYcIYoNwtWcXrY3nD+ZoeQ76dssO4oipc6Yy9Cd3pAiWOJvvhMLYa
         4FspfFYVQdhpBIrkQv6A3W3GJHq0o6Jgb+/IJTG2DGfRJt5Tg8VWL+vLPov5XgExtwmN
         YfNkCa7D41raAbNKPG83jnIHiiCQCeUH2DZCcWhY9i5b9ItyEkHX/bKNuCj4U1y/r0xa
         wSRowCImfUAp+3IQAcLCBwWFSNRym4sZqsy3WZT8ftfmw/YkZ+20DlWTKBJ1vD6q0swJ
         gEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729543154; x=1730147954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UC/8FTl7kQOxlAwtFk0QZ260OXjG0S6yrJqgkQDaVq4=;
        b=KYTF6wYqnbO8tOwzdfmQYjHjBhslB2xOD5gw1RB5J65NW+RFlJNxaQCi76ZJEtnmG4
         JagYQrHfrhfZnFVlQuXBw3ox/sgW934PJsnF5FlnLOkr+/XxZr2l+PvWx6ePODLyo32f
         RvlDyiHbnxtn8Owt9UiCdAyIladNFokKu/LKZJPPK3TngeboFrGoEYCYl1OGekk8zdKR
         819rYLAHM4i88mgl8eT+pjA46uGMsaNXILIqD47vjdHrMUg+dbAI8bmqtKo4wxIPEWef
         ZbuZlt2lXiUfgTUKp3FPYTnZQwRjv9uj3yzNoF2x+6y8wC+6kRBw/r6h1KEiavyWOSl9
         9vbA==
X-Gm-Message-State: AOJu0YwhrKkymGvEbBs3q2sSCehaBAHdyFC4Dd47AxltTuV6RNc36+/9
	bnyDU0sLw+pj+54CeEhwCHhsQK0gd3R8AIs1taiwacPxxtn3QZ7Fv/ExW3v6tKU=
X-Google-Smtp-Source: AGHT+IFZVdqtlwWO4a7FQWeBTFiyj3R2Tp0FUMVaL+q8LawgqVd50w2mAG3g/xW+sN13YhMU4LHJtw==
X-Received: by 2002:a5d:5267:0:b0:36c:ff0c:36d7 with SMTP id ffacd0b85a97d-37ea2140294mr8437236f8f.2.1729543153706;
        Mon, 21 Oct 2024 13:39:13 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm5097999f8f.89.2024.10.21.13.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:39:13 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-oe][PATCH] doxygen: version bump 1.9.3 -> 1.12.0
Date: Mon, 21 Oct 2024 22:39:04 +0200
Message-Id: <20241021203904.2905690-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 20:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113082

* The project moved from sourceforge to github (https://github.com/doxygen/doxygen?tab=readme-ov-file#source-code)
* The python3 patches are not needed anymore
* iconv patch: seems to be not longer needed

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../0001-build-don-t-look-for-Iconv.patch     |  37 ---
 .../doxygen-native-only-check-python3.patch   | 232 ------------------
 .../{doxygen_1.9.3.bb => doxygen_1.12.0.bb}   |  16 +-
 3 files changed, 9 insertions(+), 276 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
 delete mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.9.3.bb => doxygen_1.12.0.bb} (50%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
deleted file mode 100644
index 47c8edb49..000000000
--- a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 24650b0c7db6b213a2eaa5061b75b9f1b43f1ce9 Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <brgl@bgdev.pl>
-Date: Fri, 23 Nov 2018 11:44:56 +0100
-Subject: [PATCH] build: don't look for Iconv
-
-Drop the find_package() for Iconv. CMake is unable to find iconv.h in
-native build but all modern systems supply it as part of the standard
-C library. We don't need this check in meta-openembedded.
-
-Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
-
-Upstream-Status: Inappropriate
-- upstream doxygen must build on many architectures, this change is
-  too intrusive for upstream
----
- CMakeLists.txt | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 06b9696f..f30b46b8 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -117,10 +117,6 @@ if (sqlite3)
-   endif()
- endif()
- 
--find_package(Iconv REQUIRED)
--include_directories(${ICONV_INCLUDE_DIR})
--
--
- #set(DOXYDOCS ${PROJECT_SOURCE_DIR}/doc CACHE INTERNAL "Path to doxygen docs")
- set(DOXYDOCS ${PROJECT_BINARY_DIR}/doc)
- set(ENV{DOXYGEN_DOCDIR} ${DOXYDOCS})
--- 
-2.27.0
-
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch b/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
deleted file mode 100644
index 796bc61dd..000000000
--- a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
+++ /dev/null
@@ -1,232 +0,0 @@
-From daf686508f2ee4711d93e96e5b100e50bf161656 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Wed, 26 Aug 2020 10:52:10 +0300
-Subject: [PATCH] doxygen: Fix Python issues for doxygen-native
-
-It fails to compile doxygen-native when /usr/bin/python is a link
-to python3 on build host:
-
-| Failed to import the site module
-| Traceback (most recent call last):
-|   File "/usr/lib64/python3.6/site.py", line 564, in <module>
-|     main()
-|   File "/usr/lib64/python3.6/site.py", line 550, in main
-|     known_paths = addusersitepackages(known_paths)
-|   File "/usr/lib64/python3.6/site.py", line 282, in addusersitepackages
-|     user_site = getusersitepackages()
-|   File "/usr/lib64/python3.6/site.py", line 258, in getusersitepackages
-|     user_base = getuserbase() # this will also set USER_BASE
-|   File "/usr/lib64/python3.6/site.py", line 248, in getuserbase
-|     USER_BASE = get_config_var('userbase')
-|   File "/usr/lib64/python3.6/sysconfig.py", line 604, in get_config_var
-|     return get_config_vars().get(name)
-|   File "/usr/lib64/python3.6/sysconfig.py", line 553, in get_config_vars
-|     _init_posix(_CONFIG_VARS)
-|   File "/usr/lib64/python3.6/sysconfig.py", line 424, in _init_posix
-|     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
-| ModuleNotFoundError: No module named '_sysconfigdata'
-
-Replace find_package PythonInterp with Python3 to fix this issue
-that it uses python3 from python3-native. And it also replaces the
-result variable PYTHON_EXECUTABLE with Python3_EXECUTABLE.
-
-This patch is only needded by doxygen-native.
-
-Updated to apply to release 1.9.1.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Co-Authored-By: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
-
----
- CMakeLists.txt                  |  2 +-
- addon/doxywizard/CMakeLists.txt |  6 +++---
- doc/CMakeLists.txt              |  6 +++---
- examples/CMakeLists.txt         |  4 ++--
- libmscgen/CMakeLists.txt        |  2 +-
- src/CMakeLists.txt              | 10 +++++-----
- testing/CMakeLists.txt          |  4 ++--
- 7 files changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2455793..28f0d83 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -105,7 +105,7 @@ else ()
- endif ()
- 
- find_program(DOT NAMES dot)
--find_package(PythonInterp REQUIRED)
-+find_package(Python3 REQUIRED)
- find_package(FLEX REQUIRED)
- find_package(BISON REQUIRED)
- if (BISON_VERSION VERSION_LESS 2.7)
-diff --git a/addon/doxywizard/CMakeLists.txt b/addon/doxywizard/CMakeLists.txt
-index 63ac8e3..d37d1d0 100644
---- a/addon/doxywizard/CMakeLists.txt
-+++ b/addon/doxywizard/CMakeLists.txt
-@@ -57,7 +57,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/settings.h PROPERTIES GENERA
- 
- # generate version.cpp
- add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/version.py ${VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/version.py ${VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
-     DEPENDS ${PROJECT_SOURCE_DIR}/VERSION ${PROJECT_SOURCE_DIR}/src/version.py
-     OUTPUT ${GENERATED_SRC_WIZARD}/version.cpp
- )
-@@ -65,7 +65,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/version.cpp PROPERTIES GENER
- 
- # generate configdoc.cpp
- add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/configgen.py -wiz ${PROJECT_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/configdoc.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/configgen.py -wiz ${PROJECT_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/configdoc.cpp
-     DEPENDS  ${PROJECT_SOURCE_DIR}/src/configgen.py ${PROJECT_SOURCE_DIR}/src/config.xml
-     OUTPUT ${GENERATED_SRC_WIZARD}/configdoc.cpp
- )
-@@ -74,7 +74,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/configdoc.cpp PROPERTIES GEN
- set(LEX_FILES config_doxyw)
- foreach(lex_file ${LEX_FILES})
-     add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
-+        COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
-         DEPENDS ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l
-         OUTPUT  ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
-     )
-diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
-index ec63ceb..49a2bda 100644
---- a/doc/CMakeLists.txt
-+++ b/doc/CMakeLists.txt
-@@ -168,7 +168,7 @@ configure_file(${PROJECT_SOURCE_DIR}/doc/doxyindexer.1      ${PROJECT_BINARY_DIR
- 
- # doc/language.doc (see tag Doxyfile:INPUT)
- add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE} translator.py ${PROJECT_SOURCE_DIR}
-+        COMMAND ${Python3_EXECUTABLE} translator.py ${PROJECT_SOURCE_DIR}
-         DEPENDS ${PROJECT_SOURCE_DIR}/doc/maintainers.txt ${PROJECT_SOURCE_DIR}/doc/language.tpl ${PROJECT_BINARY_DIR}/doc/translator.py ${LANG_FILES}
-         OUTPUT language.doc
-         WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc
-@@ -177,7 +177,7 @@ set_source_files_properties(language.doc PROPERTIES GENERATED 1)
- 
- # doc/config.doc (see tag Doxyfile:INPUT)
- add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/src/configgen.py -doc ${TOP}/src/config.xml > config.doc
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/src/configgen.py -doc ${TOP}/src/config.xml > config.doc
-         DEPENDS ${TOP}/src/config.xml ${TOP}/src/configgen.py
-         OUTPUT config.doc
-         WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc/
-@@ -228,7 +228,7 @@ add_custom_target(docs_chm
-     COMMAND ${CMAKE_COMMAND} -E echo "    for file in files:" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
-     COMMAND ${CMAKE_COMMAND} -E echo "        if file.endswith('.html') or file.endswith('.png') or file.endswith('.css') or file.endswith('.gif'):" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
-     COMMAND ${CMAKE_COMMAND} -E echo "            print(os.path.join(root, file))" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
--    COMMAND ${CMAKE_COMMAND} -E chdir  ${PROJECT_BINARY_DIR}/chm ${PYTHON_EXECUTABLE} ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual.hhp
-+    COMMAND ${CMAKE_COMMAND} -E chdir  ${PROJECT_BINARY_DIR}/chm ${Python3_EXECUTABLE} ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual.hhp
-     COMMAND ${CMAKE_COMMAND} -E chdir ${PROJECT_BINARY_DIR}/chm "${HTML_HELP_COMPILER}" doxygen_manual.hhp || echo > nul
-     COMMAND ${CMAKE_COMMAND} -E rename ${PROJECT_BINARY_DIR}/chm/index.chm ${PROJECT_BINARY_DIR}/chm/doxygen_manual.chm
-         DEPENDS ${PROJECT_BINARY_DIR}/doc/language.doc ${PROJECT_BINARY_DIR}/doc/config.doc
-diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
-index 194b427..248b807 100644
---- a/examples/CMakeLists.txt
-+++ b/examples/CMakeLists.txt
-@@ -54,7 +54,7 @@ foreach (f_inp  ${BASIC_EXAMPLES})
-         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/html/examples/${f}
-         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/latex/examples/${f}
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen ${f}.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman.tex > ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman.tex > ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
- 	DEPENDS doxygen ${f}.${f_ext} ${f}.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/${f}/html/index.html ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
-     )
-@@ -73,7 +73,7 @@ if (DOT)
-         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/html/examples/diagrams
-         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/latex/examples/diagrams
- 	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen diagrams.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman.tex > ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman_doc.tex
- 	DEPENDS doxygen diagrams_a.h diagrams_b.h diagrams_c.h diagrams_d.h diagrams_e.h diagrams.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/diagrams/html/index.html ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman_doc.tex
-   )
-diff --git a/libmscgen/CMakeLists.txt b/libmscgen/CMakeLists.txt
-index 34cf4d8..f015afc 100644
---- a/libmscgen/CMakeLists.txt
-+++ b/libmscgen/CMakeLists.txt
-@@ -7,7 +7,7 @@ include_directories(
- set(LEX_FILES mscgen_lexer) 
- foreach(lex_file ${LEX_FILES})
-     add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-+        COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-         DEPENDS ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l
-         OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
-     )
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 0e0c5f7..c1d3ca5 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -40,7 +40,7 @@ set_source_files_properties(${GENERATED_SRC}/settings.h PROPERTIES GENERATED 1)
- 
- # configvalues.h
- add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maph ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.h
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maph ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.h
-     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
-     OUTPUT ${GENERATED_SRC}/configvalues.h
- )
-@@ -52,7 +52,7 @@ add_custom_target(
- 
- # configvalues.cpp
- add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maps ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -maps ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configvalues.cpp
-     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
-     OUTPUT ${GENERATED_SRC}/configvalues.cpp
- )
-@@ -60,7 +60,7 @@ set_source_files_properties(${GENERATED_SRC}/configvalues.cpp PROPERTIES GENERAT
- 
- # configoptions.cpp
- add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -cpp ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configoptions.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/configgen.py -cpp ${CMAKE_CURRENT_LIST_DIR}/config.xml > ${GENERATED_SRC}/configoptions.cpp
-     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
-     OUTPUT ${GENERATED_SRC}/configoptions.cpp
- )
-@@ -95,7 +95,7 @@ endif()
- # resources.cpp
- add_custom_command(
-     COMMENT  "Generating ${GENERATED_SRC}/resources.cpp"
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py ${PROJECT_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py ${PROJECT_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
-     DEPENDS ${RESOURCES} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py
-     OUTPUT ${GENERATED_SRC}/resources.cpp
- )
-@@ -126,7 +126,7 @@ foreach(lex_file ${LEX_FILES})
-     set(LEX_FILES_H ${LEX_FILES_H} " " ${GENERATED_SRC}/${lex_file}.l.h CACHE INTERNAL "Stores generated files")
-     set(LEX_FILES_CPP ${LEX_FILES_CPP} " " ${GENERATED_SRC}/${lex_file}.cpp CACHE INTERNAL "Stores generated files")
-     add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/scan_states.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-+        COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/scan_states.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-         DEPENDS ${CMAKE_CURRENT_LIST_DIR}/scan_states.py ${CMAKE_CURRENT_LIST_DIR}/${lex_file}.l
-         OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
-     )
-diff --git a/testing/CMakeLists.txt b/testing/CMakeLists.txt
-index fd6912e..0af1865 100644
---- a/testing/CMakeLists.txt
-+++ b/testing/CMakeLists.txt
-@@ -1,7 +1,7 @@
- # run all tests sequentially (keep for backward compatibility)
- add_custom_target(tests
- 	COMMENT "Running doxygen tests..."
--	COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
-+	COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
- 	DEPENDS doxygen
- )
- 
-@@ -19,6 +19,6 @@ foreach(TEST_FILE ${TEST_FILES})
- 	string(REGEX REPLACE "^.*/([0-9][0-9][0-9]*).*$" "\\1" TEST_ID "${TEST_FILE}")
- 	# add a test target for each test
- 	add_test(NAME ${TEST_NAME}
--		 COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
-+		 COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
- 	)
- endforeach()
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
similarity index 50%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
index 16a4250b2..11ea116af 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
@@ -4,16 +4,17 @@ HOMEPAGE = "http://www.doxygen.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "flex-native bison-native"
+DEPENDS = "bison-native flex-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
-           file://0001-build-don-t-look-for-Iconv.patch \
+SRC_URI = "\
+    git://github.com/doxygen/doxygen.git;branch=master;protocol=https \
 "
-SRC_URI:append:class-native = " file://doxygen-native-only-check-python3.patch"
-SRC_URI[sha256sum] = "f352dbc3221af7012b7b00935f2dfdc9fb67a97d43287d2f6c81c50449d254e0"
 
-UPSTREAM_CHECK_URI = "https://github.com/doxygen/doxygen/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+SRCREV = "c73f5d30f9e8b1df5ba15a1d064ff2067cbb8267"
+
+S = "${WORKDIR}/git"
+
+UPSTREAM_CHECK_GITTAGREGEX = "Release_(?P<pver>\d+(\_\d+)+)"
 
 inherit cmake python3native
 
@@ -21,4 +22,5 @@ EXTRA_OECMAKE += "\
     -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
     -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
 "
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


