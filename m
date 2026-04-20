Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D53DF36C40
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:06 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13772.1776666483859273427
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hflow2st;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso1487105e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666482; x=1777271282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmqmTwgRz3aareP7MGTeVX9W7DNC84+Mxm9K491YBQI=;
        b=Hflow2stSbLBImy8uudurYsWuVlLPWt7b0gIHCPfBmNEcWTlig7IfxXK6kNLNBAK/A
         h1ETFjri+c/hIOEyYLy04ZhNGhZzAcQRftmJtEyHw1N0XmcvkxV3AkrhyzpMvK5DWpu5
         wyt3C6Qx0JZ7RsfeLX6XA6KBjzfn5J0wiJUrUJv/RsLQMQp32BlFklJzpvF4oUUEZ4vt
         lXMFBZCnoFDIHZMKUEGe+jjJfbhu1+xDf3j9uOU03fr9pV8zYX7RcPUO0IeunI3CxOAx
         ORQiQJvFGJLFEPqxgczpErGVgnhWwPoohY26e9nPKfz/8YdvTpZ2X5thF6xtniMs6iP+
         kvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666482; x=1777271282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmqmTwgRz3aareP7MGTeVX9W7DNC84+Mxm9K491YBQI=;
        b=E02bo/99n6E44EJ715kzarRIIdSrrH19gWbZjt7tvbQNrjnKrXGxiiDYBRFBNRxO84
         wg03HO1CP/7dBFrxrAkuwzoKtArUV4fjtIVcShq5SQCk4emnFCp17mspFUeneYKB4BJh
         1+QkD8kqIknmzFLv4BbRjEPheA2xRdYMhOGttwN3Z1UhUumNWYZbLJOTaYGOCxVV41Ho
         eKEECbyUid1vTSuRyUDgp7rKDXTLIJ0qDoJTB4Cb1hAJb45x5MoQmdUmrCgJnMc9rLif
         485O7LuHo/OetrsrEHHjz6jqNdwpViTtWibV8sJtONbEV0ER3msGjqvJX8xUmu5NJo7j
         r2Mw==
X-Gm-Message-State: AOJu0YxjW0in2qXwUO1VRO7EyKVQkrtJk68DoZg9effQ3CdPKMVcxGO0
	8ppJH2rUONqVNDFXotIH99VNRy1/fC+WCPPlO2q1sMowcwwWA7hUiUZ4OO7uPQ==
X-Gm-Gg: AeBDietEk7IsmgY9g+d1dyCftDE1aa0Ti9BiXgxZZ4Djtx3r+dxJlgMgGXPiU0LcZ4F
	+uvStDW6MNeYb+NHA6ccD6rL1hene3FYsZR8WTC+SYwPXeaxuRrC/pzOpXgUXGDWqsWyTaO3ghc
	tEU+1R2TI1QQb5QBlMlGB4t8nzOYGxeHr8zwyDI/2f8ZvM+zrP9GkEUBGyRm6S9pkRRct6ZOUKO
	9CNwkek0sRTjXslkwWii7QBX07pjqWG1n74aGtldWDE/XcNqHbajKCZYaDzcNqRJURAu3e6+ZmC
	PSbrien9yT5ALqtnlpuhhwScEDdB4G6MNi5fAO3jCIwq0+2L9TfHbiS5k6gDqwv1xV1dtIekhj5
	xreIfAyL75HOrMNxcjr8xeor1NvvLGF9bbZVKvEqiKbGxCWfGkh6fPYManIXs6ImpTQP7fd7Y6W
	KfN/5R6iw/J/nLyGaEatx+BGE43tlvL0A=
X-Received: by 2002:a05:600c:a00c:b0:488:c51f:e04e with SMTP id 5b1f17b1804b1-488fb765e65mr162444755e9.13.1776666482167;
        Sun, 19 Apr 2026 23:28:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.28.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:28:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 15/17] libgphoto2: patch CVE-2026-40340
Date: Mon, 20 Apr 2026 08:27:47 +0200
Message-ID: <20260420062750.3795917-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126479

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40340

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
index be761bc940..c82e76a06e 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40336.patch \
            file://CVE-2026-40338.patch \
            file://CVE-2026-40339.patch \
+           file://CVE-2026-40340.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

