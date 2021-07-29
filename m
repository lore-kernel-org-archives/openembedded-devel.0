Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.17207.1627601817310669992
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gz8I3grV;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d1so8867026pll.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zChBGx4VIZjPSUgVL1HVZX6V7mL4BWzUdIYfp2Ze/u4=;
        b=Gz8I3grVePZQ1To9cl/yDdIisD3soAN5yK2zNs/frJhnpKNGsL6KPck0XImpNkjWSS
         0a8o7b+DhssKU3OtfnHgEsqMARp2pR7HKPay4icQxFM6gWs/w6xYl3qTM4fZhjtdgTg1
         wDQDYuPr12+dcl67j74PdYSw5eQqfAa7EOZHBBpSvbbJOPXip51Kpy01M2LwUk6Up+Qg
         j7pfO1WLFETcL0ufjWHWHE7nLvF4ubeHUJWYOfsvB8C/4NKThzWELa05hUwoit1H4jgU
         2O2MfZpOAuqEEcELVc1kG/uwgJeZAUo67iCAzL+0yt1hweLxdEGZMAd8phNhFG17hIso
         lCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zChBGx4VIZjPSUgVL1HVZX6V7mL4BWzUdIYfp2Ze/u4=;
        b=ULNKtScuiRqXjUnTD7fuYN9MGrTtSP8HcTnRzNyCuzofTYIEcyFbm7huC2zT87S/Hl
         yYaH6oX9wm7P/CI3kmqXsG+GDtDPMF36Kf4ixi/TRVbckw1YgDp/Jlv0WtTwi5KEtrOa
         lvZ5udNKygJOWVmojhCuxth3/gFO328i1Rj4vChzwYWZGQC9OPY1qToJ9MzF6XSm1+jD
         /rcyr/M+BdRNRuSF4yjSQ8ngtTTyk/z4wDIea9PbqMeCxueH+bpryeH8ebHQDDHv/DoA
         OVs+WOOouR09Wi327LDOaOyl5hJ6+vG7AA7AyuqUxODnbDlrLWnP2nTYqpwBltIwqZg8
         bShQ==
X-Gm-Message-State: AOAM530WK4Zv2BWaLi7rFxsmxRhIw1qo2/MkxEcasHEBUsCS6nT6jS+O
	uy03bKep9ULsvwHtU5XQ5Bn8woAf5nD1Cw==
X-Google-Smtp-Source: ABdhPJzx61UfxNfV+wKFwplAZYgZ6rTKka+MtUYZHqCnF48cTQtAJZdck3AaZCqqzYfCQoadrlRS4g==
X-Received: by 2002:a65:6555:: with SMTP id a21mr5936138pgw.53.1627601816794;
        Thu, 29 Jul 2021 16:36:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.36.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:36:56 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 04/15] mariadb: Fix configure
Date: Thu, 29 Jul 2021 16:36:37 -0700
Message-Id: <7628af5739ee981c33dc04b6d5b02c07d73aeb94.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Assume recent CMake upgrade made this pop up.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ca18e276d63e9fc6fece6a32e88959cbcf84c91b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...onfigure-by-closing-IF-ELSE-properly.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 9833b28857..92e54d7592 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -22,6 +22,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
            file://sys_futex.patch \
+           file://0002-Fix-configure-by-closing-IF-ELSE-properly.patch \
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch b/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch
new file mode 100644
index 0000000000..36c74d8f94
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch
@@ -0,0 +1,35 @@
+From fdd08a8774265618668c7f24697e138587c47a16 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 10 May 2021 13:35:54 +0200
+Subject: [PATCH] Fix configure by closing IF ELSE properly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+| CMake Error at libmariadb/cmake/ConnectorName.cmake:30 (ENDMACRO):
+|   Flow control statements are not properly nested.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ libmariadb/cmake/ConnectorName.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libmariadb/cmake/ConnectorName.cmake b/libmariadb/cmake/ConnectorName.cmake
+index b7bbbad..357b8ac 100644
+--- a/libmariadb/cmake/ConnectorName.cmake
++++ b/libmariadb/cmake/ConnectorName.cmake
+@@ -22,7 +22,7 @@ IF(CMAKE_SYSTEM_NAME MATCHES "Windows")
+     SET(MACHINE_NAME "x64")
+   ELSE()
+     SET(MACHINE_NAME "32")
+-  END()
++  ENDIF()
+ ENDIF()
+ 
+ SET(product_name "mysql-connector-c-${CPACK_PACKAGE_VERSION}-${PLATFORM_NAME}${CONCAT_SIGN}${MACHINE_NAME}")
+-- 
+2.30.2
+
-- 
2.25.1

