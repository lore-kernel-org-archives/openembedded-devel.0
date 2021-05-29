Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.19218.1622281883819850852
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 02:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U582aGcO;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id qq22so685234ejb.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LAyOCwk6SHyqEw/rKDjXSU/9YXx3KMLTk7aU6n0oBI=;
        b=U582aGcO6mPnb0nyIMCuDD8DfN+q8ce7xHnHVAB7y4vu7TgmqnQRqUvbRd07FUHDjU
         U1GYSlkfkAdABzcYQrHQAVNiWcn3o6hp8BXS5W0FlxIDEVq+RuWs7MYEXiRhrY116jMF
         3k+xZHg6G+Rk6cW1GGho6jZ0FwpjxfWkc1G31Dj3yOnt5KpFJi5ILg1m2pGyA6rUdCar
         Nd+ZZxysgZia1iiVSumG6ajbrhsCosBpAbIMA0JZHSbO3p80FqW1F7+in6sj44XylcZN
         xZGWIF0rFMZcSbk7IbHa+tgtMYQxVSxQIpyMQQ575qIm0qM8lmEspifutD/WFGEdieUv
         MfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LAyOCwk6SHyqEw/rKDjXSU/9YXx3KMLTk7aU6n0oBI=;
        b=E0/xJfDaRX+ucBFvyuDVLEYtXqg7RfuG/0y2drEZyI0dMEZuf5rJ6pX4C8Y3lR319b
         KiSCE0surY0wN/Fo8QSqq98UXFFvegzYqTZQIOqGsJCWrghNAyep6nBrxeI1qzCtzksR
         KwSl0MxylziUw2U5xSCOW9+NGUUncvRihVPqiberXb2mBLOKCcecohgvGU53qvOJkqQU
         kbXIUgs6PLfqUNGWwb7knWiBQAuRk/D3y9qGKE0IrpUayfidButF85B6+KCNySqynDwd
         IGw3AcvpGpBrify9391LCcmKJ5nKgc2JXBybvvN537E89hGX+ZZ93Ewbwg7v7+yVd2qv
         Z+TQ==
X-Gm-Message-State: AOAM5315r/yJ8+TaNKCbQd5U/0Kk7mC+0jnNQCj7Qi6NkgRcyyUCrqWg
	UUoxvfM+WnRmYixHIjUl/EMlk75m5JA=
X-Google-Smtp-Source: ABdhPJwSx/SKwp0/iUhLcWy0CUmm5bUzkrAFniomfl421zpuHmMUx0gpbjzSStzlRPvB7YlotSGpuQ==
X-Received: by 2002:a17:906:49ce:: with SMTP id w14mr13462060ejv.273.1622281882160;
        Sat, 29 May 2021 02:51:22 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q16sm3421425ejm.12.2021.05.29.02.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 02:51:21 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] p7zip: refresh patches with devtool to apply cleanly
Date: Sat, 29 May 2021 11:51:19 +0200
Message-Id: <20210529095120.2135584-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

change_numMethods_from_bool_to_unsigned.patch added in:
https://git.openembedded.org/meta-openembedded/commit/?id=3c36a8efe2a964c3aa9bfcd836cee3f80a837fcd
doesn't apply cleanly:

ERROR: p7zip-16.02-r0 do_patch: Fuzz detected:

Applying patch change_numMethods_from_bool_to_unsigned.patch
patching file CPP/7zip/Archive/Wim/WimHandler.cpp
Hunk #1 succeeded at 298 with fuzz 1.

The context lines in the patches can be updated with devtool:

    devtool modify p7zip
    devtool finish --force-patch-refresh p7zip <layer_path>

Don't forget to review changes done by devtool!

ERROR: p7zip-16.02-r0 do_patch: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...Fix-narrowing-errors-Wc-11-narrowing.patch |  3 ++-
 .../p7zip/files/CVE-2017-17969.patch          | 13 +++++++++--
 ...nge_numMethods_from_bool_to_unsigned.patch | 23 +++++++++++++------
 ...t_override_compiler_and_do_not_strip.patch | 16 +++++++++----
 4 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch b/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch
index ae27517458..1f08d1603a 100644
--- a/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch
+++ b/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch
@@ -1,4 +1,4 @@
-From b6b1782af4aa7f9084d32e4144738dc2535c8d6f Mon Sep 17 00:00:00 2001
+From 653674e11872465dd5edf1c1e8413ea813d7e086 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Apr 2018 23:07:21 -0700
 Subject: [PATCH] Fix narrowing errors -Wc++11-narrowing
@@ -17,6 +17,7 @@ also reported here https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=224930
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  CPP/Windows/ErrorMsg.cpp | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
index 177d1455f8..9ba1078071 100644
--- a/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
+++ b/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
@@ -1,4 +1,7 @@
-p7zip: Fix CVE-2017-17969
+From 7f2da4f810b429ddb7afa0e252e3d02ced0eba87 Mon Sep 17 00:00:00 2001
+From: Radovan Scasny <radovan.scasny@siemens.com>
+Date: Tue, 20 Feb 2018 12:08:13 +0100
+Subject: [PATCH] p7zip: Fix CVE-2017-17969
 
 [No upstream tracking] -- https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=888297
 
@@ -8,12 +11,18 @@ Compress/ShrinkDecoder.cpp: Heap-based buffer overflow
 in the NCompress::NShrink::CDecoder::CodeReal method
 in 7-Zip before 18.00 and p7zip allows remote attackers
 to cause a denial of service (out-of-bounds write)
-or potentially execute arbitrary code via a crafted ZIP archive. 
+or potentially execute arbitrary code via a crafted ZIP archive.
 
 Upstream-Status: Backport [https://sourceforge.net/p/p7zip/bugs/_discuss/thread/0920f369/8316/attachment/CVE-2017-17969.patch]
 CVE: CVE-2017-17969
 Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
 
+---
+ CPP/7zip/Compress/ShrinkDecoder.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/CPP/7zip/Compress/ShrinkDecoder.cpp b/CPP/7zip/Compress/ShrinkDecoder.cpp
+index 80b7e67..5bb0559 100644
 --- a/CPP/7zip/Compress/ShrinkDecoder.cpp
 +++ b/CPP/7zip/Compress/ShrinkDecoder.cpp
 @@ -121,7 +121,12 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
index edde525933..93eb0588c0 100644
--- a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
+++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
@@ -1,4 +1,7 @@
-fixes the below error
+From 0820ef4b9238c1e39ae5bda32cc08cce3fd3ce89 Mon Sep 17 00:00:00 2001
+From: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+Date: Wed, 26 May 2021 19:59:28 +0000
+Subject: [PATCH] fixes the below error
 
 | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
 | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
@@ -7,19 +10,25 @@ fixes the below error
 | ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
 |   318 |         numMethods++;
 
-
 use unsigned instead of bool
 Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
 
 Upstream-Status: Pending
---- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:51:56.997402701 +0000
-+++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:52:16.665604125 +0000
-@@ -298,7 +298,7 @@
 
-       AString res;
+---
+ CPP/7zip/Archive/Wim/WimHandler.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/CPP/7zip/Archive/Wim/WimHandler.cpp b/CPP/7zip/Archive/Wim/WimHandler.cpp
+index 27d3298..4ff5cfe 100644
+--- a/CPP/7zip/Archive/Wim/WimHandler.cpp
++++ b/CPP/7zip/Archive/Wim/WimHandler.cpp
+@@ -298,7 +298,7 @@ STDMETHODIMP CHandler::GetArchiveProperty(PROPID propID, PROPVARIANT *value)
+ 
+       AString res;
+ 
 -      bool numMethods = 0;
 +      unsigned numMethods = 0;
        for (unsigned i = 0; i < ARRAY_SIZE(k_Methods); i++)
        {
-         if (methodMask & ((UInt32)1 << i
+         if (methodMask & ((UInt32)1 << i))
diff --git a/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch b/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
index b0a560fe98..2636e7f6f4 100644
--- a/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
+++ b/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
@@ -1,4 +1,7 @@
-do not override compiler and do not strip
+From b2aa209dfc5e59d6329b55b9764782334b63dbe8 Mon Sep 17 00:00:00 2001
+From: Raphael Freudiger <raphael.freudiger@siemens.com>
+Date: Wed, 11 Feb 2015 09:11:47 +0100
+Subject: [PATCH] do not override compiler and do not strip
 
 The default makefile sets the compiler to g++ or gcc. This leads to a wrong architecture when cross-compiling.
 Remove the hardcoded compiler and just append the flags to CXX and CC.
@@ -7,9 +10,14 @@ Upstream-Status: Pending
 Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
 Reviewed-By: Pascal Bach <pascal.bach@siemens.com>
 
-diff -Nurp p7zip_15.14.1_orig/makefile.machine p7zip_15.14.1/makefile.machine
---- p7zip_15.14.1_orig/makefile.machine	2016-03-23 20:37:47.000000000 +0100
-+++ p7zip_15.14.1/makefile.machine	2016-06-17 15:33:39.720454477 +0200
+---
+ makefile.machine | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/makefile.machine b/makefile.machine
+index 9e34c34..e9244d9 100644
+--- a/makefile.machine
++++ b/makefile.machine
 @@ -2,7 +2,7 @@
  # makefile for Linux (x86, PPC, alpha ...)
  #
-- 
2.30.2

