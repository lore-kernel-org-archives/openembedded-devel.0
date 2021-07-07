Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.624.1625678964620983108
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jul 2021 10:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u5xyBNhW;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id w22so2841913pff.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jul 2021 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nb2Rgx3CURqkFULFt4IRpw72C1QAYb7hQ+m8jWkMQjQ=;
        b=u5xyBNhWkCRxOIEYY6sJXFJu9dRX7KF0ayV0hRFXWU7FiKk3PfCzBCEJrEC0RMqUxk
         8PG/r9znspvv9FDwu/kC9monwJmk0bp6P3Sasrs4UPsmVyOQKbrnwutXla4He0O5pEB8
         Y+AS9ZTrxoqCfwQkS7mTDYMbAiksnIVYTDqIZPkhRLgEXlTnIKOx4FK3IwuW364ZTkJV
         yCrpgEoE2KL90s7g2AQ8rgrxrV1f4414pCSyduT1DH5CkE2BsYfUPh+NS7kaIop5gHKy
         /943+r1b+aE8yQ4onIfvX5C+sZK5VShnwbNxY4NuSReUf3vjxyjnhoaIOKoyH62E1rR3
         AUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nb2Rgx3CURqkFULFt4IRpw72C1QAYb7hQ+m8jWkMQjQ=;
        b=bvf9rawzgowdyGpN/yYhbvm36L6ajbW5D/AZSL2HsBOlMMXYp+jZQ8PigRAAGzk+i7
         o96/oQkWPMWsW2WCWEFthNSjXQAi/bRTeBmWd0RsidEJINYCSJE84z3m+nyQ8d+eKfrx
         DAz0iJ4p52Wqpgx/On9nkIipM7kKOrNLsCwNxEchwh2JvUUxAk7U9ihTYljWnSCaLs2s
         W/AlDD1tZ2HXCeftZH50B2a1Gz1Mid3EtPDa6zJGGpMwI768jwtD4O6l7z59KkK2LO2e
         prTkHRQlUp9mp9VHJq3WzyA1Ari+4OjoXRHysqLjTr6LbfpSs9E9LRpQTsmxvFt5DFjb
         Rupg==
X-Gm-Message-State: AOAM531CFPoGzVttnZglLBTSS9wWISzuqtgPZUIzOZ33F+TfxnErv2br
	eYREm6Wx6IDlZ7nBHaandx+LamRun89Kjw==
X-Google-Smtp-Source: ABdhPJy4DrgakCUN7zJwF24KnW5Jf513AZSqlJcZAJXJaF/sqaCBZSXnxX6p9u+BPr6S25S9+QpnTA==
X-Received: by 2002:a63:1718:: with SMTP id x24mr1018850pgl.416.1625678963674;
        Wed, 07 Jul 2021 10:29:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1c2d])
        by smtp.gmail.com with ESMTPSA id y6sm22803248pgk.79.2021.07.07.10.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 10:29:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] suitesparse: Fix LIC_FILES_CHKSUM
Date: Wed,  7 Jul 2021 10:29:20 -0700
Message-Id: <20210707172920.3919845-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-update: Use SPDX format text for graphBLAS [1]

[1] https://github.com/DrTimothyAldenDavis/SuiteSparse/commit/538273cfd53720a10e34a3d80d3779b607e1ac26#diff-d0ed4cc3fb70489fe51c7e0ac180cba2a7472124f9f9e9ae67b01a37fbd580b7
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 1e165039b1..b92f63b265 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -1,5 +1,5 @@
 LICENSE = "GPLv2 & GPLv3 & BSD-3-Clause & LGPL-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f9f2b9d61cb769a67c4cd079e1166de7"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5fa987762101f748a6cdd951b64ffc6b"
 SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https \
            file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch \
            file://0002-Preserve-links-when-installing-libmetis.patch \
@@ -73,4 +73,3 @@ FILES_${PN}-staticdev += "${libdir}/libmongoose.a"
 FILES_${PN}-dev += "${includedir} ${libdir}/*.so"

 EXCLUDE_FROM_WORLD = "1"
-
--
2.32.0
