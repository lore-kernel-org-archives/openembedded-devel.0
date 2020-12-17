Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.7682.1608210262459033528
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Dec 2020 05:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MZ0Vqgk6;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: wickbergster@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id o17so54204035lfg.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Dec 2020 05:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1+QAv625z//ESS5CoMD2bE9nS5nolKWV/oG3lS5JF5I=;
        b=MZ0Vqgk6aQxohDCy5N48FucCD4nlsO4HeRepnEoYKGqS8gRVdhJsfoIMfn1kNezAgl
         q68QyRjVyEQMj6uBP0CUHHUxuKvHPy8RQyb4KNt4kZmjGjJTzw+coGfkh7M+uNF+Hyeg
         DK8lHLPk7UTS4py8gPu0CcxFwUpt3i0JTUWp7BIp8BCM7b52+/mXgYfh2m1Gdc8L/OI9
         jRguiShbeQIDb1rhyzjAluXo2kSYFBFPCzaT/IiJcAgUEveIJDa65e5PaQmBY28yMT8Y
         pzYiuASiAPjMt2Zlqxc0xlV/aM0qlnfkUIiocLH4XBaf4lssqCtRGN3BvUFRzeHCRvOt
         EqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1+QAv625z//ESS5CoMD2bE9nS5nolKWV/oG3lS5JF5I=;
        b=WkerxdOhLXslN21XAmjgG0IUwM86nPkmr7MPHvlEpzQUYOQVSiZpZCHACGGfLEdPJ9
         NPzChQxVmNSurcirdTFX4wCxB8LO/6GSYjBjoAGDTXAywibM9vcDP50AFkDqA/+8/t4o
         wu0qIvt2BMZMKsE0eK8HMhdMq2RUAS/MRFpR73JHud6HQvAxxoF5Incs1r2hibeurKAr
         jd7eh7wDvi6PCAzTPQhHbehDR0ip+HPw4/twqsxxKEnj/8+aTBJ3bg+e1zkcECcnyQf4
         jEz6WkgyTSEjr4glacNm+AaGq8jouVdVnV1N9wJXb7rSt4zCeYjAu2SiV1OzbRSWFfoW
         9Wyg==
X-Gm-Message-State: AOAM533uF764B9bbldPta0UCJlneM52ys75CMWiMtLtBkhw0R304nXGg
	eHQogU4UWLy45MA8HjvBsDqB5CdgVDQ=
X-Google-Smtp-Source: ABdhPJyYdrCygVD6/qLZhYjfI3gRmVgqmSJrNY/WapnlShiwrmq97bFPG6mg4V6+PsWJv9rrLV0N6w==
X-Received: by 2002:a2e:5018:: with SMTP id e24mr17625874ljb.425.1608210260172;
        Thu, 17 Dec 2020 05:04:20 -0800 (PST)
Return-Path: <wickbergster@gmail.com>
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id h8sm581301lfj.116.2020.12.17.05.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 05:04:19 -0800 (PST)
From: "Alexander Vickberg" <wickbergster@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: upgrade to 2.25.0
Date: Thu, 17 Dec 2020 14:02:07 +0100
Message-Id: <20201217130206.157573-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deleted build fix patch. This is already applied in this release.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 ...orrect-EOF-check-in-ssl_context_info.patch | 57 -------------------
 .../{mbedtls_2.24.0.bb => mbedtls_2.25.0.bb}  |  6 +-
 2 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/fix-incorrect-EOF-check-in-ssl_context_info.patch
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.24.0.bb => mbedtls_2.25.0.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/fix-incorrect-EOF-check-in-ssl_context_info.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/fix-incorrect-EOF-check-in-ssl_context_info.patch
deleted file mode 100644
index 836fce91e..000000000
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/fix-incorrect-EOF-check-in-ssl_context_info.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From d696e7d91e42a190d06760279d2e396392143454 Mon Sep 17 00:00:00 2001
-From: Nayna Jain <nayna@linux.ibm.com>
-Date: Thu, 13 Aug 2020 19:17:53 +0000
-Subject: [PATCH] programs/ssl: Fix incorrect EOF check in ssl_context_info.c
-
-In `read_next_b64_code()`, the result of fgetc() is stored into a char,
-but later compared against EOF, which is generally -1.  On platforms
-where char is unsigned, this generates a compiler warning/error that the
-comparison will never be true (causing a build failure).  The value will
-never match, with the function ultimately bailing with a "Too many bad
-symbols are detected" error.
-
-On platforms with signed char, EOF is detected, but a file containing a
-0xFF character will causes a premature end of file exit of the loop.
-
-Fix this by changing the result to an int.
-
-Fixes #3794.
-
-Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
-Signed-off-by: David Brown <david.brown@linaro.org>
----
- ChangeLog.d/bugfix_3794.txt     | 4 ++++
- programs/ssl/ssl_context_info.c | 4 ++--
- 2 files changed, 6 insertions(+), 2 deletions(-)
- create mode 100644 ChangeLog.d/bugfix_3794.txt
-
-diff --git a/ChangeLog.d/bugfix_3794.txt b/ChangeLog.d/bugfix_3794.txt
-new file mode 100644
-index 0000000000..a483ea76ae
---- /dev/null
-+++ b/ChangeLog.d/bugfix_3794.txt
-@@ -0,0 +1,4 @@
-+Bugfix
-+  * Fix handling of EOF against 0xff bytes and on platforms with
-+    unsigned chars.  Fixes a build failure on platforms where char is
-+    unsigned.  Fixes #3794.
-diff --git a/programs/ssl/ssl_context_info.c b/programs/ssl/ssl_context_info.c
-index df8819a804..d109c1e6f7 100644
---- a/programs/ssl/ssl_context_info.c
-+++ b/programs/ssl/ssl_context_info.c
-@@ -377,13 +377,13 @@ size_t read_next_b64_code( uint8_t **b64, size_t *max_len )
-     int valid_balance = 0;  /* balance between valid and invalid characters */
-     size_t len = 0;
-     char pad = 0;
--    char c = 0;
-+    int c = 0;
- 
-     while( EOF != c )
-     {
-         char c_valid = 0;
- 
--        c = (char) fgetc( b64_file );
-+        c = fgetc( b64_file );
- 
-         if( pad > 0 )
-         {
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.24.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.25.0.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.24.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.25.0.bb
index e3a016956..27c1b209d 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.24.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.25.0.bb
@@ -23,10 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "523f0554b6cdc7ace5d360885c3f5bbcc73ec0e8"
-SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=development \
-           file://fix-incorrect-EOF-check-in-ssl_context_info.patch \
-"
+SRCREV = "1c54b5410fd48d6bcada97e30cac417c5c7eea67"
+SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=development"
 
 inherit cmake
 
-- 
2.25.1

