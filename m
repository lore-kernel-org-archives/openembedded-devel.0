Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.316.1623866386083942038
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 10:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jyZxAjbp;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id h12so2851123pfe.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 10:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m0/L0k5L753T066kqEc9jprFH3c8Zv5ChtQ1NKc9Rts=;
        b=jyZxAjbpV/wJLlVkK2zh9Y4SZNuzgCGNxWWVGj93IvG75DGLYLP2AZGsqqQkfKH9Dw
         4rgrsNcObC36MEn55P8U318TQCCmqH/8b+R7oEHklfe7Luntn0RsqZhSYvMlD3C+P7X4
         cp4xfyp26YjYuL6JfMpVwXiuPPDKCHidOneiaAb0wx3mApSFBhG4grnNASNvsG+GvFOS
         KGW+xnqu8W+59OUqX9B83ErPFe1QyozH0zV+lGf5PcBSeoM/TE3n9V+BDAyu5/fi3kIk
         8AxfjtUBZ9xT3fnDTbYkkUrhemlIyWhQAGgk4yA6nVbWqEXc86rqN953NHKVnvIAake9
         fryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m0/L0k5L753T066kqEc9jprFH3c8Zv5ChtQ1NKc9Rts=;
        b=fzTYT3pM0Sp2EGsp5T8DGuV2GHXyNfu8csTg3nKvNX1k/qt9yC16wNFhjPwQkUqKQ2
         YaXxfhOf0l+K21++BdZ3jSJTBkugIAIOjmVhPeEenZ5jTMxhVy8mRzlwW0fxu4ED5JkM
         KvBXT0e6xbVzMSqIo7uaK+X3TE0LO5rJO8H5anjOix1i7uN35WQ1KpzJil4AHs1oTCV1
         eD3w/DANKpG6mI9YqAWtfNIFI9J3q6UzWMg8dmI2krI/JHQ9K0arHbW5MT+L19faso6a
         cWvLbJ/SqAe9V2N/WaddDLG5kafRkiJR9bSMRBZoj+zsdPxrDSiAN4yICOzfEtF7/Vcs
         43Zg==
X-Gm-Message-State: AOAM5300rUR/raspJ9NrO4EgoyHEZmG/z0OSVLCwDS+SIFDPOEj/Nv1y
	rC1DWvH3OEoHeKv+DhIZCREl5IE4+JUSsw==
X-Google-Smtp-Source: ABdhPJyhRCipbQeDbohHxOTkx/x0yRW5mBYA88zfJ900EmkpnzhCVQMrSCOIbWZYRAGMXjMrCxC/uw==
X-Received: by 2002:a65:4d01:: with SMTP id i1mr812574pgt.262.1623866385392;
        Wed, 16 Jun 2021 10:59:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id y7sm2872982pfy.153.2021.06.16.10.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:59:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/9] nodejs: Update to 14.17.1
Date: Wed, 16 Jun 2021 10:59:36 -0700
Message-Id: <20210616175937.323664-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616175937.323664-1-raj.khem@gmail.com>
References: <20210616175937.323664-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop upstreamed v8-call-new-ListFormatter-createInstance.patch patch
Add a patch for ppc64/clang to drop -mminimal-toc since clang does not
have this option

License-Update: URLs updated [1] and copyright owners too [2]

[1] https://github.com/nodejs/node/commit/2d7e0b6912bd04b44ed652bc0f40bb343652d926#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7
[2] https://github.com/nodejs/node/commit/b57785d89bc548c4048118606919d66dff1c7eb7#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...4-Do-not-use-mminimal-toc-with-clang.patch | 28 ++++++
 ...all-new-ListFormatter-createInstance.patch | 93 -------------------
 .../{nodejs_14.16.1.bb => nodejs_14.17.1.bb}  |  8 +-
 3 files changed, 33 insertions(+), 96 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_14.16.1.bb => nodejs_14.17.1.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
new file mode 100644
index 0000000000..00b2e9baa9
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
@@ -0,0 +1,28 @@
+From 0976af0f3b328436ea44a74a406f311adb2ab211 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Jun 2021 19:01:31 -0700
+Subject: [PATCH] ppc64: Do not use -mminimal-toc with clang
+
+clang does not support this option
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ common.gypi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common.gypi b/common.gypi
+index ee91fb1d..049c8f8c 100644
+--- a/common.gypi
++++ b/common.gypi
+@@ -413,7 +413,7 @@
+             'ldflags': [ '-m32' ],
+           }],
+           [ 'target_arch=="ppc64" and OS!="aix"', {
+-            'cflags': [ '-m64', '-mminimal-toc' ],
++            'cflags': [ '-m64' ],
+             'ldflags': [ '-m64' ],
+           }],
+           [ 'target_arch=="s390x"', {
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch b/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch
deleted file mode 100644
index 806360084c..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 035c305ce7761f51328b45f1bd83e26aef267c9d Mon Sep 17 00:00:00 2001
-From: Frank Tang <ftang@chromium.org>
-Date: Thu, 15 Oct 2020 22:44:27 -0700
-Subject: [PATCH] [Intl] call new ListFormatter::createInstance
-
-The one we currently using is now marked as internal and to be removed
-for 68. Migrating to the style which already avaiable in ICU 67-1.
-
-Upstream-Status: Backport
-Bug: v8:11031
-Change-Id: I668382a2e1b8602ddca02bf231c5008a6c92bf2d
-Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/2477751
-Reviewed-by: Jakob Kummerow <jkummerow@chromium.org>
-Commit-Queue: Frank Tang <ftang@chromium.org>
-Cr-Commit-Position: refs/heads/master@{#70638}
----
- deps/v8/src/objects/js-list-format.cc | 55 ++++++++++++-----------------------
- 1 file changed, 18 insertions(+), 37 deletions(-)
-
---- a/deps/v8/src/objects/js-list-format.cc
-+++ b/deps/v8/src/objects/js-list-format.cc
-@@ -29,46 +29,27 @@ namespace v8 {
- namespace internal {
- 
- namespace {
--const char* kStandard = "standard";
--const char* kOr = "or";
--const char* kUnit = "unit";
--const char* kStandardShort = "standard-short";
--const char* kOrShort = "or-short";
--const char* kUnitShort = "unit-short";
--const char* kStandardNarrow = "standard-narrow";
--const char* kOrNarrow = "or-narrow";
--const char* kUnitNarrow = "unit-narrow";
- 
--const char* GetIcuStyleString(JSListFormat::Style style,
--                              JSListFormat::Type type) {
-+UListFormatterWidth GetIcuWidth(JSListFormat::Style style) {
-+  switch (style) {
-+    case JSListFormat::Style::LONG:
-+      return ULISTFMT_WIDTH_WIDE;
-+    case JSListFormat::Style::SHORT:
-+      return ULISTFMT_WIDTH_SHORT;
-+    case JSListFormat::Style::NARROW:
-+      return ULISTFMT_WIDTH_NARROW;
-+  }
-+  UNREACHABLE();
-+}
-+
-+UListFormatterType GetIcuType(JSListFormat::Type type) {
-   switch (type) {
-     case JSListFormat::Type::CONJUNCTION:
--      switch (style) {
--        case JSListFormat::Style::LONG:
--          return kStandard;
--        case JSListFormat::Style::SHORT:
--          return kStandardShort;
--        case JSListFormat::Style::NARROW:
--          return kStandardNarrow;
--      }
-+      return ULISTFMT_TYPE_AND;
-     case JSListFormat::Type::DISJUNCTION:
--      switch (style) {
--        case JSListFormat::Style::LONG:
--          return kOr;
--        case JSListFormat::Style::SHORT:
--          return kOrShort;
--        case JSListFormat::Style::NARROW:
--          return kOrNarrow;
--      }
-+      return ULISTFMT_TYPE_OR;
-     case JSListFormat::Type::UNIT:
--      switch (style) {
--        case JSListFormat::Style::LONG:
--          return kUnit;
--        case JSListFormat::Style::SHORT:
--          return kUnitShort;
--        case JSListFormat::Style::NARROW:
--          return kUnitNarrow;
--      }
-+      return ULISTFMT_TYPE_UNITS;
-   }
-   UNREACHABLE();
- }
-@@ -143,7 +124,7 @@ MaybeHandle<JSListFormat> JSListFormat::
-   icu::Locale icu_locale = r.icu_locale;
-   UErrorCode status = U_ZERO_ERROR;
-   icu::ListFormatter* formatter = icu::ListFormatter::createInstance(
--      icu_locale, GetIcuStyleString(style_enum, type_enum), status);
-+      icu_locale, GetIcuType(type_enum), GetIcuWidth(style_enum), status);
-   if (U_FAILURE(status) || formatter == nullptr) {
-     delete formatter;
-     THROW_NEW_ERROR(isolate, NewRangeError(MessageTemplate::kIcuError),
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
index 48bf2f4a8a..5ac4f9dc7d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=85bf260d8b6de1588f57abc5dc66587c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a1016f9b7979cfe6fc3466a9bba60b1e"
 
 DEPENDS = "openssl"
 DEPENDS_append_class-target = " qemu-native"
@@ -21,7 +21,6 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://big-endian.patch \
            file://mips-warnings.patch \
-           file://v8-call-new-ListFormatter-createInstance.patch \
            file://mips-less-memory.patch \
            "
 SRC_URI_append_class-target = " \
@@ -30,7 +29,10 @@ SRC_URI_append_class-target = " \
 SRC_URI_append_toolchain-clang_x86 = " \
            file://libatomic.patch \
            "
-SRC_URI[sha256sum] = "e44adbbed6756c2c1a01258383e9f00df30c147b36e438f6369b5ef1069abac3"
+SRC_URI_append_toolchain-clang_powerpc64le = " \
+           file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
+           "
+SRC_URI[sha256sum] = "ddf1d2d56ddf35ecd98c5ea5ddcd690b245899f289559b4330c921255f5a247f"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.32.0

