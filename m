Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AACC02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 12:14:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35383.1737375242888804703
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 04:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=311573e853=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KASK6I026761
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 12:14:02 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4481h0ssdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 12:14:01 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 20 Jan 2025 04:13:59 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] poppler: upgrade 24.12.0 -> 25.01.0
Date: Mon, 20 Jan 2025 12:13:36 +0000
Message-ID: <20250120121337.3338282-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: onuSBm8PjEL5ZXV6Htr8DXEsOSM238cA
X-Authority-Analysis: v=2.4 cv=Oua1yz/t c=1 sm=1 tr=0 ts=678e3e09 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=mDV3o1hIAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=1C6rGDo87biJVj6i5Z4A:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: onuSBm8PjEL5ZXV6Htr8DXEsOSM238cA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501200102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 12:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114995

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2024-56378

Changelog:
===========
core:
* TextOutputDev: Better detect fakebold words
* TextOutputDev: Faster sorting algorithm
* Internal code improvements
* Fix crashes in malformed documents

cpp:
* Remove rect parameter from image::copy, it was never implemented

qt6:
* Fix crash in Submit Forms if document links to non existing field

qt5:
* Fix crash in Submit Forms if document links to non existing field

glib:
* mark transfer of poppler_page_get_selected_region

utils:
* pdfdetach: Make -savefile work with Unicode strings. Issue #1540

build system:
* Don't update pdfsig.pot when POT-Creation-date is the only change

Droped 0001-Don-t-update-pdfsig.pot-when-POT-Creation-date-is-th.patch
as this is available in 25.01.0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...sig.pot-when-POT-Creation-date-is-th.patch | 127 ------------------
 ...{poppler_24.12.0.bb => poppler_25.01.0.bb} |   3 +-
 2 files changed, 1 insertion(+), 129 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0001-Don-t-update-pdfsig.pot-when-POT-Creation-date-is-th.patch
 rename meta-oe/recipes-support/poppler/{poppler_24.12.0.bb => poppler_25.01.0.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-Don-t-update-pdfsig.pot-when-POT-Creation-date-is-th.patch b/meta-oe/recipes-support/poppler/poppler/0001-Don-t-update-pdfsig.pot-when-POT-Creation-date-is-th.patch
deleted file mode 100644
index 4d929beb3..000000000
--- a/meta-oe/recipes-support/poppler/poppler/0001-Don-t-update-pdfsig.pot-when-POT-Creation-date-is-th.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 053acd5d2b310c696993dc97072d1f2b3b1dd7ac Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Nelson=20Ben=C3=ADtez=20Le=C3=B3n?= <nbenitezl@gmail.com>
-Date: Fri, 5 Apr 2024 15:08:09 +0100
-Subject: [PATCH] Don't update pdfsig.pot when POT-Creation-date is the only
- change
-
-Everytime we perform a Poppler build the pdfsig.pot file is
-updated with just a new timestamp in POT-Creation-date field.
-
-That is a nuance as we have to always discard that change in Git
-prior to submitting a MR or just switching branches locally.
-
- - Fix it by only updating pdfsig.pot when there are changes
-   other than the POT-Creation-date. Currently only done for
-   platforms other than Windows as it requires 'diff' command.
-
- - Change the OUTPUT/DEPENDS to be pdfsig.pot.new instead of
-   pdfsig.pot, which is more correct as the former is auto
-   generated while the later is a repo checked-in file, this
-   way we avoid pdfsig.pot from being marked as deleted by
-   git when doing a 'make clean'.
-
-Other changes:
- - Drop flag '-s' from msgmerge as it's deprecated, use
-   instead sort flag '-F' for both msgmerge and xgettext
-   so their output is more synced and so prevent useless
-   diffs that only carry reordering changes.
-
- - Drop redundant flag '--language=C++' as xgettext will
-   use that anyway by recognizing source extension '.cc'
-
- - Update 'pdfsig.pot' and 'ca/pdfsig.po' with the outputs
-   generated with the new flags.
-
-Some related info:
-https://savannah.gnu.org/bugs/?49654#comment1
-
-Fixes #1479
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/053acd5d2b310c696993dc97072d1f2b3b1dd7ac]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- utils/po/CMakeLists.txt | 24 +++++++++++++++++-------
- utils/po/ca/pdfsig.po   | 10 ++++++----
- utils/po/pdfsig.pot     |  6 ++++--
- 3 files changed, 27 insertions(+), 13 deletions(-)
-
-diff --git a/utils/po/CMakeLists.txt b/utils/po/CMakeLists.txt
-index 2eb7f0f0..38e1fd44 100644
---- a/utils/po/CMakeLists.txt
-+++ b/utils/po/CMakeLists.txt
-@@ -13,16 +13,26 @@ macro(UPDATE_POT_FILE input)
-   foreach(_lang ${_langs})
-     set(_poFile "${CMAKE_CURRENT_SOURCE_DIR}/${_lang}/${input}.po")
-     list(APPEND _commands
--      COMMAND ${GETTEXT_MSGMERGE_EXECUTABLE} --quiet --update --backup=none -s ${_poFile} "${CMAKE_CURRENT_SOURCE_DIR}/${_potFile}")
-+      COMMAND ${GETTEXT_MSGMERGE_EXECUTABLE} --quiet --update --backup=none -F ${_poFile} "${CMAKE_CURRENT_SOURCE_DIR}/${_potFile}")
-   endforeach()
--  add_custom_command(OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/${_potFile}
--                    COMMAND xgettext --keyword=_ --language=c++ --package-name=pdfsig --output-dir=po --output=${_potFile} ${input}.cc
--                    ${_commands}
--                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/../${input}.cc
--                    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/..)
-+
-+  set(COPY_NEW_POTFILE ${CMAKE_COMMAND} -E copy po/${_potFile}.new po/${_potFile})
-+  if (NOT (${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Windows"))
-+    # IF the new potfile carries changes other than an updated POT-creation-date (autogenerated) THEN proceed to use that new potfile
-+    set(CM diff --brief --ignore-matching-lines="POT-Creation-Date.*" po/${_potFile} po/${_potFile}.new || ${COPY_NEW_POTFILE})
-+  else ()
-+    set(CM ${COPY_NEW_POTFILE})
-+  endif ()
-+
-+  add_custom_command(OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/${_potFile}.new
-+                     COMMAND xgettext ${input}.cc --package-name=${input} --keyword=_ -F --output=po/${_potFile}.new
-+                     COMMAND ${CM}
-+                     ${_commands}
-+                     DEPENDS ../${input}.cc
-+                     WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/..)
-   add_custom_target(update_pot_${input}
-                     ALL
--                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${_potFile})
-+                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${_potFile}.new)
- endmacro()
- 
- UPDATE_POT_FILE(pdfsig)
-diff --git a/utils/po/ca/pdfsig.po b/utils/po/ca/pdfsig.po
-index fe6a14e7..0d83e42c 100644
---- a/utils/po/ca/pdfsig.po
-+++ b/utils/po/ca/pdfsig.po
-@@ -18,9 +18,11 @@ msgstr ""
- "X-Generator: Lokalize 22.12.3\n"
- 
- #: pdfsig.cc:544
--msgid "Digitally signed by {0:s}"
--msgstr "Signat digitalment per {0:s}"
--
--#: pdfsig.cc:544
-+#, c++-format
- msgid "Date: {0:s}"
- msgstr "Data: {0:s}"
-+
-+#: pdfsig.cc:544
-+#, c++-format
-+msgid "Digitally signed by {0:s}"
-+msgstr "Signat digitalment per {0:s}"
-diff --git a/utils/po/pdfsig.pot b/utils/po/pdfsig.pot
-index 83095113..ffe3bc2f 100644
---- a/utils/po/pdfsig.pot
-+++ b/utils/po/pdfsig.pot
-@@ -18,9 +18,11 @@ msgstr ""
- "Content-Transfer-Encoding: 8bit\n"
- 
- #: pdfsig.cc:544
--msgid "Digitally signed by {0:s}"
-+#, c++-format
-+msgid "Date: {0:s}"
- msgstr ""
- 
- #: pdfsig.cc:544
--msgid "Date: {0:s}"
-+#, c++-format
-+msgid "Digitally signed by {0:s}"
- msgstr ""
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/poppler/poppler_24.12.0.bb b/meta-oe/recipes-support/poppler/poppler_25.01.0.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_24.12.0.bb
rename to meta-oe/recipes-support/poppler/poppler_25.01.0.bb
index 152b0a057..f7f2ea6cc 100644
--- a/meta-oe/recipes-support/poppler/poppler_24.12.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_25.01.0.bb
@@ -7,9 +7,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
-           file://0001-Don-t-update-pdfsig.pot-when-POT-Creation-date-is-th.patch \
            "
-SRC_URI[sha256sum] = "1cf374c3146f3f685d9257701bf0c2866c61d6c202c14d1f5c01a1f3a089028a"
+SRC_URI[sha256sum] = "7eefc122207bbbd72a303c5e0743f4941e8ae861e24dcf0501e18ce1d1414112"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 
-- 
2.40.0


