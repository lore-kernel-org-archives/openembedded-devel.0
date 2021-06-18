Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.9683.1624030741307819329
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jun 2021 08:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G/fSsFV3;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id x19so4868646pln.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XBxJG9uo/zoXtKyOGNPIDlXdY2LxE1QzlgFbhLd/Eqs=;
        b=G/fSsFV3mMXg9NIk+fgshVahZAyOdr68pE00cHSsvX8GFAZ0tbflpSKsO0rHNEpzDb
         M+RHGnMa9uxqZbgZplVXaIvC08zNtUh62YSsyIrZXkxnrNu1+e9kJfpLE9YQma0FQgk6
         xWZiTDXbCAGP351VoUiPdkq0G6nH4hqNx7+fDYeDTZ2/YQZpIhHTI4sE9e+8iu35kwOs
         dQjlnoV3CiOdn6HWgzZa8+Q7/KD9x1IwouADWkHrIR7zt19xCv6PdTYR0XqDG+uRkvV7
         X8Y+y+pRejIICON3s3Ni1RIzXZAtbPnrVCqzPc1xIAV28PVzmnKQKmZMOvKT/a8PIlml
         DgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XBxJG9uo/zoXtKyOGNPIDlXdY2LxE1QzlgFbhLd/Eqs=;
        b=FPn4o9RHJ/fdAQWdU58GimwW+gpgqDZsynqaV0LxlKsmyJbl3dPLcnXE4Vxbs6kusw
         JPgfqg3kzg3EWmfmQyN1k2IbvEuLdFsv8U0mhA8P7Ddixi1RSLJURrK+veZSsOk/9/cd
         dUzBAJg/sBrO1NgKE4QNinsfBZaLyuLii5tWK9uzHEMbpz/utT/awmy/JejAOq9ZbkCR
         mvEgpm2MTuDCER3+61UetupeOlJnAnQ6GtHeZwX6561M5HOrYadV0B8iQvzWcs+zLobQ
         XuqDrRU/zdpVIGR6jq7uure3GWHO2cAo0/AH5VwvzGpn2hDJfriof3lLMV36RyAcnz+D
         GZjA==
X-Gm-Message-State: AOAM530Yh2NY+1VMB2+TeQrZKHABiCeMaIzEe4p4Cl4LrY2faUFrMIib
	hRwrHjMT3nXkLG3jjeepEo4OIK3G7oxbQg==
X-Google-Smtp-Source: ABdhPJw4y2t/95rH41JBgHiHc/BMiZdVPK++VQJSNXd8CGs+DIvTug10OD72MRdRS60S+JpmEuuCpA==
X-Received: by 2002:a17:90b:1d0f:: with SMTP id on15mr22647260pjb.194.1624030740637;
        Fri, 18 Jun 2021 08:39:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id y7sm2591476pja.8.2021.06.18.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 08:39:00 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] rocksdb: Implement timer for armv6+
Date: Fri, 18 Jun 2021 08:38:57 -0700
Message-Id: <20210618153857.775544-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210618153857.775544-1-raj.khem@gmail.com>
References: <20210618153857.775544-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/files/arm.patch   | 26 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/arm.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/arm.patch b/meta-oe/recipes-dbs/rocksdb/files/arm.patch
new file mode 100644
index 0000000000..d428a6624a
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/arm.patch
@@ -0,0 +1,26 @@
+implement timer for arm >= v6
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
++++ b/utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
+@@ -161,6 +161,20 @@ static inline tokutime_t toku_time_now(v
+   struct timeval tv;
+   gettimeofday(&tv, nullptr);
+   return (uint64_t)tv.tv_sec * 1000000 + tv.tv_usec;
++#elif (__ARM_ARCH >= 6)
++  uint32_t pmccntr;
++  uint32_t pmuseren;
++  uint32_t pmcntenset;
++  // Read the user mode perf monitor counter access permissions.
++  asm volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
++  if (pmuseren & 1) {  // Allows reading perfmon counters for user mode code.
++    asm volatile("mrc p15, 0, %0, c9, c12, 1" : "=r"(pmcntenset));
++    if (pmcntenset & 0x80000000ul) {  // Is it counting?
++      asm volatile("mrc p15, 0, %0, c9, c13, 0" : "=r"(pmccntr));
++      // The counter is set up to count every 64th cycle
++      return (uint64_t)pmccntr * 64;  // Should optimize to << 6
++    }
++  }
+ #else
+ #error No timer implementation for this platform
+ #endif
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index 6516edade6..99bfdd4264 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://0001-range_tree-Implement-toku_time_now-for-rv32-rv64-in-.patch \
            file://ppc64.patch \
            file://mips.patch \
+           file://arm.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.32.0

