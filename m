Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.317.1623866387005975974
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 10:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lBU0UDAF;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id v7so2641925pgl.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 10:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Khe1XzwPltve568eYig6aBqw1K8PlyOu0GjoQcS3rKE=;
        b=lBU0UDAFOCi2ogHQeQCCWPMCNHLbP60z9kYPelJq2JdL5kwEmyT2h1k2VICYPlyTE8
         ZckSLF0Zpf7ghvnuSlYV81rgTAKmPxj/Uzh/pcsrkQJlT0meCYUyxE00SVycZKhBjK9c
         jrb0lGwOx4qLwjQbDYWiCzbvByEcKWg5eHWr+vsRTxWaFK2LtQz5BZGrCOTQoyiAg8DY
         hn7jgibEYet8CTnIfjg/BxjDN8DUycxrZ9lCHOm8YIOYR+Qnoucw64GUEOeQVUyBExD0
         bwGMEw8ChEKvjmlMLtwolJgp/SaWVyxkZNlJEWEMGwelgVRPu2XCKq8HFWqmqx6XmVw/
         nL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Khe1XzwPltve568eYig6aBqw1K8PlyOu0GjoQcS3rKE=;
        b=jUFQwetbCWs/xrGx+3K1GzP83SmUsn/0c9P3GWTtuYywg2G288LfrgsVkEpbgF88PZ
         G/41/qqQYWl4lu71jVUxTwnbilAXKMHt64tZhmW2U1Yt+VSxvnKqpvBwF5i+N+idKjAT
         IOSG3ZaCuB7t0TBwT5VqNi277OEmR9NCs1lIXMl+jseCcksLVFNejlgbkoS5Mb3vmax1
         nifAUC1Fx9m84BSPWBXIc0CHu/n5rJzd1PQKjKWplagC5babW8KySz119pgmJN9N6DOf
         osaReXBkbatenZku5mMM/krsdvnKvZjjMcDSovOrAovnFKW4ftZYGGfFvLxgprI3dXG3
         fH7w==
X-Gm-Message-State: AOAM533gxpeDB9Jva8NUV0F5cXY/d4E+/XttrH8M0KPSQ4G0YRa5Y+Pn
	+6Efs5x2vQcW1gw73gSAy0E7+7dtYWGd1g==
X-Google-Smtp-Source: ABdhPJxI6D0z+DYVK4tMqCUnvMKup7vEfW2O5gGbFBGSm/w0NU2AZClqO+JD+zjWTOle/+HgfIRPpg==
X-Received: by 2002:a63:ec43:: with SMTP id r3mr818284pgj.344.1623866386106;
        Wed, 16 Jun 2021 10:59:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id y7sm2872982pfy.153.2021.06.16.10.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:59:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 9/9] rocksdb: Disable on riscv architectures
Date: Wed, 16 Jun 2021 10:59:37 -0700
Message-Id: <20210616175937.323664-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616175937.323664-1-raj.khem@gmail.com>
References: <20210616175937.323664-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Errors are
utilities/transactions/lock/range/range_tree/lib/locktree/../portability/toku_time.h:137:2: error: #error No timer implementation for this platform
  137 | #error No timer implementation for this platform
      |  ^~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index ded454e167..f5b2946cd5 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -43,3 +43,6 @@ do_install_append() {
 }
 
 LDFLAGS_append_riscv64 = " -pthread"
+
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
-- 
2.32.0

