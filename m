Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37941.1795594091604131528
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=A2n0HKVH;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso2524602eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594091; x=1796198891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pIPzew9I3Dv2DXwf594VZOlL8P8gUGJ0i0Nq+/+zyU=;
        b=A2n0HKVHa+2o0Gny68IIhOH+OjzcaES2wa1r+E9ifcYjTtpP2X1Cia9q9Eu3DkBX/c
         NzK6nV0IAOd9RKygaxrDLdyMOlIM6NCXt4xxDm/1XWfG9SCrllMNOF8mOTC5Gj4DZbfQ
         20Ux7+jdchDCV6QcDNQ/lx+7D7M0UI1MPDHDbon2nghd3F0cafKo6p+o1CGwS9PlcPoA
         KHeUupgSDkb4eV7TKE6BeNxshFCN/6TFwoZ8GAQa8NZuSSuaCgpqhv2rRlvTpZmjaBxM
         6LoZxQ3MiQzdb+ZUgJVT57Cmxc50PujnCUUAVIkQuJoaUdvDFmDonmIUCDgHffdUeWvy
         fJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594091; x=1796198891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pIPzew9I3Dv2DXwf594VZOlL8P8gUGJ0i0Nq+/+zyU=;
        b=XpWeBXCBfqRYLGlGME1mPSF6WkuRgRgAGWTKjDEj/kxgDuQyIbs3S+T57NCiwdCBHC
         hfxHvgTb2FdiLM32T66EGti62+FBDrrxW3SsAj3vRP6wi8RjwHmpt27xh2SHhxPOd3Zi
         Sxn4GtPkNWMZWkwx+S1nI5pm8yR4NdVrz4TWCiJEQcHlgIo4yzQqqAJHuFHyH33O3GTs
         rvhVztmx0psoJsn9oiTx1Y5sy+CADOxQwyvtYiRTlJq5HClXzlw344WO0ANb+8Cx1tc1
         MYe0ygwtp2jGpEQSZi/rXzpAFvRSTqx8wYNq1ntwHiWRiBbAP1jqULAF4pfaXivU7EwY
         C/2g==
X-Gm-Message-State: APuU4Z/eqLj/SKClEGbPLpTtc4/cN5S5KH66Dtiw1wF+cIB5dJ49R7pD
	n4NCAW0O/sQ6sDUPwY0advV2BCBVM8N+dleI+iJEaFNeVIaz06p5PaYBFp9O99jD
X-Gm-Gg: AZFdTZdwlfgKdcn8YNpIOWzFFwj5Y8uj6YgRjNmzyUrOnJkXEU+WWZ5mI2Frx0vP6KQ
	nuzspOXMZbdZnTppWkNjTLjjo0rI7IcCa9UJjiK14Sw2ST2fatJCAfwQQ32R6Ddsort85jwdE1a
	CLyinFie1TCHk+q52SPum4xf/ddGa6Rv5uEyrHHdfiiZJBPTaHJwwZ4JxHlYEQhOQoEFhbpEP3U
	av9n8+K+P9+RF6LaMGI2VPq/J+PTnbdEBzx105xLwevKlR8m9WHRNyoHhhV98IGNXpx4j1TxQzL
	TpDNyb2lgmWpT6t086wdkwvkqcYxo+nsLUepKrSKwDJQWe9FGrRWrC9EFag+v3DN8kNji1FPbld
	F8SOvyw3QwA4VsBbeKBmyaPxa7w6dOThDM5cG+ymKMPYQ2VvzoBhptXhWE6mxOD1I2ajtfLSw/L
	wgaKFWACzDIktvXaCCkq162/zTfyRo3UEdUo3Ekqpq2Qi2df+66wj+sGLnSEdROOq5bQsPEn3YW
	4nryiSzuC2b/dpAm1loobF+6TKPxIOpe1IJTPxY7T8oq2kWy5YjDymSOlaoi8faxgb3mcD8znfc
	X42jT5bmC9fk5Xvj1HNXazyoX1B1VZPlYTMwLLXuLhdpbCECGObFdqYglTEjVkHeyX7gJ1W5vXN
	UvVrfGqQeOZfZuvXNqzdtblublIZBLmLwalCfKbIxbeH5mpOFZpuWFkjZzZEVVUGGtPU190zNIu
	nhzMUh5Alg/q9yZKZREOOYMnU8zdFjeMEK1BEbpTh9ThlDQd9R/kLyUPf73eY5R0g3wZJ7zGPPQ
	jDXbdF36MOa15oldpFrWQu9NfZ0NfFbCd78EJiYWTWZwnWpWinWDYg2IlWeTXK7b8w4lvM7dlWN
	d2FV
X-Received: by 2002:a05:7301:241b:b0:386:b526:24d2 with SMTP id 5a478bee46e88-386b52636aemr8502560eec.41.1795594090905;
        Wed, 25 Nov 2026 00:08:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 22/55] libyang: upgrade 3.13.6 -> 6.4.13
Date: Wed, 25 Nov 2026 00:06:38 -0800
Message-ID: <20261125080732.2419614-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133025
Content-Type: text/plain; charset="utf-8"

- 4.x: SO version 4, major LYB binary format optimizations
- 5.x: SO version 5, "bin" value functions removed, LYB uses complex
  encoding, anydata XPath support, schema mount improvements; the
  binary YANG modules were removed, the text modules are installed in
  ${datadir}/yang and loaded from there
- 6.x: keeps SO version 5; ietf-yang-semver/ietf-yang-revisions,
  experimental schema comparison, new yangupdate tool, sized array API
  (LY_ARRAY_COUNT renamed to LYA_COUNT), CBOR format with libcbor
- includes the fix for CVE-2026-41401

Drop CVE-2026-41401.patch, it is part of this release. Refresh the
test_context patch. Add a cbor PACKAGECONFIG, off by default, so an
available libcbor is not picked up by accident. Install the top-level
modules directory and the schema_comparison data the new tests use for
ptest. Add UPSTREAM_CHECK_GITTAGREGEX. FRR, the only user in the
layers, got the libyang 5.x/6.x API backport in the previous commit.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ntext-skip-test-case-test_searchdirs.patch |  6 +--
 .../libyang/libyang/CVE-2026-41401.patch      | 43 -------------------
 .../{libyang_3.13.6.bb => libyang_6.4.13.bb}  | 12 +++++-
 3 files changed, 13 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
 rename meta-oe/recipes-extended/libyang/{libyang_3.13.6.bb => libyang_6.4.13.bb} (71%)

diff --git a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch b/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
index 70890e2485..8775f7025e 100644
--- a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
+++ b/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
@@ -13,14 +13,14 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/tests/utests/basic/test_context.c b/tests/utests/basic/test_context.c
-index 116b2ce36..4e96f4e96 100644
+index f3dfcaad..fd3e3f31 100644
 --- a/tests/utests/basic/test_context.c
 +++ b/tests/utests/basic/test_context.c
-@@ -1110,7 +1110,6 @@ int
+@@ -1131,7 +1131,6 @@ int
  main(void)
  {
      const struct CMUnitTest tests[] = {
 -        UTEST(test_searchdirs),
-         UTEST(test_options),
          UTEST(test_models),
          UTEST(test_imports),
+         UTEST(test_includes),
diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch b/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
deleted file mode 100644
index 06537acbb8..0000000000
--- a/meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 34b2a26ee86716e2b593c44e51e38ee15d4e8434 Mon Sep 17 00:00:00 2001
-From: Michal Vasko <mvasko@cesnet.cz>
-Date: Thu, 26 Mar 2026 08:33:44 +0100
-Subject: [PATCH] parser common BUGFIX invalid metadata removal
-
-(cherry picked from commit 54c3276d871023da266d4ed3ceaee7e8d71d0b04)
-
-CVE: CVE-2026-41401
-Upstream-Status: Backport [https://github.com/CESNET/libyang/commit/54c3276d871023da266d4ed3ceaee7e8d71d0b04]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/parser_common.c                                    | 4 ++--
- tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26 | 5 +++++
- 2 files changed, 7 insertions(+), 2 deletions(-)
- create mode 100644 tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26
-
-diff --git a/src/parser_common.c b/src/parser_common.c
-index 0b221af72..fefe723eb 100644
---- a/src/parser_common.c
-+++ b/src/parser_common.c
-@@ -413,8 +413,8 @@ lyd_parser_set_data_flags(struct lyd_node *node, struct lyd_meta **meta, struct
-             next_meta = meta2->next;
- 
-             /* delete the metadata */
--            if (meta != &node->meta) {
--                *meta = (*meta)->next;
-+            if ((meta != &node->meta) && (meta2 == *meta)) {
-+                *meta = next_meta;
-             }
-             lyd_free_meta_single(meta2);
-             if (prev_meta) {
-diff --git a/tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26 b/tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26
-new file mode 100644
-index 000000000..7e3b6c39e
---- /dev/null
-+++ b/tests/fuzz/corpus/lyd_parse_mem_xml/advisory2026_03_26
-@@ -0,0 +1,5 @@
-+<int32 xmlns="urn:tests:types"
-+       xmlns:yang="urn:ietf:params:xml:ns:yang:1"
-+       xmlns:dflt="urn:ietf:params:xml:ns:netconf:default:1.0"
-+       yang:operation="create"
-+       dflt:default="true">5</int32>
diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb b/meta-oe/recipes-extended/libyang/libyang_6.4.13.bb
similarity index 71%
rename from meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
rename to meta-oe/recipes-extended/libyang/libyang_6.4.13.bb
index 7724b4c218..a6d23f30b8 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_6.4.13.bb
@@ -6,14 +6,14 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b69fd3b2815bbf1cef5c97f0eee2519a"
 
-SRCREV = "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
+SRCREV = "f7e0cc1bc99ec9280af1010a94ba8dd8ef448f6d"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
            file://run-ptest \
-           file://CVE-2026-41401.patch \
            "
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 # Main dependencies
 inherit cmake pkgconfig lib_package ptest multilib_header
@@ -23,6 +23,9 @@ DEPENDS = " \
 "
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cbor] = "-DCMAKE_DISABLE_FIND_PACKAGE_CBOR=OFF,-DCMAKE_DISABLE_FIND_PACKAGE_CBOR=ON,libcbor"
+
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
 EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON -DENABLE_VALGRIND_TESTS=OFF', '', d)}"
 
@@ -41,6 +44,11 @@ do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -f ${B}/tests/utest_* ${D}${PTEST_PATH}/tests/
     cp -fR ${S}/tests/modules ${D}${PTEST_PATH}/tests/
+    cp -fR ${S}/modules ${D}${PTEST_PATH}/
+    install -d ${D}${PTEST_PATH}/tests/utests/schema_comparison
+    cp -fR ${S}/tests/utests/schema_comparison/bc ${S}/tests/utests/schema_comparison/ed \
+        ${S}/tests/utests/schema_comparison/local_full_resolved ${S}/tests/utests/schema_comparison/nbc \
+        ${D}${PTEST_PATH}/tests/utests/schema_comparison/
     install -d ${D}${PTEST_PATH}/tests/plugins
     cp -f ${B}/tests/plugins/plugin_*.so ${D}${PTEST_PATH}/tests/plugins/
 }
