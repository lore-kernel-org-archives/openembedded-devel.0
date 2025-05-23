Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51EBDC54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 07:50:38 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.43178.1747986636688172197
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 May 2025 00:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TAA8zJq9;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742caef5896so4970001b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 00:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747986636; x=1748591436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLiHqgYTPkSKVaBTlN9r3qjb9CvmpbbG0NOvihJJIQY=;
        b=TAA8zJq9sXJKerf8t/t88KMrKqp6FYizyU78zvdIeZGWW49P5IZ/EeiDgba3JlvhtL
         gYt4k2RHbuy3hCAQuyAYshY8uG54+rVAqGFXOI+SgcE52tjOKDQU04h88gvrHJ8ir2Yw
         i036J5HvRzfhh0oBUDTAhA60IvM9GNeHCZ/LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747986636; x=1748591436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLiHqgYTPkSKVaBTlN9r3qjb9CvmpbbG0NOvihJJIQY=;
        b=J31Os+lpyU1EIi1FHZFpnth2oUkKKBP3q0/FiyKD1WIRlzNaQJgwjwcAU3aEs/VvyZ
         fDpudflGht5cTWEh3DUZRVjSYbtzd8guzTn8iFz4WxmF8CriIzxR/QQPY7gJn3+SgJpX
         knvg8kPoTXW8/wGXEs9M11V3uTELj8TadJAN82Jj5LrhGWCuqpBZDHft4R42KkjQVujU
         lStHwhcM0nLlOpuCabxdbpI3ssBhK4AxVJLTQg7/2qvyQn6sOVB50l27kf64dO/+heiG
         CftnSgGz0t29M1DS8izJMoUqaSuzNxmfogLzeEGm8kMqVfzJiVxsMkYjN3RJqElSTY+L
         hhQA==
X-Gm-Message-State: AOJu0YyHH2Wo3DpqLkXM3agKQ2Wvar5XRX+f3zXXo7EP6lFyPxivg8mL
	XiMZVO6KKYaHe9R8DWrQk4vo3U0gQeimy0GVEztnOrHIaHjFtoajKnuB2cTVH+yK9y+d7TKXH/y
	82kNab/4=
X-Gm-Gg: ASbGnctz59r4hjvRfSBRUCAvWYzmAmA8Ab8i+rf+AIoZ5+yqCl+PZuqcZmb8f7kfeAs
	sUyGXZS130w0uv+w19nx+0uDClJOfCnHtsvDrhx0vdZl9nCW/Q05rt8YXXn/YsHhkmvt6UyLf+m
	yE1t4Gp613rWKxie8bviXGoWWZ9E7Cpo2auYg8GznyNxsLhl4eAcEYwObP/RXrj49RXlaidaS2V
	ul9CF5O+uio57Z24eUsLFiEzFs2S3wByQ/6IwtPUkPy6iFOQEUhG+Gm/d0mb/VwCLkvVVqi5gAi
	UV0ZmSZbdvxG7LTZaWA8p/xxryFAeBDsg2LJ1cawp2AwXwNZZBDsRiqIzQ3TQqmAsJPCEEdi+g=
	=
X-Google-Smtp-Source: AGHT+IHloDhD5c9uYOkpf2UPFxsED2OgJT5QcyDDMmNAmN6/7dYvRb1uWshFMCayXlA8dJfD0bTbcQ==
X-Received: by 2002:a05:6a00:9455:b0:73d:ff02:8d83 with SMTP id d2e1a72fcca58-742a9786a85mr41414748b3a.3.1747986635506;
        Fri, 23 May 2025 00:50:35 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.211.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d5f0sm12699251b3a.56.2025.05.23.00.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:50:34 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][kirkstone][PATCH] proftpd: Fix CVE-2024-57392
Date: Fri, 23 May 2025 13:20:17 +0530
Message-Id: <20250523075017.82930-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 07:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117604

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/proftpd/proftpd/commit/981a37916fdb7b73435c6d5cdb01428b2269427d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../proftpd/files/CVE-2024-57392.patch        | 42 +++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.7c.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch
new file mode 100644
index 0000000000..0b50175a55
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch
@@ -0,0 +1,42 @@
+From 981a37916fdb7b73435c6d5cdb01428b2269427d Mon Sep 17 00:00:00 2001
+From: TJ Saunders <tj@castaglia.org>
+Date: Sun, 9 Feb 2025 12:14:25 -0800
+Subject: [PATCH] Issue #1866: Some of the fuzzing tests submitted in the
+ advisory ran into existing null pointer dereferences (not buffer overflows);
+ let's correct them. (#1867)
+
+Upstream-Status: Backport [https://github.com/proftpd/proftpd/commit/981a37916fdb7b73435c6d5cdb01428b2269427d]
+CVE: CVE-2024-57392
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ modules/mod_ls.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/modules/mod_ls.c b/modules/mod_ls.c
+index 45a3187bd..f7abfe540 100644
+--- a/modules/mod_ls.c
++++ b/modules/mod_ls.c
+@@ -349,7 +349,8 @@ static int sendline(int flags, char *fmt, ...) {
+           errno != 0) {
+         int xerrno = errno;
+ 
+-        if (session.d != NULL) {
++        if (session.d != NULL &&
++	    session.d->outstrm != NULL) {
+           xerrno = PR_NETIO_ERRNO(session.d->outstrm);
+         }
+ 
+@@ -1039,7 +1040,9 @@ static int outputfiles(cmd_rec *cmd) {
+     return res;
+   }
+ 
+-  tail->down = NULL;
++  if (tail != NULL) {
++    tail->down = NULL;
++  }
+   tail = NULL;
+   colwidth = (colwidth | 7) + 1;
+   if (opt_l || !opt_C) {
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
index 9d846f46a2..3a0fff5599 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https
            file://build_fixup.patch \
            file://proftpd.service \
            file://CVE-2023-51713.patch \
+           file://CVE-2024-57392.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


