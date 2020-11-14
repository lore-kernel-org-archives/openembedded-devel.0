Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.13122.1605395293892201698
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 15:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M+UCzvM1;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id w11so6277910pll.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 15:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cxgM+QmHvDC7xb58P7iVBntPEhv4zdzoISmo/M6lhPE=;
        b=M+UCzvM10QWAc44fyihvdG5SdBI5x/xANN2E+DX85I7n+7M4gKMz59L5X9qjBZbTEX
         +VbYL7c779hoQJt8NzjbQ0UU6DeHf0tlCUJT5cl2u+vwCKcU7s7QdHJfzZzYdQwNWAxC
         vsmwxuYnpEZlFF8JpPTmTTt0gTsXG3Z8TJkiD/mo5yq2mBkyGVzu1DF0DpxsnyP0dSrN
         FaumRXOypyG5ZaKspxeuP17wo60tCJSg8Qiv5g5GSqpHoSCZLj6WowCON+AEQFy2x7jP
         cMhnpunf40XABViAUqpNnvZt/QbBiQ3nzTbCU+7oXQLIpm2nPzIu9ub8bEiAgl6S0y1b
         BDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cxgM+QmHvDC7xb58P7iVBntPEhv4zdzoISmo/M6lhPE=;
        b=pv1J2hTClAkSx5BYi3D+ibYR2F0nhkoFTq1haDeNItwwG1db7cHQ7YvPg5efNiVDyw
         5yNKpXNuVnUECpnTeATIFHAgP7t3p2o4vaDRbBrTVVA+SpAiADVs8bEQy3NglQhJQtd6
         71dayVOc939EN1+RvYM7tt6UVOtVD3GCJRzClUrAskgHtIIE3dLEvBZigMUGxXvmMw96
         SEojMqTYNjddO5hnAvgPPv0dVac0+9I9c5CHNaRcEeTtCa7IwTwVUhmWwKSq3+yYQYKr
         RpYohTM3zM4guJ8GMmGjH8AR5mTUfkAQ0f+vv5wMscWFMk7kKVGQ6nFO8XwwZ0kr/fqX
         aGhA==
X-Gm-Message-State: AOAM5313xImBIjLsppLorcvb2A0z8bqL+ct/uswsZCYzj6qgrgpHJRYm
	F/t6IoNxSDx/dUKSO214dgSzcFSEd2NsBqIK
X-Google-Smtp-Source: ABdhPJxxJWiEDu8CaxTWKw8rpuht3OCV1hiIz2lmdDQXjBd9Fk1M25tZsXkMb1NEmxuA6D0UjG75Lg==
X-Received: by 2002:a17:90b:a4b:: with SMTP id gw11mr2399423pjb.157.1605395293239;
        Sat, 14 Nov 2020 15:08:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id v191sm13520318pfc.19.2020.11.14.15.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 15:08:12 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/4] projucer: Link with libatomic on rv32
Date: Sat, 14 Nov 2020 15:08:05 -0800
Message-Id: <20201114230806.370074-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114230806.370074-1-raj.khem@gmail.com>
References: <20201114230806.370074-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
include/c++/10.2.0/bits/atomic_base.h:374: undefined reference to `__atomic_fetch_xor_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/juce/projucer.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-multimedia/recipes-multimedia/juce/projucer.inc
index fc8baa45b4..ab0f23879f 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -34,6 +34,7 @@ EXTRA_OEMAKE = "V=1 JUCE_ARCH_LABEL=${TARGET_ARCH} TARGET_ARCH='-g'"
 LDFLAGS_append_mipsarcho32 = " -latomic"
 LDFLAGS_append_powerpc = " -latomic"
 LDFLAGS_append_riscv64 = " -latomic"
+LDFLAGS_append_riscv32 = " -latomic"
 LDFLAGS_append_armv5 = " -latomic"
 
 do_configure() {
-- 
2.29.2

