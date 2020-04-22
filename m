Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.1170.1587534709327071264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2020 22:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HdkbO+J5;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id n24so494587plp.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 22:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORlsZgk0KvxKA/lCinnLTPYL3r35/xRYpR2QWNZB5uw=;
        b=HdkbO+J5wlnAlu6kBOvdXKoy3RDhTAz5pPx9EK4BJlRdLYKtwWq44wT6SuRuihMZI+
         eVw5cJzxUACUiBafeV4TAWwqahEY2XW7nODTn9RbXBLBnLh/apFVdwZ3FCJX4vvnnE+1
         aCHvcxaZM3R/wV8nOK+wQRSOmeQJnj1ADXFfSb1yzuFGlolMYUK+wChAa1RhgoHdYiHK
         UDuvpl9UBcMzpZQ93as6dfitJDgCZy4wUW3WzEF16/atdNSVhhlwiv+zs7AuuI8j2cWe
         /5qSZ+WTo1Wc0sQYemwUx3lpqvwCHTkuDYV0p0Zt/0gftV/Db/v27gZOGf1qy6yvIT33
         wPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORlsZgk0KvxKA/lCinnLTPYL3r35/xRYpR2QWNZB5uw=;
        b=mP0ZdSF4sTyObzhmB4tKnEe8W9gPskfZttO8w0NtzNBIOInkQJX7hZW6XlfcGcd2UV
         dbNebWgXLxrDpBHHMVUD8NOD8xLquetPI3nWN61mGg1gXKosGIyE428luVJwe3vZUG04
         6pWGxUgE9Fn4tuml3i7dWR5uExmpVuwq5pT31yWnVjY0yG5EKAP/EUkhPzIX++WC6DqN
         /+Xq6TStSpmf6NUZXD9FLE5desRsOqTOKe05JuaNuHJvOvOYXbnRpakGs+qwfV0Vh0HG
         8SdkCQwkS5oMPMBSzsHXYH04teIeF5pl60UY6088jVSRIDnTUXbMslnKLsY+C9lzXiCj
         SSOA==
X-Gm-Message-State: AGi0PuYBFHnS+4eYo6GckjG7B1mc3AAuhFFMGefoIm8NcwUVdx+7x+G7
	3eOGX+bVNK7yXhVnSORRLtWfTdmAk48=
X-Google-Smtp-Source: APiQypJaQw5PIqvK+TcYOZDmOOnOl0t+TRKc5cw3GuwL5G7R6IpvkLooo00a+EFJ4LxUeXpBCwh6Hg==
X-Received: by 2002:a17:90a:cb0b:: with SMTP id z11mr9608066pjt.62.1587534708427;
        Tue, 21 Apr 2020 22:51:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d473])
        by smtp.gmail.com with ESMTPSA id c1sm4219080pfo.152.2020.04.21.22.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 22:51:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] rocksdb: Link with pthreads on riscv
Date: Tue, 21 Apr 2020 22:51:44 -0700
Message-Id: <20200422055144.89937-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
 librocksdb.so.6.6.4: undefined reference to `__atomic_compare_exchange_1'
collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index addf9552b5..b9038df81d 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -39,3 +39,5 @@ do_install_append() {
     # fix for qa check buildpaths
     sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/rocksdb/RocksDBTargets.cmake
 }
+
+LDFLAGS_append_riscv64 = " -pthread"
-- 
2.26.2

