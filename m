Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA50F589C0
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:45 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18678.1776948584099584676
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GVMpW6Ry;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ad9a9be502so41179825ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948583; x=1777553383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBfCX6yF00xghKVGrHV11kwtbDc06JuXsHdj1A9gGYk=;
        b=GVMpW6RybviChH+RP4onBUmtYRDgSWMfmG1I5zLERGP3M2tIcApzidQc3FBBOFLxhT
         uXWfPvoVkn5OhELMjgqAXXiHx+PVPbz+E9rJabY9gbbar89TNFvmVjHAFeJlsIafH+mq
         PRgGicLSOb6as5GImYU71MlkcXr/C6VjxntKne4Fm+MwQIEAfCo2NbYIpv8T7rPRIzt8
         /yTamj5KV3ZzzlKJkdb7VVHiTvY+hDS2Fby6FPTrR6/9bqZbd0y1htkZIw4CjyHyLCj+
         zpBhNHoNMyqwIRAOsytnk9B+YlOupwaBD7mYNCmkzg8jTfMxGZPGK8U//Qezc0wIH5tj
         pH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948583; x=1777553383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KBfCX6yF00xghKVGrHV11kwtbDc06JuXsHdj1A9gGYk=;
        b=nPt2PER5/z8xaAfAK4l09zAjy1+49o5QNmm48vZqieOdXymMCU2NdlQgjUaQh9/8b+
         aGGkVzspXl46i7M0HaYeAfGXucaOjFZtnS5sJ/p2PfHKs1QhmlvW8s4P4liNTLbp5gn9
         lt3AeyMzghd5Z5I0IJA+oplIQX93ZuZPSLVlZE7590uB8ZbKP/118HIFpBxQ/ufhSJlm
         /mENTMDCIPYweBc42Oml6SzHm0Ppxm+2mTxqs8x0ly0dTcOuUcNNtAoc/TzMgy7ywIlZ
         JP3rsUx1aHyFbbWL88HjYsNpRltqh1oCbvApaLUSVyAJMXNV7SwilKJAsZrFPZ1UlVbm
         3VsA==
X-Gm-Message-State: AOJu0Yzzjl2LXqSCCdIXHm8I5GNcRvjlvXLZBLply0IEbbwcy7LwkP7Y
	xF24TY/STU7pmNOFrLOshF8xIacwAncPmCPbmOd1vniLuesAKGc4kAzcVmpnN/5f
X-Gm-Gg: AeBDieuxs9MLPVPNxucpHC8tFN/bkYlVRgFmWrvxBIAiCw/OptiJLMzHMs1olTVy3Hy
	3MAgwT4BoXRXH3JqfqXvxaLtqvm4p2ByYmNUQyMff6sme9t3O++QpdH+oiGqwNXMU1WzS3iqYg9
	WCsCwqcXQmRCpm6T2AxwEk5VuYFmIJOIhmRZY3+hUoDQfj/PRifmNNdP/nPiB45rigvcpVS0MLl
	W3K7dRVEuA6nj55oNhiMx1IAfpHRdrnLLyRFa4s6O0yaNhO1BhZb96C0Jr4Bcu6DnmHe4dHM+hJ
	FbWgBX73DpHLvSeGF0V8YVeaXhUw5pDcDUJNtduLvxf+uOMOYI3jQ0kHJjxWRHX83QvEInQYQeJ
	VKjCtTIQu+XTB64cBV516r1YYECEEykqk6X283w7WchXQjMYO647yFQDVT5dWxuCUKwa7yZFy2R
	J0ppoG54GgC6tOb5pgeyUSzwKtaO40ZWnqppPAxCxW1HdCplM=
X-Received: by 2002:a17:903:2acb:b0:2b4:6398:6aa2 with SMTP id d9443c01a7336-2b5f9f3a802mr307095775ad.27.1776948583079;
        Thu, 23 Apr 2026 05:49:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 14/19] libgphoto2: patch CVE-2026-40340
Date: Fri, 24 Apr 2026 00:48:12 +1200
Message-ID: <20260423124823.1983261-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126590

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40340

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 420e5aec46b8e9344c4d9e692f2e05236b9c89e5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40340.patch   | 40 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40340.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40340.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40340.patch
new file mode 100644
index 0000000000..a0852692b0
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40340.patch
@@ -0,0 +1,40 @@
+From fd9f234df894caec6c65144b5a4f0264aadf0989 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Wed, 8 Apr 2026 16:01:48 +0200
+Subject: [PATCH] Fixed ObjectInfo Parser OOB Read
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ptp_unpack_OI() validates len < PTP_oi_SequenceNumber (i.e., len < 48) but then accesses:
+
+    Offsets 48–51: dtoh32a(data + PTP_oi_SequenceNumber) at line 563 (4 bytes OOB)
+    Offset 52: data[PTP_oi_filenamelen] at line 547 (5 bytes OOB)
+    Offset 56: data[PTP_oi_filenamelen+4] at line 547 (9 bytes OOB)
+
+The Samsung Galaxy 64-bit objectsize detection heuristic reads up to 9 bytes beyond the validated boundary.
+
+ CVE-2026-40340
+
+Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
+
+CVE: CVE-2026-40340
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/7c7f515bc88c3d0c4098ac965d313518e0ccbe33]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index 28648a5..9eba06f 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -526,7 +526,7 @@ ptp_unpack_OI (PTPParams *params, const unsigned char* data, PTPObjectInfo *oi,
+ {
+ 	char *capture_date;
+ 
+-	if (!data || len < PTP_oi_SequenceNumber)
++	if (!data || len < PTP_oi_filenamelen + 5)
+ 		return;
+ 
+ 	oi->Filename = oi->Keywords = NULL;
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index b8d6aee3c1..40ada8dd20 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40336.patch \
            file://CVE-2026-40338.patch \
            file://CVE-2026-40339.patch \
+           file://CVE-2026-40340.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

