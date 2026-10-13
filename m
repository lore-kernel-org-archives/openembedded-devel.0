Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B1DCA9ED0
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 04:40:31 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.362.1791866425970424135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 21:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YFJEyIT5;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac397836fbso345158a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866425; x=1792471225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHw5JRLgOlcFY5DYdmACJelptg6LctIJStO918gX8nQ=;
        b=YFJEyIT55jsDZ8UnGmtVCFJceOIFD3aJx7EVlnBtk/PnSla8XM6e44IUw+FV8E08Hi
         QGhHgF+f36Zazos9RSJxzlNOuFfmS63EpGU2sTOGBX8RsTc13KUblnz5Vv8mNGQ1oWB9
         4yKPwazqIBJ7huBIa4hKRVDhs3ihdUPmVmyz3bNAvmyD786ZkET3M50XZVRwANo4qVVw
         v/54/ZAjX32jXb/tkSveAJwtcHzC0INCS5ObWuc3sVWcJqxnWi5o5SdE8/vtDReFZdtp
         qv+FoqlLz9tirQdh0Bo7cXjTVzaS67+CmZY3ebDUravqzcFJ76fmMGBEvNeuA1nZnDJW
         B6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866425; x=1792471225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHw5JRLgOlcFY5DYdmACJelptg6LctIJStO918gX8nQ=;
        b=xuLAoyDZrecTmjwAau5qHDlqe9hFK90LyMN+1KYKLIGjhFI3tsCylpcjhbIhI53c3q
         P1c/AqKbNM2epyJidaMb6E8vU8Pq9fLCcGN6g7HIGD+n3NK/t32aUbGgYTqSRCtjmRTB
         WvVlSjjRL6eeZ8XQ3g9Opl/SwTnxNZTVBcb+CRmwpdwi8djP5Mh0KzmhpbvKvqD8co/y
         0vhoOgdY1DE0yBDkcdmPmI9UImZlTvCNJMi0T4jJjHnNWkwJfmKdLM4L9ON9H/5QIVzi
         9NYHOtw4S8pDUStKpNVxbuJ7p8KJAnRIag7Bv8ewi8sdudVWUMs51LQ5zjDIIR31u2TZ
         hA8A==
X-Gm-Message-State: AFq9FYIFCtV/fyGFD0Jw0HrR2chDto1f1H5+Zc8pKUTllJQhvHYjx3C4
	tJGFBgs96oRJOqlgUueGwnAnbWFN4cHfxSa9zldhvwg4El2ivoFI0f71DSWfJw==
X-Gm-Gg: AYBFou25JRDCrLYK5E1k2ZKGvZzaZSxYwOg3iABKnPsLFEn+YFX+t4gSTlHQ+7sCVU+
	sZ9Ntuky5B6MI57VXUVSjdDFX2c4DphrCq3Y9Tyt3MTiBV1fgUiz+nWEFef3ETmZL1KP7UbALY6
	0uFRslb3jkXT+nxACctPjf5M4wNa0YnhdHkmibx9d2B/ar9dySlM+CD8RTF9yyT/UWoWB+w9BoO
	1Kvip91/uQ8v4K9f5OAxpStWnGdaAujyYWQLDRZbCPU4aITd5o5evdrdGfsFQXDZQUYkVKF0Gg6
	B8BwuhX7brJgbgtfDHPlH/OW0gr7q5TL0cFTwm9lA81dFZ2/e8jV6udxFpRcPKK7ONV1suN5m1S
	IgiwuLDtA7We2VQMN3f97tC0Di15zRU3xacLFQey4iyC2+xUE02aWU2gV/nXJ3zPQs2AAB4Sowp
	9ontmk46ZZxxWsM/RloIb4eNhRACX6DE/3J1RDZ2xnnZg24J0nhd040Wf3Wf3N8m6ITPtcoEXlP
	vz5P+b8NPZSQ2cDHaQmIZmZgVlfH2iSS18vn+KETQrLjl7rYg==
X-Received: by 2002:a17:90b:6c5:b0:3ac:450a:f9ac with SMTP id 98e67ed59e1d1-3ac450b4782mr350436a91.64.1791866425267;
        Mon, 12 Oct 2026 21:40:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm11672757a91.1.2026.10.12.21.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 3/16] cjson: patch CVE-2026-87933
Date: Tue, 13 Oct 2026 17:39:53 +1300
Message-ID: <20261013044006.834868-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
References: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130817

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-87933

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 2b3f5cbbd85177f06cea6f89f0b6d83bba48da40)
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
 

