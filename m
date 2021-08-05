Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.5431.1628144556962631599
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 23:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D+s2XvyQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so7108491pjh.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 23:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yO2ExyoKWUo6XW38SDk1oHrZO+mEO6xp6NzK/XnFMIw=;
        b=D+s2XvyQ/FErqIdaYQ11abc2EWVjHOsJ/8Nyi6VAPuxyYWto0qKAReH2oii9X0K875
         m8DYzshtqvFqRnSn+YeTtXT8T65rrI0QaJScgamxwiZRgM5qyfSNkvXske0evbycjgZu
         Nn0B+yIHU4pMAf9i5qkN4jsfs/V0fgLKyzAedJxwUrNSdsa63Pp5qb/c3NGzVk0m/TcF
         i/sv7bAatDDer/D5Im0PiD4Ek3iM2wdeW2P41eirxWGONsyOMh+zcp2ysgbYoOVB7afJ
         3taC++vF4MCNDQjJ4tU6eBEJOPNTYwawyvmrjb47jFJ6RYHQZzui8pioxUCH0lOi/7C6
         cWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yO2ExyoKWUo6XW38SDk1oHrZO+mEO6xp6NzK/XnFMIw=;
        b=a/5qqrFP0G0Coqut96OXlp/C41AbsWFKmnFGSpieyxLyPD3nPRFD8wafMHY6WzscOz
         3ry6VdLQWfssldWcpzRl5P6aZ9jUbQO/cj6rh+J7PLJnPTdLmNKPhYqWTds/N0+Gcdl3
         FxspuV15Dsah691c6wxMgDYuwmrRHB97qiCNiJtFaq0P42snymSw7xl3mWP0J09eoXOv
         fNdB2ulMoxM/UVxUNkSo5AfpNrB9sp4XWD0c2WHfQOus+IIYe6DplAMXZ10yV797b9aT
         lXn18MGTd7cnHgutFRWCrgsU5kEnc8TDDX9lTd/Afo4NavlLBzhpQ40LfpTp2hQ9fywN
         hRqw==
X-Gm-Message-State: AOAM530j0nM+b9CHyALuDHuDA15NQStd8mNQCVV2+9ZBa01ft8mTBdAH
	6fJU68vps/YCbi221bhi3QpCj9CgG/Yelw==
X-Google-Smtp-Source: ABdhPJxe7M9/qfXRHRfmviHeMt7Ukk90WC3V8bmgeWQy8cL4W2fODjZkFHe5JA/8feQ0KunWcTa7hQ==
X-Received: by 2002:a65:615a:: with SMTP id o26mr40572pgv.177.1628144556242;
        Wed, 04 Aug 2021 23:22:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id x24sm8077378pjk.43.2021.08.04.23.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 23:22:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mingli Yu <mingli.yu@windriver.com>
Subject: [meta-oe][PATCH] jemalloc: Fix build on musl
Date: Wed,  4 Aug 2021 23:22:33 -0700
Message-Id: <20210805062233.217516-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
In file included from include/jemalloc/internal/jemalloc_preamble.h:21:
include/jemalloc/internal/../jemalloc.h:235:28: error: exception specification in declaration does not match previous declaration
    void JEMALLOC_NOTHROW       *je_aligned_alloc(size_t alignment,
                                 ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
index 4738f0e786..39637663f6 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
@@ -22,3 +22,5 @@ S = "${WORKDIR}/git"
 inherit autotools

 EXTRA_AUTORECONF += "--exclude=autoheader"
+
+EXTRA_OECONF:append:libc-musl = " --with-jemalloc-prefix=je_"
--
2.32.0
