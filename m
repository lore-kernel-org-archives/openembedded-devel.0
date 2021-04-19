Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.987.1618866283224761262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 14:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k3MWv6cI;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id s20so2620769plr.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Apr 2021 14:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3BJvWLAO+VniZLE+vLMcCwc5TSX78agtmVfELwzW/7Y=;
        b=k3MWv6cIC+MkqwVWACvGEvwXT772vPFptd4gETc0xlFTw8rtZ67yc8UFCRf1GG3tt1
         K00nNCuGxWMP4SZBCbHLvilErTRJ16MTEkFtUfUxWLHufjpNrzegn4ZWVHp5zpRZ2mIu
         IP5t2jkENI1cmfOaGyu04XmlIswlacl1r+BcNeW3gRZyBKUnHbuqr8A2IhJA6v6b/cnF
         wtA+hoQt3OxRS0jC8U7pp6Z3+tHe85usmW/JCm0XWW7oC9GbLn4t5o1HQse55r2mp40O
         DxvpmvpHsKv50sB/frM1IcV8v8Wq4kO/f0+m8K+OaSYi661u3zO+tQvyCOtpSAfdZDpH
         llqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3BJvWLAO+VniZLE+vLMcCwc5TSX78agtmVfELwzW/7Y=;
        b=oHmRl4EJSlLQusT49sr6jQfqFxRL4vjGClev6BKDBArcE3mYekE2cWQK2LX3zr4qok
         risgWsR0pSLoJv+CQLQPUxLouY/nSSJPy0bktpx62BnUKqM/hz/0dRPUlTBacJZ4bvEs
         SZMw76vi2ffA0P64qD0vMI4CuuWCy+Ez9aytsxQx2BDZ8ARcRLNzzXIjrcdBVRpGza4B
         XOupAKbkhisANywTlMBZ3B7YRsPqwDYQljNo5nI4t3At4OVCzRzDz5T36uv8EPj5GQfg
         1HUoRoA7XU1UCDRp3tlxApmiXt+LSwyXQ+6ARNulf+e11t6cmA2iPDWLtgpUy+0BonIc
         bgbg==
X-Gm-Message-State: AOAM533yy6bua7ICTT0tuR9oDnLPQRPRbE3pDL+u2rHA0YpreEVWsuKC
	GQhH3S9fpzf1XhTGpG00Q5YN6yDsJkdKFA==
X-Google-Smtp-Source: ABdhPJygMeikfLT0fg3iT/1MOld98FpxJ1fd3si+GfWqHhL2MlDmylclVsd2HR3LANJ+0g6BqgdEYA==
X-Received: by 2002:a17:90a:8d82:: with SMTP id d2mr1074139pjo.200.1618866282538;
        Mon, 19 Apr 2021 14:04:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id b7sm305439pjq.36.2021.04.19.14.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 14:04:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3 0/4] Upgrade nodejs to 14.x release
Date: Mon, 19 Apr 2021 14:04:36 -0700
Message-Id: <20210419210440.2446040-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While upgrading, switch to using qemu usermode to run  parts of build
using native binaries

Backport a fix to build with icu >= 69

Fix build on mips when using qemu usermode by reducing amound of memory
saved by mksnapshot tool from 2G to 500M

Khem Raj (4):
  nodejs: Update to 14.16.1
  nodejs: Fix build with icu-69
  nodejs: Use qemu usermode to run target binaries during build
  nodejs: Fix build on mips

 ...e-running-gyp-files-for-bundled-deps.patch | 15 ++-
 ...gister-r7-because-llvm-now-issues-an.patch | 53 -----------
 .../nodejs/0002-Using-native-binaries.patch   | 93 +++++++++----------
 ...Install-both-binaries-and-use-libdir.patch | 37 ++++----
 .../nodejs/nodejs/mips-less-memory.patch      | 32 +++++++
 ...all-new-ListFormatter-createInstance.patch | 93 +++++++++++++++++++
 .../{nodejs_12.21.0.bb => nodejs_14.16.1.bb}  | 41 +++++++-
 7 files changed, 226 insertions(+), 138 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.21.0.bb => nodejs_14.16.1.bb} (79%)

-- 
2.31.1

