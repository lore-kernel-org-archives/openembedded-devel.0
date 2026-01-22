Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9EDD625F3
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 05:44:07 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31037.1769060641488948251
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 21:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EUu4GV23;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso5758895e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 21:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769060640; x=1769665440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gybwpHdc37L2sS1C0hKFh60Dqm5n/Swgiy6iMy9lKSM=;
        b=EUu4GV23oF2IvnnCkT9hludm6+cybG16aENr0HmMyJoSFv0OhgSzXWYeRVPIiwHIsb
         QHWIXxwgyK8uuNhrBIXTHJ1nqkyyLKcIo2TtDOrZW3mzFWJhnNsHKEFd/ej1098FjM6B
         aX+nAW7Tj2eW7xxzd2bbMHUuFGzxqy2BukwDcIndktNfchoGr1C8UJYp+t2NQAAKjYi9
         FCi8V8niiKQ+1gTmcqCWJGWkyWG0M3kHqwpClAWl3CkmFlq4FSlhrFCBM+6ptbm/0nfz
         eF3WV77B6CkGqCyeKB1lrjQhscx2tGM4Og4sAte/o33W5RHNWfDXdPWgLNZbwgeiIDdI
         sXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769060640; x=1769665440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gybwpHdc37L2sS1C0hKFh60Dqm5n/Swgiy6iMy9lKSM=;
        b=WwA55Fez4JO2pz3kOWBGiHKNtNeVQJ8KWAPqghTnS/2SAVlzslkpDIfbt6aqDs0FXW
         x+yLrK7/1FpHGRcFSATuU2t43zpA074XKGQRcfdGIiSAj6rYH3he1++KrCt6VSCQRCfL
         zyRX+/KkqQC4FzDKePdv82hzIPhr16yKCLal4Fo6oV/vaWZphnm3gnWv3qZEu8PsWJgS
         LfrjRE0CPWMFzL1uUNGNHF2xN9ulSKwk9tiN3MMi1hq426gg3Y3D9onyQyEIUZmjBlnK
         l6KCkn4mFXoZc2fgbvwPCDrP6dm4TJUzqd1YBNgZh6pLxTxXthBPn+SAIrUPYehu+pjy
         z94A==
X-Gm-Message-State: AOJu0Yz2+jKzp8azl6S5ksomp/Tq5jwseIa4R4YQMEXSpYs81NUVX5P6
	skKRMvDakZrx32Gs4CxqVd6vTA5MdbW5GaDKS+gPSi+sEvTC5klWyQhYzhmneA==
X-Gm-Gg: AZuq6aJXLN+wdz+4/1rjPMR3llQCJTUPOuxVc5tiDIjFBFCbqIH8qm4/CoP8aP2e6Ok
	ltwxoLAXzUyfb67h7SovSPql8RFRfjPlCaAkFSr2eM8jvRiF17Gwv5eOJZUTsXCwXrfWRlvXCyA
	GVTv7Tc/qkgMosRrLtPbIOGf7jtanc1oOWA+4Zv/93MxhN1F6Pj710eM+SxtCX301zPTYQZC4jI
	IeMSZVVXR1FzORTQmS43+vPG16KVT3sxUm94zh89Ph2Vzl1LbosC1du7GlyYX3s+fSJSxgScLaM
	1XJyMMB8yHBi/plFopVd7z1RrfjQlg8/KOIEEcykJAoXmYNPDV2hWte9bMaz25Jgz8FnEp4Gt25
	JtbmGylkObg2V61BfEsuUWKoaR4VjeuYcCVKIqKRgJS2P4RPuSobuCVbjmFg+rTWXUeLkatg/tH
	cYvbIoJeSS
X-Received: by 2002:a05:600c:3e0d:b0:47e:e2ec:995b with SMTP id 5b1f17b1804b1-48046a2dc0fmr33871295e9.9.1769060639728;
        Wed, 21 Jan 2026 21:43:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480424aa344sm43912035e9.3.2026.01.21.21.43.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 21:43:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] freerdp: patch CVE-2023-40589
Date: Thu, 22 Jan 2026 06:43:53 +0100
Message-ID: <20260122054356.3570391-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122054356.3570391-1-skandigraun@gmail.com>
References: <20260122054356.3570391-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 05:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123726

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-40589

Pick the patch that was identified[1] by Debian to solve the issue
on the 2.x branch.

[1]: https://security-tracker.debian.org/tracker/CVE-2023-40589

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2023-40589.patch      | 319 ++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |   1 +
 2 files changed, 320 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40589.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40589.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40589.patch
new file mode 100644
index 0000000000..8f87cae3b6
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40589.patch
@@ -0,0 +1,319 @@
+From 2bbed980cf8cf9066d96e9aa29afcedc540ee47c Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Mon, 28 Aug 2023 09:06:42 +0200
+Subject: [PATCH] fix index checks
+
+properly verify all offsets while decoding data.
+
+(cherry picked from commit 880285c332a1d98334fd8fa4b06c10fba0fb6959)
+
+CVE: CVE-2023-40589
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/c659973bb4cd65c065f2fe1a807dbc6805c684c6]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/ncrush.c | 137 ++++++++++++++++++++++++++++++--------
+ 1 file changed, 108 insertions(+), 29 deletions(-)
+
+diff --git a/libfreerdp/codec/ncrush.c b/libfreerdp/codec/ncrush.c
+index 3d6a216d3..c1d622a9c 100644
+--- a/libfreerdp/codec/ncrush.c
++++ b/libfreerdp/codec/ncrush.c
+@@ -1994,15 +1994,9 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BY
+                       UINT32* pDstSize, UINT32 flags)
+ {
+ 	UINT32 index;
+-	UINT32 bits;
+-	INT32 nbits;
+-	const BYTE* SrcPtr;
+-	const BYTE* SrcEnd;
+-	UINT16 Mask;
+ 	BYTE Literal;
+ 	UINT32 IndexLEC;
+ 	UINT32 BitLength;
+-	UINT32 MaskedBits;
+ 	UINT32 CopyOffset;
+ 	UINT32 CopyLength;
+ 	UINT32 OldCopyOffset;
+@@ -2010,9 +2004,6 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BY
+ 	UINT32 LengthOfMatch;
+ 	UINT32 CopyOffsetIndex;
+ 	UINT32 OffsetCacheIndex;
+-	BYTE* HistoryPtr;
+-	BYTE* HistoryBuffer;
+-	BYTE* HistoryBufferEnd;
+ 	UINT32 CopyOffsetBits;
+ 	UINT32 CopyOffsetBase;
+ 	UINT32 LengthOfMatchBits;
+@@ -2021,8 +2012,8 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BY
+ 	if (ncrush->HistoryEndOffset != 65535)
+ 		return -1001;
+ 
+-	HistoryBuffer = ncrush->HistoryBuffer;
+-	HistoryBufferEnd = &HistoryBuffer[ncrush->HistoryEndOffset];
++	BYTE* HistoryBuffer = ncrush->HistoryBuffer;
++	const BYTE* HistoryBufferEnd = &HistoryBuffer[ncrush->HistoryEndOffset];
+ 
+ 	if (flags & PACKET_AT_FRONT)
+ 	{
+@@ -2041,7 +2032,7 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BY
+ 		ZeroMemory(&(ncrush->OffsetCache), sizeof(ncrush->OffsetCache));
+ 	}
+ 
+-	HistoryPtr = ncrush->HistoryPtr;
++	BYTE* HistoryPtr = ncrush->HistoryPtr;
+ 
+ 	if (!(flags & PACKET_COMPRESSED))
+ 	{
+@@ -2050,17 +2041,19 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BY
+ 		return 1;
+ 	}
+ 
+-	SrcEnd = &pSrcData[SrcSize];
+-	nbits = 32;
+-	bits = get_dword(pSrcData);
+-	SrcPtr = pSrcData + 4;
++	const BYTE* SrcEnd = &pSrcData[SrcSize];
++	const BYTE* SrcPtr = pSrcData + 4;
+ 
++	INT32 nbits = 32;
++	UINT32 bits = get_dword(pSrcData);
+ 	while (1)
+ 	{
+ 		while (1)
+ 		{
+-			Mask = get_word(&HuffTableMask[29]);
+-			MaskedBits = bits & Mask;
++			const UINT16 Mask = get_word(&HuffTableMask[29]);
++			const UINT32 MaskedBits = bits & Mask;
++			if (MaskedBits >= ARRAYSIZE(HuffTableLEC))
++				return -1;
+ 			IndexLEC = HuffTableLEC[MaskedBits] & 0xFFF;
+ 			BitLength = HuffTableLEC[MaskedBits] >> 12;
+ 			bits >>= BitLength;
+@@ -2096,8 +2089,10 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BY
+ 				return -1004;
+ 
+ 			CopyOffset = ncrush->OffsetCache[OffsetCacheIndex];
+-			Mask = get_word(&HuffTableMask[21]);
+-			MaskedBits = bits & Mask;
++			const UINT16 Mask = get_word(&HuffTableMask[21]);
++			const UINT32 MaskedBits = bits & Mask;
++			if (MaskedBits > ARRAYSIZE(HuffTableLOM))
++				return -1;
+ 			LengthOfMatch = HuffTableLOM[MaskedBits] & 0xFFF;
+ 			BitLength = HuffTableLOM[MaskedBits] >> 12;
+ 			bits >>= BitLength;
+@@ -2106,13 +2101,23 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BY
+ 			if (!NCrushFetchBits(&SrcPtr, &SrcEnd, &nbits, &bits))
+ 				return -1;
+ 
++			if (LengthOfMatch >= ARRAYSIZE(LOMBitsLUT))
++				return -1;
++
+ 			LengthOfMatchBits = LOMBitsLUT[LengthOfMatch];
++
++			if (LengthOfMatch >= ARRAYSIZE(LOMBaseLUT))
++				return -1;
+ 			LengthOfMatchBase = LOMBaseLUT[LengthOfMatch];
+ 
+ 			if (LengthOfMatchBits)
+ 			{
+-				Mask = get_word(&HuffTableMask[(2 * LengthOfMatchBits) + 3]);
+-				MaskedBits = bits & Mask;
++				const size_t idx = (2ull * LengthOfMatchBits) + 3ull;
++				if (idx >= ARRAYSIZE(HuffTableMask))
++					return -1;
++
++				const UINT16 Mask = get_word(&HuffTableMask[idx]);
++				const UINT32 MaskedBits = bits & Mask;
+ 				bits >>= LengthOfMatchBits;
+ 				nbits -= LengthOfMatchBits;
+ 				LengthOfMatchBase += MaskedBits;
+@@ -2127,15 +2132,28 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BY
+ 		}
+ 		else
+ 		{
++			if (CopyOffsetIndex >= ARRAYSIZE(CopyOffsetBitsLUT))
++				return -1;
++
+ 			CopyOffsetBits = CopyOffsetBitsLUT[CopyOffsetIndex];
++
++			if (CopyOffsetIndex >= ARRAYSIZE(CopyOffsetBaseLUT))
++				return -1;
+ 			CopyOffsetBase = CopyOffsetBaseLUT[CopyOffsetIndex];
+ 			CopyOffset = CopyOffsetBase - 1;
+ 
+ 			if (CopyOffsetBits)
+ 			{
+-				Mask = get_word(&HuffTableMask[(2 * CopyOffsetBits) + 3]);
+-				MaskedBits = bits & Mask;
+-				CopyOffset = CopyOffsetBase + MaskedBits - 1;
++				const size_t idx = (2ull * CopyOffsetBits) + 3ull;
++				if (idx >= ARRAYSIZE(HuffTableMask))
++					return -1;
++
++				const UINT16 Mask = get_word(&HuffTableMask[idx]);
++				const UINT32 MaskedBits = bits & Mask;
++				const UINT32 tmp = CopyOffsetBase + MaskedBits;
++				if (tmp < 1)
++					return -1;
++				CopyOffset = tmp - 1;
+ 				bits >>= CopyOffsetBits;
+ 				nbits -= CopyOffsetBits;
+ 
+@@ -2143,8 +2161,11 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BY
+ 					return -1;
+ 			}
+ 
+-			Mask = get_word(&HuffTableMask[21]);
+-			MaskedBits = bits & Mask;
++			const UINT16 Mask = get_word(&HuffTableMask[21]);
++			const UINT32 MaskedBits = bits & Mask;
++			if (MaskedBits >= ARRAYSIZE(HuffTableLOM))
++				return -1;
++
+ 			LengthOfMatch = HuffTableLOM[MaskedBits] & 0xFFF;
+ 			BitLength = HuffTableLOM[MaskedBits] >> 12;
+ 			bits >>= BitLength;
+@@ -2153,13 +2174,23 @@ int ncrush_decompress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BY
+ 			if (!NCrushFetchBits(&SrcPtr, &SrcEnd, &nbits, &bits))
+ 				return -1;
+ 
++			if (LengthOfMatch >= ARRAYSIZE(LOMBitsLUT))
++				return -1;
++
+ 			LengthOfMatchBits = LOMBitsLUT[LengthOfMatch];
++
++			if (LengthOfMatch >= ARRAYSIZE(LOMBaseLUT))
++				return -1;
+ 			LengthOfMatchBase = LOMBaseLUT[LengthOfMatch];
+ 
+ 			if (LengthOfMatchBits)
+ 			{
+-				Mask = get_word(&HuffTableMask[(2 * LengthOfMatchBits) + 3]);
+-				MaskedBits = bits & Mask;
++				const size_t idx = (2ull * LengthOfMatchBits) + 3ull;
++				if (idx >= ARRAYSIZE(HuffTableMask))
++					return -1;
++
++				const UINT16 Mask = get_word(&HuffTableMask[idx]);
++				const UINT32 MaskedBits = bits & Mask;
+ 				bits >>= LengthOfMatchBits;
+ 				nbits -= LengthOfMatchBits;
+ 				LengthOfMatchBase += MaskedBits;
+@@ -2583,7 +2614,12 @@ int ncrush_compress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BYTE
+ 			}
+ 
+ 			IndexLEC = Literal;
++			if (IndexLEC >= ARRAYSIZE(HuffLengthLEC))
++				return -1;
+ 			BitLength = HuffLengthLEC[IndexLEC];
++
++			if (IndexLEC * 2ull >= ARRAYSIZE(HuffCodeLEC))
++				return -1;
+ 			CodeLEC = get_word(&HuffCodeLEC[IndexLEC * 2]);
+ 
+ 			if (BitLength > 15)
+@@ -2666,9 +2702,18 @@ int ncrush_compress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BYTE
+ 					bits = CopyOffset;
+ 
+ 				CopyOffsetIndex = ncrush->HuffTableCopyOffset[bits + 2];
++
++				if (CopyOffsetIndex >= ARRAYSIZE(CopyOffsetBitsLUT))
++					return -1;
++
+ 				CopyOffsetBits = CopyOffsetBitsLUT[CopyOffsetIndex];
+ 				IndexLEC = 257 + CopyOffsetIndex;
++				if (IndexLEC >= ARRAYSIZE(HuffLengthLEC))
++					return -1;
+ 				BitLength = HuffLengthLEC[IndexLEC];
++
++				if (IndexLEC * 2ull >= ARRAYSIZE(HuffCodeLEC))
++					return -1;
+ 				CodeLEC = get_word(&HuffCodeLEC[IndexLEC * 2]);
+ 
+ 				if (BitLength > 15)
+@@ -2687,13 +2732,23 @@ int ncrush_compress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BYTE
+ 				else
+ 					IndexCO = ncrush->HuffTableLOM[MatchLength];
+ 
++				if (IndexCO >= ARRAYSIZE(HuffLengthLOM))
++					return -1;
+ 				BitLength = HuffLengthLOM[IndexCO];
++
++				if (IndexCO >= ARRAYSIZE(LOMBitsLUT))
++					return -1;
+ 				IndexLOM = LOMBitsLUT[IndexCO];
++
++				if (IndexCO >= ARRAYSIZE(HuffCodeLOM))
++					return -1;
+ 				NCrushWriteBits(&DstPtr, &accumulator, &offset, HuffCodeLOM[IndexCO], BitLength);
+ 				Mask = ((1 << IndexLOM) - 1);
+ 				MaskedBits = (MatchLength - 2) & Mask;
+ 				NCrushWriteBits(&DstPtr, &accumulator, &offset, MaskedBits, IndexLOM);
+ 
++				if (IndexCO >= ARRAYSIZE(LOMBaseLUT))
++					return -1;
+ 				if ((MaskedBits + LOMBaseLUT[IndexCO]) != MatchLength)
+ 					return -1010;
+ 			}
+@@ -2701,7 +2756,11 @@ int ncrush_compress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BYTE
+ 			{
+ 				/* CopyOffset in OffsetCache */
+ 				IndexLEC = 289 + OffsetCacheIndex;
++				if (IndexLEC >= ARRAYSIZE(HuffLengthLEC))
++					return -1;
+ 				BitLength = HuffLengthLEC[IndexLEC];
++				if (IndexLEC * 2ull >= ARRAYSIZE(HuffCodeLEC))
++					return -1;
+ 				CodeLEC = get_word(&HuffCodeLEC[IndexLEC * 2]);
+ 
+ 				if (BitLength >= 15)
+@@ -2714,13 +2773,24 @@ int ncrush_compress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BYTE
+ 				else
+ 					IndexCO = ncrush->HuffTableLOM[MatchLength];
+ 
++				if (IndexCO >= ARRAYSIZE(HuffLengthLOM))
++					return -1;
++
+ 				BitLength = HuffLengthLOM[IndexCO];
++
++				if (IndexCO >= ARRAYSIZE(LOMBitsLUT))
++					return -1;
+ 				IndexLOM = LOMBitsLUT[IndexCO];
++
++				if (IndexCO >= ARRAYSIZE(HuffCodeLOM))
++					return -1;
+ 				NCrushWriteBits(&DstPtr, &accumulator, &offset, HuffCodeLOM[IndexCO], BitLength);
+ 				Mask = ((1 << IndexLOM) - 1);
+ 				MaskedBits = (MatchLength - 2) & Mask;
+ 				NCrushWriteBits(&DstPtr, &accumulator, &offset, MaskedBits, IndexLOM);
+ 
++				if (IndexCO >= ARRAYSIZE(LOMBaseLUT))
++					return -1;
+ 				if ((MaskedBits + LOMBaseLUT[IndexCO]) != MatchLength)
+ 					return -1012;
+ 			}
+@@ -2745,6 +2815,10 @@ int ncrush_compress(NCRUSH_CONTEXT* ncrush, BYTE* pSrcData, UINT32 SrcSize, BYTE
+ 		Literal = *SrcPtr++;
+ 		HistoryPtr++;
+ 		IndexLEC = Literal;
++		if (IndexLEC >= ARRAYSIZE(HuffLengthLEC))
++			return -1;
++		if (IndexLEC * 2ull >= ARRAYSIZE(HuffCodeLEC))
++			return -1;
+ 		BitLength = HuffLengthLEC[IndexLEC];
+ 		CodeLEC = get_word(&HuffCodeLEC[IndexLEC * 2]);
+ 
+@@ -2817,6 +2891,11 @@ static int ncrush_generate_tables(NCRUSH_CONTEXT* context)
+ 		else
+ 			i = context->HuffTableLOM[k];
+ 
++		if (i >= ARRAYSIZE(LOMBitsLUT))
++			return -1;
++		if (i >= ARRAYSIZE(LOMBaseLUT))
++			return -1;
++
+ 		if (((((1 << LOMBitsLUT[i]) - 1) & (k - 2)) + LOMBaseLUT[i]) != k)
+ 			return -1;
+ 	}
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 5122a2d057..e422d46a81 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2023-39353.patch \
            file://CVE-2023-40181.patch \
            file://CVE-2023-40569.patch \
+           file://CVE-2023-40589.patch \
            "
 
 S = "${WORKDIR}/git"

