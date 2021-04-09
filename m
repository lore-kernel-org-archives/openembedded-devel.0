Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web09.3537.1617934860133619551
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wo4tWSSX;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so4302711otq.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6l581YQ1mG6yYRP+33Y7vA3Qonl3QBsKnMQudsIfY48=;
        b=Wo4tWSSXfIYhlJ2RAB2R3I+4i4+8YzwpuI5G5nkbj5Wz6ksoHp7jKwjsA4g1Jsf/Us
         JH8LSbQ4fJM2Ebgeu5eV9/6sF9JjloxOyZ7foGJnCc4a+LfiomG2R7pUiJDvSKpM31dw
         pRjgye45pcO+3hC1MHEoq6kgzUEpaLQ1oc/wIHtQcLbG4hBjMr3ywFnfKgi9HxFS2SBB
         HkkMXH0NDnuafzgR0Z/XLfTAeo+ecy5vMIxtg4fJIJq+IyhEiuBAnmRc8Q0sSY+wGYCd
         EsZygx7J365r7ZihXbrvJdJOyqPvbpRyKAjkUNvqB8dSUHP0A9IN73ZINkOFA7ga3kFe
         B4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6l581YQ1mG6yYRP+33Y7vA3Qonl3QBsKnMQudsIfY48=;
        b=b4xOnMOqfeG5LZEMJXW+cs+ZlbwNIQcVQFq4fjNwNF5EQaX0mDyrtDAuJbRfpnmOl2
         mqAVr5ZvRHoDFetF2zuTjXbxMPPEYPh2UeUGUDjlS1xmAdILONEeN8iAKUavR19ooFEo
         u6Vrz0HNWNqjTDAOwxFaEjiQf2DjcXgT2OmgZPHUqdKGaXkDx+IxRhdDUQvPRvyITzNU
         J73cROJDHbsy84fJn+oMfVmcaKLz+w8cDceIRRNadvKOgnOjfCKCHwhJAJ9V2d9I76qg
         cS4AvYnqMxNIjx12KssRoy9LeXQNntsyx7CW93W+TTAjIw25klesWs9Xc36rGfGTx2X5
         fbzQ==
X-Gm-Message-State: AOAM5318Y2CUNARBnhXuNxVc13gPaIyTCe1OrFsNVuQp4LHvJGlMX01t
	0NRDcpGsskKzxEFLg8WCFwY5r7I/tN0=
X-Google-Smtp-Source: ABdhPJyp/o0jSA7kninprd6J7QXlzrXRosSFaQQwbluCl8mPyJ8gFHZVtTrIo/T1Iaa9v+dgg8hpWA==
X-Received: by 2002:a9d:798a:: with SMTP id h10mr10145671otm.170.1617934859252;
        Thu, 08 Apr 2021 19:20:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.20.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:20:58 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 06/36] doxygen: Upgrade 1.8.20 -> 1.9.1
Date: Thu,  8 Apr 2021 19:20:19 -0700
Message-Id: <1ec5ff36591d04aaff4cb3357cbbc7d95065ac55.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Randy MacLeod <randy.macleod@windriver.com>

Refit and update patches.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e4ad6f3507de85343d3cbd884781a0e0572414ae)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-build-don-t-look-for-Iconv.patch     |   9 +-
 .../doxygen-native-only-check-python3.patch   | 116 +++++++++---------
 .../{doxygen_1.8.20.bb => doxygen_1.9.1.bb}   |   3 +-
 3 files changed, 61 insertions(+), 67 deletions(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.20.bb => doxygen_1.9.1.bb} (79%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
index c86dc1691e3..6906efd1c0d 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
@@ -8,6 +8,7 @@ native build but all modern systems supply it as part of the standard
 C library. We don't need this check in meta-openembedded.
 
 Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 
 Upstream-status: Inappropriate
 - upstream doxygen must build on many architectures, this change is
@@ -17,10 +18,10 @@ Upstream-status: Inappropriate
  1 file changed, 4 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 45c2f2c1..22cf0144 100644
+index 06b9696f..f30b46b8 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -92,10 +92,6 @@ if (sqlite3)
+@@ -117,10 +117,6 @@ if (sqlite3)
    endif()
  endif()
  
@@ -28,9 +29,9 @@ index 45c2f2c1..22cf0144 100644
 -include_directories(${ICONV_INCLUDE_DIR})
 -
 -
- #set(DOXYDOCS ${CMAKE_SOURCE_DIR}/doc CACHE INTERNAL "Path to doxygen docs")
+ #set(DOXYDOCS ${PROJECT_SOURCE_DIR}/doc CACHE INTERNAL "Path to doxygen docs")
  set(DOXYDOCS ${PROJECT_BINARY_DIR}/doc)
  set(ENV{DOXYGEN_DOCDIR} ${DOXYDOCS})
 -- 
-2.17.1
+2.27.0
 
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch b/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
index 53f88885f44..9d1a5a93d0f 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
@@ -1,4 +1,4 @@
-From aa833cf56c5cc2e87a1d91881eb2286beb34e417 Mon Sep 17 00:00:00 2001
+From 7aeee92c752f8a4b2524ed6a41d60c1a3ca8bf2d Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Wed, 26 Aug 2020 10:52:10 +0300
 Subject: [PATCH] doxygen: Fix Python issues for doxygen-native
@@ -32,25 +32,28 @@ result variable PYTHON_EXECUTABLE with Python3_EXECUTABLE.
 
 This patch is only needded by doxygen-native.
 
+Updated to apply to release 1.9.1.
+
 Upstream-Status: Inappropriate[oe specific]
 
 Co-Authored-By: Kai Kang <kai.kang@windriver.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 ---
  CMakeLists.txt                  |  2 +-
  addon/doxywizard/CMakeLists.txt |  6 +++---
  doc/CMakeLists.txt              |  6 +++---
  examples/CMakeLists.txt         |  4 ++--
  libmscgen/CMakeLists.txt        |  2 +-
- src/CMakeLists.txt              | 12 ++++++------
+ src/CMakeLists.txt              | 10 +++++-----
  testing/CMakeLists.txt          |  4 ++--
- 7 files changed, 18 insertions(+), 18 deletions(-)
+ 7 files changed, 17 insertions(+), 17 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 35e6a0c2..9aaebbdf 100644
+index f30b46b8..50f211c8 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -100,7 +100,7 @@ else ()
+@@ -101,7 +101,7 @@ else ()
  endif ()
  
  find_program(DOT NAMES dot)
@@ -60,50 +63,50 @@ index 35e6a0c2..9aaebbdf 100644
  find_package(BISON REQUIRED)
  if (BISON_VERSION VERSION_LESS 2.7)
 diff --git a/addon/doxywizard/CMakeLists.txt b/addon/doxywizard/CMakeLists.txt
-index 6aacd8b6..fa197e9e 100644
+index a6f65f8d..d163aa5b 100644
 --- a/addon/doxywizard/CMakeLists.txt
 +++ b/addon/doxywizard/CMakeLists.txt
 @@ -58,7 +58,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/settings.h PROPERTIES GENERA
  
  # generate version.cpp
  add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/version.py ${VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/version.py ${VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
-     DEPENDS ${CMAKE_SOURCE_DIR}/VERSION ${CMAKE_SOURCE_DIR}/src/version.py
+-    COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/version.py ${VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
++    COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/version.py ${VERSION} > ${GENERATED_SRC_WIZARD}/version.cpp
+     DEPENDS ${PROJECT_SOURCE_DIR}/VERSION ${PROJECT_SOURCE_DIR}/src/version.py
      OUTPUT ${GENERATED_SRC_WIZARD}/version.cpp
  )
 @@ -66,7 +66,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/version.cpp PROPERTIES GENER
  
  # generate configdoc.cpp
  add_custom_command(
--COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -wiz ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/configdoc.cpp
-+COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -wiz ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/configdoc.cpp
- OUTPUT ${GENERATED_SRC_WIZARD}/configdoc.cpp
+-    COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/configgen.py -wiz ${PROJECT_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/configdoc.cpp
++    COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/configgen.py -wiz ${PROJECT_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC_WIZARD}/configdoc.cpp
+     DEPENDS  ${PROJECT_SOURCE_DIR}/src/configgen.py ${PROJECT_SOURCE_DIR}/src/config.xml
+     OUTPUT ${GENERATED_SRC_WIZARD}/configdoc.cpp
  )
- set_source_files_properties(${GENERATED_SRC_WIZARD}/configdoc.cpp PROPERTIES GENERATED 1)
-@@ -74,7 +74,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/configdoc.cpp PROPERTIES GEN
- set(LEX_FILES config_doxyw) 
+@@ -75,7 +75,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/configdoc.cpp PROPERTIES GEN
+ set(LEX_FILES config_doxyw)
  foreach(lex_file ${LEX_FILES})
      add_custom_command(
--	    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/scan_states.py ${CMAKE_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
-+	    COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/scan_states.py ${CMAKE_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
-         DEPENDS ${CMAKE_SOURCE_DIR}/src/scan_states.py ${CMAKE_SOURCE_DIR}/addon/doxywizard/${lex_file}.l
- 	OUTPUT  ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
+-        COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
++        COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l > ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
+         DEPENDS ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/addon/doxywizard/${lex_file}.l
+         OUTPUT  ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
      )
 diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
-index a094c570..8a757c20 100644
+index f2d177ed..22a4d602 100644
 --- a/doc/CMakeLists.txt
 +++ b/doc/CMakeLists.txt
-@@ -132,7 +132,7 @@ configure_file(${CMAKE_SOURCE_DIR}/doc/doxyindexer.1      ${PROJECT_BINARY_DIR}/
+@@ -163,7 +163,7 @@ configure_file(${PROJECT_SOURCE_DIR}/doc/doxyindexer.1      ${PROJECT_BINARY_DIR
  
  # doc/language.doc (see tag Doxyfile:INPUT)
  add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE} translator.py ${CMAKE_SOURCE_DIR}
-+        COMMAND ${Python3_EXECUTABLE} translator.py ${CMAKE_SOURCE_DIR}
-         DEPENDS ${CMAKE_SOURCE_DIR}/doc/maintainers.txt ${CMAKE_SOURCE_DIR}/doc/language.tpl ${PROJECT_BINARY_DIR}/doc/translator.py ${LANG_FILES}
+-        COMMAND ${PYTHON_EXECUTABLE} translator.py ${PROJECT_SOURCE_DIR}
++        COMMAND ${Python3_EXECUTABLE} translator.py ${PROJECT_SOURCE_DIR}
+         DEPENDS ${PROJECT_SOURCE_DIR}/doc/maintainers.txt ${PROJECT_SOURCE_DIR}/doc/language.tpl ${PROJECT_BINARY_DIR}/doc/translator.py ${LANG_FILES}
          OUTPUT language.doc
          WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc
-@@ -141,7 +141,7 @@ set_source_files_properties(language.doc PROPERTIES GENERATED 1)
+@@ -172,7 +172,7 @@ set_source_files_properties(language.doc PROPERTIES GENERATED 1)
  
  # doc/config.doc (see tag Doxyfile:INPUT)
  add_custom_command(
@@ -112,7 +115,7 @@ index a094c570..8a757c20 100644
          DEPENDS ${TOP}/src/config.xml ${TOP}/src/configgen.py
          OUTPUT config.doc
          WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc/
-@@ -192,7 +192,7 @@ add_custom_target(docs_chm
+@@ -223,7 +223,7 @@ add_custom_target(docs_chm
      COMMAND ${CMAKE_COMMAND} -E echo "    for file in files:" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
      COMMAND ${CMAKE_COMMAND} -E echo "        if file.endswith('.html') or file.endswith('.png') or file.endswith('.css') or file.endswith('.gif'):" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
      COMMAND ${CMAKE_COMMAND} -E echo "            print(os.path.join(root, file))" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
@@ -122,42 +125,42 @@ index a094c570..8a757c20 100644
      COMMAND ${CMAKE_COMMAND} -E rename ${PROJECT_BINARY_DIR}/chm/index.chm ${PROJECT_BINARY_DIR}/chm/doxygen_manual.chm
          DEPENDS ${PROJECT_BINARY_DIR}/doc/language.doc ${PROJECT_BINARY_DIR}/doc/config.doc
 diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
-index 3f1c79b8..d5866ee1 100644
+index 194b4271..248b8076 100644
 --- a/examples/CMakeLists.txt
 +++ b/examples/CMakeLists.txt
-@@ -51,7 +51,7 @@ foreach (f_inp  ${BASIC_EXAMPLES})
-         string(REGEX REPLACE ":.*" "" f ${f_inp})
-     add_custom_command(
+@@ -54,7 +54,7 @@ foreach (f_inp  ${BASIC_EXAMPLES})
+         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/html/examples/${f}
+         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/latex/examples/${f}
  	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen ${f}.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/${f}/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/${f}/latex/refman_doc.tex
-+        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/${f}/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/${f}/latex/refman_doc.tex
+-        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman.tex > ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
++        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman.tex > ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
  	DEPENDS doxygen ${f}.${f_ext} ${f}.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/${f}/html/index.html ${PROJECT_BINARY_DIR}/html/examples/${f}/latex/refman_doc.tex
+ 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/${f}/html/index.html ${PROJECT_BINARY_DIR}/latex/examples/${f}/latex/refman_doc.tex
      )
-@@ -68,7 +68,7 @@ add_custom_target(examples
- if (DOT)
-   add_custom_command(
+@@ -73,7 +73,7 @@ if (DOT)
+         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/html/examples/diagrams
+         COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/latex/examples/diagrams
  	COMMAND ${EXECUTABLE_OUTPUT_PATH}/doxygen diagrams.cfg
--        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman_doc.tex
+-        COMMAND ${PYTHON_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman.tex > ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman_doc.tex
 +        COMMAND ${Python3_EXECUTABLE}  ${TOP}/examples/strip_example.py  < ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman.tex > ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman_doc.tex
  	DEPENDS doxygen diagrams_a.h diagrams_b.h diagrams_c.h diagrams_d.h diagrams_e.h diagrams.cfg ${TOP}/examples/strip_example.py
- 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/diagrams/html/index.html ${PROJECT_BINARY_DIR}/html/examples/diagrams/latex/refman_doc.tex
+ 	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/diagrams/html/index.html ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman_doc.tex
    )
 diff --git a/libmscgen/CMakeLists.txt b/libmscgen/CMakeLists.txt
-index 079fcfc8..e6d86f61 100644
+index 0a239008..09849e2d 100644
 --- a/libmscgen/CMakeLists.txt
 +++ b/libmscgen/CMakeLists.txt
 @@ -7,7 +7,7 @@ include_directories(
  set(LEX_FILES mscgen_lexer) 
  foreach(lex_file ${LEX_FILES})
      add_custom_command(
--        COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/scan_states.py ${CMAKE_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-+        COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/scan_states.py ${CMAKE_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
-         DEPENDS ${CMAKE_SOURCE_DIR}/src/scan_states.py ${CMAKE_SOURCE_DIR}/libmscgen/${lex_file}.l
+-        COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
++        COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l > ${GENERATED_SRC}/${lex_file}.l.h
+         DEPENDS ${PROJECT_SOURCE_DIR}/src/scan_states.py ${PROJECT_SOURCE_DIR}/libmscgen/${lex_file}.l
          OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
      )
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index cb289116..356741ff 100644
+index 5004a957..68e803f2 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
 @@ -39,7 +39,7 @@ set_source_files_properties(${GENERATED_SRC}/settings.h PROPERTIES GENERATED 1)
@@ -191,21 +194,12 @@ index cb289116..356741ff 100644
  # resources.cpp
  add_custom_command(
      COMMENT  "Generating ${GENERATED_SRC}/resources.cpp"
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py ${CMAKE_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py ${CMAKE_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
+-    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py ${PROJECT_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
++    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py ${PROJECT_SOURCE_DIR}/templates ${GENERATED_SRC}/resources.cpp
      DEPENDS ${RESOURCES} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py
      OUTPUT ${GENERATED_SRC}/resources.cpp
  )
-@@ -102,7 +102,7 @@ set_source_files_properties(${GENERATED_SRC}/resources.cpp PROPERTIES GENERATED
- 
- # layout_default.xml
- add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/to_c_cmd.py < ${CMAKE_CURRENT_LIST_DIR}/layout_default.xml > ${GENERATED_SRC}/layout_default.xml.h
-+    COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/to_c_cmd.py < ${CMAKE_CURRENT_LIST_DIR}/layout_default.xml > ${GENERATED_SRC}/layout_default.xml.h
-     DEPENDS ${CMAKE_CURRENT_LIST_DIR}/layout_default.xml ${CMAKE_CURRENT_LIST_DIR}/to_c_cmd.py
-     OUTPUT  ${GENERATED_SRC}/layout_default.xml.h
- )
-@@ -131,7 +131,7 @@ foreach(lex_file ${LEX_FILES})
+@@ -124,7 +124,7 @@ foreach(lex_file ${LEX_FILES})
      set(LEX_FILES_H ${LEX_FILES_H} " " ${GENERATED_SRC}/${lex_file}.l.h CACHE INTERNAL "Stores generated files")
      set(LEX_FILES_CPP ${LEX_FILES_CPP} " " ${GENERATED_SRC}/${lex_file}.cpp CACHE INTERNAL "Stores generated files")
      add_custom_command(
@@ -215,15 +209,15 @@ index cb289116..356741ff 100644
          OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
      )
 diff --git a/testing/CMakeLists.txt b/testing/CMakeLists.txt
-index b354e78f..28d45e11 100644
+index fd6912e9..0af1865b 100644
 --- a/testing/CMakeLists.txt
 +++ b/testing/CMakeLists.txt
 @@ -1,7 +1,7 @@
  # run all tests sequentially (keep for backward compatibility)
  add_custom_target(tests
  	COMMENT "Running doxygen tests..."
--	COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
-+	COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
+-	COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
++	COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --doxygen ${PROJECT_BINARY_DIR}/bin/doxygen --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
  	DEPENDS doxygen
  )
  
@@ -231,10 +225,10 @@ index b354e78f..28d45e11 100644
  	string(REGEX REPLACE "^.*/([0-9][0-9][0-9]*).*$" "\\1" TEST_ID "${TEST_FILE}")
  	# add a test target for each test
  	add_test(NAME ${TEST_NAME}
--		 COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
-+		 COMMAND ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/testing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir ${CMAKE_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
+-		 COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
++		 COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
  	)
  endforeach()
 -- 
-2.17.1
+2.27.0
 
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.9.1.bb
similarity index 79%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.9.1.bb
index d4ac3b72072..3370a131327 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.20.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.9.1.bb
@@ -10,8 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch \
 "
 SRC_URI_append_class-native = " file://doxygen-native-only-check-python3.patch"
-SRC_URI[md5sum] = "8729936a843232a66fe970ef65f3c3e4"
-SRC_URI[sha256sum] = "e0db6979286fd7ccd3a99af9f97397f2bae50532e4ecb312aa18862f8401ddec"
+SRC_URI[sha256sum] = "67aeae1be4e1565519898f46f1f7092f1973cce8a767e93101ee0111717091d1"
 
 inherit cmake python3native
 
-- 
2.17.1

