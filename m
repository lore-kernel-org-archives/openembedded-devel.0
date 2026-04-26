Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8381AFF8863
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 13:04:12 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18282.1777208647470160407
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 06:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NdK/v4zE;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c795eacbeb0so4050316a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208647; x=1777813447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8odJSTkHD7x+069OPYhEvAtaCclDQnuYqtkDME2nrw=;
        b=NdK/v4zEfT9wzY/iZ1q5yoQWqKIwJ+lAjgNG5C3OaKBDLB3bVmJxmTvf7qZBJFQeqg
         8rKFGa8WZlLjVJPq4uodw4kmrviXHx8zUoXvapiBw7q5hx5Ryr/vHec9HvtnssYxx+8C
         j0c58H/Moid5mWN4T9LtgpOz/lrdbGUHwySEOLGo2f94SMdhwuUUdXAsJ9SmgL5flomw
         tFqKWDvoBoBReUg7J1qksgzLRgYA7ZJWy4307U804Fje6anYI6Q2zAxxtryEyoVqduHk
         Z4hRD0dPxF/oTINNs31ug6gatzL34nhY8vicmlM7yNqhibrliru7Z7wgb7gsATaXyINM
         sluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208647; x=1777813447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a8odJSTkHD7x+069OPYhEvAtaCclDQnuYqtkDME2nrw=;
        b=r3NTpCz/Kz2rHqwmCvqhtFv4zgQJ5RFaFQUVHDHsrrMzbfQgTIYOharuEXOx5DHYNa
         5hsZZr3vDlxI0uh/YiwoPCABTwl0NF0gomdQWoJPO7nDJeC+MUVpDAJ90RQCjjmvXckd
         x446Q1um7RGxy9i0RYi+xcvHjCOCQa3w4eAcuiFgMrSxkYg6/BAwLl0Gh53MEGCQ3Ked
         fZXKg3c1m/GY1sdhmc29eNrw3wd0Qufo6yNpX3ES6TwePyvUiQT+7PAPp24GSUQt8UGV
         5f6JVIfkBjt23SlpF6PObn8gRVewE150Bo1llqvKBZc0x2ILI6zgVjKbyXSW6u8S9sxq
         ROJQ==
X-Gm-Message-State: AOJu0YxBof8RFiHUOJ5Y8ECZV922TdLP90VMq53AOu/+9QcTV0x8AM52
	J2OSFj/kkS6DRHfghFWdwVk9ajrNRTNahpJNfaU9o2s9cE3/Vo33ovssWmQUpKUo
X-Gm-Gg: AeBDieu0amPbrUAjtadLRnBYYr4HZoF/oAfZTNrDDLMigYyKA+cFiiRFP8wIi4tpMXf
	vqEX0QfpOguSdFRkqDWvTR88+sPnQcKaZHXx3Sn3tU3H2hyO9cJ8ezq+y3dACDfTfQS7dxhYrHG
	Jcow6aA6CYLDuzjrer+517yrk8OU13yMiX5NXX1t+D18+ICW6HHBaQymBIU0XGzaEr5pWl3g3R5
	MXeTUmRcQlSDw2FYOY0B198THS6+w25qxXJU5VfAD+q9EjzxufWuvEM3gbv/2lV4SW8ej5+qCLl
	qe9oLQqLgl3tMA+SeuvNZEFpd0ptNbpeCX2cyZYY3xspnQNhePmyIxAIiEISg/ck1PdgGboh9LS
	fDfn7IEc2oFC3NcQsoQ1/bTU21UOVrmNI5/95TRyVDmJvN4EmPq1u39TLeN1bRXx3o/s+WuwEKJ
	e8FZIWdqQN1MwnxXlEO2V4V5mC01lYodVdEfun9Ag6NS9WvRc=
X-Received: by 2002:a17:903:2c0f:b0:2b9:4eaa:7153 with SMTP id d9443c01a7336-2b94eaa73b5mr41033375ad.19.1777208646594;
        Sun, 26 Apr 2026 06:04:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm277490935ad.3.2026.04.26.06.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:04:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/9] jq: patch CVE-2026-33947
Date: Mon, 27 Apr 2026 01:03:44 +1200
Message-ID: <20260426130351.793052-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
References: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 13:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126618

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33947

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jq/jq/CVE-2026-33947.patch                | 107 ++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
new file mode 100644
index 0000000000..bf1a506311
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-33947.patch
@@ -0,0 +1,107 @@
+From d6a36423898f756355c270c4acae335318ac357c Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 11:23:40 +0900
+Subject: [PATCH] Limit path depth to prevent stack overflow
+
+Deeply nested path arrays can cause unbounded recursion in
+`jv_setpath`, `jv_getpath`, and `jv_delpaths`, leading to
+stack overflow. Add a depth limit of 10000 to match the
+existing `tojson` depth limit. This fixes CVE-2026-33947.
+
+(cherry picked from commit fb59f1491058d58bdc3e8dd28f1773d1ac690a1f)
+
+CVE: CVE-2026-33947
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/fb59f1491058d58bdc3e8dd28f1773d1ac690a1f]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/jv_aux.c  | 21 +++++++++++++++++++++
+ tests/jq.test | 25 +++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+)
+
+diff --git a/src/jv_aux.c b/src/jv_aux.c
+index bbe1c0d..0855053 100644
+--- a/src/jv_aux.c
++++ b/src/jv_aux.c
+@@ -376,6 +376,10 @@ static jv jv_dels(jv t, jv keys) {
+   return t;
+ }
+ 
++#ifndef MAX_PATH_DEPTH
++#define MAX_PATH_DEPTH (10000)
++#endif
++
+ jv jv_setpath(jv root, jv path, jv value) {
+   if (jv_get_kind(path) != JV_KIND_ARRAY) {
+     jv_free(value);
+@@ -383,6 +387,12 @@ jv jv_setpath(jv root, jv path, jv value) {
+     jv_free(path);
+     return jv_invalid_with_msg(jv_string("Path must be specified as an array"));
+   }
++  if (jv_array_length(jv_copy(path)) > MAX_PATH_DEPTH) {
++    jv_free(value);
++    jv_free(root);
++    jv_free(path);
++    return jv_invalid_with_msg(jv_string("Path too deep"));
++  }
+   if (!jv_is_valid(root)){
+     jv_free(value);
+     jv_free(path);
+@@ -434,6 +444,11 @@ jv jv_getpath(jv root, jv path) {
+     jv_free(path);
+     return jv_invalid_with_msg(jv_string("Path must be specified as an array"));
+   }
++  if (jv_array_length(jv_copy(path)) > MAX_PATH_DEPTH) {
++    jv_free(root);
++    jv_free(path);
++    return jv_invalid_with_msg(jv_string("Path too deep"));
++  }
+   if (!jv_is_valid(root)) {
+     jv_free(path);
+     return root;
+@@ -511,6 +526,12 @@ jv jv_delpaths(jv object, jv paths) {
+       jv_free(elem);
+       return err;
+     }
++    if (jv_array_length(jv_copy(elem)) > MAX_PATH_DEPTH) {
++      jv_free(object);
++      jv_free(paths);
++      jv_free(elem);
++      return jv_invalid_with_msg(jv_string("Path too deep"));
++    }
+     jv_free(elem);
+   }
+   if (jv_array_length(jv_copy(paths)) == 0) {
+diff --git a/tests/jq.test b/tests/jq.test
+index ecb9116..4d57301 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -2129,3 +2129,28 @@ try ltrimstr("x") catch "x", try rtrimstr("x") catch "x" | "ok"
+ {"hey":[]}
+ "ok"
+ "ok"
++
++# regression test for CVE-2026-33947
++setpath([range(10000) | 0]; 0) | flatten
++null
++[0]
++
++try setpath([range(10001) | 0]; 0) catch .
++null
++"Path too deep"
++
++getpath([range(10000) | 0])
++null
++null
++
++try getpath([range(10001) | 0]) catch .
++null
++"Path too deep"
++
++delpaths([[range(10000) | 0]])
++null
++null
++
++try delpaths([[range(10001) | 0]]) catch .
++null
++"Path too deep"
+\ No newline at end of file
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index c3b547383d..7b7910bc72 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2025-48060.patch \
     file://CVE-2025-9403.patch \
     file://CVE-2026-32316.patch \
+    file://CVE-2026-33947.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 

