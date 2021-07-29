Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.17097.1627601821607751080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j6jWdXJL;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id pf12-20020a17090b1d8cb0290175c085e7a5so18137655pjb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wKyPqzY1hcnmm/SWhPZ7Z0QV5BTsnyWfSop8zyH4vCQ=;
        b=j6jWdXJLT1uYkg5leP3ItetbAWVju7uYDHUFv2fURwq29wZeHLEVpcMGxwKWIieGj0
         c6i4YmD9CG7HcVCEzkjLi8PaCV1CVFJqw0W1/nzgmXfnfeG5wADkoZV/dUpitY823R9P
         7/10SspvKKba53LtBDC4iVHLQ9wPeURkBi5chNGJtEAKubMzC830oiVQVn8s6v3G4vPW
         P8KGKJGz04FlEUlV4RwwPIHGXw5xIbLFCvTTAF3cbwdO0q2LueifgswFDjsXSxjRg3EN
         rjg67Qq9wS5ec+9IE/zEE3X/gB3u3aD+rxnOIRu9t8fH5KGLQGWf3wn6FahNI5Z1byg8
         3Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wKyPqzY1hcnmm/SWhPZ7Z0QV5BTsnyWfSop8zyH4vCQ=;
        b=e1Wam6ZR8AlINfeRKfbqJxna8STBY7m5pnU5MPrG20zFVcBJ8DTSfdJWU/vBvFUayW
         jPKgv/6VMvPtyYj71TIKPK9biVdJDzZQ+uABhbXQdRFT4XdOhp0ppMyrlcWia8gPNeK2
         usxC3s8p+Pn8etrxWnsiQDKPSn1ZdJu8fin+NR63IlV+wK4DawRgN3NGtsMC/kFtRNip
         pulOBXwX2X1P0rvVW5kmqHK0X5/pYXnj3FcuT1nNKNfztZfOYg7ALJOEhybti5rn2Pbf
         boAbchIR4C375FkW+wNiBj6cicpox2DILNXXrfxpT5kb29yyyMSTPscQxG2a8Air1sfc
         Bzlg==
X-Gm-Message-State: AOAM533btHHsSSC+u82fiv0M2tlNd73LsbLt3YijeVyRMI7c4KYr3yoy
	tSnw0nXfhx+I4K2WO0ADa3K1/sObkf8qEw==
X-Google-Smtp-Source: ABdhPJw7xg/GDtwGCQSIyHIFGhcUzmCaq/mqezSfTlpqwCdY82N8A7p3bMZXf7vTvMRsBsKm7soWuA==
X-Received: by 2002:a17:90b:385:: with SMTP id ga5mr14493680pjb.183.1627601821083;
        Thu, 29 Jul 2021 16:37:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.37.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:37:00 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 09/15] mariadb: Upgrade to 10.5.11
Date: Thu, 29 Jul 2021 16:36:42 -0700
Message-Id: <13a011b4500f81d212408ba8f9894ed183c07fd1.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

Forward port musl patches

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 287ffdf1d03731fadd6a90b224d08cf9a3b50de5)
[Stable branch]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{mariadb-native_10.5.10.bb => mariadb-native_10.5.11.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch    | 2 +-
 .../mysql/{mariadb_10.5.10.bb => mariadb_10.5.11.bb}            | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.10.bb => mariadb-native_10.5.11.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.10.bb => mariadb_10.5.11.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.11.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.11.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 7b1f537fb4..71978740ba 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
-SRC_URI[sha256sum] = "a5ff32f9fcaaf26bf5cba94accc7b246d2d5eb75710d027e40122df6bac0babb"
+SRC_URI[sha256sum] = "761053605fe30ce393f324852117990350840a93b3e6305ef4d2f8c8305cc47a"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
index d082d424b0..d6e53c29e1 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
@@ -36,7 +36,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +  __builtin_ppc_get_timebase();
  #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
    /* Mainly, prevent the compiler from optimizing away delay loops */
-   __asm__ __volatile__ ("isb":::"memory");
+ #ifdef _aarch64_
 --- a/storage/tokudb/PerconaFT/portability/toku_time.h
 +++ b/storage/tokudb/PerconaFT/portability/toku_time.h
 @@ -124,7 +124,7 @@ static inline tokutime_t toku_time_now(v
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.11.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.11.bb
-- 
2.25.1

