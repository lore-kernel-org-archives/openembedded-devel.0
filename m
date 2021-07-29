Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.17454.1627601815618717769
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jvI7GqYj;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id mt6so12551378pjb.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=U2HhJSL/BTDgAsVec4zVO72CY1Wf8EyL4f5apIppKlM=;
        b=jvI7GqYjRv7eZpIJWcFY/ZbB9dL35bNMxMO/4BpIMiK117nUnNB+EYKgQVenux9jVD
         nKM3atW2rPL2w2RB+stra6/Tbg+Vee27YQNv61f13Mv71j+XVlRGifDZ6P1vBV7oOM1B
         JnbQFvVxPUYgKg+kO6L8oHs/XmcbjMFkhCnfo+XPQ+AbedfQBAcAO3BcdLh0NJRHO1nl
         ETB7cmC1/mFPJImxmo/ukmspSHIWCwtCEtwcRMSwipTxGnHU1i06homY8iglK5GXk69V
         9k6b4lCu6kJcznB5gZ7aP8jHaE9V0541Iw6O7Ifua6dBjcDVBWclGxR/rHYh7Mz50Qt7
         FzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U2HhJSL/BTDgAsVec4zVO72CY1Wf8EyL4f5apIppKlM=;
        b=qcrSRzd+WEr+GWACPlYGQLi51wEWXyA21UCavA7bjIhu/SuuGUDtndy/+4pPSB6eJ/
         vbWx0E0EAxWmFPrXPjM/ENaEKCZJvIWCWSjGNAL8A53z+aURVTT0RNSdu9jJW3Nsso7L
         H7s2qhiyGPbZakoQtxLEiP9BlW68oWKvZanBYJwk3OWT7km+HbA3ZGOJPa8fspWmPs5I
         1d+y+Vcr31laXwgDm9d87T9V+pW3aRiCSh/0Sc7jrud8oc/Ox/kX0T8klkPl/GU2m26L
         3Ifp2WEnS0tk0JL/FdkMggwFHqrnxluxPPDgggaaJw69KTGkzNJv2A93hhi6N6fDiAv0
         iQVQ==
X-Gm-Message-State: AOAM531yk5xUENt2gFL6RP2IbPywI0GEkYdFCkHuTPYQPHXlIFvPNAJT
	UMHw9RCQeWtTrzeg8RgvQ3ODRBN2jEkBFA==
X-Google-Smtp-Source: ABdhPJw+soBflWTDlED7Mg+iBwm0DbljjyUXi7q8VoJFwG4CJIdFxSWpsLKgbtzGUXW4OZamLUQ9cw==
X-Received: by 2002:a17:902:6bc8:b029:117:6a8a:f7af with SMTP id m8-20020a1709026bc8b02901176a8af7afmr6813828plt.51.1627601815096;
        Thu, 29 Jul 2021 16:36:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.36.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:36:54 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 02/15] redis: fix CVE-2021-29477
Date: Thu, 29 Jul 2021 16:36:35 -0700
Message-Id: <5865a7684755011d45c4f51d4227851c641d9eea.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

This patch backports the fix for CVE-2021-29477.

CVE: CVE-2021-29477
Upstream-Status: Backport
[https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4902789d1ef9]

An integer overflow bug in Redis version 6.0 or newer could be exploited using
the STRALGO LCS command to corrupt the heap and potentially result with remote
code execution.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../redis/redis/fix-CVE-2021-29477.patch      | 35 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch

diff --git a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
new file mode 100644
index 0000000000..a5e5a1ba55
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
@@ -0,0 +1,35 @@
+From f0c5f920d0f88bd8aa376a2c05af4902789d1ef9 Mon Sep 17 00:00:00 2001
+From: Oran Agra <oran@redislabs.com>
+Date: Mon, 3 May 2021 08:32:31 +0300
+Subject: [PATCH] Fix integer overflow in STRALGO LCS (CVE-2021-29477)
+
+An integer overflow bug in Redis version 6.0 or newer could be exploited using
+the STRALGO LCS command to corrupt the heap and potentially result with remote
+code execution.
+
+CVE: CVE-2021-29477
+Upstream-Status: Backport
+[https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4902789d1ef9]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+
+---
+ src/t_string.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/t_string.c b/src/t_string.c
+index 9228c5ed0..db6f7042e 100644
+--- a/src/t_string.c
++++ b/src/t_string.c
+@@ -805,7 +805,7 @@ void stralgoLCS(client *c) {
+     /* Setup an uint32_t array to store at LCS[i,j] the length of the
+      * LCS A0..i-1, B0..j-1. Note that we have a linear array here, so
+      * we index it as LCS[j+(blen+1)*j] */
+-    uint32_t *lcs = zmalloc((alen+1)*(blen+1)*sizeof(uint32_t));
++    uint32_t *lcs = zmalloc((size_t)(alen+1)*(blen+1)*sizeof(uint32_t));
+     #define LCS(A,B) lcs[(B)+((A)*(blen+1))]
+ 
+     /* Start building the LCS table. */
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
index 65b525709e..e89bb50f15 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
+           file://fix-CVE-2021-29477.patch \
            "
 SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
 
-- 
2.25.1

