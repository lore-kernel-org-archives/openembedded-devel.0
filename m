Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id F3A5E7F302
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=S1JPS/sClj5QpC7MQlzqIxPM5Jtgh3bRlnaooAxbL6M=; 
	b=f4kYSmZmsD9ICkKdvZoMzpDTBCYlB2wzqMJZNHjTxrKiR/GlkDI18dSqjAKaPXdisFQlp1wMfgs5Wis5aVOyAMRRrV+cp+6BhpA3S8JPuGJiH3aLEhxTEY++G2mOz2LacF3hpFHRY3Nc8JY+ru2UMFZVVbgCUg/NowXvA4D9yFOWUD3fY9OnoOrGJ05cb5D+yAiNE7cIuzmIDuhwF9+pa+DvhOKHyYHkemkUgJl1gTdsMZ/cVeygw5pXUGi1W2Re7K3iyu9BbNQeK31BKka1N7fXoVynaxj1DD4LAN9PiVfKdkG5E7sv0fV9EiVlifPVKYBJMdLOZ4hRAP7224xtnA==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1htTHE-0001lC-PQ
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 10:51:04 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Aug 2019 10:50:32 +0200
Message-Id: <20190802085032.32687-10-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190802085032.32687-1-psaavedra@igalia.com>
References: <20190802085032.32687-1-psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v6 10/10] ibus-table-chinese: Fix build using native ibus-table
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
X-List-Received-Date: Fri, 02 Aug 2019 08:51:04 -0000

---
 .../0005-fix-cmake-cross-compile.patch                | 19 ++++++-------------
 .../recipes-support/ibus/ibus-table-chinese_1.8.2.bb  |  8 ++++----
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-support/ibus/ibus-table-chinese/0005-fix-cmake-cross-compile.patch b/meta-oe/recipes-support/ibus/ibus-table-chinese/0005-fix-cmake-cross-compile.patch
index 0f814b765..1ab33e892 100644
--- a/meta-oe/recipes-support/ibus/ibus-table-chinese/0005-fix-cmake-cross-compile.patch
+++ b/meta-oe/recipes-support/ibus/ibus-table-chinese/0005-fix-cmake-cross-compile.patch
@@ -23,7 +23,6 @@ diff -u -r ibus-table-chinese-1.8.2/tables/array/CMakeLists.txt new/tables/array
  
  ADD_CUSTOM_COMMAND(OUTPUT ${ARRAY30_BIG_UTF8}
      COMMAND cat ${ARRAY30_BASE_UTF8}
-Only in new/tables/array: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/cangjie/CMakeLists.txt new/tables/cangjie/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/cangjie/CMakeLists.txt	2018-10-30 01:56:50.506773198 +0100
 +++ new/tables/cangjie/CMakeLists.txt	2018-10-30 00:15:41.319903050 +0100
@@ -31,7 +30,6 @@ diff -u -r ibus-table-chinese-1.8.2/tables/cangjie/CMakeLists.txt new/tables/can
 -CONVERT_DB(cangjie "cangjie3.txt" "cangjie5.txt" "cangjie-big.txt")
 +CONVERT_DB(cangjie "${CMAKE_CURRENT_SOURCE_DIR}/cangjie3.txt" "${CMAKE_CURRENT_SOURCE_DIR}/cangjie5.txt" "${CMAKE_CURRENT_SOURCE_DIR}/cangjie-big.txt")
  
-Only in new/tables/cangjie: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/cantonese/CMakeLists.txt new/tables/cantonese/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/cantonese/CMakeLists.txt	2018-10-30 01:56:29.464408649 +0100
 +++ new/tables/cantonese/CMakeLists.txt	2018-10-30 00:05:51.026038238 +0100
@@ -39,11 +37,15 @@ diff -u -r ibus-table-chinese-1.8.2/tables/cantonese/CMakeLists.txt new/tables/c
 -CONVERT_DB(cantonese "cantonese.txt" "cantonhk.txt" "jyutping.txt")
 +CONVERT_DB(cantonese "${CMAKE_CURRENT_SOURCE_DIR}/cantonese.txt" "${CMAKE_CURRENT_SOURCE_DIR}/cantonhk.txt" "${CMAKE_CURRENT_SOURCE_DIR}/jyutping.txt")
  
-Only in new/tables/cantonese: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/CMakeLists.txt new/tables/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/CMakeLists.txt	2018-10-30 01:56:08.781947707 +0100
 +++ new/tables/CMakeLists.txt	2018-10-30 01:53:51.086824367 +0100
-@@ -87,7 +87,7 @@
+@@ -83,11 +83,11 @@ MACRO(CONVERT_DB targetName)
+ 	GET_FILENAME_COMPONENT(_tabName "${_tabFile}" NAME_WE)
+ 	SET(_dbF "${_tabName}.db")
+ 	ADD_CUSTOM_COMMAND(OUTPUT ${_dbF}
+-	    COMMAND ${CREATE_DB} -n ${_dbF} -s ${_tabFile}
++	    COMMAND ${CREATE_DB} -p ${CMAKE_BINARY_DIR}/../recipe-sysroot-native/usr/share/ibus-table/data/pinyin_table.txt.bz2 -n ${_dbF} -s ${_tabFile}
  	    DEPENDS ${_tabFile}
  	    COMMENT "Building ${_tabName} table"
  	    )
@@ -52,7 +54,6 @@ diff -u -r ibus-table-chinese-1.8.2/tables/CMakeLists.txt new/tables/CMakeLists.
  	IF(EXISTS "${CMAKE_SOURCE_DIR}/icons/${_tabName}.png")
  	    LIST(APPEND _dependIcon "${CMAKE_SOURCE_DIR}/icons/${_tabName}.png")
  	ELSEIF(EXISTS "${CMAKE_SOURCE_DIR}/icons/${_tabName}.svg")
-Only in new/tables: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/easy/CMakeLists.txt new/tables/easy/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/easy/CMakeLists.txt	2018-10-30 01:56:35.966667250 +0100
 +++ new/tables/easy/CMakeLists.txt	2018-10-30 00:07:49.806217968 +0100
@@ -60,7 +61,6 @@ diff -u -r ibus-table-chinese-1.8.2/tables/easy/CMakeLists.txt new/tables/easy/C
 -CONVERT_DB(easy "easy-big.txt")
 +CONVERT_DB(easy "${CMAKE_CURRENT_SOURCE_DIR}/easy-big.txt")
  
-Only in new/tables/easy: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/erbi/CMakeLists.txt new/tables/erbi/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/erbi/CMakeLists.txt	2018-10-30 01:56:39.921608060 +0100
 +++ new/tables/erbi/CMakeLists.txt	2018-10-30 00:08:14.355641341 +0100
@@ -68,7 +68,6 @@ diff -u -r ibus-table-chinese-1.8.2/tables/erbi/CMakeLists.txt new/tables/erbi/C
 -CONVERT_DB(erbi "erbi.txt" "erbi-qs.txt")
 +CONVERT_DB(erbi "${CMAKE_CURRENT_SOURCE_DIR}/erbi.txt" "${CMAKE_CURRENT_SOURCE_DIR}/erbi-qs.txt")
  
-Only in new/tables/erbi: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/quick/CMakeLists.txt new/tables/quick/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/quick/CMakeLists.txt	2018-10-30 01:56:43.592624907 +0100
 +++ new/tables/quick/CMakeLists.txt	2018-10-30 00:14:13.643389364 +0100
@@ -76,7 +75,6 @@ diff -u -r ibus-table-chinese-1.8.2/tables/quick/CMakeLists.txt new/tables/quick
 -CONVERT_DB(quick "quick3.txt" "quick5.txt" "quick-classic.txt")
 +CONVERT_DB(quick "${CMAKE_CURRENT_SOURCE_DIR}/quick3.txt" "${CMAKE_CURRENT_SOURCE_DIR}/quick5.txt" "${CMAKE_CURRENT_SOURCE_DIR}/quick-classic.txt")
  
-Only in new/tables/quick: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/scj/CMakeLists.txt new/tables/scj/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/scj/CMakeLists.txt	2018-10-30 01:56:47.079691021 +0100
 +++ new/tables/scj/CMakeLists.txt	2018-10-30 00:00:14.404215150 +0100
@@ -84,7 +82,6 @@ diff -u -r ibus-table-chinese-1.8.2/tables/scj/CMakeLists.txt new/tables/scj/CMa
 -CONVERT_DB(scj "scj6.txt")
 +CONVERT_DB(scj "${CMAKE_CURRENT_SOURCE_DIR}/scj6.txt")
  
-Only in new/tables/scj: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/stroke5/CMakeLists.txt new/tables/stroke5/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/stroke5/CMakeLists.txt	2018-10-30 01:56:32.727534736 +0100
 +++ new/tables/stroke5/CMakeLists.txt	2018-10-30 00:07:28.132024331 +0100
@@ -92,7 +89,6 @@ diff -u -r ibus-table-chinese-1.8.2/tables/stroke5/CMakeLists.txt new/tables/str
 -CONVERT_DB(stroke5 "stroke5.txt")
 +CONVERT_DB(stroke5 "${CMAKE_CURRENT_SOURCE_DIR}/stroke5.txt")
  
-Only in new/tables/stroke5: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/wu/CMakeLists.txt new/tables/wu/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/wu/CMakeLists.txt	2018-10-30 01:56:53.921858589 +0100
 +++ new/tables/wu/CMakeLists.txt	2018-10-30 00:16:38.080698934 +0100
@@ -100,7 +96,6 @@ diff -u -r ibus-table-chinese-1.8.2/tables/wu/CMakeLists.txt new/tables/wu/CMake
 -CONVERT_DB(wu "wu.txt")
 +CONVERT_DB(wu "${CMAKE_CURRENT_SOURCE_DIR}/wu.txt")
  
-Only in new/tables/wu: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/wubi-haifeng/CMakeLists.txt new/tables/wubi-haifeng/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/wubi-haifeng/CMakeLists.txt	2018-10-30 01:56:15.560132413 +0100
 +++ new/tables/wubi-haifeng/CMakeLists.txt	2018-10-29 23:30:12.746818405 +0100
@@ -112,7 +107,6 @@ diff -u -r ibus-table-chinese-1.8.2/tables/wubi-haifeng/CMakeLists.txt new/table
 +MAKE_TABLE_SOURCE_TXT(wubi-haifeng86.txt ${CMAKE_CURRENT_SOURCE_DIR}/wubi-haifeng86.head ${CMAKE_CURRENT_SOURCE_DIR}/wubi-haifeng86.UTF-8 ${CMAKE_CURRENT_SOURCE_DIR}/wubi-haifeng86.tail)
  CONVERT_DB(wubi-haifeng "wubi-haifeng86.txt")
  
-Only in new/tables/wubi-haifeng: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/wubi-jidian/CMakeLists.txt new/tables/wubi-jidian/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/wubi-jidian/CMakeLists.txt	2018-10-30 01:56:25.921357528 +0100
 +++ new/tables/wubi-jidian/CMakeLists.txt	2018-10-30 00:01:13.876283460 +0100
@@ -120,7 +114,6 @@ diff -u -r ibus-table-chinese-1.8.2/tables/wubi-jidian/CMakeLists.txt new/tables
 -CONVERT_DB(wubi-jidian "wubi-jidian86.txt")
 +CONVERT_DB(wubi-jidian "${CMAKE_CURRENT_SOURCE_DIR}/wubi-jidian86.txt")
  
-Only in new/tables/wubi-jidian: .CMakeLists.txt.swp
 diff -u -r ibus-table-chinese-1.8.2/tables/yong/CMakeLists.txt new/tables/yong/CMakeLists.txt
 --- ibus-table-chinese-1.8.2/tables/yong/CMakeLists.txt	2018-10-30 01:56:57.568881862 +0100
 +++ new/tables/yong/CMakeLists.txt	2018-10-30 00:17:30.326704114 +0100
diff --git a/meta-oe/recipes-support/ibus/ibus-table-chinese_1.8.2.bb b/meta-oe/recipes-support/ibus/ibus-table-chinese_1.8.2.bb
index 0c33e4f44..ff2173fbd 100644
--- a/meta-oe/recipes-support/ibus/ibus-table-chinese_1.8.2.bb
+++ b/meta-oe/recipes-support/ibus/ibus-table-chinese_1.8.2.bb
@@ -3,19 +3,19 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=86bfc594f9971fb2797f5aea1a49d316"
 SECTION = "inputmethods"
 
-SRC_URI = "https://github.com/definite/${PN}/archive/${PV}.tar.gz \
+SRC_URI = "git://github.com/definite/${PN}.git;protocol=https;branch=master \
            file://0001-revert-CMakeLists.txt.patch \
            file://0002-add-Modules.patch \
            file://0003-add-ChangeLog.prev.patch \
            file://0005-fix-cmake-cross-compile.patch \
 "
-
-SRC_URI[md5sum] = "6360649580363bb3627a11e32057f6b1"
-SRC_URI[sha256sum] = "ef62c22ef4e8f9085fc40fcbc14c30f6dac458817df98e9f90f883a3e2080089"
+SRCREV = "2ada25684e3df1f003cb66dde406465cd6b5190c"
+S = "${WORKDIR}/git"
 
 inherit cmake
 
 DEPENDS = " ibus-table "
+DEPENDS_append_class-target = " ibus-table-native"
 
 BBCLASSEXTEND = "native"
 
-- 
2.11.0


