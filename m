Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.17455.1627601819814206458
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZJnw2lAJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id a20so8898886plm.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xSLDb5BrNTe+ddYcZMw/PoBfjtZsAgDDw6RRFTBijNE=;
        b=ZJnw2lAJtOTScsLT0qfu/PMqeiXJJ8WQMuqZNc4zFH7sQF2HyPQsW1av58EIQvuOFV
         IDqcNGSLRjRqPMOGMLkE6/OrOL525lz+gsRRj1Qv4RFcUTGZR7kmsL5MaJZeApQ/vsRD
         TuK/ELgpEHzU+51LODlfcvAUj+xG2I4nAGDvZQFgNsjMzeNqCVp+Or5b36hNr3TLWkLK
         uzhDDOJ/DtU5HYx5FJcD0MxJIVC7HTAmifeHqHaSQa6FdjahgRhjKeYqlsnb5RMGYgVq
         Af7X17Qcv61en3r7cMX5lJi15PM6xPCYdZbxJkDLI7zIF9YkkEq9YxuSjKI2ir8FpCMB
         1bBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xSLDb5BrNTe+ddYcZMw/PoBfjtZsAgDDw6RRFTBijNE=;
        b=p1ruDnEOJRfZ5bmV1kcLi4snIwzU1UyGGeW8daSHuK1mqWBmIOPSiGK3PO+veLpChJ
         Ldw+uFw3/oyYsRAHgSF25yh4oUzJbskLqnCN+dYPOtwsElHDCqYEBAFEhi0DIxrjClB5
         XK6BMHcdaCtmaGzs4m+hz/316fupDv73Zo0DNc3xgHFBoWdYOPSR9kf3hXPsUfPKXTMn
         DPG1pQSpy/dXnLvv8IOUaI7UQn/RIrH9vJtT0+33s9JSlHFdfCajlgXmezJqsOUCNVs1
         GbhuO7YdQURC88QEFLYTct+XiD2fxLOw70gnF6dmJ5+JgDci9/uZT+3PsuKgd+9qcNTU
         APGg==
X-Gm-Message-State: AOAM5332bGloBfMKtI0dioti9uLLspbkYs0wSu82fSKxQQ4/0x57+gIw
	BgOIL3XEmJb9mWzwT6/q61zEcCiTL2DK0g==
X-Google-Smtp-Source: ABdhPJwgDTzF7eNDKhOOTD4aLYaDdpEdHz+xlxhLH7PdLZ1kaULjHYA3cLBKijIh4zSqeHXqD3caag==
X-Received: by 2002:a17:90a:d250:: with SMTP id o16mr8022831pjw.181.1627601819308;
        Thu, 29 Jul 2021 16:36:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.36.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:36:59 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 07/15] mariadb: Fix build with clang/musl
Date: Thu, 29 Jul 2021 16:36:40 -0700
Message-Id: <a6ec992b3f2fa9a9762962eb18087193b8293e4c.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit abbca30bd61c0ff856785900aac899ab33ead08b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc             |  1 +
 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 25e630a16a..18b025070b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,6 +23,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://sys_futex.patch \
            file://cross-compiling.patch \
            file://ssize_t.patch \
+           file://mm_malloc.patch \
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
new file mode 100644
index 0000000000..347fcd8516
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
@@ -0,0 +1,11 @@
+--- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
++++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
+@@ -5,7 +5,7 @@
+ 
+ #pragma once
+ 
+-#if defined(__clang__)
++#if defined(__clang__) && defined(__GLIBC__)
+ // glibc's `posix_memalign()` declaration specifies `throw()` while clang's
+ // declaration does not. There is a hack in clang to make its re-declaration
+ // compatible with glibc's if they are declared consecutively. That hack breaks
-- 
2.25.1

