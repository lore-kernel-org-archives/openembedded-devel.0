Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A76BC87FCB
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 04:37:56 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.14481.1754627867870785581
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Aug 2025 21:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G3pFx41I;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32129c4e9a4so1555851a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Aug 2025 21:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754627867; x=1755232667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2HWeGaVR3jCwvavnVWw1a2H55N6bRsTWJsfpwHjJgcY=;
        b=G3pFx41IeMFxkMCFGcBFs63LFFo6XhTelR1SxTSiLGPY86Io6jv6XWy9Ae8MS/Ic3G
         gw5Ghs7H+uiQou8TWFKLKLT0RPpQQKQ2pChtNFBPtTnAvixtEDhjuFUXWVmhfLdng8Ij
         hP9bK7ufyDQe8Ms6e+Ra6+Q1a1QDa7tY0dHpdPzy9fadVNPw7RmkOZ4tJf6fVVQCpeIj
         Dkes+MzfbbMAOMG0ONE4BIB3o8qwqugPgW53ComR6RH/uUI9jWh5pJ3fFisuAglDezDR
         gpJQjqKrRZ7SR2a/t3qkAN42PW9z0o9N+Fu/ZGM+AC8WT+BQ0ueMfPr/6KvQ06/o3jr1
         IzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754627867; x=1755232667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2HWeGaVR3jCwvavnVWw1a2H55N6bRsTWJsfpwHjJgcY=;
        b=a9rtjAYIzsGobscmGE+lST5CfWK4vXPs9oZVFIZlpzWoYi8qZTf1Q2itJePpWZh6nZ
         ZlfKPVeHfCdR7Z1Ar/DjCex/dnjfN5jjmrPMzCSdR8uqWZeaZZml6MUe214QHP50eOf0
         WYP949cy7EYVXBmubaszrg+C3DMhaodbEFTelyYB9DcgHiJsUqJ4SsDs90OCLYaddN3S
         XdCjbTRn0VGLj0uUJVKv+h0QNlNgp2ESbONrzIM0DePUhF5mq+z5oTyIqLtj754W26OS
         iVAOrQEPfIw93GousMF6V7ZbjgecpfsJzWy8s514lRKetZpcOojw23v87SqW7OaGg7Hw
         6gmQ==
X-Gm-Message-State: AOJu0YzwiwocjaSSpnQoaSsRZINuoA/gk2ekpgs1jHfn6O292HxepHZa
	CoEvZQzV/CbFE+Hg5SBsqFpnsvx44pi1wB3aK40lGN9uWG9KmsfvTxzl0DVxevpJBWY=
X-Gm-Gg: ASbGnctd3sXqRIIa1UJ4f/Zszlz9U2iiJjAb0Afq/P5kqlv/USR4K2tOeYBvrUOoYck
	rMB0dm6hEn4Kqz1rht9JPJNwkKxC5FKwkRaT6Te/RPtAW7ku1hno7Z6G3n2+3uoZYOwh/yvGpjh
	0p806SuGhycGnvtM85IWGXNVwDoKtQPM5Y2P211jecWvlpycPu6wgVDZS40jsurh3GjD72mW9jM
	dsuf9chqbXbfl5b35+g4GIjuWMEmmni+NmM6ryorUcxfm1/bEfS/h47jznWW1qPVYDFYGcIOOuv
	N8CSFK//Jh1oGR5uD7edG2c1arWHs8rbErVzZNZIHkBwSyDHXc2i4V5iJI/Rcj8STkedxWfjYFV
	E/5nxNB5YzVJ/rbKviU5sEw==
X-Google-Smtp-Source: AGHT+IGGgZT4Ni2UL3RAfEFBjNPb3KsymRqJE0F/+rVuj8/8MqiERpdHw16fxS3jTrGPs3qdv4GzKw==
X-Received: by 2002:a17:90b:314e:b0:321:2407:3ced with SMTP id 98e67ed59e1d1-32183e6d92fmr2078700a91.28.1754627866861;
        Thu, 07 Aug 2025 21:37:46 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7606])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f0ba97sm23782180a91.29.2025.08.07.21.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 21:37:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] tomlplusplus: Fix test failures with clang/libcxx
Date: Thu,  7 Aug 2025 21:37:44 -0700
Message-ID: <20250808043744.1928097-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Aug 2025 04:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118902

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
index 4d77ee6096..1f434520a9 100644
--- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
+++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
@@ -17,6 +17,10 @@ inherit meson ptest pkgconfig
 EXTRA_OEMESON += "-Dbuild_tests=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "true", "false", d)} \
 "
 
+# See - https://github.com/marzer/tomlplusplus/issues/279
+CXXFLAGS:append:toolchain-clang = " -stdlib=libstdc++"
+LDFLAGS:append:toolchain-clang = " -stdlib=libstdc++"
+
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST_PATH}/tests

