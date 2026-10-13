Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEFECC6B10
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:26 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3510.1791885564143953707
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=czgYQXv2;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ccca948203aso947587a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885563; x=1792490363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHw5JRLgOlcFY5DYdmACJelptg6LctIJStO918gX8nQ=;
        b=czgYQXv2V6jaujas8iEds7jK14q+9Y7CJf6YNvcdxkcgLuWMfEAM3Dl/dkVdCidBtL
         nO0QYKXeow72aX7gPPbEf5mxQdT3TllIBDeQVg4ufLliCcwTu9Ps8nJsM2SaTN/i3P+a
         uf7mU2icc9e0cqni0sWaLyAyJ/R+C1mftZKu3Y/p9iBuKvJLXfQhr0gwZi9/SNpswjY6
         xVJcpc0P3H2gnjXZHxxEdslOewgMZYSFyap9NwASUmIvcKmpNvQOjzVqa2rjrH5650ry
         5UBJnVwk28E1Wwov8dU9NbFO2wsF/JsOKYrwNCKrdnaWJukcpJT3RETusNjKVjgLoBLl
         QEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885563; x=1792490363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHw5JRLgOlcFY5DYdmACJelptg6LctIJStO918gX8nQ=;
        b=cobLjBwbM7OOiHvh8xAVWuG2w9+owYP95TEmkU+Zt+4wyLVWtOpEaYzJNFoVGTD63a
         DfkeifNAKNFLgTd7YAguR0IjMTPyvxFuPK6uId9cojhIGucmHn/s7qgGcwt0cMznd4E7
         QYH2Dwp0mQ1PtPFlIErOhR0deTI+rrn/kkL7Hq09O3EBlc9DgGU+YtqWSKIKEH0uaMEW
         D6YVz6+taSN0J7PtdE02q5QTM0iTxyourUqayTuHheAoA3rY1yPyUTF4YhWVGTTfv9Ho
         nHCvUOGryF7G9zjyN3NReTI5Jklb4zuiq96cp2dztha0KBnGivL+qdDE2Xdvtr4VQ/xY
         Vilg==
X-Gm-Message-State: AFq9FYKpM+wskcPum0CkyIgAtkcIV3cuKIdD+J4qkvNsBkmWCopf8U+x
	P6gcOxKaBkxiLDKgLO1Gg3k33NOOm7jJQAs2rxxf1aWqGvjyjbwC/16riC/6LQ==
X-Gm-Gg: AYBFou09hHi0Fu2gP/3lhfpdfd3NoUNhCsgq3Yin0MilBJ9d6tBWdpM6sQwq2swC7E4
	3Rb2BxhJxoTniaT/ZJ8N3zoTDhqJBeUcvpfW6SoUJrOSvJGFKJBG6ZtHH+bPC73CYErsw8Ya+7o
	IBddtwYrFRdAbVINQOevc/gGLeqzI0Prwi6iYw5Rf5ju1pYxqj7UzELY6kcwrZ1MTRsny/Rzg+x
	cX3MrVqedtwO7AAeRYt+lvtN5EgeFOJt0Q1WA9sQzJva0rIf8b+cAZxxzd0ALGw7DHK2otJ95/I
	/W13aSzWt5VaaceFwucukRbBGEQGX8o/Ygj/ybJktpt7HJUd6AcyOHwnlu7lkMGsVCeMwprRn1h
	gkD9TNa5/Sz4R3Dx+nir81J1HPTrhQHqCqhqaAEQOz2cfZNL5WILE3q3OsKCBImiIHX2IU07V+V
	b3408ayoVQbBZQ6wDaLtnDRHUeT7jZldqxv3LKimTKF7nvfP86ixZX9xIh8ay/M+PQk9SJEBWVu
	PGW4dEH3maTn39avYd3us0x897Aw5VBRxt871Q=
X-Received: by 2002:a17:90a:1049:b0:3ab:9c73:13a with SMTP id 98e67ed59e1d1-3ab9c730800mr4092311a91.0.1791885563329;
        Tue, 13 Oct 2026 02:59:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 5/28] cjson: patch CVE-2026-87933
Date: Tue, 13 Oct 2026 22:58:40 +1300
Message-ID: <20261013095903.3544906-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130838

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
 

