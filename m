Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00979D625EF
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 05:44:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31039.1769060643841868056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 21:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SxElv2qU;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so4200685e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 21:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769060642; x=1769665442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bOvbhWNs+ESR1muZy/lqKD68AjyWWseRc+YW+jkjZXc=;
        b=SxElv2qU5uiHfcCpOOhqcCS9Zaa/1mlMLnoitb1SY7CEmBCDftVqy7ZD/ze3AxygJN
         R7SyXDH8K8Jr60yhbYLNsvCtcDW9LeaQE+y1JN3DxnOAZs0NQkT4Co2v9a8a+B/iqs1Z
         VYjR40hULRQrNvF1EP4Fjsjo/+P1zRNh8ZB2Ck31nuB+VzjmwIP3gIB/1/xPYSY9bmjV
         uZMzRQW47VZwhhoN4yA3gUr5guWDxLcHb/MV0hKVfrFiscE102ARGYZ2b+x+iF62favY
         OUZxPJDX7PyyP/it4obyQ275AAzx3yd70i7JYy08zKk1xURaR47VcGiQJ4fA2AIP+eNN
         J7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769060642; x=1769665442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bOvbhWNs+ESR1muZy/lqKD68AjyWWseRc+YW+jkjZXc=;
        b=ds8CZ299Ya9Nzj8ki8TKTNkaMZ5aTi9upADePl/GH8lQxKjUVMXSbkxIyNjydHueXz
         sSDHVLIAieJZC46xv9F3pcUPCgjgR359TCliuvcC63Xzs7+jTqMGucR4wk2OKscVLasl
         gHnhT6H8W3mh3LtxHhixD8IuJGaF7g6nzm4uomaWEzV8hL5aX7gVc7k00ebjQRFjn69I
         gyzOabOkZ0QnNqxEgHqKHaOTHMFZruzfhZkmSpkt51pKhaQq21h6joKcF3mY59Z/S2Sc
         qDoJG2VnhRvXZ7WiRw0AYUN7WKVNGJ1r0Dgu98Fsb1lSBFu+6ilIxiywCKfuWrBD0hox
         t5fA==
X-Gm-Message-State: AOJu0YwNY1g9HKWMjTJ8lf25DmFckAA1D99tv24NOBngBxTpaEC7jir1
	TBuoGhBcpX1grtmoD/D9TV8cQUnlJvthJj8yha6seUFwVD0S6RryjQnTw/PylQ==
X-Gm-Gg: AZuq6aJEeo3jg4HfqxxAK+oe7RTSYghp3ksPOTuUp3+86m9epHL25dr8Y2zNtUacphj
	Gl1BvZTaLzNMU/NvECTyXCGo6hdnxxJ6bcXgIqdOqPXfQ4IO3slkVGi8IeSCEfxKdiES9dUNKEs
	ybJJrC/R02y+TW+wfjik2cygW31GCScxvIilhb+FOvCA7793/7qYeb+5b7hjIrc6Gi7jdvLFKT4
	8ab1bnKad8HYgd0f6PnF04aLdStKqyrJWHNlkyLIIkI+hR/o7GPoqpCdbLdKkwo2/iRl3ZF+Qmx
	79vMXdItR5r9BMCUOS2hJW/d5cML2BLp/uaBInGQWEzrpM9craSYnrRz0plIpjw8wMyues2f5ul
	aDjeax88Ja4TmEH3/+35igOgQiAVL+DhP90ftP0x0eYfE9NtZSzli/ja1ChK01EPBFaMiIDvQdP
	Q51/fw8bge
X-Received: by 2002:a05:600c:4f4a:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48047087235mr30212245e9.11.1769060642113;
        Wed, 21 Jan 2026 21:44:02 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480424aa344sm43912035e9.3.2026.01.21.21.44.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 21:44:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/5] freerdp: patch CVE-2024-32039
Date: Thu, 22 Jan 2026 06:43:55 +0100
Message-ID: <20260122054356.3570391-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122054356.3570391-1-skandigraun@gmail.com>
References: <20260122054356.3570391-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 05:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123728

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32039

Pick the commit that is marked to resolve this vulerability, mentioned
by the Github advisory[1].

[1]: https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-q5h8-7j42-j4r9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2024-32039.patch      | 78 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32039.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32039.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32039.patch
new file mode 100644
index 0000000000..4def7320b9
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32039.patch
@@ -0,0 +1,78 @@
+From 519c08d4720950dbeef8e671431ff8a6ea4e2927 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 16 Apr 2024 08:35:05 +0200
+Subject: [PATCH] fix integer overflow
+
+reorder check to prevent possible integer overflow
+
+(cherry picked from commit 3a2a241b8fcfee853e35cc54bec00375096fedd9)
+
+CVE: CVE-2024-32039
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/d88ad1acd142769650a6159906ac90f46a766265]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/clear.c |  2 +-
+ libfreerdp/codec/zgfx.c  | 16 +++++++++++-----
+ 2 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/libfreerdp/codec/clear.c b/libfreerdp/codec/clear.c
+index fadd98e67..0e169cf9d 100644
+--- a/libfreerdp/codec/clear.c
++++ b/libfreerdp/codec/clear.c
+@@ -410,7 +410,7 @@ static BOOL clear_decompress_residual_data(CLEAR_CONTEXT* clear, wStream* s,
+ 			}
+ 		}
+ 
+-		if ((pixelIndex + runLengthFactor) > pixelCount)
++		if ((pixelIndex >= pixelCount) || (runLengthFactor > (pixelCount - pixelIndex)))
+ 		{
+ 			WLog_ERR(TAG,
+ 			         "pixelIndex %" PRIu32 " + runLengthFactor %" PRIu32 " > pixelCount %" PRIu32
+diff --git a/libfreerdp/codec/zgfx.c b/libfreerdp/codec/zgfx.c
+index 4489b3798..3ed5067c8 100644
+--- a/libfreerdp/codec/zgfx.c
++++ b/libfreerdp/codec/zgfx.c
+@@ -23,6 +23,8 @@
+ #include "config.h"
+ #endif
+ 
++#include <assert.h>
++
+ #include <winpr/crt.h>
+ #include <winpr/print.h>
+ #include <winpr/bitstream.h>
+@@ -230,7 +232,10 @@ static BOOL zgfx_decompress_segment(ZGFX_CONTEXT* zgfx, wStream* stream, size_t
+ 	BYTE* pbSegment;
+ 	size_t cbSegment;
+ 
+-	if (!zgfx || !stream || (segmentSize < 2))
++	assert((zgfx) && "Assert failed: zgfx");
++	assert((stream) && "Assert failed: stream");
++
++	if (segmentSize < 2)
+ 		return FALSE;
+ 
+ 	cbSegment = segmentSize - 1;
+@@ -349,8 +354,9 @@ static BOOL zgfx_decompress_segment(ZGFX_CONTEXT* zgfx, wStream* stream, size_t
+ 
+ 						if (count > sizeof(zgfx->OutputBuffer) - zgfx->OutputCount)
+ 							return FALSE;
+-
+-						if (count > zgfx->cBitsRemaining / 8)
++						else if (count > zgfx->cBitsRemaining / 8)
++							return FALSE;
++						else if (zgfx->pbInputCurrent + count > zgfx->pbInputEnd)
+ 							return FALSE;
+ 
+ 						CopyMemory(&(zgfx->OutputBuffer[zgfx->OutputCount]), zgfx->pbInputCurrent,
+@@ -377,8 +383,8 @@ int zgfx_decompress(ZGFX_CONTEXT* zgfx, const BYTE* pSrcData, UINT32 SrcSize, BY
+ 	BYTE descriptor;
+ 	wStream* stream = Stream_New((BYTE*)pSrcData, SrcSize);
+ 
+-	if (!stream)
+-		return -1;
++	assert((zgfx) && "Assert failed: zgfx");
++	assert((stream) && "Assert failed: stream");
+ 
+ 	if (Stream_GetRemainingLength(stream) < 1)
+ 		goto fail;
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 9ad95e1700..c616a55958 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2023-40569.patch \
            file://CVE-2023-40589.patch \
            file://CVE-2024-22211.patch \
+           file://CVE-2024-32039.patch \
            "
 
 S = "${WORKDIR}/git"

