Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.2251.1588966476171544595
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 12:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MeDT4W8B;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id k19so1163258pll.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 12:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xL8ZS/IEJNY4WX8GVhlgjm3TBfcsruFpAQA9vZ096ZA=;
        b=MeDT4W8BUqA3qAtcf+ZlsRgNtlRa94Fu1I+TPBJp0/fRPx1vbX306GFPv0Uzsq+/hM
         kZcAQQ7kRbdBE5pHnCspXMr2GC27ToITn08EbhDlETgUHwMrSZaYTdnlRyIT3ifaqd2r
         IsI2AeyX01R9j/deyn+e1RC3S5ZRgRA2P25DRf3c/dkcWGVPIWExWd9eU49np570Fzl5
         7SMmS+vb9E+AutaeEL0/Rxj3gOu9BlHBoAEk/zb/IvMzFn4osQd8Ti8WH6EAzZPH2DE9
         DU92guXbYqYgiBdt7PUdTESk1WdD66x2OW87w5Xb7vCXFpvPS9/jRUincTKvOJFpSogQ
         86iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xL8ZS/IEJNY4WX8GVhlgjm3TBfcsruFpAQA9vZ096ZA=;
        b=ftaktEKnJGPiT2ZcTMZzhwvDEMAFXF2NbsbLC3il7RlQWSOKt7vznPcbxgl/igBUZs
         O2Cz0FmIGzjlj5lkiSi5bV5E/ytNsua/x107b2+b5QVypAIVI9iMBYpbwQbNhrwsnuOf
         BrXDFveokntcFnifpeemYnYtZOcuvyH7rsxF8yPZ4vwRH7AbxjVflKh0jIyiGxnOQB9h
         +tr58al4EugxrhwSynelXSHSJ6Ise8+qBgZcLRVEIqKkHGR9s0DfpxxvYMgTdR47bXHj
         9r/Vqp1wUL6LfPBghQ2lDctbrVq2m61Rd03qb+jux51V1PsDk117Wk+dqL47965GZcQe
         EsrQ==
X-Gm-Message-State: AGi0PuaBHcFWvsuX6YZ61lxDxySVnk6yGsI6Ys37yFzoU3hkCzXc4wuN
	8zCFOsWHUZgCi4wE9dH9Po2Des85qSo=
X-Google-Smtp-Source: APiQypKfcUTr67GKK7/1liQ6254QSWaESlDl8aONdeyPdoOJRMvCog9w+Y1iuZwxpZ4Wfc/w6EASrQ==
X-Received: by 2002:a17:902:421:: with SMTP id 30mr3787453ple.271.1588966475238;
        Fri, 08 May 2020 12:34:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2691])
        by smtp.gmail.com with ESMTPSA id u11sm2650819pfc.208.2020.05.08.12.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 12:34:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] nss: Remove mcpu to avoid march conflicts
Date: Fri,  8 May 2020 12:34:32 -0700
Message-Id: <20200508193433.3952554-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some files are compiled with armv8-a+crypto and when using cortex-a55
the deduced march is armv8.2-a which then conflicts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.51.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index fba80ce2ab..36e6cd8fc5 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -47,6 +47,10 @@ inherit siteinfo
 TD = "${S}/tentative-dist"
 TDS = "${S}/tentative-dist-staging"
 
+# cortex-a55 is ARMv8.2-a based but libatomic explicitly asks for -march=armv8.1-a
+# which caused -march conflicts in gcc
+TUNE_CCARGS_remove = "-mcpu=cortex-a55+crc -mcpu=cortex-a55 -mcpu=cortex-a55+crc+crypto"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_configure_prepend_libc-musl () {
-- 
2.26.2

