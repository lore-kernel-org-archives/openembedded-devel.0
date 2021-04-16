Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.633.1618597177192739663
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 11:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aQ34Xv1Q;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id z16so19739868pga.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 11:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RmT0Yqw7T3SFnOtLF47RksjwQFn7bbkbBkCmVn23eM8=;
        b=aQ34Xv1Qf/XCAmo2786fQsxOJ1JPQFcxSII3lw8U4iOVCHVfK5T4IB/LP64IarG9vz
         ezdOO1on2o3lIZsWcDY3qjXnPkxGQkxy314X8zRhVOEGoK1bzW9s6iBXakNe77plhJxh
         4u8ZsSxPkR9V2J95VrJ1153RIugaZhgA6ZZJuidg9j2OmeeyovbUfbaleHxXofwqFVjK
         +ZW8XozB2hzqRcpJi0gCn6iWI25UClHcRSdy2JA1CDnf/uYtSRZ3gSCFl/ZZEgcsDFpy
         ZshC9Xizzv65kLSlC87fiN8pQd13QDMgfW1sxQT4AJYHy4TkyKp3wS18sYzbqhujJpXA
         HciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RmT0Yqw7T3SFnOtLF47RksjwQFn7bbkbBkCmVn23eM8=;
        b=cNj87tSHh/2vuo72OCPevrT1oGZOno0kjv3WwEsV8Zy3zb9xXUUSwekH4fxsjtuzpD
         +QXtTsUH/LLLmLos0xgkIrpLNJ472yPr1n9ME7xu4SokedwwDeSHPr62Z1ZEjnJMOl1H
         HAr4RDy0VbpkgKZgYsnfE4vZQ1/Lm0+SrdW0zpVZMTFvtoobrrIBh8h9GhCc8nq4jVDl
         5/MiG0/GZrdl45gobI8WJ/bw8AYkR3fcgkwZMN8DVVFEGn9nWX3pAgwfOXNMy1PjYNR9
         FCZz1AZH1HYaJdumhKTEOIrZsjKsVNNBtlSUspJ9tdUDJi4R/WaWnTBS+BzlelUcZbpT
         eQcQ==
X-Gm-Message-State: AOAM532EgZn/vkqRt+1CMfsGhoy2HiFEiBtLUcI/eUIeKBv7iVN54kB2
	E6niujBjHl6uWsPvLzFzxUsYstOMY0oF6w==
X-Google-Smtp-Source: ABdhPJzqdr5OPK+np7bnq54S946qmwbiOZM4qDMn0y9Cg0bXFQNEz+2yRlSyCPsOw1u9Nun75VlbRw==
X-Received: by 2002:aa7:984d:0:b029:24c:8251:6d93 with SMTP id n13-20020aa7984d0000b029024c82516d93mr8938874pfq.34.1618597176226;
        Fri, 16 Apr 2021 11:19:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id k21sm5288316pfi.28.2021.04.16.11.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:19:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2] python3-icu: Upgrade to 2.7.2
Date: Fri, 16 Apr 2021 11:19:34 -0700
Message-Id: <20210416181934.2445888-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: Use info in setup.py for license as dedicated LICENSE
file has disappeared. License still is MIT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix license checksum calculations

 ...host-contamination-of-include-files.patch} | 26 +++++++++++++------
 .../python/python3-icu_2.6.bb                 | 13 ----------
 .../python/python3-icu_2.7.2.bb               | 13 ++++++++++
 3 files changed, 31 insertions(+), 21 deletions(-)
 rename meta-python/recipes-devtools/python/python3-icu/{fix_host_include.patch => 0001-Fix-host-contamination-of-include-files.patch} (58%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-icu_2.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-icu_2.7.2.bb

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
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.6.bb b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
deleted file mode 100644
index 58f5e563bf..0000000000
--- a/meta-python/recipes-devtools/python/python3-icu_2.6.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Python extension wrapping the ICU C++ API"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59"
-
-DEPENDS += "pkgconfig icu"
-
-PYPI_PACKAGE = "PyICU"
-SRC_URI[sha256sum] = "a9a5bf6833360f8f69e9375b91c1a7dd6e0c9157a42aee5bb7d6891804d96371"
-
-SRC_URI += "file://fix_host_include.patch"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb b/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb
new file mode 100644
index 0000000000..4c064c3d4c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Python extension wrapping the ICU C++ API"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=244;endline=252;md5=3e00c41c6d04310707992b93307a224f"
+
+DEPENDS += "pkgconfig icu"
+
+PYPI_PACKAGE = "PyICU"
+SRC_URI[sha256sum] = "1382869b22d91cc99274f9b525fa7d9199b44d9007ff0036a09747839a01e9dc"
+
+SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
+
+inherit pypi setuptools3
-- 
2.31.1

