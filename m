Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.11043.1605118409116033710
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2020 10:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lrCD9PPF;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id w20so1175688pjh.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2020 10:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=friex6R2tSeoEZGSI4Xy7EVIFAh5jsCB+55ilDEjJ3g=;
        b=lrCD9PPFIUAL/0DOrcjNGqR97DTyAqcDlHcaIXb6yfjnXtSM/ru9WpsbeCiaCEFl3i
         Xx5LmiSb0UPkBvSg26I7L1TcW/Uah1+3j1jL+9Mi8eKepM4btwvZWPjBYeGFTpeWarzL
         Mg3Ew2B/ou6eu+tklefe+NwyltmuvBICC7B4ru1BreSM9Uzu49weiI7S1xpuQrBKD13q
         eIrpqRZLvapo1Wy3kzg8idg+eE2ga6AAziFNrxkE+/ymyKS3gPCwJOMa7GMFq4IVTsem
         X7OiKJ8DvjEkKLwDMQp84dLrtxNgvVhOBQoygUYYdRjegyfQ3DXMcK1XI97q5VFtVJOQ
         Fj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=friex6R2tSeoEZGSI4Xy7EVIFAh5jsCB+55ilDEjJ3g=;
        b=rdJ0pnk6jxquoS2HjGUp5XOjZCOzzv8wwA3DDAdFG6puScou/chhWXAAYPEI/6PVAP
         +I/O4FkAzw3ZWsff6B35nwmV9RWV1JNW1mFxJtQjGm+mLOCoZRW/f+EKv3kMzBhxRKly
         GgEVHS1ZdUs9OYpME8grRfufK6JOrH1UMl2bwm2gWQ9VL0FpqTkY6HqM6f/byyydcPfg
         o1B4UeqF7p7Xewt9L4uinW0t6iPMAIDxLUmzTay74yKVATJZrJSQbyq2BIs5ziHVd7Ao
         5q/PXEMVnyuBfvenx/39lVzvFeAXhaVV+hZH010O2FfISwUl9eYX+aWKeBhyZivgF4b0
         Y07A==
X-Gm-Message-State: AOAM530rjG44rUvTOGQE2gsL74xovqWww7Hb1nyBxH6TcSkUsZhnnoC6
	DTenblB//FU3RyjPucyKENPDnGsW9dyynQ==
X-Google-Smtp-Source: ABdhPJzgJ1qpiH4KE/mTNBSo9MbG1VtbgfcwkTw6+E260MOBNnPR/z9xmBBh2+HL+7CGW6c29v8zPA==
X-Received: by 2002:a17:90b:154:: with SMTP id em20mr4953493pjb.114.1605118408119;
        Wed, 11 Nov 2020 10:13:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id x4sm3264751pfm.98.2020.11.11.10.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 10:13:27 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-cvxopt: Exclude from world builds
Date: Wed, 11 Nov 2020 10:13:22 -0800
Message-Id: <20201111181323.897884-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it needs lapack which need fortran

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
index b440d62bd5..ef06b56022 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
@@ -17,3 +17,5 @@ inherit setuptools3
 export CVXOPT_BLAS_LIB_DIR = "${STAGING_LIBDIR}"
 export CVXOPT_SUITESPARSE_LIB_DIR = "${STAGING_LIBDIR}"
 export CVXOPT_SUITESPARSE_INC_DIR = "${STAGING_INCDIR}"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.29.2

