Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48009.1795411812239621548
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hBS4gHzl;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380c28f9e35so3961808eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411812; x=1796016612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCHmAnXap+Zyj7OMounKubRCkaskWgSdadrOFLDw3c4=;
        b=hBS4gHzlvOozqDVjcDUGwkx9JrvbpN0oHCisAKmF52wtBoh9X0ihuSdevXWFfbWslf
         ygcH/pP29ebzmqzTfqGja1DcYIT6l+eCNe+nbGPxnydJj3vCMQdiPDcb0bjy6wDVy3Fw
         rHiAuPVr52Lbnkeqcdvi1gsxDlFWgtzsWo4OrYQeqVYpCW7YEm1uI6eA+ylgwIwEN26L
         JNjiT10YqQERwbEqUeyGv/59oV9mkjzDX/DhKpJaqWnnk3TlrMWXbwM4OjxCThYBrfsB
         aH66i/D5MZiy+haeByWTM6hF0ByxPlbq+ng61SkSuIlo6n9znhww5xLLu0uw/baEhQor
         ZyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411812; x=1796016612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vCHmAnXap+Zyj7OMounKubRCkaskWgSdadrOFLDw3c4=;
        b=Exde71woUCYqpfNMDjJGWsxa7Ny+GEcRHkoA/YhGkcxXWcaBdcyMCuASJGMFJnb2QY
         b2a6SPlTBwju55W9RogvC2pgGLHnJK5IPlWQO93YqLTXzYQqYGG6zjpXSIR7mjVtc1G4
         N5h2qoIX2IY60PP8PdaM5aNMkJFr+JQ7CuOVzVzRMktDFFV1LZ+95r9KRS9eCpfS6l5Q
         fRYLY6DlPEzQU3loQHg0u03Ku6qoFSeiplnsHUjo7VVstbWSv0cLElWU5IjrwxxFMgJ9
         vJmPKhTls/vg+Y7M2qJFsUx4vRZodR4aewpPMxtH5U+iNBf4iHi1wlUn+1zuAaGo8dlp
         virw==
X-Gm-Message-State: APuU4Z9rDh9qZecedqIuZ9XffmuBU6dMD6bKqM0QoAJ0TsOp2DUuSjSv
	17k2unRkP3eu6Ex3ydwH2miXKruU2LkYgHbZucHvHqAX41hlZU+SRlNtIAKwKnLTKho=
X-Gm-Gg: AZFdTZcuCL5rmMGpugy4F0E8vYmhJi8xA0QXiYUb2kMsxkDdy7lRBrJTI3RjHkuy3Xx
	dPlBwTtdVudEEkIPWQSvo7vd+KKKvcoeqmF/51YqOhBkJsCir6Cs6bBtzGiJkAU2agRE8YS2Nhr
	DJ1CtLxOlQ8poPZ06c4BpBH8Alw7SddIzKAJ7E7tzhObKND10ON8g2FbZB3DIvjhaUiwnqxi/3y
	7rulS/cdWcWK/tKZNXYMHB9+M+x+8x+xkUDhvJy5nxNHuBofrkTGehzTfBVu4OxSnHZgolrTK7g
	UFMMKMSxbAtVKzIkUmYc6fZ/RUkg+ViUksinyDxGVCa54DOmFIdHB0m5wi0yvnVRwEREqk+jnbO
	0dDKhSILyQkJRpjH8MB5nGO0Kt9jegzu3cXznO96uuI28nTYgp7piTy4DhGUc5ImPtpOrj9YEJ8
	22vMy2LUpKtwBqKXqbbA2u1a89MS3L8Wp4ZBVaz9bLb9Dzq4yvgm9xl9yeQxds5W3EUtXVWz4LP
	s2A45/06mzkxaHgAZnt9LLf3dIfsWNSE+KYIcNRm2MlGcFiyhQMp+MVpehTw4IDn97br9Pu/jRM
	hdTOScf6VyQXS4rA1LiPxzSTuT+woZF9bi0JlqWjIAIYe2vjHb3ZqgJdUsdEG16uTG+fN3EtLIf
	GoZLoMVSrISK1Wtqziu+xtB8FYJExs7SdedJUZ0cxVdPtokbm1LfTG7b9Pxn2s4pjRBDsv/jAiy
	0zxTbEuAw0nV6kDI/i0yvE0i/HiMLs7dmv5mNKU0BqGSPTL4gU015daTGq7ix5nvmtGzShgsLK6
	M+QwJTXPAoQ2bcaAs9TGuh4VI2A37yGkIyAaYWcUTb+AIlSicxTvC5bLrmzmLpo12rZwUQoHfRq
	B7jo
X-Received: by 2002:a05:7301:8616:b0:385:9424:5c08 with SMTP id 5a478bee46e88-38594245c66mr11875095eec.4.1795411811519;
        Sun, 22 Nov 2026 21:30:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 1/6] dav1d: upgrade 1.5.4 -> 1.5.5
Date: Sun, 22 Nov 2026 21:28:28 -0800
Message-ID: <20261123052953.3658549-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132799
Content-Type: text/plain; charset="utf-8"

Minor release focused on optimizations: new and faster x86 (SSE,
AVX2, AVX-512), AArch64 and RISC-V assembly for CDEF, loop filter,
loop restoration, intra prediction and more, plus faster refmvs,
palette and film grain code. Fixes an out-of-bounds read in high
bitdepth SGR AVX-512 assembly and several allocation-failure paths.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/dav1d/{dav1d_1.5.4.bb => dav1d_1.5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/dav1d/{dav1d_1.5.4.bb => dav1d_1.5.5.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.4.bb b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.5.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.4.bb
rename to meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.5.bb
index ed45711b12..7fb7db3288 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.4.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.5.5.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=48d9210a87a24f62609b5a4f777d8dfe"
 
 SRC_URI = "git://code.videolan.org/videolan/dav1d.git;protocol=https;nobranch=1"
-SRCREV = "54706fc6bc0cdecab7e9593974a4039cc038fca7"
+SRCREV = "6c7bee685677fd997a431302be4fea8ea4017606"
 
 DEPENDS:append:x86 = " nasm-native"
 DEPENDS:append:x86-64 = " nasm-native"
