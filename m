Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.1882.1588224715108766153
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 22:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eJCb0/mq;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id d17so2248418pgo.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2020 22:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bzn9+sqOI06WAQR9pG2+eSi7ZRplTRLJDTLG1Kbw1yM=;
        b=eJCb0/mq3FE2Hsu0JBPPGZEYHtl/1ykgSBeBzlUgWNZUW/2EJ83IBY3Usle2lVBcxK
         CJk8ofFGRSaMhhL85F24tt3bc8fO1tXOcZc7iFCXKgnNYQ+XNSSZawth+RD4HfjNH1fD
         IgYhw/sReT2OOg7BtxitHFeM/IG89c4BM9Gq1hHSWVCATT5jiOSsd/MYZIeqjMsnaaXs
         qdt5w3e0Ud+HNdSgUMSSwRyBTSMD7G1vZ3TTGV1DTVTcA3//rU8QnCm6KADi2YU35a5y
         jFn2Un4mVyKTPn2W08bV4f/GMz0q+QYXdZUXYdOjrJD+gF6bsjwWjI0B7wyijuNRMrBU
         My/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bzn9+sqOI06WAQR9pG2+eSi7ZRplTRLJDTLG1Kbw1yM=;
        b=TdPyjAxW8ISOJnSsZw7T8W9g01oO36zwl1npeEMDxY4cLK8MxwylwZqx54mGZUndvo
         1fJl+s9Z2sLN+7iyGvnVlw2Ris7FSB7DuomkpZMvfom+s/NT4dz2++FLyqFVXLoX0zTp
         2f9SyM3NrMVU2oGN3o0uu2qN5jiQodyf35OawwKrAeaKTS0fg/JWVqrr/zJuwM8AuB9B
         A3K2iaQWTUM/i3gLIuyiuGN56bFCtLhNGCqO5pOKB7B00/263nh1uSvbfILyncoiSFPx
         0sr3x1rswX9Q1xOzdIc8tmu3AHiYzPPhpsT1pt75ZGfE21Sjyyt0ojNVpBAdY6156t4F
         bZvw==
X-Gm-Message-State: AGi0PubUuqkpJ6hGxdTgV6LRjtznwhLQpAilP4dux2qk/F7oV1Gl9paT
	//xpRA6RSnUMkgdjoJ1/Sw2UAeseffg=
X-Google-Smtp-Source: APiQypKPe5ToVBaMo1vfcu4wwSvoMMnOPWzIbL65fYei3dKVKoK7CByUpKEqig/Z9NjJuLN51z9DoQ==
X-Received: by 2002:a62:1dd8:: with SMTP id d207mr1934171pfd.3.1588224714206;
        Wed, 29 Apr 2020 22:31:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e11c])
        by smtp.gmail.com with ESMTPSA id v26sm2418780pfe.121.2020.04.29.22.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 22:31:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] rsyslog: Enable atomic builtins on rv32
Date: Wed, 29 Apr 2020 22:31:46 -0700
Message-Id: <20200430053149.226494-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430053149.226494-1-raj.khem@gmail.com>
References: <20200430053149.226494-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
rsyslog-8.2002.0/runtime/../action.c:1666: undefined reference to `__sync_bool_compare_and_swap_8'
collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb
index 8605145ebc..ca8fddc713 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb
@@ -41,6 +41,7 @@ EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
 EXTRA_OECONF += "--enable-imfile-tests"
 EXTRA_OECONF_remove_mipsarch = "ap_cv_atomic_builtins=yes"
 EXTRA_OECONF_remove_powerpc = "ap_cv_atomic_builtins=yes"
+EXTRA_OECONF_remove_riscv32 = "ap_cv_atomic_builtins=yes"
 
 # first line is default yes in configure
 PACKAGECONFIG ??= " \
-- 
2.26.2

