Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24395F357C5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 17:04:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25259.1771952692146842734
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 09:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FLHiQeJk;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso48917555e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 09:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771952690; x=1772557490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bfhQb+0Tgp2U8VXK4QqiuNFqp5T/5IleWVzb2R1nLs=;
        b=FLHiQeJkDMnoxVaCree2PqF04es2c1rfPEFBJtzdrWaKIu7wUdTv85NAlbwL5gzHOL
         W69CjdSUfnNx7CozzusAjEn906UMLvSk3twZgLrwgZ35Gi4MoiWb3XLfgJgippMAnnvq
         v9nvjX8fdmG/QNGt3xyFWk6wWK6zEA/oe9p3IEPeRss08ErkJMSfqF3SDM8MopDaMQ45
         BS02YTWFlTKZONi9w4sS/HTJZ0s+wXn6JweOI31tsRUE9lWwxrQWf2KqdLXNd+FmUoA9
         AFMbbea+cLZXfRN/u9za+CAAzI0Wbo0Uq1cy7RKx3yfDedaA/0oGtg3fzygWjWmIlgp7
         8sSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771952690; x=1772557490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bfhQb+0Tgp2U8VXK4QqiuNFqp5T/5IleWVzb2R1nLs=;
        b=SkKF4Q92lKj1VxB5fRT16bmG+4UacoMIa0djmxYTfSSoCy2+MYDAGdtI/JyiRv0LKS
         cJVRJW1QJfajRO7UgxRtuMAfP8Nrh3t7IyqDbxqtcXrDp+tMdjmBWgLZpDTHqDYHTTyB
         gruAlfcrPJEvXxfRJn+4/6kkq3sC/MY3cP1UJP2PMIPlIKZumHdd2hThOSpS6cJq//+M
         tJwa8TxiI9ntIA2uPQPm3sYkenSJJhk84KGJRb4NiSvT4Q3HPC4Dom4P8lDLBTkKawfk
         PUpZwEPy1huiYfFQ7IKHdKdzXUPBzapDFp0gzyZPBAWrY17ao7ppLA1u86nPobNwvhMW
         Tk5A==
X-Gm-Message-State: AOJu0YyjjjznsnLoDoz3sasTRIYI2qgnQRjp7vk4WmeOk4h6OcHO+suR
	i4cQbthG3j/+pX18wahU2rpBjj3GOELO0hY9VO2vfI/R/nP5k7zx/oqXF2NANg==
X-Gm-Gg: AZuq6aIH8GKgoDki7/K6eInMX+HUEKZTMtJ+WmrPmyDPEbVOdwKRpyJ8fQykObEi2Oz
	ZJEZDKns3040/LYkJ1az4EiSy5/Hc53wQL83yRzFg6XmkOaf3tjrrO+IyB8GsLsISGRyMqrV1sP
	BIMqj5qwEaxZwSCjGOzuhPbLLg/rwasCTdHAtcot6LbZpwJK8bkNgt8VYFUaPaZIN7hbNORsoVZ
	yAJ2sVE85zPEpnmwwTd4T/unT4R8zz22fpqgvXNpBX8msRgIay1tFgOOKWPml+Zwb1IEKFca5Dp
	4IVdnAsKO5v+BMimBeSVExia5uyoPl5oMcm/OnE2JwE0PtFyd0oK4zXQ3nLUv+KbqkCv946gwFM
	OzVGWo0L32GDtT08MMnMxFml9f5eqDOZmJx7ngmh9yUSiqWvzo6rdmZAvD3GQNzfszF7RbdUFPs
	W1O6aKEwcZVa9JMy8nfcA1
X-Received: by 2002:a05:600c:5020:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-483a95fc1d3mr230051815e9.12.1771952690170;
        Tue, 24 Feb 2026 09:04:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm19990535e9.0.2026.02.24.09.04.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 09:04:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] freerdp: patch CVE-2026-23530
Date: Tue, 24 Feb 2026 18:04:46 +0100
Message-ID: <20260224170448.1310931-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 17:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124583

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-23530

The related Github advisory[1] contains an amalysis of the
vulenrability, describing the issue and the root cause also.

Backported the commit that implemented the solution described
in the advisory.

[1]: https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-r4hv-852m-fq7p

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2026-23530.patch      | 28 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.11.7.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2026-23530.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-23530.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-23530.patch
new file mode 100644
index 0000000000..4aac13de93
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-23530.patch
@@ -0,0 +1,28 @@
+From 6f61d18e9707cebe9d7d64346c66da780c7094c4 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Thu, 15 Jan 2026 12:02:02 +0100
+Subject: [PATCH] fix decoder length checks
+
+CVE: CVE-2026-23530
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/1bab198a2edd0d0e6e1627d21a433151ea190500]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/planar.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libfreerdp/codec/planar.c b/libfreerdp/codec/planar.c
+index fe27011e1..1cb2e22bc 100644
+--- a/libfreerdp/codec/planar.c
++++ b/libfreerdp/codec/planar.c
+@@ -616,6 +616,11 @@ BOOL planar_decompress(BITMAP_PLANAR_CONTEXT* planar, const BYTE* pSrcData, UINT
+ 	WINPR_ASSERT(planar);
+ 	WINPR_ASSERT(prims);
+ 
++	if (planar->maxWidth < nSrcWidth)
++		return FALSE;
++	if (planar->maxHeight < nSrcHeight)
++		return FALSE;
++
+ 	if (nDstStep <= 0)
+ 		nDstStep = nDstWidth * GetBytesPerPixel(DstFormat);
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 63dc177cbe..d4efcccdbd 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2026-22854.patch \
            file://CVE-2026-22855.patch \
            file://CVE-2026-22852.patch \
+           file://CVE-2026-23530.patch \
            "
 
 

