Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.526.1618596669104188244
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 11:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bBbQ/Kkh;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id q14-20020a17090a430eb02901503aaee02bso3986583pjg.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FI28hfRbA7tIZll0UxyIquLmLHiuB06v+vgXVZG4jVU=;
        b=bBbQ/KkhfFhIe8Y4G8d839qquBHQgEKmJQeXa8WGaPTxQygV4mLDL9MeNkIJjuY8g2
         8fq8s/x1c96GeG9r7luYTNQmG356Fm0EvA3zbShdk2a68sFoEQ2RCi2+H6duklPVrnnb
         MiauE8XHj2PYkBNu02dvmVI6h+suaXBvkMH90/zQMl9ly3refbtS0JIviZn9CSlzBUZ1
         wcfcpfYWgSL3makX4x6QVe8207CEAChRFeonCW51QWZmGDpvRjaS64XJ4nSzpGYEd9Rv
         i3r3R5Va6RmCRKOckN1E4BlcrFdUhzTr2/EM34gsGBsW6tsj+SxtaZA/H2kwlcQM/0De
         rX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FI28hfRbA7tIZll0UxyIquLmLHiuB06v+vgXVZG4jVU=;
        b=dMDR7oVtHuaq++ITpMQvcgJIrcsN8P8JyUR/5bXQo28Pc9/lY3hQxuUQYNyvEF7I5k
         w95grJQqVLESxJiz7K1L2PBTWZ4Vz1NTQphACTsNraMdr4LcbDBPQpgTc9dHKpOCSCyo
         qx5/zM7BGoNyxtshJ5PCe5XGbk9trkhQYZ+MIq99tcqokejO7hWOqYM+INsihQzpQBhi
         mZFY4BLjtEq6pg8Pka5D4fvmFGDwDWHEKYrUuBI0m8AxF72aMQAmRg1mAguqQDiIYhrk
         PkvUCOIgbWv8O8MXHdX44isGrh9bfavoYPhKxW83BkxoLJBtI2I8AOB1G7jQdSbkLxLW
         QN3w==
X-Gm-Message-State: AOAM531A5bqNzcFX0Dco49WBPnFDWj6lPeYaAdk6FIxWIroB31Q4FUGo
	591gLRVrIlwCMSWTUZvhlkXC191+kSbVTQ==
X-Google-Smtp-Source: ABdhPJx8tnFbOJXhAX9tHq1VRps7Jnvoi3Q1/mDVtA1dfaY1Z6D7Khvmlu9HSWUCRtKNCB1LPPJE2A==
X-Received: by 2002:a17:902:708b:b029:e6:77ca:3cb6 with SMTP id z11-20020a170902708bb02900e677ca3cb6mr10868461plk.84.1618596668230;
        Fri, 16 Apr 2021 11:11:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id gj13sm6148241pjb.57.2021.04.16.11.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:11:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nodejs: Fix build with icu-69
Date: Fri, 16 Apr 2021 11:11:06 -0700
Message-Id: <20210416181106.2405863-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

backport relevant v8 patch to fix the build issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...all-new-ListFormatter-createInstance.patch | 93 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_14.16.1.bb |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch b/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch
new file mode 100644
index 0000000000..806360084c
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch
@@ -0,0 +1,93 @@
+From 035c305ce7761f51328b45f1bd83e26aef267c9d Mon Sep 17 00:00:00 2001
+From: Frank Tang <ftang@chromium.org>
+Date: Thu, 15 Oct 2020 22:44:27 -0700
+Subject: [PATCH] [Intl] call new ListFormatter::createInstance
+
+The one we currently using is now marked as internal and to be removed
+for 68. Migrating to the style which already avaiable in ICU 67-1.
+
+Upstream-Status: Backport
+Bug: v8:11031
+Change-Id: I668382a2e1b8602ddca02bf231c5008a6c92bf2d
+Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/2477751
+Reviewed-by: Jakob Kummerow <jkummerow@chromium.org>
+Commit-Queue: Frank Tang <ftang@chromium.org>
+Cr-Commit-Position: refs/heads/master@{#70638}
+---
+ deps/v8/src/objects/js-list-format.cc | 55 ++++++++++++-----------------------
+ 1 file changed, 18 insertions(+), 37 deletions(-)
+
+--- a/deps/v8/src/objects/js-list-format.cc
++++ b/deps/v8/src/objects/js-list-format.cc
+@@ -29,46 +29,27 @@ namespace v8 {
+ namespace internal {
+ 
+ namespace {
+-const char* kStandard = "standard";
+-const char* kOr = "or";
+-const char* kUnit = "unit";
+-const char* kStandardShort = "standard-short";
+-const char* kOrShort = "or-short";
+-const char* kUnitShort = "unit-short";
+-const char* kStandardNarrow = "standard-narrow";
+-const char* kOrNarrow = "or-narrow";
+-const char* kUnitNarrow = "unit-narrow";
+ 
+-const char* GetIcuStyleString(JSListFormat::Style style,
+-                              JSListFormat::Type type) {
++UListFormatterWidth GetIcuWidth(JSListFormat::Style style) {
++  switch (style) {
++    case JSListFormat::Style::LONG:
++      return ULISTFMT_WIDTH_WIDE;
++    case JSListFormat::Style::SHORT:
++      return ULISTFMT_WIDTH_SHORT;
++    case JSListFormat::Style::NARROW:
++      return ULISTFMT_WIDTH_NARROW;
++  }
++  UNREACHABLE();
++}
++
++UListFormatterType GetIcuType(JSListFormat::Type type) {
+   switch (type) {
+     case JSListFormat::Type::CONJUNCTION:
+-      switch (style) {
+-        case JSListFormat::Style::LONG:
+-          return kStandard;
+-        case JSListFormat::Style::SHORT:
+-          return kStandardShort;
+-        case JSListFormat::Style::NARROW:
+-          return kStandardNarrow;
+-      }
++      return ULISTFMT_TYPE_AND;
+     case JSListFormat::Type::DISJUNCTION:
+-      switch (style) {
+-        case JSListFormat::Style::LONG:
+-          return kOr;
+-        case JSListFormat::Style::SHORT:
+-          return kOrShort;
+-        case JSListFormat::Style::NARROW:
+-          return kOrNarrow;
+-      }
++      return ULISTFMT_TYPE_OR;
+     case JSListFormat::Type::UNIT:
+-      switch (style) {
+-        case JSListFormat::Style::LONG:
+-          return kUnit;
+-        case JSListFormat::Style::SHORT:
+-          return kUnitShort;
+-        case JSListFormat::Style::NARROW:
+-          return kUnitNarrow;
+-      }
++      return ULISTFMT_TYPE_UNITS;
+   }
+   UNREACHABLE();
+ }
+@@ -143,7 +124,7 @@ MaybeHandle<JSListFormat> JSListFormat::
+   icu::Locale icu_locale = r.icu_locale;
+   UErrorCode status = U_ZERO_ERROR;
+   icu::ListFormatter* formatter = icu::ListFormatter::createInstance(
+-      icu_locale, GetIcuStyleString(style_enum, type_enum), status);
++      icu_locale, GetIcuType(type_enum), GetIcuWidth(style_enum), status);
+   if (U_FAILURE(status) || formatter == nullptr) {
+     delete formatter;
+     THROW_NEW_ERROR(isolate, NewRangeError(MessageTemplate::kIcuError),
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
index deaaf9fa58..3e5002bc9d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
@@ -81,6 +81,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://big-endian.patch \
            file://mips-warnings.patch \
+           file://v8-call-new-ListFormatter-createInstance.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.31.1

