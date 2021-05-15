Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.1437.1621042490230299772
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 18:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YsC2hVpZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id p17so238981plf.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 18:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q2RQVavzAzQZhgGsNvjrUp9bbTM8qjREALby1Y8CHtk=;
        b=YsC2hVpZ/DQlC1a5SfhfgAOyI5XzyknTOZBPTd0hLbj0mKQ8MWbiSaRI/c4gkafsQq
         YJQt+8xja4qfDi940IGmERFyiqeLnyLFPxrRGvW4ExrApWTsXGhvKvoGAxtlhYMyFosq
         xsHMSwNZV/bvY0R+CmU1cpSp+GSCU7V3A1pNJnJQ6vsIAOpBWgoDpMWm9BVz+6w/6fOW
         XpO0lgQ/4QEw+OuznyubvWsL1OwposoJuJszL5brX3CW4bSLQi27kmjyJ48rpguNryDy
         u4lGHL1FIkUWz3HJsd55kgjiLuH3AAelyA7UHpOJZewRsF3MFuegLmgE08BK9+9rMBma
         NaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q2RQVavzAzQZhgGsNvjrUp9bbTM8qjREALby1Y8CHtk=;
        b=BPItfVBh8AtB5gkTS1IVZe/KOjRjk2YrQqYtnaim/jpd2sCijt9t3nYQtc58Tb0Wjc
         JDjp6Efy0pT3dq/nFVCfqro4NaQyqkzR3mV2xF2SPxL3x99T0/Wstao+JSD6k36Djpkv
         McNlO/cqsfcSk3equanr/+gkEWEwAi31BymgBpDzySrwSrFlbJsfxGjGYR/jhwYChqsU
         o4bF+WJ5O3Q6ETRcZK5n0hMJB9DlJiwHXJ/3CGFEbNR1artLAgIYYapHhPbby3IOV7/7
         Fy60q67lmbVIE84MtJP3GxpCrzz48YkennETaWmweVxveRWOhWEfiFMJC4TItNxgfysS
         Js6A==
X-Gm-Message-State: AOAM532BlmkFix3oQIEg5Ewo8OcsGExVjM6TDxGp6pdEk1wM13Glrk9S
	aFtECVxvKQPv33XsfZwVq/26fZSVbSsLzA==
X-Google-Smtp-Source: ABdhPJyga9g1VQdVg7kuw2kXPsWwIMWXRQA6RURdSzyegzLiQQNDeGxQBaU3ltXJwsCz/2N+2ZzmPw==
X-Received: by 2002:a17:90a:d710:: with SMTP id y16mr14576854pju.86.1621042489450;
        Fri, 14 May 2021 18:34:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id c1sm4830092pfj.128.2021.05.14.18.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 18:34:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2] python3-m2crypto: Fix build on riscv and mips
Date: Fri, 14 May 2021 18:34:47 -0700
Message-Id: <20210515013447.2141700-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wordlen is not so easy to calculate on RISCV, therefore pass the right
ingredients so compiler does the right thing in the end

Do same for mips as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build on mips/rv32 as well

 meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
index ef123075c7..e1f92928c6 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
@@ -36,6 +36,9 @@ SWIG_FEATURES_x32 = "-D__ILP32__"
 
 SWIG_FEATURES ?= "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.getVar('SITEINFO_BITS') != '32']}"
 
+SWIG_FEATURES_append_riscv64 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
+SWIG_FEATURES_append_riscv32 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
+SWIG_FEATURES_append_mipsarch = " -D_MIPS_SZPTR=${SITEINFO_BITS}"
 export SWIG_FEATURES
 
 BBCLASSEXTEND = "native"
-- 
2.31.1

