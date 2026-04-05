Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F292E88D7D
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:49:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34416.1775393383079601599
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RTX2PtVm;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b24fdac394so32465725ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393382; x=1775998182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZMQE3P1FgUpIHv7muKUU2rBTcBepat4/0EBe4xFN5k=;
        b=RTX2PtVmxxne6LjmlJiGeYMfIblBqoWSvejJV9hL68kcDrEiloS8qHzjF6ExPTh64R
         1h6+pgUCGN/QXSrz+d/6ID2wQvaoSHQeOvl0OlKNX8IjXU8W4c5+m8XUmGklCIXz1AVe
         KwotFlq95jRTCMNrUzbCRV7csu6Ugz8hJe3TJieaW7Homs0IAGaF0TBU+tFMZOWw2GeU
         Z4rzd3dkFIVPK123DQ5a33YL3FE6FEEnfu6L+mkv7+woqVu5wmUX9OcQ3bMn94iaDs3R
         gZpUAf3MLMzvjx7gmZIP+yQQ+3upFgQYYDgIhCKa81RydDL4gmierHSGSqaOe+I52A8M
         MwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393382; x=1775998182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZMQE3P1FgUpIHv7muKUU2rBTcBepat4/0EBe4xFN5k=;
        b=glnVj66lYOVv3ru4f8Rc9lcgL9pVhZAACiXw/Fivz015MfZzrsi97MQ6wa+Ex1laji
         x2O9fAHB/5cf7z2NEHqNbCSnH4vj9q1zseAOD5y1oEjJp+WBIZkYYlCwYCcTNfdGBkig
         i3ahVttqtiQm43SloTfV61B4+nPm5Vd+25iPqeYxx6d4CdiAZAJvg0/ggj+fPqd00tZD
         E7uMsDjJdmol8TzugbNsMUOcoOaRO4byXTOwfBw2LUOpgnEwFcDZiLiqiGY22NplGv/l
         n1iCj+KvLTh2/dTCMWpdLE4e4iDD8x8xDRN7bBAWHjfu7JzwwGzS5+GXLDOwTmPl7Kt7
         hhXg==
X-Gm-Message-State: AOJu0YxewSgtSOwdrj4h06x1PqaT0aDC1OlSQUS/Abd8NndBm4nSyC3z
	XBuoGeC5batiLdql4c9xJE+hSPVsrWygaRxLlvW7faxt47RkFfDZkWb1dDgke1TA4Yg=
X-Gm-Gg: AeBDiesLBNJ+rMP81Zs6lq4pCU5xsISuFXz5H47L4JJHwLO1gwywFAPQ6I+JvN8W1MQ
	wPcE38yio2/hKOUrwrDDNylHsdrwsnjiGJUG/vTvL60RTQwlt4nh9dvIcu50qFl2ewP4Yn+8zMH
	nXtATSnBtN+DYL14y6tXvga2Gv+iTyEcI0eAFzhBf3x21XaBAX+SaKMy/rgXRvior3iO/9gMc4O
	bXSKGOijf20sGd1M6Zm7VmeTRTT056HUk5gxqqwBsEId56ojtrKwOH7CZ7cIOHZAn4RilXn4GQK
	5qzMOF+pwMQ900n1NDYHUWkeQ2Owlg2J4RqhqGNy4dvye3+2kmiMR3GPAKee5ZGG6nPCdfcZ2J6
	sHgHAaJrilgOkWc5q7WGTzlJfIG3c1bMEBA7AtBcuDNuvHkIxvvpKBIuBtH8OxuL6ZS9CKUt2PC
	dEl1kSRhl+MIJgqs7HP0uoZ1fowG2ZR8pr4ck=
X-Received: by 2002:a17:902:7243:b0:2b2:42f8:1a45 with SMTP id d9443c01a7336-2b2817eae99mr69010825ad.39.1775393382332;
        Sun, 05 Apr 2026 05:49:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 6/14] wolfssl: patch CVE-2026-3547
Date: Mon,  6 Apr 2026 00:49:08 +1200
Message-ID: <20260405124916.2881008-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126005

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3547

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-3547.patch         | 30 +++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3547.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3547.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3547.patch
new file mode 100644
index 0000000000..e7e4f5de53
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3547.patch
@@ -0,0 +1,30 @@
+From 2539e3b925481db1da9791ac2a75c98cf8a7c989 Mon Sep 17 00:00:00 2001
+From: Anthony Hu <anthony@wolfssl.com>
+Date: Wed, 4 Mar 2026 07:00:26 -0500
+Subject: [PATCH] Fix for loop exit condition.
+
+size should be length.  s includes offset, so it must be compared against
+length, not size because size is only what is after offset.
+
+(cherry picked from commit 9d3cc6e30c778b124002cc45b7974d718b6649fd)
+
+CVE: CVE-2026-3547
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/9d3cc6e30c778b124002cc45b7974d718b6649fd]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/tls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tls.c b/src/tls.c
+index 8552e8daf..290d4b49d 100644
+--- a/src/tls.c
++++ b/src/tls.c
+@@ -1923,7 +1923,7 @@ static int TLSX_ALPN_ParseAndSet(WOLFSSL *ssl, const byte *input, word16 length,
+         return BUFFER_ERROR;
+ 
+     /* validating length of entries before accepting */
+-    for (s = input + offset; (s - input) < size; s += wlen) {
++    for (s = input + offset; (s - input) < length; s += wlen) {
+         wlen = *s++;
+         if (wlen == 0 || (s + wlen - input) > length)
+             return BUFFER_ERROR;
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index bec2764ad1..1f5b051d16 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://CVE-2026-3229-2.patch \
     file://CVE-2026-3229-3.patch \
     file://CVE-2026-3230.patch \
+    file://CVE-2026-3547.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

