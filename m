Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C01C3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 05:19:13 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.355.1748582345923649007
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 22:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZAhk76c+;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e033a3a07so23467905ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 22:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748582345; x=1749187145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMNDGvKyTmrPEP7oRr358y7vlmFEfZicpZ32YJL/ju8=;
        b=ZAhk76c+rXRKoMtTAfAaWTCNfBBP/S7PLJFxNBgJDqJw63kgLbfEubGkVLVsHlToEL
         ZXMNLWP0jfxoGUnklDfw93X8OmvDLs72VOEX3dPcH7HFC8GmRyE+TLNTfzBv+Qmr1hIx
         kxB4AXmBsjHFS73VRTzm8X7Jh6ohpcZYkgXH6AlfdztfoxQaOYgxsshr4SdgWH2VCzJY
         H56OQzTXUAl/OL3UL3lFUeL9qJeblM1CDoIqsa8R1v9drQEtWmCMRaxFbexoiZYlJLH1
         UXXLcyIb6fxZSRmsezy7NE22uPaZKB175DKY1jpdCBFwMwhETC1mVEZzz+LPIS06YuJn
         ZTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748582345; x=1749187145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMNDGvKyTmrPEP7oRr358y7vlmFEfZicpZ32YJL/ju8=;
        b=SUlb3V4UFFTTuOAyhqOh8CxVm313DLiLp1i0wHzZB/6RJwpW8KNwLnAtt7YlgZ8N2w
         6a27mHajuwH8ax8ih6vpa4LjIPpeAL2w4KJ1l5vlNGPHoRY/rBxh7qXHWZskRcs75cE8
         kNyR5y2+/ys1a69efnNL7SGS2Gmdqao/uBYZ1n/7xeXRmzGbaNSdVPzQG46AclPT1STU
         nZSQvsRGmTRK+YgWtyXqMjbec/Mtd4Ckm1q6ZxLcVfZSwt84XzVVGjU1mWj5qXLdGxr9
         fLWSoZS8jGZBrpkhMzzpoyzY1yJ6A5ulOBmLSXaZpXpP7WS2E5p+EIRJ/3EVPGrGnDDY
         KULA==
X-Gm-Message-State: AOJu0YzVMuQvgfAlmbw+ocER3Gr8eDE28ayfL1oGok9qJft0GIVe9Fig
	aHOxVnNe+jvjmMNfPgA4yd7GXAKw/mWC3gatr3mfPelChSVmsJ5mbiYxM/SPP+nm
X-Gm-Gg: ASbGncuigCunyI0y97n0YQaKgLLPD3yxAGVkQYpZEFBh7CoGUz/NLGBP8enERLq69ss
	cKfFEKxEQf6K0u0GEmP3o0YFFnh+7pj/lQ0x9Vlv2rVpqfIuVn34UComMrViVfpZf+ih9zI55Oc
	KfzG+IYmRtXtlNany0sWJh7kVJEJ3xCbx3TpwQWqPDgfVtMcmrzh8Wgy87m8uCJ2hBaNRHUHj2v
	lhN4QZt5kJwVsM+g2XOB5ls3RaEOouuZ/sbyjTKzbZBKa9zDrOXq0Tt1KoLbQKk78idthmzPka8
	XnwfL7c01AhCaaNBulPeCjQO2J3cpPgW205Czt//65jTtf9bqyI1Kw==
X-Google-Smtp-Source: AGHT+IGQoIcjx8/91rDc5tQ0YnDb6VBVvUV8OCkIZBzgm7B0PCl64laXtlSs9FwzdNzzfv0PwdhnyA==
X-Received: by 2002:a17:902:e888:b0:234:c8f6:1b10 with SMTP id d9443c01a7336-235291ef73bmr37579275ad.28.1748582344978;
        Thu, 29 May 2025 22:19:04 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2c49d4sm417254a91.18.2025.05.29.22.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 22:19:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] aom: Disable rvv on riscv32
Date: Thu, 29 May 2025 22:19:02 -0700
Message-ID: <20250530051902.1976322-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 05:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117669

Current implementation explicitly add rv64gcv to
-march, which means its not yet tested on rv32gcv
so disable RVV on 32bit RISCV for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
index 681ebb4d3d..94e3f4f14f 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
@@ -21,6 +21,7 @@ EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=1 -DENABLE_TESTS=0 \
 CMAKE_VERBOSE = "VERBOSE=1"
 CFLAGS:append:libc-musl = " -D_GNU_SOURCE"
 EXTRA_OECMAKE:append:arm = " -DENABLE_NEON=OFF"
+EXTRA_OECMAKE:append:riscv32 = " -DENABLE_RVV=OFF"
 
 do_generate_toolchain_file:append() {
     echo "set(AOM_AS_FLAGS --debug-prefix-map ${S}=${TARGET_DBGSRC_DIR})" >> ${WORKDIR}/toolchain.cmake

