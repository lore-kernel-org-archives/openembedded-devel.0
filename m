Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF7AC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 14:28:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.7061.1641565698458257615
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 06:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nfeSakSs;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641565690; i=@fujitsu.com;
	bh=dhqrL76ZIHuG4qKwKxO6yQ9/hPWOdkxKZppQjOUG5nU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nfeSakSsPEcQPlaNxuSyuMCD/F1t5fgTuzF8tl4K8kuNnMNU3iR7WMQNEB3jXHfQG
	 goLcVH02D1oP5ah53M8rSnDJgf/lgftBaV9aw0NuH91D0ndg2mBLDMpHLLsdSENTyV
	 67/pp9CTMYPugdDZxGdMuqipKdcejHyiSkey0hKhCE8P8tDjF6ISZ7T55dGRkqGhfA
	 /UOXxUyorsPhmCVqoFE1qBlXoIEAa34Sfcbjclu7j1yeERihAObNiSrJoO5/GDJekf
	 0cORgf+osAiQU4tIYul82I4GUqBgID8v27oy6g9yKcQKLq15ozUqW0b2ILm/SI9Y2d
	 aO3ZufWTUj7/A==
Received: from [100.115.32.243] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 48/0B-09428-AFD48D16;
 Fri, 07 Jan 2022 14:28:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8ORqPvL90a
  iwc1tnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8buLwdYCl56VzQcvMrWwLjZqYuRi0NI4Amj
  xP5ph5i6GDmBnAtMEoemi0AkjjNKHOs/wwiSYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAXqKjexNYDQtQfOHBS2C9vAJOEq29b8HqJQQUJKY8fA9mcwo4Szw8sgtqsZNE07PnUP
  WCEidnPmGBmC8hcfDFC6heRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvYFjEyrGK2
  TijLTM0pyEzNzdA0NDHQNDU11jS10DU0M9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS
  9PJSSzYxAsM4pVitZwfjiVU/9Q4xSnIwKYny6jrfSBTiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  VvhA5QTLEpNT61Iy8wBxhRMWoKDR0mE9ypImre4IDG3ODMdInWK0Zhj5+nFi5g5Nr3avptZiC
  UvPy9VSpz3sDdQqQBIaUZpHtwgWKxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuwlkIU9
  mXgncvldApzABnbJC+DrIKSWJCCmpBia9mJf7dJb7xWrdbbb/ekxC4tK830ZJQoc/6IWIdSbV
  sj5aoHP5WETBog0MzmpO74t4JbW/bi3o8DP41FfnW2/1TOvqrXkqCcVai9a+/fk040bx/8wMp
  cCcWWceRRV/49nvqhzkxyr812TTNiml68qe0fEXfwSY9HUUv6+X07yqOf9IWGyYaEyRXap9pY
  fvvCUGNoGZ3en9xqu39C81XLvB2OfvmofHN196UXI4vYhtmlxDQPreX6w3TrQverX6xTPf6Jt
  f+RnX1IhfFjpVVdRbM8NBQuSJxNrZRyqfK2qzNzbc21pzNyTA2t65tpn1mWFn8yyrlvkmrz4c
  Xfqmz/XLj9M32D06ZG7bntvkrcRSnJFoqMVcVJwIAHgZqCFwAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1641565689!36490!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20954 invoked from network); 7 Jan 2022 14:28:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jan 2022 14:28:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BE1291001A6
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  7 Jan 2022 14:28:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B10781001A1
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  7 Jan 2022 14:28:09 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 7 Jan 2022 14:27:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] doxygen: upgrade 1.9.2 -> 1.9.3
Date: Fri, 7 Jan 2022 22:27:34 +0800
Message-ID: <1641565655-53792-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641565655-53792-1-git-send-email-wangmy@fujitsu.com>
References: <1641565655-53792-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 14:28:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94690

refresh doxygen-native-only-check-python3.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../doxygen-native-only-check-python3.patch   | 44 +++++++++----------
 .../{doxygen_1.9.2.bb => doxygen_1.9.3.bb}    |  2 +-
 2 files changed, 22 insertions(+), 24 deletions(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.9.2.bb => doxygen_1.9.3.bb} (86%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch b/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
index 9d1a5a93d..b6d007d8d 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/doxygen-native-only-check-python3.patch
@@ -1,4 +1,4 @@
-From 7aeee92c752f8a4b2524ed6a41d60c1a3ca8bf2d Mon Sep 17 00:00:00 2001
+From daf686508f2ee4711d93e96e5b100e50bf161656 Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Wed, 26 Aug 2020 10:52:10 +0300
 Subject: [PATCH] doxygen: Fix Python issues for doxygen-native
@@ -39,6 +39,7 @@ Upstream-Status: Inappropriate[oe specific]
 Co-Authored-By: Kai Kang <kai.kang@windriver.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+
 ---
  CMakeLists.txt                  |  2 +-
  addon/doxywizard/CMakeLists.txt |  6 +++---
@@ -50,10 +51,10 @@ Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
  7 files changed, 17 insertions(+), 17 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f30b46b8..50f211c8 100644
+index 2455793..28f0d83 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -101,7 +101,7 @@ else ()
+@@ -105,7 +105,7 @@ else ()
  endif ()
  
  find_program(DOT NAMES dot)
@@ -63,10 +64,10 @@ index f30b46b8..50f211c8 100644
  find_package(BISON REQUIRED)
  if (BISON_VERSION VERSION_LESS 2.7)
 diff --git a/addon/doxywizard/CMakeLists.txt b/addon/doxywizard/CMakeLists.txt
-index a6f65f8d..d163aa5b 100644
+index 63ac8e3..d37d1d0 100644
 --- a/addon/doxywizard/CMakeLists.txt
 +++ b/addon/doxywizard/CMakeLists.txt
-@@ -58,7 +58,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/settings.h PROPERTIES GENERA
+@@ -57,7 +57,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/settings.h PROPERTIES GENERA
  
  # generate version.cpp
  add_custom_command(
@@ -75,7 +76,7 @@ index a6f65f8d..d163aa5b 100644
      DEPENDS ${PROJECT_SOURCE_DIR}/VERSION ${PROJECT_SOURCE_DIR}/src/version.py
      OUTPUT ${GENERATED_SRC_WIZARD}/version.cpp
  )
-@@ -66,7 +66,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/version.cpp PROPERTIES GENER
+@@ -65,7 +65,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/version.cpp PROPERTIES GENER
  
  # generate configdoc.cpp
  add_custom_command(
@@ -84,7 +85,7 @@ index a6f65f8d..d163aa5b 100644
      DEPENDS  ${PROJECT_SOURCE_DIR}/src/configgen.py ${PROJECT_SOURCE_DIR}/src/config.xml
      OUTPUT ${GENERATED_SRC_WIZARD}/configdoc.cpp
  )
-@@ -75,7 +75,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/configdoc.cpp PROPERTIES GEN
+@@ -74,7 +74,7 @@ set_source_files_properties(${GENERATED_SRC_WIZARD}/configdoc.cpp PROPERTIES GEN
  set(LEX_FILES config_doxyw)
  foreach(lex_file ${LEX_FILES})
      add_custom_command(
@@ -94,10 +95,10 @@ index a6f65f8d..d163aa5b 100644
          OUTPUT  ${GENERATED_SRC_WIZARD}/${lex_file}.l.h
      )
 diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
-index f2d177ed..22a4d602 100644
+index ec63ceb..49a2bda 100644
 --- a/doc/CMakeLists.txt
 +++ b/doc/CMakeLists.txt
-@@ -163,7 +163,7 @@ configure_file(${PROJECT_SOURCE_DIR}/doc/doxyindexer.1      ${PROJECT_BINARY_DIR
+@@ -168,7 +168,7 @@ configure_file(${PROJECT_SOURCE_DIR}/doc/doxyindexer.1      ${PROJECT_BINARY_DIR
  
  # doc/language.doc (see tag Doxyfile:INPUT)
  add_custom_command(
@@ -106,7 +107,7 @@ index f2d177ed..22a4d602 100644
          DEPENDS ${PROJECT_SOURCE_DIR}/doc/maintainers.txt ${PROJECT_SOURCE_DIR}/doc/language.tpl ${PROJECT_BINARY_DIR}/doc/translator.py ${LANG_FILES}
          OUTPUT language.doc
          WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc
-@@ -172,7 +172,7 @@ set_source_files_properties(language.doc PROPERTIES GENERATED 1)
+@@ -177,7 +177,7 @@ set_source_files_properties(language.doc PROPERTIES GENERATED 1)
  
  # doc/config.doc (see tag Doxyfile:INPUT)
  add_custom_command(
@@ -115,7 +116,7 @@ index f2d177ed..22a4d602 100644
          DEPENDS ${TOP}/src/config.xml ${TOP}/src/configgen.py
          OUTPUT config.doc
          WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/doc/
-@@ -223,7 +223,7 @@ add_custom_target(docs_chm
+@@ -228,7 +228,7 @@ add_custom_target(docs_chm
      COMMAND ${CMAKE_COMMAND} -E echo "    for file in files:" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
      COMMAND ${CMAKE_COMMAND} -E echo "        if file.endswith('.html') or file.endswith('.png') or file.endswith('.css') or file.endswith('.gif'):" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
      COMMAND ${CMAKE_COMMAND} -E echo "            print(os.path.join(root, file))" >> ${PROJECT_BINARY_DIR}/chm/doxygen_manual_examples_chm.py
@@ -125,7 +126,7 @@ index f2d177ed..22a4d602 100644
      COMMAND ${CMAKE_COMMAND} -E rename ${PROJECT_BINARY_DIR}/chm/index.chm ${PROJECT_BINARY_DIR}/chm/doxygen_manual.chm
          DEPENDS ${PROJECT_BINARY_DIR}/doc/language.doc ${PROJECT_BINARY_DIR}/doc/config.doc
 diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
-index 194b4271..248b8076 100644
+index 194b427..248b807 100644
 --- a/examples/CMakeLists.txt
 +++ b/examples/CMakeLists.txt
 @@ -54,7 +54,7 @@ foreach (f_inp  ${BASIC_EXAMPLES})
@@ -147,7 +148,7 @@ index 194b4271..248b8076 100644
  	OUTPUT ${PROJECT_BINARY_DIR}/html/examples/diagrams/html/index.html ${PROJECT_BINARY_DIR}/latex/examples/diagrams/latex/refman_doc.tex
    )
 diff --git a/libmscgen/CMakeLists.txt b/libmscgen/CMakeLists.txt
-index 0a239008..09849e2d 100644
+index 34cf4d8..f015afc 100644
 --- a/libmscgen/CMakeLists.txt
 +++ b/libmscgen/CMakeLists.txt
 @@ -7,7 +7,7 @@ include_directories(
@@ -160,10 +161,10 @@ index 0a239008..09849e2d 100644
          OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
      )
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 5004a957..68e803f2 100644
+index 0e0c5f7..c1d3ca5 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -39,7 +39,7 @@ set_source_files_properties(${GENERATED_SRC}/settings.h PROPERTIES GENERATED 1)
+@@ -40,7 +40,7 @@ set_source_files_properties(${GENERATED_SRC}/settings.h PROPERTIES GENERATED 1)
  
  # configvalues.h
  add_custom_command(
@@ -172,7 +173,7 @@ index 5004a957..68e803f2 100644
      DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
      OUTPUT ${GENERATED_SRC}/configvalues.h
  )
-@@ -51,7 +51,7 @@ add_custom_target(
+@@ -52,7 +52,7 @@ add_custom_target(
  
  # configvalues.cpp
  add_custom_command(
@@ -181,7 +182,7 @@ index 5004a957..68e803f2 100644
      DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
      OUTPUT ${GENERATED_SRC}/configvalues.cpp
  )
-@@ -59,7 +59,7 @@ set_source_files_properties(${GENERATED_SRC}/configvalues.cpp PROPERTIES GENERAT
+@@ -60,7 +60,7 @@ set_source_files_properties(${GENERATED_SRC}/configvalues.cpp PROPERTIES GENERAT
  
  # configoptions.cpp
  add_custom_command(
@@ -190,7 +191,7 @@ index 5004a957..68e803f2 100644
      DEPENDS ${CMAKE_CURRENT_LIST_DIR}/config.xml ${CMAKE_CURRENT_LIST_DIR}/configgen.py
      OUTPUT ${GENERATED_SRC}/configoptions.cpp
  )
-@@ -94,7 +94,7 @@ endif()
+@@ -95,7 +95,7 @@ endif()
  # resources.cpp
  add_custom_command(
      COMMENT  "Generating ${GENERATED_SRC}/resources.cpp"
@@ -199,7 +200,7 @@ index 5004a957..68e803f2 100644
      DEPENDS ${RESOURCES} ${CMAKE_CURRENT_LIST_DIR}/res2cc_cmd.py
      OUTPUT ${GENERATED_SRC}/resources.cpp
  )
-@@ -124,7 +124,7 @@ foreach(lex_file ${LEX_FILES})
+@@ -126,7 +126,7 @@ foreach(lex_file ${LEX_FILES})
      set(LEX_FILES_H ${LEX_FILES_H} " " ${GENERATED_SRC}/${lex_file}.l.h CACHE INTERNAL "Stores generated files")
      set(LEX_FILES_CPP ${LEX_FILES_CPP} " " ${GENERATED_SRC}/${lex_file}.cpp CACHE INTERNAL "Stores generated files")
      add_custom_command(
@@ -209,7 +210,7 @@ index 5004a957..68e803f2 100644
          OUTPUT  ${GENERATED_SRC}/${lex_file}.l.h
      )
 diff --git a/testing/CMakeLists.txt b/testing/CMakeLists.txt
-index fd6912e9..0af1865b 100644
+index fd6912e..0af1865 100644
 --- a/testing/CMakeLists.txt
 +++ b/testing/CMakeLists.txt
 @@ -1,7 +1,7 @@
@@ -229,6 +230,3 @@ index fd6912e9..0af1865b 100644
 +		 COMMAND ${Python3_EXECUTABLE} ${PROJECT_SOURCE_DIR}/testing/runtests.py --id ${TEST_ID} --doxygen $<TARGET_FILE:doxygen> --inputdir ${PROJECT_SOURCE_DIR}/testing --outputdir ${PROJECT_BINARY_DIR}/testing
  	)
  endforeach()
--- 
-2.27.0
-
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.2.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
similarity index 86%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.9.2.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
index fc5df4c71..7070c1f2d 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.2.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch \
 "
 SRC_URI:append:class-native = " file://doxygen-native-only-check-python3.patch"
-SRC_URI[sha256sum] = "060f254bcef48673cc7ccf542736b7455b67c110b30fdaa33512a5b09bbecee5"
+SRC_URI[sha256sum] = "f352dbc3221af7012b7b00935f2dfdc9fb67a97d43287d2f6c81c50449d254e0"
 
 inherit cmake python3native
 
-- 
2.25.1


