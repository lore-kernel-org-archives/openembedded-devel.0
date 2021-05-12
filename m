Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.67.1620778028297113414
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 17:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nDYGbuj+;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id md17so12567905pjb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 May 2021 17:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RbAok0IwHCVx6CST8GVhkYNANlZKD5SlZsOYuyODVnU=;
        b=nDYGbuj+XEewE4+TB90JeJlKeikyByEpqY170Lqhb+DqOTLT3p4UMjpKsYKukYYyQR
         L+BQhCGWnJffzqcl5xKEOhnrcUSr7wy8PDCLxfQsnzRPD4rZhEmRoFsySVGGrjtkcyBY
         tmBm95f7XqUeiNsx/us+ZIcWHS9n4dsxTSBalN0C6STd31beqpgKcIwQxBlu9esm/Atu
         uxfJMzVijIRaGhWCXjsCjJflpCrg3GEYF6gHu3+O2Cb6k/E+JpU51kwPyzu0IDEpWlHV
         aeyNKYdRN0dRnEHJFwVxzJ/974nHEafFArI0mNqgvnK5o7hvwoX12/waliehe+1cgC69
         Je4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RbAok0IwHCVx6CST8GVhkYNANlZKD5SlZsOYuyODVnU=;
        b=i8lyitkByRLo7hayg9n+sATnK6WoVxPMB5U2K7VlzmamTHPawGQRDytSlaHtvb5cyt
         qOLqDGMUR9xQuGnal0Ji+2T3aF6xNzIwzC7uEy+aXtRuqjWrs7ZCdk9GNqO5YeZ1uomQ
         cIQe0JBxWuQ54e8N36oockFBmMhWgRiN+2FIVi/p0Cc53m8pEhU8gzEko9iD6qHGctPb
         ecuSp744r08/IOt5dkAVzCQQi1oa7H4YaN3mLsRgW8hkBXQ81SAdzNh53kDvyo75orsQ
         28x8jnP9EDqSdXlfLFN8lBCSZcb9C/mZ25SfLzI/SJvH+8VfxDQSVQNr7HelvdG1K2Tc
         p1QA==
X-Gm-Message-State: AOAM533/t/qSPovyMgNiylP1L6eHi/r/XtmUmWj+BjJeQ/2N6IBf2hkT
	Litcl3HpYq2ZZzio8T50r/N3IaxaXEaS5Q==
X-Google-Smtp-Source: ABdhPJxxBE8pO4JwwbiYXwFdTuB5tWE6rrvo9MwqFWo7Lw/51ARr2J3NjLT4FSTobv2GyRczHhFONQ==
X-Received: by 2002:a17:90a:e64e:: with SMTP id ep14mr36481052pjb.103.1620778027443;
        Tue, 11 May 2021 17:07:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id n30sm14675966pgd.8.2021.05.11.17.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 17:07:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] mongodb: Do not use MINSIGSTKSZ
Date: Tue, 11 May 2021 17:07:02 -0700
Message-Id: <20210512000704.2889545-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

glibc 2.34 has made MINSIGSTKSZ non-constant

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mongodb/0001-Do-not-use-MINSIGSTKSZ.patch | 34 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Do-not-use-MINSIGSTKSZ.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Do-not-use-MINSIGSTKSZ.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Do-not-use-MINSIGSTKSZ.patch
new file mode 100644
index 0000000000..0ee64e9c6c
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Do-not-use-MINSIGSTKSZ.patch
@@ -0,0 +1,34 @@
+From 027044a692b588ef586d495f65eb58b07cc711a3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 May 2021 10:15:51 -0700
+Subject: [PATCH] Do not use MINSIGSTKSZ
+
+Since glibc 2.34+ MINSIGSTKSZ is no more a constant.  So,
+let's hardwire this for now until better fix is found.
+64Kb should be good anyway
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/stdx/thread.h | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/mongo/stdx/thread.h b/src/mongo/stdx/thread.h
+index f8058279e3..f31f309959 100644
+--- a/src/mongo/stdx/thread.h
++++ b/src/mongo/stdx/thread.h
+@@ -104,10 +104,7 @@ private:
+     //   .                     N   Y :      4,344 |  13,048 |     7,352
+     //   .                     Y   Y :      4,424 |  13,672 |     8,392
+     //   ( https://jira.mongodb.org/secure/attachment/233569/233569_stacktrace-writeup.txt )
+-    static constexpr std::size_t kMongoMinSignalStackSize = std::size_t{64} << 10;
+-
+-    static constexpr std::size_t kStackSize =
+-        std::max(kMongoMinSignalStackSize, std::size_t{MINSIGSTKSZ});
++    static constexpr std::size_t kStackSize = std::size_t{64} << 10;
+     std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(kStackSize);
+ 
+ #else   // !MONGO_HAS_SIGALTSTACK
+-- 
+2.31.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 54178bf75a..cfa2bc18c2 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://0001-include-needed-c-header.patch \
            file://disable_runtime_check.patch \
            file://ppc64_ARCH_BITS.patch \
+           file://0001-Do-not-use-MINSIGSTKSZ.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.31.1

