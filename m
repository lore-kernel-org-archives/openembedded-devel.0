Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E9EC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:15 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4264.1790160066918960275
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=akzI1zUq;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a8568e9so378422b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160066; x=1790764866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVbtBaNwpv8HfDqPpzzqu+2kp03or2TKGArYN1K/5iA=;
        b=akzI1zUqlljZL1AG8Krb0MVPbnrtQBalBoGKoWHfwUHXX00HSks3BraKMthma0ruG5
         tJXyTx+B+gJ7wMSNpN9kJ4pjUdIHpSUOIj+0YLAcVwEwOeUeCdzfccLyl+VtYgGmHz3/
         VtCzZEb1d0KVKm5Lfa+kt/MU3vWzZtohXVtN3WEKCdSW1hlMNEHY/PsC6/NQ+616TPkp
         iOxLifukapddoPdu0hT62V1XP2BpcckWoh3n+X+5lnXhqEeNUmYj2myiICGtfkxM2VQg
         g1CVRjXc97VogrVpAZTERLjzI6u4ZfWEHTWEPIh4r1vhkXLPg6mqradxdMcQ4cvE92y7
         9txA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160066; x=1790764866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dVbtBaNwpv8HfDqPpzzqu+2kp03or2TKGArYN1K/5iA=;
        b=DiRTx0Rho5XRE5Zprc96Gz12vPFWGdlAs24mQ/1tt6kAlwny+BW1uD9gLUUYGxIUR/
         iq7oUYix3bx3aiSoyQdGskTQlCO2y9J9w55hibJT5ZdRM8ie7+AZ1AVL4XOCMtwq9LKs
         SgPXTJ0KbC3PWHR9G7at27Z8+nUKX/7DM/sM/gHM4swzP/X53RSWnvyBxQnNHHX/QHxw
         jzm5+VJxkoH0N7J8j+2USrsg1e0Rdq3asoW2FTCRy/AZpJf8g+R8swNGSR2idv4gX4EF
         rHXBKuWeVFaIhatobKiukgAU8RmZKcI5xuKZ7/UXWtQoOLKxtcXXfAb0mq4MTp2KOFY1
         K7Sw==
X-Gm-Message-State: AFuF++kiKbl9aeMdD/ZXhGfiqwF1ASTwhalepb9UP4os3CEr2EkpjfXD
	zGdXZ8+7t0hJl/H9Ww2Zuaplwpl8hLfIe1Z6QCn757uls4vi0uIllsCnXuQmtQ==
X-Gm-Gg: AYBFou2CRnBMctlOM2OvbpVNhji7rAPfIV7pEdyMizUO0IJKUGhMiox0W5iVyaWq/ag
	fhXTOYrvXfdz0aD9mZ5lAs+O2D7nzEYNBApraqz9s9swSKO16mzcNOm4iCL07M2kblD5N81w7Ev
	s20661/fNSs6pkCVO8JetU1YIIpoEVvBkAwUAbxgcQs55hYaQxcYQw5AEKVprWAhU8YnlrW6huQ
	j3/VoQjpl5BXDzNMR/SSN6cqHgETsJYz0sUXa7Cm8k5cHBi7FfsneJxGXda0RJEYAbVe5nj6iZf
	L6Y70yOdxsSn0Q+5RdMuoQHCpb9vNNZ4YpXV0lTzunria8/6/IX4woWHD1rfulzCDAcEOsaCZfJ
	W/OSIKLRGSwHGecVmrJLeSmzNS3P2z1Brp3cM5g4HhSRBiSitjNbYftHLVsZGP+JypTnEzmotMe
	7FBV1wWiZe0g3e+6+6i8Spl1BxY9iVfglOOtPcEHEFNxdnyolhiT8rxGubdB+OIN2WqTem3AdoQ
	ieuC0ytdpq6/UtKrvf6WT8=
X-Received: by 2002:a05:6a00:1c90:b0:878:3538:8f77 with SMTP id d2e1a72fcca58-87d1b89fd9emr1763881b3a.37.1790160066159;
        Wed, 23 Sep 2026 03:41:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 3/42] cjson: patch CVE-2026-87933
Date: Wed, 23 Sep 2026 22:40:17 +1200
Message-ID: <20260923104056.457360-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130190

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-87933

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cjson/cjson/CVE-2026-87933.patch          | 110 ++++++++++++++++++
 .../recipes-devtools/cjson/cjson_1.7.19.bb    |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch

diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch b/meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch
new file mode 100644
index 0000000000..3972e5eafc
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch
@@ -0,0 +1,110 @@
+From a1b370963c98e1374e5538e97841f9d476a8932e Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 6d9f2443ab071f86e5d9b43025a40929ec41c46c)
+
+CVE: CVE-2026-87933
+Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/6d9f2443ab071f86e5d9b43025a40929ec41c46c]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ cJSON_Utils.c           |  8 ++++++--
+ tests/old_utils_tests.c | 34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 40 insertions(+), 2 deletions(-)
+
+diff --git a/cJSON_Utils.c b/cJSON_Utils.c
+index 8fa24f8..6f41875 100644
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
index d914018331..b4e57d7297 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
            file://0001-allow-build-with-cmake-4.patch \
+           file://CVE-2026-87933.patch \
          "
 SRCREV = "c859b25da02955fef659d658b8f324b5cde87be3"
 

