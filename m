Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.270.1618595540518990901
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 10:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lBTz2BGd;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id g16so5536627pfq.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 10:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wcEvDwfCmPtzYlqEEdZwQsKv4lb7aXL2UalNO6U/e2A=;
        b=lBTz2BGdWDNDeULKNfvWmxmFhxo3Ynz4/128qjniavDpetkeSKMyoa6/U/wMEwxl88
         zFKu+Gns7W8Mm1qEi5qwqiFOfe9IQjYfMLqfH9FqyJa2aGEQEEn0GPV9FLKcB+NbocFX
         oqkCdN5+1Rc8n3HIewf7A0PHm5Mrd0LsL31s7DhcAtzq6K2qdJyHnL5R9LJ/UcwObgJ/
         1IKXDHX8MG8dceopjBrT9bv8d2UNvpAHWqe84ehS1FvllIYUiAjInfC3kdbQ+XNRVCvD
         F3J5e5i6HDgwpXEul/bp7NS0h2i4Pb2t6a65hDQ1tFox5auVKveldrtHwPvk14+F5uKN
         qz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wcEvDwfCmPtzYlqEEdZwQsKv4lb7aXL2UalNO6U/e2A=;
        b=e6z0Be+agOb7Tu7UKNDCw2kK0HIS1k9jAyD+EXC+LaZ5DixYHSbCg6hS3aHUCqwBRr
         QZDU4KJlFUZ7krvkgJX+7I8iLSBi25Ia7RWzMj6eQemUeKgtpFXEGUBVj2xv9x45annn
         xi1BOme1+tEzGamOhW6ZvMUKaQkzdBIZo9dU9nZCS98xBhcyHEDcP0DMq3FeY6aRXEHT
         i5WX94A2n/YOW2iQBuCL2dTwpBtvH77sl5o9j36WOwFDHw8zsCg+qXaWZNVlETL6Skh8
         3rk+NnEHRKMROK0QWiK2tS37Vuz7UGvyGrfeh1lgZ+SYRBVd4A6a2k7G8+Y6t9f02cgT
         BVCA==
X-Gm-Message-State: AOAM5306jxmo4acCcOvDOmRaAV1sLMWQm4y3OS1DsbRxS/4JKo5kbUlp
	bKgZGb2ifoz64suY9gqi7oyYvm0RgWcCyw==
X-Google-Smtp-Source: ABdhPJw8CWxWxVCOaQjSgUDSZ3AlEbWJJBpipzSRvTQsprS53plA9lSBBpKdIRgy+ixikUzUd+Jg/w==
X-Received: by 2002:a63:b09:: with SMTP id 9mr243762pgl.107.1618595539461;
        Fri, 16 Apr 2021 10:52:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id i22sm5651465pgj.90.2021.04.16.10.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 10:52:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-icu: Upgrade to 2.7.2
Date: Fri, 16 Apr 2021 10:52:15 -0700
Message-Id: <20210416175215.2389387-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...host-contamination-of-include-files.patch} | 26 +++++++++++++------
 ...ython3-icu_2.6.bb => python3-icu_2.7.2.bb} |  4 +--
 2 files changed, 20 insertions(+), 10 deletions(-)
 rename meta-python/recipes-devtools/python/python3-icu/{fix_host_include.patch => 0001-Fix-host-contamination-of-include-files.patch} (58%)
 rename meta-python/recipes-devtools/python/{python3-icu_2.6.bb => python3-icu_2.7.2.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch b/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
rename to meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
index 1b6e890436..c45217a88a 100644
--- a/meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
+++ b/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
@@ -1,17 +1,24 @@
-Fixed host contamination of include files
+From 8abf79f77d9151d6786da3c8e868117822bce6d4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Apr 2021 10:48:36 -0700
+Subject: [PATCH] Fix host contamination of include files
 
 python3-icu-2.5-r0 do_package_qa: QA Issue: python3-icu: The compile log indicates that host include and/or library paths were used.
 
 Also, don't use icu-config
 
-Upstream-Status: [inappropriate] OE specific
+Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
-Index: PyICU-2.5/setup.py
-===================================================================
---- PyICU-2.5.orig/setup.py
-+++ PyICU-2.5/setup.py
-@@ -81,7 +81,7 @@ Building PyICU %s for ICU %s (max ICU ma
+diff --git a/setup.py b/setup.py
+index e647db4..abed399 100644
+--- a/setup.py
++++ b/setup.py
+@@ -81,7 +81,7 @@ Building PyICU %s for ICU %s (max ICU major version supported: %s)
  
  CONFIGURE_WITH_ICU_CONFIG = {
      'darwin': True,
@@ -20,7 +27,7 @@ Index: PyICU-2.5/setup.py
      'freebsd': False, # not tested
      'win32': False,   # no icu-config
      'sunos5': False,  # not tested
-@@ -274,7 +274,6 @@ setup(name="PyICU",
+@@ -267,7 +267,6 @@ setup(name="PyICU",
        ext_modules=[Extension('_icu',
                               [filename for filename in sorted(os.listdir(os.curdir))
                                if filename.endswith('.cpp')],
@@ -28,3 +35,6 @@ Index: PyICU-2.5/setup.py
                               extra_compile_args=_cflags,
                               extra_link_args=_lflags,
                               libraries=_libraries)],
+-- 
+2.31.1
+
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.6.bb b/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-icu_2.6.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.7.2.bb
index 58f5e563bf..8d788bda6b 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59"
 DEPENDS += "pkgconfig icu"
 
 PYPI_PACKAGE = "PyICU"
-SRC_URI[sha256sum] = "a9a5bf6833360f8f69e9375b91c1a7dd6e0c9157a42aee5bb7d6891804d96371"
+SRC_URI[sha256sum] = "1382869b22d91cc99274f9b525fa7d9199b44d9007ff0036a09747839a01e9dc"
 
-SRC_URI += "file://fix_host_include.patch"
+SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
 inherit pypi setuptools3
-- 
2.31.1

