Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8A8CA5FDD
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 11:20:15 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4084.1791026405711402216
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Oct 2026 04:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=avbbMSet;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261003112001e27abfd3fe000207f3-halhwz@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261003112001e27abfd3fe000207f3
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 03 Oct 2026 13:20:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Ta/D094w15GWpKPOuTIsks+OAbrsjutGUbAwRcmciUQ=;
 b=avbbMSetHFqXwTgFM5b7BImYZ0ye7iPAushkYAUWh6wCDRDzu90ownrNNIYgQ52I5iOMup
 u1wgueoeD42ZE5rIn5NqCHubucJuZZSp77LpkIsF2keBi/r54XgGqkU/BZWxbUefKNVpGEHI
 OruDoYYYwiN8vlayO2RziPP25mduxca3M9eWTfyoIGqcoBr9yvhpSX7Fq15Ko1hvlvcXkfmp
 j7slP2pyaF6+8+PsofANwTao06TQcgzqOYwZ+Z6RgpB4v+Bt6koHakJjeebaPR5FL+Ybhtpo
 eAI5i8kuhUQ79HNlBld45z6l0o1qz4gwhW/9pm1hTAo8PKXR2a3Uoqkg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] cjson: patch CVE-2026-87933
Date: Sat,  3 Oct 2026 13:19:39 +0200
Message-ID: <20261003111939.4004529-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Oct 2026 11:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130615

From: Peter Marko <peter.marko@siemens.com>

Pick patch from Github PR mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../cjson/cjson/CVE-2026-87933.patch          | 108 ++++++++++++++++++
 .../recipes-devtools/cjson/cjson_1.7.19.bb    |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch

diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch b/meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch
new file mode 100644
index 0000000000..eb4aacd1a9
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch
@@ -0,0 +1,108 @@
+From 6d9f2443ab071f86e5d9b43025a40929ec41c46c Mon Sep 17 00:00:00 2001
+From: lilu5458 <lilu@kylinos.cn>
+Date: Wed, 16 Sep 2026 09:55:35 +0800
+Subject: [PATCH] Fix: heap-use-after-free in merge_patch when patch is subtree
+ of target (#1065)
+
+When cJSONUtils_MergePatch(target, patch) is called with a non-object
+patch (scalar, array, or NULL) that happens to be a subtree of target,
+merge_patch() called cJSON_Delete(target) first, which freed the patch
+memory, and then cJSON_Duplicate(patch, 1) read the already-freed memory,
+triggering a heap-use-after-free (detected by AddressSanitizer at
+cJSON_Duplicate_rec, cJSON.c:2808).
+
+Fix: duplicate the patch first into a local variable, then delete the
+target, then return the duplicate. This matches the Option B approach
+proposed in issue #1060.
+
+Verified locally:
+- Reproduced the UAF with a minimal PoC under ASan before the fix.
+- After the fix the PoC runs cleanly (exit 0, correct result [1,2,3]).
+- Added a regression unit test
+  (merge_patch_should_not_read_freed_memory_when_patch_is_subtree).
+- Full ctest suite passes (22/22 tests).
+
+Fixes #1060
+
+Signed-off-by: lilu <lilu@kylinos.cn>
+
+CVE: CVE-2026-87933
+Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/6d9f2443ab071f86e5d9b43025a40929ec41c46c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ cJSON_Utils.c           |  8 ++++++--
+ tests/old_utils_tests.c | 34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 40 insertions(+), 2 deletions(-)
+
+diff --git a/cJSON_Utils.c b/cJSON_Utils.c
+index 8b38eb2..4f3a9ed 100644
+--- a/cJSON_Utils.c
++++ b/cJSON_Utils.c
+@@ -1324,9 +1324,13 @@ static cJSON *merge_patch(cJSON *target, const cJSON * const patch, const cJSON_
+ 
+     if (!cJSON_IsObject(patch))
+     {
+-        /* scalar value, array or NULL, just duplicate */
++        /* scalar value, array or NULL, just duplicate.
++         * Duplicate the patch first in case it is a subtree of target,
++         * otherwise cJSON_Delete(target) would free the patch memory
++         * and the subsequent cJSON_Duplicate would read freed memory. */
++        cJSON *duplicate = cJSON_Duplicate(patch, 1);
+         cJSON_Delete(target);
+-        return cJSON_Duplicate(patch, 1);
++        return duplicate;
+     }
+ 
+     if (!cJSON_IsObject(target))
+diff --git a/tests/old_utils_tests.c b/tests/old_utils_tests.c
+index 690dbb5..bdc7393 100644
+--- a/tests/old_utils_tests.c
++++ b/tests/old_utils_tests.c
+@@ -189,6 +189,39 @@ static void merge_tests(void)
+     }
+ }
+ 
++static void merge_patch_should_not_read_freed_memory_when_patch_is_subtree(void)
++{
++    /* When patch is a subtree of target, merge_patch must duplicate the patch
++     * before deleting target. Otherwise cJSON_Delete(target) frees the patch
++     * memory and the subsequent cJSON_Duplicate reads freed memory (UAF).
++     * See CVE candidate: heap-use-after-free in merge_patch (cJSON_Utils.c). */
++    cJSON *target = cJSON_Parse("{\"a\":[1,2,3]}");
++    cJSON *patch = cJSON_GetObjectItem(target, "a");
++    cJSON *result = NULL;
++    cJSON *first = NULL;
++    cJSON *second = NULL;
++    cJSON *third = NULL;
++
++    TEST_ASSERT_NOT_NULL(target);
++    TEST_ASSERT_NOT_NULL(patch);
++
++    /* patch (array [1,2,3]) is a subtree of target. This used to trigger
++     * heap-use-after-free under AddressSanitizer before the fix. */
++    result = cJSONUtils_MergePatch(target, patch);
++    TEST_ASSERT_NOT_NULL(result);
++    TEST_ASSERT_TRUE(cJSON_IsArray(result));
++    TEST_ASSERT_EQUAL_INT(3, cJSON_GetArraySize(result));
++
++    first = cJSON_GetArrayItem(result, 0);
++    second = cJSON_GetArrayItem(result, 1);
++    third = cJSON_GetArrayItem(result, 2);
++    TEST_ASSERT_EQUAL_INT(1, first->valueint);
++    TEST_ASSERT_EQUAL_INT(2, second->valueint);
++    TEST_ASSERT_EQUAL_INT(3, third->valueint);
++
++    cJSON_Delete(result);
++}
++
+ static void generate_merge_tests(void)
+ {
+     size_t i = 0;
+@@ -219,6 +252,7 @@ int main(void)
+     RUN_TEST(misc_tests);
+     RUN_TEST(sort_tests);
+     RUN_TEST(merge_tests);
++    RUN_TEST(merge_patch_should_not_read_freed_memory_when_patch_is_subtree);
+     RUN_TEST(generate_merge_tests);
+ 
+     return UNITY_END();
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
index 799eb119d6..acaffc54fb 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
+           file://CVE-2026-87933.patch \
          "
 SRCREV = "c859b25da02955fef659d658b8f324b5cde87be3"
 

