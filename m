Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.318.1623866384125716239
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 10:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g8k8CVTz;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id y15so2835577pfl.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 10:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y3CkOvo/Rj8/U+eSUUe+X3M3gL6J/qkSGFnXXPkLhgw=;
        b=g8k8CVTzsVNfFmegmzZEdG9kwGbHyAH9hx5TxRk4050+IlXnJhBIr4Mruz7F4ye3Ev
         eRd01Cmc15amCUzNq1AY8+CYEhxqYJH2ei2tz/Gz70Gq2pkADKyC3ZQHU8Kr4HuueURG
         NF4HETf9vuyGbnOVB07csUiKT+bg4u5e5ShMxGNIRgQvYUslPehCkQshFyZHcBcbfcTE
         cMnOQ2jftJtimCorVP936iROEI7OMksrD4p0sJ/AjnD4/Kl0LlMGxb4w3O/sFM0AHzWZ
         aOlxTmre8vT2nprpP/v8hpzqODIz09UCZqGW1y2XjDkdGuzo8KeWbiFDOeM9SXWxX0Ib
         5G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y3CkOvo/Rj8/U+eSUUe+X3M3gL6J/qkSGFnXXPkLhgw=;
        b=P7W7IBeQ9GA2XmOi8x4NWzDK0g6AAwZvbtOZLNilMI2oJ84ggw0whHY+Bwn6vyioo5
         mdG4DMX+m/KWtfAJ0jLKYlLeEvUexzgoPrQc7NBpeFl8akT0Q58H/ANPYQctqeiySKmE
         g1TG0e8cYVJMlomkdYF2jwTu9amuFeMSbLRrCqVOCGXGTFsB19swYhIbKX5HeIk2GbJv
         GC5Cn5NrbfXq9fnVaszEi4L7O7XA2fFajO30FBUBanw002PcbM3Pr9woFb5dq7tYg0F5
         S7yXnLzYRDPmc9+WOlGTD852cV+uOqo7qPy9OZrVPICrGUDtU4xAQVQrN79LGzTE/oaj
         wmgw==
X-Gm-Message-State: AOAM5320o0f0q5uyqtsYgAFOXbambUJwkS1SD7MJQxzG6GJ8SWQpzzPw
	w4spmIdCCGBk8IMwA/pCjJE4YXN4reDxMg==
X-Google-Smtp-Source: ABdhPJzRMECnipwO+/KmclOQcgdjQ0ETN/jE5w4r3n8nCZImn+WnSgP4gT4wSAosyZZrHF4S3PXpiQ==
X-Received: by 2002:a63:7404:: with SMTP id p4mr765994pgc.405.1623866383412;
        Wed, 16 Jun 2021 10:59:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id y7sm2872982pfy.153.2021.06.16.10.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:59:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/9] mariadb: Fix build with clang/musl
Date: Wed, 16 Jun 2021 10:59:34 -0700
Message-Id: <20210616175937.323664-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616175937.323664-1-raj.khem@gmail.com>
References: <20210616175937.323664-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.32.0

