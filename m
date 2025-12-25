Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E90E7AD4F
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 12:51:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137503.1766667102450283543
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 04:51:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJyj3lIS;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43277900fb4so327290f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 04:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766667101; x=1767271901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jB2AmCifNuBl1CK0MtE0ka3eRd2DEYEAV7y8Nk/Z660=;
        b=KJyj3lISFL6+EJbb1xUlZsbZJeiVvhDdlFfW9LFgOwvmfzAoXq4+iSy2xB3L12SeNs
         2ynpHNhQs84l33MvWp6+JG8WO4497clps0unIoRaGrhOyM/+S3Pr3Jbu7UFEukKNQzfk
         5Yjj1B1GbsRJABJoSF2+3V0tQbamBNsNtX/JKfKtzR6jDS2vPcafS4PfYNseRNNRxxdh
         xL0Rcph8lztFjevQPmUTNCTRb5HQwRYh11USJzgEmOYVIhQXgkyBecjglA+YNMgqHENk
         ie5BS0sUOWHGZfp8jlJd5fziDy+33EQO4sGqmAnvfBgFKTG4npUeg2L7/1oH5pvPlbz4
         LUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766667101; x=1767271901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jB2AmCifNuBl1CK0MtE0ka3eRd2DEYEAV7y8Nk/Z660=;
        b=tCb1Cf9OH3nlpRX+TFjge8reQrsIpOqjpV8RPEZjG1/drq9RedQVV7Nanp37CgiybJ
         7fEiB43ko8ynZE3N2hF8SvRBnPGN6+OE3y9yehkxC1GzhVLI0tmZL9R56xDY110gbQM2
         JufLAUovJXs2jMEKDCukS1hyplfyx1wphcoBedi9c2dVueolxdqcckfFtsSONEa5/WTH
         wK21gXShzjFj+T1ivazncTv1hWqM+w98YEJ6zP2r8SLoSKfLoCW/LL0U9wwr5UG3J/T7
         0aIZL/4e6fmsrNBohZmhbhZ0KfCEGdpaRMs2JM2pix377f5juciBjlXB2oE1SUXAJT9s
         vYjg==
X-Gm-Message-State: AOJu0YzEOCDcVjwPocSWte/z/BUaN+VBsOfsoydEruP1qwugr8bEPW5g
	wJeTpnqp8iLU7s2S4Edw8LpM3njs4r+C2bQyNGbN7UYoUF+WqQg507DvCpN8DA==
X-Gm-Gg: AY/fxX55o8I5XHzT/foRhZEdV8y5AXuVN3JDOHKxCt7S0dswviCCaUcT0N5DnRJJGg+
	wAJlyXI8wt4F8OFLlZ7gRP07Sc9bYOJmtXNZRGtBurRxV7ChLNA2bNDcwZlMTxMM2RLVj8F7aKk
	IJwuHMWY3zM4rTTxFDGhc9P4+GcwLIfq1tU9uhAvlFzBjNkpwAmI52ur/ZMHuXZC+VaWqsEbd0V
	jZLvQIMjYPRBnKzpzip8XDPDdcZrEJEbuDE5IggUheG4XObhwuQd87SjGMFxcMqgsirBsgKvNw1
	49/qRvLT/155QewnR2Yd7fnzHmIK/MyC0yX1l7ABm5n9zklu/o9X55Aa5x67p5XKANzq00gd/9V
	ECJ83mWk+P0U4nRMsqJmsLSQPQB3G0ej2PobJJSMr/ub2qRAn/Ckg0Y9jEgONJAyO8hr5LoMRw3
	JH6XDgVN5vloX6kxVUk34=
X-Google-Smtp-Source: AGHT+IH96YoeUhYVDiKMhkaUq0zCdH0hhCvcZ7UxwvYb9RaKH7WZt8JZx/jHUO5Iglm4qqBZRJTceg==
X-Received: by 2002:a05:6000:430b:b0:430:f736:7cc with SMTP id ffacd0b85a97d-4324e3ebf79mr22088487f8f.1.1766667100584;
        Thu, 25 Dec 2025 04:51:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm40219073f8f.20.2025.12.25.04.51.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 04:51:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/8] mtr: patch CVE-2025-49809
Date: Thu, 25 Dec 2025 13:51:32 +0100
Message-ID: <20251225125139.2436941-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 12:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122913

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-49809

Pick the patch mentioned in the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../mtr/mtr/CVE-2025-49809.patch              | 38 +++++++++++++++++++
 .../recipes-support/mtr/mtr_0.95.bb           |  4 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2025-49809.patch

diff --git a/meta-networking/recipes-support/mtr/mtr/CVE-2025-49809.patch b/meta-networking/recipes-support/mtr/mtr/CVE-2025-49809.patch
new file mode 100644
index 0000000000..1f8ac4aeb9
--- /dev/null
+++ b/meta-networking/recipes-support/mtr/mtr/CVE-2025-49809.patch
@@ -0,0 +1,38 @@
+From 5eefb172ef1ab9e46d79c6bae60dbe7983c9f704 Mon Sep 17 00:00:00 2001
+From: "R.E. Wolff" <R.E.Wolff@BitWizard.nl>
+Date: Sun, 29 Jun 2025 14:06:00 +0200
+Subject: [PATCH] Added protection against use of MTR_PACKET under special
+ circumstances
+
+CVE: CVE-2025-49809
+Upstream-Status: Backport [https://github.com/traviscross/mtr/commit/5226f105f087c29d3cfad9f28000e7536af91ac6]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
index 92f9c4bfc0..8c385ae46a 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.95.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.95.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
 SRCREV = "852e5617fbf331cf292723702161f0ac9afe257c"
-SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https"
+SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https \
+           file://CVE-2025-49809.patch \
+           "
 
 S = "${WORKDIR}/git"
 

