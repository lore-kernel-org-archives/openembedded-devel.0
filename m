Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE4FD2A553
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.32582.1729107320822073056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QKDovKjI;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so73168f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107319; x=1729712119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ6eysO1/gu3beY0ZHZHPoa1kVbjq+GdKCI+YC4Ojpo=;
        b=QKDovKjI53l3QMHBe/gj+YC5VzLNfZe/aoQSXuJdF3SQGwVOC3H3sijMJ8gCNoquJc
         Y/ghvPWd6m8RK7vkvxAkhwvjwko5JpMFXAP5jqNDcSgo74JSr2H9qSlpgzJYUFxSd2w+
         dB4LM8p+AWfhBw5srWwFmz+dZsmh/O84fzreMeu09Z64Sj5T7n1q/dL2yt/f/KVY33bY
         4SWLyuKbyJoG5gVidvxwytIb9n1MhV2/vM1/iEv8LpoqWwREgiR8jVolEaPnnkOhNRWD
         kGSjmHw0zFrI/JDd3Il42RNoyDOBtaFZ7hFQxDQWQdJijE86eWfps0Lk4V8BF/aV9466
         jXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107319; x=1729712119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZ6eysO1/gu3beY0ZHZHPoa1kVbjq+GdKCI+YC4Ojpo=;
        b=aPMO7Vdhwz7xDTdlwlyTldoelX+6vEDULRVuQVwMXCH6Eo/5Gx1lKD0YMXjD17lPy4
         FSaBOII29RHfzHLQjKmDw27GIDdKRN9YZVJ4mab29rvJYOPucQfYLmiU11ml/jK+QruR
         GNJjcCU16Rj+6OdcLN82nF5h7ps4sfKTgj+KjKBYnmx/32/7DBssi2Uer9VJWgNkE+pj
         OfgFlbnIuoJ1fev1IgUTUscqNJMv3JRTInRsrkYO5MUokKg1jXZR6EAlp055NhkabWUz
         /eKRtqUOpD3fXupairJSd40KhgVtEgp1OdKbXthE3nXtjPEzP7R7sEW7Qtl7keOclhpR
         hfSQ==
X-Gm-Message-State: AOJu0Yxbp1D6odq72+zBAeyejiUsh8EoW7k1NQVXg4ZnaN1kLbyEngXw
	A388bxzHDVg+eRXkG/QmY1E4xpWtGZAq3VXe99OtW0CyWot8casA0AP4+w==
X-Google-Smtp-Source: AGHT+IFYGm4HIqNVyzYBhBUX1goPklZKfjtKpZTzJd7dBTUTbMVyyyyO87baFjBuqMFuUXr0eeRs2g==
X-Received: by 2002:adf:fe89:0:b0:37d:5129:f454 with SMTP id ffacd0b85a97d-37d551d4fd9mr12988757f8f.15.1729107318862;
        Wed, 16 Oct 2024 12:35:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/13] python3-wxgtk4: update 4.2.1 -> 4.2.2
Date: Wed, 16 Oct 2024 21:35:04 +0200
Message-Id: <20241016193505.3459828-12-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112953

This addresses python 3.13 issues.

License-Update: added bsd-2-clause to LICENSE.txt

Drop 0001-sip-Fix-build-with-gcc-14.patch as already fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...y-use-GetAssertStackTrace-under-USE_.patch |  6 ++--
 .../0001-sip-Fix-build-with-gcc-14.patch      | 31 -------------------
 .../add-back-option-build-base.patch          |  9 ++++--
 .../not-overwrite-cflags-cxxflags.patch       | 10 ++++--
 .../wxgtk-fixup-build-scripts.patch           | 15 +++++----
 ...xgtk4_4.2.1.bb => python3-wxgtk4_4.2.2.bb} |  7 ++---
 6 files changed, 28 insertions(+), 50 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Fix-build-with-gcc-14.patch
 rename meta-python/recipes-devtools/python3-wxgtk4/{python3-wxgtk4_4.2.1.bb => python3-wxgtk4_4.2.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch
index f8a3061ae..1426067d2 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch
@@ -1,4 +1,4 @@
-From b9f95c06b2e7a525f4f93d705976882e8dcba6ab Mon Sep 17 00:00:00 2001
+From b62aa1a2e3e0feced819a375be3b2187cc356284 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 20 Dec 2022 09:46:31 -0800
 Subject: [PATCH] sip: Conditionally use GetAssertStackTrace under
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/sip/cpp/sip_corewxAppTraits.cpp b/sip/cpp/sip_corewxAppTraits.cpp
-index 9c9f9d5b..1d2d2f90 100644
+index 9a9a4a66..a54e7659 100644
 --- a/sip/cpp/sip_corewxAppTraits.cpp
 +++ b/sip/cpp/sip_corewxAppTraits.cpp
 @@ -471,7 +471,11 @@ static PyObject *meth_wxAppTraits_GetAssertStackTrace(PyObject *sipSelf, PyObjec
@@ -23,7 +23,7 @@ index 9c9f9d5b..1d2d2f90 100644
  
              Py_BEGIN_ALLOW_THREADS
 +#if wxUSE_STACKWALKER
-             sipRes = new  ::wxString((sipSelfWasArg ? sipCpp-> ::wxAppTraits::GetAssertStackTrace() : sipCpp->GetAssertStackTrace()));
+             sipRes = new ::wxString((sipSelfWasArg ? sipCpp->::wxAppTraits::GetAssertStackTrace() : sipCpp->GetAssertStackTrace()));
 +#else
 +            sipRes = new  ::wxString("");
 +#endif
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Fix-build-with-gcc-14.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Fix-build-with-gcc-14.patch
deleted file mode 100644
index 4782e74ef..000000000
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-sip-Fix-build-with-gcc-14.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5234a454a1b9f11f83e59909fb2972176497e02c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 9 May 2024 17:35:11 -0700
-Subject: [PATCH] sip: Fix build with gcc-14
-
-Fixes -Wincompatible-pointer-types
-sip/siplib/siplib.c:3900:20: error: assignment to 'sipSimpleWrapper *' {aka 'struct _sipSimpleWrapper *'} from incompatible pointer type 'PyObject *' {aka 'struct _object *'} [-Wincompatible-pointer-types]
-|  3900 |             *selfp = va_arg(va, PyObject *);
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sip/siplib/siplib.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sip/siplib/siplib.c b/sip/siplib/siplib.c
-index 95563e5c..ae3fac60 100644
---- a/sip/siplib/siplib.c
-+++ b/sip/siplib/siplib.c
-@@ -3897,7 +3897,7 @@ static int parsePass1(PyObject **parseErrp, sipSimpleWrapper **selfp,
-     {
-     case '#':
-             /* A ctor has an argument with the /Transfer/ annotation. */
--            *selfp = va_arg(va, PyObject *);
-+            *selfp = (sipSimpleWrapper *)va_arg(va, PyObject *);
-             break;
- 
-     case 'B':
--- 
-2.45.0
-
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
index a46f3f870..2622df24e 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
@@ -1,4 +1,7 @@
-Add back default user options for cross build.
+From bc08fddaf4b23073b2afbc045a26aedc4d2c6470 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 30 Mar 2022 17:39:33 +0800
+Subject: [PATCH] Add back default user options for cross build.
 
 Upstream-Status: Pending [oe specific]
 
@@ -8,10 +11,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index a215da7..dccfeb3 100644
+index 99ee6612..fad5aba8 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -105,7 +105,7 @@ class wx_build(orig_build):
+@@ -111,7 +111,7 @@ class wx_build(orig_build):
      Delegate to build.py for doing the actual build, (including wxWidgets)
      instead of letting distutils do it all.
      """
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch
index 67f7949b3..3dc4cb1e7 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch
@@ -1,4 +1,8 @@
-Not overwrite CFLAGS and CXXFLAGS. It also avoid buildpaths qa issue:
+From 05189dc7063a7c238e38589cbaf92be256270e54 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 23 Nov 2022 13:40:00 +0800
+Subject: [PATCH] Not overwrite CFLAGS and CXXFLAGS. It also avoid buildpaths
+ qa issue:
 
   WARNING: python3-wxgtk4-4.2.0-r0 do_package_qa: QA Issue: File
   /usr/lib64/python3.11/site-packages/wx/.debug/_xml.cpython-311-aarch64-linux-gnu.so
@@ -12,10 +16,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/wscript b/wscript
-index 067b307..50d96d1 100644
+index 79bdf3e1..d6244d5e 100644
 --- a/wscript
 +++ b/wscript
-@@ -195,8 +195,8 @@ def configure(conf):
+@@ -188,8 +188,8 @@ def configure(conf):
          cfg.finishSetup(conf.env.wx_config, conf.env.debug,
                          'mingw32' if isWindows and not conf.env.use_msvc else None)
  
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
index 0d65ebb59..09497133b 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
@@ -1,4 +1,7 @@
-Fix issues in build scripts:
+From 171df10f86be6defb9e317ac62df8a7b0389b901 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 30 Mar 2022 17:39:33 +0800
+Subject: [PATCH] Fix issues in build scripts:
 
 * remove hardcode lib path from buildtools/config.py which is not suitable for
   cross build
@@ -15,10 +18,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/buildtools/config.py b/buildtools/config.py
-index c837e5d..d426005 100644
+index 94c216ec..b3ec3f2e 100644
 --- a/buildtools/config.py
 +++ b/buildtools/config.py
-@@ -312,8 +312,8 @@ class Configuration(object):
+@@ -336,8 +336,8 @@ class Configuration(object):
                  # wx-config doesn't output that for some reason.  For now, just
                  # add it unconditionally but we should really check if the lib is
                  # really found there or wx-config should be fixed.
@@ -30,10 +33,10 @@ index c837e5d..d426005 100644
              # Move the various -I, -D, etc. flags we got from the config scripts
              # into the distutils lists.
 diff --git a/setup.py b/setup.py
-index 64bec4b..fb29253 100644
+index fad5aba8..eade737b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -130,7 +130,7 @@ class wx_build(orig_build):
+@@ -135,7 +135,7 @@ class wx_build(orig_build):
                  'message and the wxWidgets and Phoenix build steps in the future.\n')
  
              # Use the same Python that is running this script.
@@ -42,7 +45,7 @@ index 64bec4b..fb29253 100644
              cmd = ' '.join(cmd)
              runcmd(cmd)
  
-@@ -233,7 +233,7 @@ if haveWheel:
+@@ -238,7 +238,7 @@ if haveWheel:
  class wx_install(orig_install):
      def finalize_options(self):
          orig_install.finalize_options(self)
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb
rename to meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
index cc6b6cef6..64e2b3ebb 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Python3 interface to the wxWidgets Cross-platform C++ GUI toolkit."
 HOMEPAGE = "http://www.wxpython.org"
 
-LICENSE = "LGPL-2.0-only & WXwindows"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bdabf9e11191e2b9d3b6aef5f338ec00"
+LICENSE = "LGPL-2.0-only & WXwindows & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=102f37a0d23aa258e59e4cc8b5380b35"
 
 DEPENDS = "python3-attrdict3-native python3-six-native wxwidgets-native \
            wxwidgets \
@@ -14,9 +14,8 @@ SRC_URI += "file://add-back-option-build-base.patch \
            file://wxgtk-fixup-build-scripts.patch \
            file://not-overwrite-cflags-cxxflags.patch \
            file://0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch \
-           file://0001-sip-Fix-build-with-gcc-14.patch \
            "
-SRC_URI[sha256sum] = "e48de211a6606bf072ec3fa778771d6b746c00b7f4b970eb58728ddf56d13d5c"
+SRC_URI[sha256sum] = "5dbcb0650f67fdc2c5965795a255ffaa3d7b09fb149aa8da2d0d9aa44e38e2ba"
 
 S = "${WORKDIR}/wxPython-${PV}"
 
-- 
2.39.5


