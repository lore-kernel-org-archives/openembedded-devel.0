Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C618DCC6B27
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:37 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9316.1791969934098925039
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OB3g8yuv;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so2116893a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969933; x=1792574733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlkOVDlMpahwpojKxINx/myU6vsCVLw5aqsNGwAyzhA=;
        b=OB3g8yuvWlAJ4+6J7nWi//sPQBfeCSAPDAdqSF+uHtOT7tdZJM8VVd4WDmB+jScDjh
         h0v5gZYeRQTQcPCzVmGYEKswcKvDpP82Xg/wCt+tHuNjAnkStiyYP6oPNmFJIBAY+Rjb
         +9td26hulbQa+/qiJx4S+QLZqYG2hDn6e36lP+o/aao0Ptu2zkcRhZ4oKH5Wycz5BQvp
         1e3r2+UtTWWk+UKGmvXjjlvRxOlCWwCEJkd0VqzkWp2KPd5D9YkpdA0OtY9xHnct5NlN
         nLPIMiUWXOyTYNPWokQNgxai+kuPFOLKKwEcXnagBnAUDlLjmw885fz9wJQEcDvgmPZ+
         6eMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969933; x=1792574733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlkOVDlMpahwpojKxINx/myU6vsCVLw5aqsNGwAyzhA=;
        b=VAkPmJZ7G3dl1tkbpeUYHRmo7Mt8okPPMyggbkgB1uKnhG8lRpNMmgu0mCv9BZLDCf
         l0wlDvnJGHogrg5KgG7jIWNYksSFblMDiNHxGyVoWAFnBm1ZRf2+wptd48B2pmm/PITg
         2Mnu11hcyp3hT4YYSe5UYl8KBr4b6PjUxnz4XGgr1aGOFnE97jDfJ0Z6JLu6pi+A56Ds
         VV0Ujopb1oWZuDnA5Uy5X00/PA7YgPMK5aYumVCzmNUIq+hvmRfXnAdE8eXw1pV6+E2g
         Nj9t5zI3xKB/hhOTMXGp3qcmakgb7lP5+aPNZBDawsQvKgIl9xewmZFwHpgtuq/2A672
         GE+w==
X-Gm-Message-State: AFq9FYJw9F7l32m4ZmKyNyopYRBrlY12UgEJ82iwW95k3PwHUBNrShRd
	O862S35d3gClBWKu65Og7YUKOdxODpk2us+ROzLM3DHEOp2Zba3avov2uytfQg==
X-Gm-Gg: AYBFou1ZnZ5oyyOG/xwdKDhMvWmrcVX8N0ZIcw/9iDBSJsm4hr3q6a7aHOdUaHGbIGG
	HH10doqgMecUceHoxyFS4ZkuK5DyI6xVIGTqx4gBQLl+8uT6Sl4qHW5uUFhLVAH1GLOu+ldiANt
	uJ/m1HPaDCfaOaUSuYPVjjnY3kQ6KE4DGYgYcASVjXvHnNUx48xGfv4rwGyRziGRHdr60CZlvqe
	lTcFHI0j3zXQYUC/MY0s4H9ScvBX4i8DUiNMPcY1+FtYn4IvpStPStkmiR3gxeTcXT0EGTEKIpi
	BMhu4xuvjlcsiBVvqRc5NWdJo9LEfnK56RvC3wqDl9WjdYn0/sHxqu4lVLZIjjZwNT+HABxZLw6
	JPAeCcfxij6jB5RFvyxQHn93N5Xph6DgzH2Y5Iv8ZHlMiWZ07f8Sa+J4kM1R+d0OHy8hia80J0o
	ywDIWZcGL0l28Our9IZiGDjE0dy6mTXAEVM4uiR82TNV6ThDaXZvdlLbabXvjNzkFnyO1LIJm0G
	Z0e5S80Mu54amXCHJ9Y7/o2+/T5h3ACJAVCPuk=
X-Received: by 2002:a05:6300:83:b0:3dd:a196:69df with SMTP id adf61e73a8af0-3e16bed47a4mr13934750637.58.1791969933371;
        Wed, 14 Oct 2026 02:25:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 4/17] tinyproxy: patch CVE-2026-54388
Date: Wed, 14 Oct 2026 22:25:00 +1300
Message-ID: <20261014092514.454505-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130872

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-54388

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-54388.patch  | 32 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
new file mode 100644
index 0000000000..4dc7f88310
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
@@ -0,0 +1,32 @@
+From 2639058707dd9d199196b167823ba1865a60ea08 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 7 May 2026 16:39:48 +0000
+Subject: [PATCH] reqs: prevent multiple content-lengths getting emitted
+
+addressing point 2 of #609
+
+(cherry picked from commit 364cdb67e0ea00a8e4a7037e2693e0711e816adb)
+
+CVE: CVE-2026-54388
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/364cdb67e0ea00a8e4a7037e2693e0711e816adb]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index d5037cf..117d755 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -681,6 +681,11 @@ add_header_to_connection (pseudomap *hashofheaders, char *header, size_t len)
+         /* Calculate the new length of just the data */
+         len -= sep - header - 1;
+ 
++        /* prevent multiple content-length headers from being inserted */
++        if (!strcasecmp(header, "content-length") &&
++            pseudomap_find (hashofheaders, "content-length"))
++                return 0;
++
+         return pseudomap_append (hashofheaders, header, sep);
+ }
+ 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index 25df44301b..46d3a4d7c6 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-31842.patch \
            file://CVE-2026-54387.patch \
            file://CVE-2026-55202.patch \
+           file://CVE-2026-54388.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

