Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61376CCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:48:04 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18391.1777549682588657334
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VuMy+uFk;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35d90833cacso626610a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549682; x=1778154482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6e6lM8AdlccnAQ5SBrO/rPuV4th3EepaXoX9eHEHEA=;
        b=VuMy+uFkoYh9PA6rnodQU+2sV61F/9eyGoemGIe52bBaD1+eInJyQ9lbSoSW85vtwq
         Cb6ebzUUq8sCf5ogHD8OSE3fLCaP0WOmEqx8pi9PkAxlYBnegm59ofQ1bj4V5r3ZYXw0
         6Mo7dTZiHrZFON3/yPsRwEAz4dBKIGBl5lnS5LPE+8GFsofB/ItflDEWSd4txmceaySP
         ccTa1BsHJkDZmyeFgc2Z3bfzVRBt9dbsoS54J9Uv7w+OMrgKl2OFeg0hhsZYD2Xe+abU
         VvWZ/innJK9mDFZUIdvmSHvcfTgP5FM4wLQsApU+oybSigL1LOkAwr4l2mVpsgaeT/Pm
         s0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549682; x=1778154482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+6e6lM8AdlccnAQ5SBrO/rPuV4th3EepaXoX9eHEHEA=;
        b=cCCLepVBgKTa+2tbY1ppYbiJn+1sxdsMamRCgoPJejcsH7JvW97eD/TrNI79CJWLfm
         Vz/4bhCacYP9h9GmX9SHjALdsDD22W5XCwZCPCaN5oM24dkQofbcNiyLCvhtEdMpEDfP
         YquNoGW04GwGQdSlQUM6bzCnpaXBw/q9jhTrGUSji0bDMWq7qccka7eHAxYBxGmKXlpz
         XrjJL9XCrkxjCuqMR/XxBhXy7dkGUhhRzbtmEcciihHb+yreNWWKJqG5eTXUByYkvUcX
         Ot8jK/JsECzvx63LX8ZoZhCvbdw1OZkLm/wAjYFbX2gP1+cUz92EV5YhIpkbzzk2USX1
         uHjw==
X-Gm-Message-State: AOJu0YxMURFETdtk484XVXhcV6ZmCpZkNBWL1b1bUtKZdw5Jp8hvQTJb
	F+HyP3ywS1LC/4o0l7fhPRGpo5IK9IovDpcQ/pJDZTfetUTWoFtJtx/rlUoLO+6K
X-Gm-Gg: AeBDietAEBqK8kPk+BGKObosDGHrLuAa0czD3BzH39e5m7l4j1Cz32kIKILdsqe2Mk5
	1WhehbvBN8qFnohYejUGojsAZRS+gcZGc68wA/2EuvB8+DxcQbCH7crzGaC+P9uZqWn6CzGSa/S
	4JdiRlZyyyY254DmqiFz/DPjqy8XJvOI05xan92irPPa+tqMAH9ZgarW3xRnAhtfN/dmUbpfpOV
	8uAAk/QkwNCDY+3j5gbJ0ZJCmHsDcbjRPEX5EpUCiyYxI4r9EP6aEUn9Pw31TutMFpqjtxAHTsp
	l/9s01WMRMy17PccOx5VEDD2M35WdKfvudQhl8sU6XJEZ6j/fLX9VY8eSctheIOdFyKaXdUf4c3
	GqGbHhLec+6MLS2ipy5XM8kdBlOTu3T/1h1o1tq0AJwerRT3WVUvnfH+V9cGagIxA9618pzt81n
	UbPRju7v7u8b/hqDEN2Z2fu3FuYRNgakXDx+yDNiGXtrlEwWI=
X-Received: by 2002:a17:90b:3cc3:b0:35b:e52a:6fe5 with SMTP id 98e67ed59e1d1-364c2f35bd5mr2403492a91.5.1777549681669;
        Thu, 30 Apr 2026 04:48:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:48:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 24/24] wolfssl: patch CVE-2026-5778
Date: Thu, 30 Apr 2026 23:46:47 +1200
Message-ID: <20260430114649.4184890-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126758

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from the PR[1] mentioned in the nvd[2]

[1]https://github.com/wolfSSL/wolfssl/pull/10125
[2]https://nvd.nist.gov/vuln/detail/CVE-2026-5778

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-5778.patch         | 38 +++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5778.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5778.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5778.patch
new file mode 100644
index 0000000000..b640b41bd0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5778.patch
@@ -0,0 +1,38 @@
+From 0eee2c2d172a28dc9159211d0d22323c980a48f4 Mon Sep 17 00:00:00 2001
+From: Kareem <kareem@wolfssl.com>
+Date: Thu, 2 Apr 2026 16:41:55 -0700
+Subject: [PATCH] Add sz check to ChachaAEADDecrypt to prevent potential
+ underflow.
+
+Thanks to Zou Dikai for the report.
+
+(cherry picked from commit 5b6b138964058ab8d30474bc9fdfb5ffcb3a4726)
+
+CVE: CVE-2026-5778
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/5b6b138964058ab8d30474bc9fdfb5ffcb3a4726]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/internal.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/internal.c b/src/internal.c
+index 6af03cbf0..40d1dd7cc 100644
+--- a/src/internal.c
++++ b/src/internal.c
+@@ -19310,10 +19310,15 @@ int ChachaAEADDecrypt(WOLFSSL* ssl, byte* plain, const byte* input,
+     byte tag[POLY1305_AUTH_SZ];
+     byte poly[CHACHA20_256_KEY_SIZE]; /* generated key for mac */
+     int ret    = 0;
+-    int msgLen = (sz - ssl->specs.aead_mac_size);
++    int msgLen = 0;
+     Keys* keys = &ssl->keys;
+     byte* seq = NULL;
+ 
++    if (sz < ssl->specs.aead_mac_size) {
++        return BAD_FUNC_ARG;
++    }
++    msgLen = (sz - ssl->specs.aead_mac_size);
++
+     #ifdef CHACHA_AEAD_TEST
+        int i;
+        printf("input before decrypt :\n");
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 3b3db9ad6f..0f1fe43d79 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -36,6 +36,7 @@ SRC_URI = " \
     file://CVE-2026-5447.patch \
     file://CVE-2026-5772-1.patch \
     file://CVE-2026-5772-2.patch \
+    file://CVE-2026-5778.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

