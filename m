Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C1ED148A4
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:06 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6698.1767950946256574388
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V4vLAufT;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a137692691so29406295ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950945; x=1768555745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUrKVs+I0xF5v1ERU2dQGai8PetcnExBwOjsKNma//8=;
        b=V4vLAufTVdEqgr2x4dLmJQWY2sUBNN71aALpsokIWkSz0WiKROxR5yRL0ys1m8lcfz
         lh0zcMe1loUijTCnBrHI3iLpg5PoaZprmguIYCWmeyN4FF/DrIcCdVa7T6cfGi4ucydu
         nEvDFjS6GmxhNrypy/HAA5DB8SPngdCkhSB/ZbJL6MVPT3IWf99a3eXQ6YjxWrFb8iN9
         Ldh6y6aCPhRTbFXGMbYnvPBWtd9T1tz30PMPVfzojSH6HpnIpM1GOqpyV7oHA4kzU5jP
         RGBbl3xHgxu/w851U1946nBRjLC8l/U3WD9AzIvQ+rwKvW/X/UjbG00MST3qbXK7D6WG
         7e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950945; x=1768555745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iUrKVs+I0xF5v1ERU2dQGai8PetcnExBwOjsKNma//8=;
        b=qjzM98frE/njToszuoBmhvi/38bEBv9PVspah3FxrXjVFezHIK8NYqd8GlXsu8l07j
         1QAwLddlgKaIgA7wZYRcP+FO2kuDLLAQql2WwXdeuJqgP4IUJGFDaQsgNW/Bma67ze+i
         ap+u5nI5/HaNhjATrjPS60jJaJUxuzXcxXYRSKyiUQ2zjyO5RdcZtKX4xhWjGndvvpcq
         2oIpnOHcrwAiSQTvqoKXZKD7eGossdlMbFnMPHvfGjbPTxndFKCtTUONhHDIau8CMtQx
         Wpl0+B3ioSIxJN087NYbky4AHG2Yi9RSEajtLRM6rMjfgbzv0upoID70/EOeN7gBKPoF
         1QkQ==
X-Gm-Message-State: AOJu0YyAhZvgQn8qtkAunv43QBRYNv02+IDFxk+FWbaZGaCBjI0t2mOu
	R2sKFicb0V5byS81V/6oU8Tp5B3JvBZE1bY3EPQ8oimX6wjinKnNxj3FTDsJ1Q==
X-Gm-Gg: AY/fxX5e6QZUM0z+XOWueHB2sY7/tKBY28KZCnFnsz4aOBIDVbwwcoVto4SP44d2cnh
	sqCP9lEMYmGRrDfKCOToG9BuXqYTsY8J/rEM+jubYJhSoC2ZXVJrASBUW3FWO6CjExHTvTQPhCg
	t7R+iTe87k+1ioFCYa4uqeShji0KEtjbwMvrPP+mJqpg+2DtYTv7OTrhsSq8JpBpCmZFgWvipFh
	+pztiEhd73QpaD+Ucz0l5kKBKsXORAqbvuejGLlhq17M3WLAQd5mYtL7za+rNH3Grn1CQscszHi
	C7heZ8x6WIf6KLOketLRAJPSvh86deHC/ayDsIs3XXLeNEZ30kQZH8CQn9VpIlqKFXgDY75a18T
	j2+yGLNs5pEjPZkHRNzyp0ElXvfqVi1kz6tQ9QVYHVnbz2y070ZQVcMQgnd/mXaNz7A0zcdD3mQ
	LRDLFBF5So/DdU0Zl2A1StCWvpLRXM1HaPsA==
X-Google-Smtp-Source: AGHT+IHWsen1G9gbovp+uxGwzP8nfXaPO5BHAQ5TrvmqJoSE12JQbKdSm/udYNUEMRRXD17CkFmeLw==
X-Received: by 2002:a17:903:40c9:b0:298:3aa6:c03d with SMTP id d9443c01a7336-2a3ee51bdd6mr96113195ad.57.1767950945355;
        Fri, 09 Jan 2026 01:29:05 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 06/12] mtr: patch CVE-2025-49809
Date: Fri,  9 Jan 2026 22:28:36 +1300
Message-ID: <20260109092843.1924568-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123284

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-49809

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mtr/mtr/CVE-2025-49809.patch              | 39 +++++++++++++++++++
 .../recipes-support/mtr/mtr_0.95.bb           |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2025-49809.patch

diff --git a/meta-networking/recipes-support/mtr/mtr/CVE-2025-49809.patch b/meta-networking/recipes-support/mtr/mtr/CVE-2025-49809.patch
new file mode 100644
index 0000000000..f7d1b06934
--- /dev/null
+++ b/meta-networking/recipes-support/mtr/mtr/CVE-2025-49809.patch
@@ -0,0 +1,39 @@
+From 9b5107ff91b72c0104d9dbeee076f37f584ea4b4 Mon Sep 17 00:00:00 2001
+From: "R.E. Wolff" <R.E.Wolff@BitWizard.nl>
+Date: Sun, 29 Jun 2025 14:06:00 +0200
+Subject: [PATCH] Added protection against use of MTR_PACKET under special
+ circumstances
+
+CVE: CVE-2025-49809
+Upstream-Status: Backport [https://github.com/traviscross/mtr/commit/5226f105f087c29d3cfad9f28000e7536af91ac6]
+(cherry picked from commit 5226f105f087c29d3cfad9f28000e7536af91ac6)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ui/cmdpipe.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/ui/cmdpipe.c b/ui/cmdpipe.c
+index d22b236..1a66293 100644
+--- a/ui/cmdpipe.c
++++ b/ui/cmdpipe.c
+@@ -220,10 +220,17 @@ void execute_packet_child(
+        the path to the mtr-packet executable.  This is necessary
+        for debugging changes for mtr-packet.
+      */
+-    char *mtr_packet_path = getenv("MTR_PACKET");
+-    if (mtr_packet_path == NULL) {
++    char * mtr_packet_path = NULL; 
++
++    // In the rare case that mtr-packet is not setuid-root, 
++    // and a select group of users has sudo privileges to run 
++    // mtr and not much else, THEN create /etc/mtr.is.run.under.sudo
++    // to prevent a privilege escalation when one of those accounts
++    // is compromised.  CVE-2025-49809
++    if (access ("/etc/mtr.is.run.under.sudo", F_OK) != 0)
++        mtr_packet_path = getenv("MTR_PACKET");
++    if (mtr_packet_path == NULL)
+         mtr_packet_path = "mtr-packet";
+-    }
+ 
+     /*
+        First, try to execute mtr-packet from PATH
diff --git a/meta-networking/recipes-support/mtr/mtr_0.95.bb b/meta-networking/recipes-support/mtr/mtr_0.95.bb
index 92f9c4bfc0..c1d6ff5605 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.95.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.95.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
 SRCREV = "852e5617fbf331cf292723702161f0ac9afe257c"
-SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https"
+SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https \
+           file://CVE-2025-49809.patch \
+"
 
 S = "${WORKDIR}/git"
 

