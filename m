Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.3476.1614146325567041287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 21:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jwOa97Fp;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id e6so779690pgk.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Feb 2021 21:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7YQCm9m7xyBT99/Zk0KBcaEMXcSDl2c7cbK/AgdEc8=;
        b=jwOa97FpGNLzMMjBl7g8gP0i9M92hb91a7WDiOkKCmqIbZ739YskSPnqpQWxD7qDZD
         938Rg/9Oret+CQv2LOiBzSkYugpRcrWZZRu2GiBHNxH/Wa5ruP2Igl5o1Fhlz/N3RfC9
         RxJP00bf+ZFG5KYeQXD1P9BFpgJ89Bpbowz9Q75jWKJdbUOFcgULyiPtQH9VESGyqyNr
         QgdANGUvixGTjUl/kz5NCHud/hSH6gu+HLy8aHk8MoLTgqW8JCMtoVTTwCH0bgR/XFtN
         XJ2ZqEViBb1s0YqMzxoKOwN+YYyOUF6RLAtx1JNLgEcoSjXYUiBZzhOPBg2KXfy9Smu+
         2KsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7YQCm9m7xyBT99/Zk0KBcaEMXcSDl2c7cbK/AgdEc8=;
        b=ZQKLq110/Dq4sacaz2bfgaUBvvtWRJDq5fYzeTWW0i4fbgTpFWwj6mTe0tVsCmzWYH
         vaH3fn6FmmcMt7jlkf2AZVfHCEXhoZbf/bJkpK/8a+ZLmJJCr4lyuY6A1dLKzcnm6X6/
         JQZRwYcDSFnhbd4IPMvvXWpbyQMjdqK3Af/Zw55GSwDBqKBf4IKXZ8NmB5WJpMBN25om
         ylQb2OWdRRKu+P9LoeXZDSCKldYYR6GetdE/HCwN5mx2pTtutMRyY0+z441RvGp3IlHK
         Gqdkesbac0QjqvvzWSngWT2xL4dvCzfsa2WmzlXInk3VwjFqNhMGB2KqEtgNFA3CWXkI
         KaGQ==
X-Gm-Message-State: AOAM531A9jHZPd/Ek29ptV7Eq5SOeJrDqi7CbWsZpJtkRuyKUtOMxhV/
	6dLo4yfUyoWArtYKIaFo6Q8ZtdXzPIEHPQ==
X-Google-Smtp-Source: ABdhPJwMAtAOREqW1QFN5EqSAO0Ys2kWoEcTmSxIZ3UNhz04LavjIuuGJvjO9RvnU2iJYc2hgb9sbA==
X-Received: by 2002:a63:5fd7:: with SMTP id t206mr5290581pgb.54.1614146324551;
        Tue, 23 Feb 2021 21:58:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id r123sm1097961pfc.211.2021.02.23.21.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 21:58:44 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] luajit: Upgrade to latest on v2.1 release
Date: Tue, 23 Feb 2021 21:58:42 -0800
Message-Id: <20210224055842.353051-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brings in bugfixes [1]

[1] https://github.com/LuaJIT/LuaJIT/compare/94d4abcca966df2cc423e821bcacd04898f73117...ec6edc5c39c25e4eb3fca51b753f9995e97215da

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-not-strip-automatically-this-leaves-the-stripping.patch | 3 +--
 meta-oe/recipes-devtools/luajit/luajit_git.bb               | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch b/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
index f123b3f55a..a29c8ce87c 100644
--- a/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
+++ b/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
@@ -1,8 +1,7 @@
 From 528009f5ca0685c95ef27f6c8957160499c0576a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2013 10:42:45 -0700
-Subject: [PATCH] Do not strip automatically, this leaves the stripping
- busines to OE
+Subject: [PATCH] Do not strip automatically, this leaves the stripping busines to OE
 
 Upstream-Status: Inappropriate [OE-Specific]
 
diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 6573efcd93..ae8b80ce7f 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -8,9 +8,9 @@ SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
            file://clang.patch \
            "
 
-# Set PV to a version tag and date associated with SRCREV if it is later.
-PV = "2.1.0~beta3-200809"
-SRCREV = "94d4abcca966df2cc423e821bcacd04898f73117"
+# Set PV to a version tag and date (YYMMDD) associated with SRCREV if it is later.
+PV = "2.1.0~beta3-210112"
+SRCREV = "ec6edc5c39c25e4eb3fca51b753f9995e97215da"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.1

