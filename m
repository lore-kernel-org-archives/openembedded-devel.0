Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A11C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 12:56:13 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.8397.1746622566413969372
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 May 2025 05:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jxLpTw5r;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b0b2ce7cc81so6076841a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 May 2025 05:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1746622565; x=1747227365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZeBTlGZqXbtl8gRt03D01borzj4yHSp8VCsbfdfKZw=;
        b=jxLpTw5rmaqsLCf2KqqEcHpPPxkvFCE7hU/54M1e8QgNRkTjxydz4AAvOgvITjJTp2
         nCCRx7+XvsnJQzVQzV6S1fMCYf98CiT/lRcaCtzaG1FyKotMKViBqLEvmtlrqSXmpCcN
         48X6X/KAArsA5QPDYioSYk5pxy89AgDKCzTXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622565; x=1747227365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZeBTlGZqXbtl8gRt03D01borzj4yHSp8VCsbfdfKZw=;
        b=HaX2UEdpZDUwgEJCltpbgpHRG3IxoIMV6aLiVDQxtQMetjhqzNObsI45cRoFTiwhxE
         uXZt+N99Bpa1xfOl5IxN64pwm9yNkS3gkg/Sf9otTt5ebmNay1CIskJp2Glo3r4pFLyr
         68Fwz0wfPr/ZGDh6D+skSK9naum9xoBS2zI6/eNwQDGRp4Fg9uIHFYBpmpkdUPD2NDNE
         YzMYKSokFj9t16uToCifwVtC93VwK6leL66Piy5BSlxz2ZEBUfLidKRRy7XqpDsnIY1+
         tOeU2XGarGQkefb7cU8jEpioSpFlhUwHaKdBZAjO4UXG1QfD0ym9oDDgU9IUBUSYSSQ9
         rUpA==
X-Gm-Message-State: AOJu0Yzc01o186gMA37alIv55fE8/T4ujp8Kia1Ruj0asN0Rj6EzwCOj
	OxETyz/tl4dgpOBbrUL3TaIz3Nv5lTLOlqrMgv76AahrglKzxnbQ9M6DXAo7FhhcU04KBJQQqXj
	Ekgc=
X-Gm-Gg: ASbGncuHnCGZy0fCtDpdql5R7SIJd2NYdDxfFNS1jVFhcvYKhfSXFwJdFwyvpaKvjeq
	L4Ptf/NnnvoRm9QBHlDEKQMBNscffvv82QDb6kdqSRqsdwfg9y31aWwWM6ZDS1hFYiPe2EcVLoU
	pT8ar0oKhHuBeZar6BN6F9Ax4ea0cQixUbjmu/oDEqEAv5jmuG2mFTtGEJMEcdliD4aVLAp1P4Q
	JctUvQYoFfpAGVA0HHghrbWC8fbcHz/1QxPoSpFyEYwxg5NEyQNs8WULkonN7Sh3fk1SkLh7z09
	Z1hvWht9aW4F57lTgp/HUg8OVSC6v0GHK9Clvs9Ygls3aMimgsUFNM2/lKNlWQ==
X-Google-Smtp-Source: AGHT+IHq0RrLKPAWUhpkxj7N36SElmt91Nibe3Db50xpiN24teSmvnAoI/nLPAGBQEpOmSIo/+/fTw==
X-Received: by 2002:a17:90b:3e83:b0:2f4:4003:f3d4 with SMTP id 98e67ed59e1d1-30aac21d0d2mr4940182a91.30.1746622565230;
        Wed, 07 May 2025 05:56:05 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.233.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4b40e3bsm12964a91.11.2025.05.07.05.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:56:04 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][scarthgap][PATCH] proftpd: Fix CVE-2024-57392
Date: Wed,  7 May 2025 18:25:53 +0530
Message-Id: <20250507125553.1421417-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 May 2025 12:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117359

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
index ecd2777247..b45cb6aaec 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https
            file://contrib.patch  \
            file://build_fixup.patch \
            file://proftpd.service \
+           file://CVE-2024-57392.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


