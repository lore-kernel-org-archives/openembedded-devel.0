Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2DACCD184
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 18:13:54 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.5330.1760206426864735824
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 11:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FyC35zN1;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7ae31caso598156466b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760206425; x=1760811225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eH7gjwo+rTm8utu8QJoxvKXIZ/uev3JqEnDRcZ7WXs0=;
        b=FyC35zN12zivqrxwlYU5gmccSqczKqkKJ4aYCRiD7/DWC1OYvb+Tbv5D4ZXRRmo4YZ
         DfnoSUpKA504vrHU9fdh3y6TytxNXkcx1VGnezxkAqPn0YqZqe1L6jpPqdiD5zcVJxNl
         n7kGtdPogE8L6SYbk2UdD363U9UN6Rw4KlH+vA4QoTTONbSpq8ANktjEnSeKrMsjui4k
         HvpSjnlspMs7aBnVwF6Bn4AFl09bvENfKf4+7WFRQcUy4enZhYNb1+nN2+PogoaCZ2QK
         o//POp2Jjd6AqAdpses394ZPRt2X0jkPZ8DIx+zmmwtnT9/8SdHAlvXYWtHspIVMQXo2
         jxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760206425; x=1760811225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eH7gjwo+rTm8utu8QJoxvKXIZ/uev3JqEnDRcZ7WXs0=;
        b=eKmPQ9focZrVA5dMB+j5lBJcUNem97WlthtrcFlE1uljOncofdH3iA+Pq5digP3/9O
         p5hfG5Lh6k6Y0mr3694yWnvC52RZo7Oo6xClvyT1ffiuR2Tjuwq5LlClR0bAPDGdbCKB
         X+WKrq+Iv7tt+htBm6kP469dIN4/z8tmwV7/eLuvMqwz/FLw2QlSt+lufwdK480Dyf4d
         62xlN5XoFNGhwTlhZAPNM3OPzYBlfEcxhVhGwAXl0dIxkZ3ZjUoKEom/+19sVhzuGqsM
         /HZ0vPx+e+iQSqzJOgJFCNQkuR+bGzopP+VXFJkvFyb7wFwm+k2kEH5Wi9gphgYCp61O
         WxHA==
X-Gm-Message-State: AOJu0YyGfOHibeIzPVxDscLFU2YrsakZG7oK48sws4kEf0j/JXCKC2Yx
	9JYsI1y1ccJ/HMjaz411Dnj95vTiM4qVwJCTGJSSOsiHYPU7BhHCjdwf2BqL3g==
X-Gm-Gg: ASbGnctMA9Qj4UNyF9lsp7d8D1sRI3FAC26zO1DkiCLaYjYFQJ6PbD8sy5LlxnHf//p
	qoTLoZAVEy+jgWjTd2jk6zM/yb5HOb1oj24QcMraIAiPVbfwWoqrjWYWy0DahvtW1htfLRzPl8p
	PPbDpl1zONiD5jhNo5iIiX+f1fbRvy3OgV2F6L1sLVMgiJLBdPeBOaCUpYvuR+Kpwsll9VCEk50
	Trv2mv9NzgRmAGcSgVD4typrXoxsw4gcD94lkC2drvO7eUC6ZIm0ZEx3IygEe4k7R9+gH0F4Lt2
	xiM50MuTzM01Cpg+Cwz1lt/Mc0yEE6Y8Wdjd2TgVgLaKLLaihAJTQMrzUtMJ4/dPbcdI5mylCHn
	s3YxZ/0EmCYutRHxjKnzhiJV4jy6pdwnoi0gn62v+dyUkEokp1A==
X-Google-Smtp-Source: AGHT+IFUZu/2C3mDno88s90yiKfj+bkOApZLmXssM+I9yPU5OBHbVLcTdyD3g8qm5rtIkFDm704CPA==
X-Received: by 2002:a17:906:fac6:b0:b54:185f:359d with SMTP id a640c23a62f3a-b54185faa9amr1017467366b.26.1760206425040;
        Sat, 11 Oct 2025 11:13:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm547156166b.7.2025.10.11.11.13.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:13:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 08/10] freerdp3: patch CVE-2024-32660
Date: Sat, 11 Oct 2025 20:13:37 +0200
Message-ID: <20251011181339.2127670-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011181339.2127670-1-skandigraun@gmail.com>
References: <20251011181339.2127670-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120507

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32660

Pick the patch that is mentioned in the above CVE report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp3/CVE-2024-32660.patch     | 151 ++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32660.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32660.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32660.patch
new file mode 100644
index 0000000000..5e0d679467
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32660.patch
@@ -0,0 +1,151 @@
+From 466ffba85665107f23cbc25ee4563e5638dcc4cd Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Sat, 20 Apr 2024 19:59:48 +0200
+Subject: [PATCH] allocate in segment steps
+
+do not trust the uncompressedSize of a ZGFX_SEGMENTED_MULTIPART and
+allocate the output buffer in steps after decoding a segment.
+
+CVE: CVE-2024-32660
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/5e5d27cf310e4c10b854be7667bfb7a5d774eb47]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/zgfx.c | 75 +++++++++++++++++++++++++----------------
+ 1 file changed, 46 insertions(+), 29 deletions(-)
+
+diff --git a/libfreerdp/codec/zgfx.c b/libfreerdp/codec/zgfx.c
+index b7ee27511..3a9d2e526 100644
+--- a/libfreerdp/codec/zgfx.c
++++ b/libfreerdp/codec/zgfx.c
+@@ -382,16 +382,46 @@ static BYTE* aligned_zgfx_malloc(size_t size)
+ 	return malloc(size + 64);
+ }
+ 
++static BOOL zgfx_append(ZGFX_CONTEXT* zgfx, BYTE** ppConcatenated, size_t uncompressedSize,
++                        size_t* pUsed)
++{
++	WINPR_ASSERT(zgfx);
++	WINPR_ASSERT(ppConcatenated);
++	WINPR_ASSERT(pUsed);
++
++	const size_t used = *pUsed;
++	if (zgfx->OutputCount > UINT32_MAX - used)
++		return FALSE;
++
++	if (used + zgfx->OutputCount > uncompressedSize)
++		return FALSE;
++
++	BYTE* tmp = realloc(*ppConcatenated, used + zgfx->OutputCount + 64ull);
++	if (!tmp)
++		return FALSE;
++	*ppConcatenated = tmp;
++	CopyMemory(&tmp[used], zgfx->OutputBuffer, zgfx->OutputCount);
++	*pUsed = used + zgfx->OutputCount;
++	return TRUE;
++}
++
+ int zgfx_decompress(ZGFX_CONTEXT* zgfx, const BYTE* pSrcData, UINT32 SrcSize, BYTE** ppDstData,
+                     UINT32* pDstSize, UINT32 flags)
+ {
+ 	int status = -1;
+ 	BYTE descriptor = 0;
+ 	wStream sbuffer = { 0 };
++	size_t used = 0;
++	BYTE* pConcatenated = NULL;
+ 	wStream* stream = Stream_StaticConstInit(&sbuffer, pSrcData, SrcSize);
+ 
+ 	WINPR_ASSERT(zgfx);
+ 	WINPR_ASSERT(stream);
++	WINPR_ASSERT(ppDstData);
++	WINPR_ASSERT(pDstSize);
++
++	*ppDstData = NULL;
++	*pDstSize = 0;
+ 
+ 	if (!Stream_CheckAndLogRequiredLength(TAG, stream, 1))
+ 		goto fail;
+@@ -403,16 +433,15 @@ int zgfx_decompress(ZGFX_CONTEXT* zgfx, const BYTE* pSrcData, UINT32 SrcSize, BY
+ 		if (!zgfx_decompress_segment(zgfx, stream, Stream_GetRemainingLength(stream)))
+ 			goto fail;
+ 
+-		*ppDstData = NULL;
+-
+ 		if (zgfx->OutputCount > 0)
+-			*ppDstData = aligned_zgfx_malloc(zgfx->OutputCount);
+-
+-		if (!*ppDstData)
+-			goto fail;
+-
+-		*pDstSize = zgfx->OutputCount;
+-		CopyMemory(*ppDstData, zgfx->OutputBuffer, zgfx->OutputCount);
++		{
++			if (!zgfx_append(zgfx, &pConcatenated, zgfx->OutputCount, &used))
++				goto fail;
++			if (used != zgfx->OutputCount)
++				goto fail;
++			*ppDstData = pConcatenated;
++			*pDstSize = zgfx->OutputCount;
++		}
+ 	}
+ 	else if (descriptor == ZGFX_SEGMENTED_MULTIPART)
+ 	{
+@@ -420,8 +449,6 @@ int zgfx_decompress(ZGFX_CONTEXT* zgfx, const BYTE* pSrcData, UINT32 SrcSize, BY
+ 		UINT16 segmentNumber = 0;
+ 		UINT16 segmentCount = 0;
+ 		UINT32 uncompressedSize = 0;
+-		BYTE* pConcatenated = NULL;
+-		size_t used = 0;
+ 
+ 		if (!Stream_CheckAndLogRequiredLength(TAG, stream, 6))
+ 			goto fail;
+@@ -429,17 +456,6 @@ int zgfx_decompress(ZGFX_CONTEXT* zgfx, const BYTE* pSrcData, UINT32 SrcSize, BY
+ 		Stream_Read_UINT16(stream, segmentCount);     /* segmentCount (2 bytes) */
+ 		Stream_Read_UINT32(stream, uncompressedSize); /* uncompressedSize (4 bytes) */
+ 
+-		if (!Stream_CheckAndLogRequiredLengthOfSize(TAG, stream, segmentCount, sizeof(UINT32)))
+-			goto fail;
+-
+-		pConcatenated = aligned_zgfx_malloc(uncompressedSize);
+-
+-		if (!pConcatenated)
+-			goto fail;
+-
+-		*ppDstData = pConcatenated;
+-		*pDstSize = uncompressedSize;
+-
+ 		for (segmentNumber = 0; segmentNumber < segmentCount; segmentNumber++)
+ 		{
+ 			if (!Stream_CheckAndLogRequiredLength(TAG, stream, sizeof(UINT32)))
+@@ -450,16 +466,15 @@ int zgfx_decompress(ZGFX_CONTEXT* zgfx, const BYTE* pSrcData, UINT32 SrcSize, BY
+ 			if (!zgfx_decompress_segment(zgfx, stream, segmentSize))
+ 				goto fail;
+ 
+-			if (zgfx->OutputCount > UINT32_MAX - used)
++			if (!zgfx_append(zgfx, &pConcatenated, uncompressedSize, &used))
+ 				goto fail;
++		}
+ 
+-			if (used + zgfx->OutputCount > uncompressedSize)
+-				goto fail;
++		if (used != uncompressedSize)
++			goto fail;
+ 
+-			CopyMemory(pConcatenated, zgfx->OutputBuffer, zgfx->OutputCount);
+-			pConcatenated += zgfx->OutputCount;
+-			used += zgfx->OutputCount;
+-		}
++		*ppDstData = pConcatenated;
++		*pDstSize = uncompressedSize;
+ 	}
+ 	else
+ 	{
+@@ -468,6 +483,8 @@ int zgfx_decompress(ZGFX_CONTEXT* zgfx, const BYTE* pSrcData, UINT32 SrcSize, BY
+ 
+ 	status = 1;
+ fail:
++	if (status < 0)
++		free(pConcatenated);
+ 	return status;
+ }
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 8649e28ecb..80e8f5f93f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32460.patch \
            file://CVE-2024-32658.patch \
            file://CVE-2024-32659.patch \
+           file://CVE-2024-32660.patch \
            "
 
 S = "${WORKDIR}/git"

