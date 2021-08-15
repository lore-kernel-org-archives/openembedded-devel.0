Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.11450.1629036416649155021
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BDIBZTU9;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id a5so17862648plh.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0V2/ibKeZgTINJkw4/m8QEjWosYLcSp6HlhgXEGhAT8=;
        b=BDIBZTU9lbsyBXB1S55jTwU7ZW31fCOxCgOeYvYbWctofRXliuD2PVLpY7kS2USrNf
         IvymoAMUvoXNx8yg4Fe9bNLkysrhqCHj5Cu6jwwl9173zO2OuaN8hZLSFeHklWpq46/E
         82UeZkTJwTWznnpNmPiaV5xHdCbn/h4SlCPPwBR0FP8Wya/K3QJLIN8K6XZRDDP7pXUW
         sjTa52z24SqA6B8sadxaaPi2rDJKIuoodkebmttO7pX3JqJHT7bJ4sAcqNHR0VvaG6ww
         1Ep4WmqZm7Jqk4VoagkxQcxWMRafr8guajxIC7l3VWMydaz825pGVh2mIqE3+GmR6I1S
         iTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0V2/ibKeZgTINJkw4/m8QEjWosYLcSp6HlhgXEGhAT8=;
        b=uDfvjE/RkaIZSx+wVnU1UvEZODCyODkaM+PRwryjOccbY0n/54ablMdECnNr6gGQmu
         wYkp2lfnVbm8D2Qt+MW1dEI4bbYPyxzaREQ04mTciQacxpnRk+mooGW2RUCBGmuyNW7M
         oxjGOOXfm6DNUke63Jm1f7PTDuR7UQOpTVeKF7Y8o1Q+D5GFzu6+R4rMI5KNlFdMApaK
         3SwDvmqCFcl2qWAPDl0j/teAmdlJc9TWoSqevOE8+jLiHFU6Gc11277YcbbkBLcLRS41
         OE4e2Oou5zT7O9DMAOsixFvHFRKxX3lj68sDfrkBJX9P/8eF99kFoJXJBD3sO42RNJx9
         +jrQ==
X-Gm-Message-State: AOAM532504LJ9tWcHkpRbvKP8/x60D96ImxwYDwFUmEMNuOido+tCAA1
	o5qCnwEb48fxqZpKL8eExfJWXyl2OzVdqQ==
X-Google-Smtp-Source: ABdhPJzMHKj0sWyd/mA6bBXrKIER1dXITxsUvcQb/CNk0G77GFZMyN6vx7OyIWbBLU3fTn7XXC8WmQ==
X-Received: by 2002:a62:ee16:0:b029:2fe:ffcf:775a with SMTP id e22-20020a62ee160000b02902feffcf775amr11387386pfi.59.1629036416089;
        Sun, 15 Aug 2021 07:06:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:55 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 18/18] redis: fix CVE-2021-32625
Date: Sun, 15 Aug 2021 07:06:30 -0700
Message-Id: <acf5769aff4edb67b187d70ac339a6484e1cc527.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

CVE: CVE-2021-32625
Upstream-Status: Backport [e9a1438ac4c52aa68dfa2a8324b6419356842116]

Fix integer overflow in STRALGO LCS (CVE-2021-32625) (#9011)
An integer overflow bug in Redis version 6.0 or newer can be exploited using the
STRALGO LCS command to corrupt the heap and potentially result with remote code
execution. This is a result of an incomplete fix by CVE-2021-29477.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../redis/redis/fix-CVE-2021-32625.patch      | 61 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch

diff --git a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch
new file mode 100644
index 0000000000..6311a5db10
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch
@@ -0,0 +1,61 @@
+From e9a1438ac4c52aa68dfa2a8324b6419356842116 Mon Sep 17 00:00:00 2001
+From: Oran Agra <oran@redislabs.com>
+Date: Tue, 1 Jun 2021 09:12:45 +0300
+Subject: [PATCH] Fix integer overflow in STRALGO LCS (CVE-2021-32625) (#9011)
+
+An integer overflow bug in Redis version 6.0 or newer can be exploited using the
+STRALGO LCS command to corrupt the heap and potentially result with remote code
+execution. This is a result of an incomplete fix by CVE-2021-29477.
+
+(cherry picked from commit 1ddecf1958924b178b76a31d989ef1e05af81964)
+
+
+CVE: CVE-2021-32625
+Upstream-Status: Backport [e9a1438ac4c52aa68dfa2a8324b6419356842116]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ src/t_string.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/src/t_string.c b/src/t_string.c
+index 490d5983a..587d3aeb8 100644
+--- a/src/t_string.c
++++ b/src/t_string.c
+@@ -797,6 +797,12 @@ void stralgoLCS(client *c) {
+         goto cleanup;
+     }
+ 
++    /* Detect string truncation or later overflows. */
++    if (sdslen(a) >= UINT32_MAX-1 || sdslen(b) >= UINT32_MAX-1) {
++        addReplyError(c, "String too long for LCS");
++        goto cleanup;
++    }
++
+     /* Compute the LCS using the vanilla dynamic programming technique of
+      * building a table of LCS(x,y) substrings. */
+     uint32_t alen = sdslen(a);
+@@ -805,9 +811,19 @@ void stralgoLCS(client *c) {
+     /* Setup an uint32_t array to store at LCS[i,j] the length of the
+      * LCS A0..i-1, B0..j-1. Note that we have a linear array here, so
+      * we index it as LCS[j+(blen+1)*j] */
+-    uint32_t *lcs = zmalloc((size_t)(alen+1)*(blen+1)*sizeof(uint32_t));
+     #define LCS(A,B) lcs[(B)+((A)*(blen+1))]
+ 
++    /* Try to allocate the LCS table, and abort on overflow or insufficient memory. */
++    unsigned long long lcssize = (unsigned long long)(alen+1)*(blen+1); /* Can't overflow due to the size limits above. */
++    unsigned long long lcsalloc = lcssize * sizeof(uint32_t);
++    uint32_t *lcs = NULL;
++    if (lcsalloc < SIZE_MAX && lcsalloc / lcssize == sizeof(uint32_t))
++        lcs = ztrymalloc(lcsalloc);
++    if (!lcs) {
++        addReplyError(c, "Insufficient memory");
++        goto cleanup;
++    }
++
+     /* Start building the LCS table. */
+     for (uint32_t i = 0; i <= alen; i++) {
+         for (uint32_t j = 0; j <= blen; j++) {
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
index a36c190af3..a9e6eaffaa 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://fix-CVE-2021-29477.patch \
            file://fix-CVE-2021-29478.patch \
+           file://fix-CVE-2021-32625.patch \
            "
 SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
 
-- 
2.25.1

