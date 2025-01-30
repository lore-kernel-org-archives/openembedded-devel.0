Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE42C0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 01:44:16 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.6652.1738201439719291502
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 17:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BQl+65LD;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2161eb95317so4065125ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 17:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738201439; x=1738806239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66nJ/dLuIdVwZ8ThuG7yfGAZLJ91vCTedp9HV1e2ZYo=;
        b=BQl+65LDrVyFAaXLuFk3tOry2TNAXENNpoJC9X3bn2ZykAFjHUG3EnkokqKnDmohKw
         2gmMSu2OizHVOuV3PTKZ1THnJAIyG4df+JkUGSZYdjuUoJaZc5FivPPIvANceWp+Eq7D
         xpz5C4Rmrm/Wy3WOxA/GNH0EXJKcMvHCzE5G8gRP4sodgSVbJ/mjCJVqcbsfo/++ZIvl
         oPkd9ZNBysf9KSDTKTEqy41vfczvWco0/q74G8mRkUz5jWL3DvMitP7vmDuaaen/oxyV
         JKjR/W4o9JszS/xaPGrooA5utYxJnaQc2KsjyYRDbzio1Vl4IGwBsdRUP6aBDy/axlBB
         h9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738201439; x=1738806239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66nJ/dLuIdVwZ8ThuG7yfGAZLJ91vCTedp9HV1e2ZYo=;
        b=VehtInexi93cZ434fHdWSs+WkEpMR/u+XCa6gXR1In2ZjEWZGuxr9Q8k7zbB/P0LMy
         NM+0RufMFOFUgiTr4Ht6bidiqgbprY1tywXXB/i/0n/K5z6qfj9eztN1JHqBiI68SKSu
         F0h5YVUHsFIYlJ7+Wg7R+lhM+pUVZ2C3AWOOB03dSA3cjZW250o9zute1iCHMqXznRHN
         UsxnIiATwx/r7T1m0UEAdzQseqts8r2xIFkPM9CSu5aCOa7hhuwGfzlLD5dnPQhSjeCh
         DfLBXsLfCyBfHz85nHuilokHV8Cys06M84B0cNp/ATxrQ6NaIyHztI/imdj9EytwULZu
         dbMg==
X-Gm-Message-State: AOJu0YwhjkwXb0G4sXvS4Bcww8zct4Ur9Lpb73lrwu4wdF3j7CNV6DBV
	DuqRIaw3fhniMH0Mk04UueHG8Kws1FwbaflJBiFV3o12+s/YuWcETtOYFCAi
X-Gm-Gg: ASbGncupErt9Rvr91tK71erfmN3NGad4e+dQ+5q5iqocaTMr487CauBplNN0FCBUqBL
	Bd27/VZSCNXkFuCLJ803/aqYliysFkIBiswtPdOjkpzR6/4Kw36Bab7b0F1XwzreqcDLb6TLeoN
	kGoXoslxTzg7Z+Kdk5NGNdJSCpFlTCxpABqRTNa5LnGxNCwC+5/YWHFPy/lUTn8yelFU67ucH8G
	9NH6836VaFgxhAdFn17DrWRZwadAXLm6Oy8bFThcf9h5X2mMRCdhM0dek4w0i0M+9FIVHsc3tPJ
	9bKUrlA=
X-Google-Smtp-Source: AGHT+IFvEiJCGUEV+s+554/o+b0NgLLJetmLe3JLWLCnmVXjBXn6CaPpKCrPjcm/0xGlUwUVxXlggg==
X-Received: by 2002:a05:6a20:3d8e:b0:1e1:abd6:ca66 with SMTP id adf61e73a8af0-1ed7a52c061mr9412134637.24.1738201438713;
        Wed, 29 Jan 2025 17:43:58 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c09e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6427abdsm188532b3a.59.2025.01.29.17.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 17:43:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] opencl-cts: Disable for RISCV architectures
Date: Wed, 29 Jan 2025 17:43:54 -0800
Message-ID: <20250130014356.1610566-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 01:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115144

Its not yet ported to RISCV architecure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
index 69181916b1..a65c3da7fc 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
@@ -26,3 +26,6 @@ do_install() {
 	 find "${D}${bindir}/opencl_test_conformance" -name cmake_install.cmake -type f -delete
         find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -type d -exec rm -rf "{}" \; -depth
 }
+
+COMPATIBLE_HOST:riscv64 = "null"
+COMPATIBLE_HOST:riscv32 = "null"

