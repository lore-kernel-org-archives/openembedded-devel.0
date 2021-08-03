Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.3749.1628019199875460811
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 12:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a7/xwnhy;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id u2so278883plg.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 12:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NCfU51YU60PmghTf5p+3DPC4vH+4dlVkO7MvYvM7LYs=;
        b=a7/xwnhyUeogsoFWIO+ZTCqwBIt7A7b6WsKqyq30BnoshBn+TwC4duCkJHbD6h5xdt
         JnIr7T++q0AS+hrtNkl4TMhQ+YGMm8hBj/JBsF3UGJge6i+SM1/hc7Tv3Zjrseu2dHRC
         TxvxM2n+4B6ryhiini/DXhbIS1L6seOCMFD32oYBPKD9FflushISij/BeJeYIVetxWbr
         8DlxFe6NqY5DFTEIYzF9Ypgs9uCT3lE0zr71CEjHrXq7lG5G3ab0eZPFmePggs0RZzkv
         VShtOsm6O8GN5IuSKI7bVKvlLlW/mYYlEOYLHTeCYDbP4O8Hp/jYnTDTGrSiZjeAu3+6
         P36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NCfU51YU60PmghTf5p+3DPC4vH+4dlVkO7MvYvM7LYs=;
        b=aznd79nG51A0DeMNjeVYnVJeDusCrU+NllSMn5RjcJVZBSaH2rdF9MIlRQgvjkeqEf
         Cqyu5+Ks7886pGY7qLT24izAy190O7k2FssMZS2A2KKrMEsPYYM5wAIuWnr/5t1wHw2C
         +vom/swUXYrMTY+S9aNJe6JkAwMN2Tei1qZl5m5QDVSVDXywgFLI5/QBGrELhf8cUADp
         KGpxIdG3SY4n9h3HdBkiCIhQrpS9UToe5Wji4Sj7+8FjDgxVDRhqIDzNw9ziUPMw4RxN
         I19PgnZBQ+1BTtW75QxfAkQkiu2IpV8zVa1czVun3LD9oKBI3uBiLZurKMX2Mtwpzk2B
         r7BQ==
X-Gm-Message-State: AOAM533F3Y8rXU/e3T6Fzsoh+DM2YcZT4jGif4Fjtsw1To2nGMC3G80n
	Ji6xrU394RlgT5+0ZdWG7vqqws4+IXJoug==
X-Google-Smtp-Source: ABdhPJwwkgB07swJMul/c3pS48ac+nmDfpF6ooIk5OSgfyBnNu+Kssfci5S0KpROiPdaKCBQOXykEQ==
X-Received: by 2002:a63:e14b:: with SMTP id h11mr2239564pgk.283.1628019198972;
        Tue, 03 Aug 2021 12:33:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id h6sm11071565pfe.177.2021.08.03.12.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 12:33:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] luajit: Fix override syntax
Date: Tue,  3 Aug 2021 12:33:16 -0700
Message-Id: <20210803193316.2691502-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not convert the variable name resembling override setups passed to makefile
Fix some of missed overrides

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 645680cd9f..d4ff06b677 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -30,8 +30,8 @@ BUILD_CC_ARCH:append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
 # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
 LUA_TARGET_OS = "Unknown"
 LUA_TARGET_OS:darwin = "Darwin"
-LUA_TARGET_OS_linux = "Linux"
-LUA_TARGET_OS_linux-gnueabi = "Linux"
+LUA_TARGET_OS:linux = "Linux"
+LUA_TARGET_OS:linux-gnueabi = "Linux"
 LUA_TARGET_OS:mingw32 = "Windows"

 # We don't want the lua buildsystem's compiler optimizations, or its
@@ -40,7 +40,7 @@ LUA_TARGET_OS:mingw32 = "Windows"
 EXTRA_OEMAKE = "\
     Q= E='@:' \
     \
-    CCOPT= CCOPT:x86= CFLAGS= LDFLAGS= TARGET_STRIP='@:' \
+    CCOPT= CCOPT_x86= CFLAGS= LDFLAGS= TARGET_STRIP='@:' \
     \
     'TARGET_SYS=${LUA_TARGET_OS}' \
     \
--
2.32.0
