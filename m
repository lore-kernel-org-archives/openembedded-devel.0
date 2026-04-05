Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44565E6401E
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:49:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34414.1775393375112892058
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gxctR1Xy;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b0c8362d93so19685695ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393374; x=1775998174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGwwgbAk80WYAjssOvvcD2a+YKT0SEeTQZJ7oxs2wP8=;
        b=gxctR1XyLeigY0u6sBRfIjSFITBCNVabOqhoUiduKi3C6mmJTGcuCkJSq/Mgsbtftk
         JdLnJhQSdKhAzOmG400QuCDyZqbXGx4P9vRoh3dkiOqGlJAb5CxtmvFVcvTGJidzlIu6
         agTjxnJqilGZwHLsNRFc8FL5WFYa5Ty5QqvOeCcPxmLKG7wRaSZobNsV18ukKNA+0bA7
         YyVigwmEV77Qtg7HKarEE3gMNzEKh+e8PmH81gAfZdtOsDGIby0z2EID6o9S7DPBOHWu
         wM9E2eP5C1PMOueLbGtwZ24zr89kMvYSoZDJOJmjXLwBzXKN/46O2msBtdHN5Mo25vVL
         WRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393374; x=1775998174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gGwwgbAk80WYAjssOvvcD2a+YKT0SEeTQZJ7oxs2wP8=;
        b=Hljh8IpDE5I3yvBaho9rZh/fDCHc7rypShtGnLXGnZZbutevA9wPo6tuqP8IEmvw4I
         VQBiBdcPzeZM1CIISjhZ6Kr/wwCrNxLpkxDBnOwi/BluNF+7fNehkb4OIL3Ucg6ChY8G
         YT5TEM8lMbqfXmE3i922AgXYYeHNfKTctb/nHcZaDIQl2/f5lcTnF0H6P4YwuI5NP7OK
         04c+6bSQXIbdLlysLXJ6ma7SjBUAsNHNScZL3ss5AzlgnnM0r3E/hjYq6kQel6cwzhw8
         8IHEsbkbCFWS79pqYmkMjwM5sEsm3qzpBmgonnNiy9CVMFFFQa3O7TcAYwjGKRZBrU5y
         b4mA==
X-Gm-Message-State: AOJu0YwwabMm5PheViVM9Uua9Q3RosXIaN3GkjkKI9Xyikhvj794IfCW
	EnwoHPtv/Thr5iwT9jbfEQbR4/7GVoF7MeQVEEnDRYnSj3PVSxdk5BVQEc/G4DVj32U=
X-Gm-Gg: AeBDieu0F9EVzgMmLu1y5EozASqG0D0m3YwUEjqVArzkaPKoi3QluhEKquUWPm2VfWj
	anFXuYzPSc8xk3tnw5d0dB1on/CQfrNQkQIOilq9nQ9kaPuF8xTP7IrkrtSxH03xxt9wBIfQggh
	BjM+331q7WA8gLu1Lw0by1AoIJ8vpUb6XDeaq0MwO9l5mQ5ZstfBFLpnb/U0pVzjXqbRDUa08az
	yGHhv8ilqg0AVZ8MX84NAvL/Dv972gizfzIgDxXRmaAw938MF6xMw8M+XJUw1xS4wmD4DLyCjYk
	2rqhkqk1uJCHIrD1e47r/ydebVWvA4v1xZ1+bdT8VGPtpneIyccd9mmtTqvqks+XJP0QfZja5Xs
	wCoAsk2zxyYtLTZNb9UR6Y7fnB6SvWxZAvrgX0v4qQCHwrr3zung31aeVopN5eTbOmUJzHOgCSu
	+eeh6/MLu5yEgg8Ta3eKumP2JVVwUKVxk66BI=
X-Received: by 2002:a17:902:ccc9:b0:2ab:230d:2d96 with SMTP id d9443c01a7336-2b28173ee68mr87266645ad.11.1775393374225;
        Sun, 05 Apr 2026 05:49:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 3/14] wolfssl: patch CVE-2026-2646
Date: Mon,  6 Apr 2026 00:49:05 +1200
Message-ID: <20260405124916.2881008-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126002

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-2646

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-2646-1.patch       | 39 ++++++++++++++
 .../wolfssl/files/CVE-2026-2646-2.patch       | 51 +++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  2 +
 3 files changed, 92 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-2646-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-2646-2.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-2646-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-2646-1.patch
new file mode 100644
index 0000000000..65daca16eb
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-2646-1.patch
@@ -0,0 +1,39 @@
+From 693e9d5e986ac642090331e5f76cfdfd656e3bbc Mon Sep 17 00:00:00 2001
+From: Reda Chouk <reda@wolfssl.com>
+Date: Fri, 6 Feb 2026 17:00:42 +0100
+Subject: [PATCH] add missing checks in wolfSSL_d2i_SSL_SESSION
+
+(cherry picked from commit f94eb68ea36aee271e0645812ec3bb038f43098b)
+
+CVE: CVE-2026-2646
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/f94eb68ea36aee271e0645812ec3bb038f43098b]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ssl_sess.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/ssl_sess.c b/src/ssl_sess.c
+index c5e0e682a..75680f1bf 100644
+--- a/src/ssl_sess.c
++++ b/src/ssl_sess.c
+@@ -2840,12 +2840,20 @@ WOLFSSL_SESSION* wolfSSL_d2i_SSL_SESSION(WOLFSSL_SESSION** sess,
+         goto end;
+     }
+     s->chain.count = data[idx++];
++    if (s->chain.count > MAX_CHAIN_DEPTH) {
++        ret = BUFFER_ERROR;
++        goto end;
++    }
+     for (j = 0; j < s->chain.count; j++) {
+         if (i - idx < OPAQUE16_LEN) {
+             ret = BUFFER_ERROR;
+             goto end;
+         }
+         ato16(data + idx, &length); idx += OPAQUE16_LEN;
++        if (length > MAX_X509_SIZE) {
++            ret = BUFFER_ERROR;
++            goto end;
++        }
+         s->chain.certs[j].length = length;
+         if (i - idx < length) {
+             ret = BUFFER_ERROR;
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-2646-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-2646-2.patch
new file mode 100644
index 0000000000..a1dfa8975d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-2646-2.patch
@@ -0,0 +1,51 @@
+From e5a887b643850138d225ec47febf1c117c38464a Mon Sep 17 00:00:00 2001
+From: jordan <jordan@wolfssl.com>
+Date: Wed, 11 Mar 2026 09:47:15 -0500
+Subject: [PATCH] ssl_sess: check fields in wolfSSL_d2i_SSL_SESSION.
+
+(cherry picked from commit 0a99a08b0f196cad1cd35e2261465c5d5f080739)
+
+CVE: CVE-2026-2646
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/0a99a08b0f196cad1cd35e2261465c5d5f080739]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ssl_sess.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/ssl_sess.c b/src/ssl_sess.c
+index 75680f1bf..08b2219ef 100644
+--- a/src/ssl_sess.c
++++ b/src/ssl_sess.c
+@@ -2808,6 +2808,10 @@ WOLFSSL_SESSION* wolfSSL_d2i_SSL_SESSION(WOLFSSL_SESSION** sess,
+     ato32(data + idx, &s->bornOn); idx += OPAQUE32_LEN;
+     ato32(data + idx, &s->timeout); idx += OPAQUE32_LEN;
+     s->sessionIDSz = data[idx++];
++    if (s->sessionIDSz > ID_LEN) {
++        ret = BUFFER_ERROR;
++        goto end;
++    }
+ 
+     /* sessionID | secret | haveEMS | haveAltSessionID */
+     if (i - idx < s->sessionIDSz + SECRET_LEN + OPAQUE8_LEN + OPAQUE8_LEN) {
+@@ -2890,6 +2894,10 @@ WOLFSSL_SESSION* wolfSSL_d2i_SSL_SESSION(WOLFSSL_SESSION** sess,
+         goto end;
+     }
+     ato16(data + idx, &s->idLen); idx += OPAQUE16_LEN;
++    if (s->idLen > SERVER_ID_LEN) {
++        ret = BUFFER_ERROR;
++        goto end;
++    }
+ 
+     /* ServerID */
+     if (i - idx < s->idLen) {
+@@ -2905,6 +2913,10 @@ WOLFSSL_SESSION* wolfSSL_d2i_SSL_SESSION(WOLFSSL_SESSION** sess,
+         goto end;
+     }
+     s->sessionCtxSz = data[idx++];
++    if (s->sessionCtxSz > ID_LEN) {
++        ret = BUFFER_ERROR;
++        goto end;
++    }
+ 
+     /* app session context ID */
+     if (i - idx < s->sessionCtxSz) {
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index e9be766e67..5db019c9cb 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -28,6 +28,8 @@ SRC_URI = " \
     file://CVE-2025-7394-5.patch \
     file://CVE-2025-7394-6.patch \
     file://CVE-2026-0819.patch \
+    file://CVE-2026-2646-1.patch \
+    file://CVE-2026-2646-2.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

