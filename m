Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.1704.1618683583729434057
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 11:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qTOzF5uX;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id p16so11665672plf.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QuMR2Rz107jZkBvzONO8/63UHatmJ5KdaKBzpT6jkMQ=;
        b=qTOzF5uXa3iOt+uagW3TdXyZ+YRDMpqsJd95bzLgdS3bFB5RwzY0a3OjAAmv08vyxG
         sCUWU22qY8ybBp4pIANr6L8+g2E/+tQZk6R0QjFLZn+omkMOmqgebcxIRbG1s4RCDNF8
         zK0TU1BIdJu7BJsQtrOywNMy+LjbadOIqYBekYpyHXEehBsZ8JhcV5x5PcGn9BMSrkIB
         ob980Jlwva/6yD8ks01bdsS/MtyTULbnOnmQE3zIWLCEfyZv8DUVPR45hKgHelbyIjLC
         j70RS8sk4PlISZ7JT28yteaJOc7BGqEe88LN9Gj1fEibUFrVHd7wf3TU4nsxQmQ2djQF
         FhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QuMR2Rz107jZkBvzONO8/63UHatmJ5KdaKBzpT6jkMQ=;
        b=mchWE0IMdGlfj1drwuRrifydIBnU2fzmgqeyut9EG+unKO6vO/46TB46kTqWU/H6wi
         0p5uiULWl51+b4nBNw8s/IzLpA5gM61Sg6KBQr6TFCQYrBz1Imo7jFPLkHqDNiDKAfLp
         LC6FWoQ2tKRnDOjMpISU89ZkfV+9mD+29IGLaoEtt9jobPJI27tJCRwIcsb+V5k0Pmh/
         N3N42toRGy7DoqPcUpN4IZqSB3MDW3ebxF+nGXvL4zdTVm0gUcreY3gG8Uq0cavSIWxj
         J1qO4z0ENhsiyiAZCa37nlwQx0RxtXRTbg7Ks+8rpqQ1tUMjeWICIeYg+UG7RId+sxPW
         eFKA==
X-Gm-Message-State: AOAM530zh01oSEYjhUcECPlIQzUQ1wszANcTLr5BhP8r5oF+gqarggju
	JuZKkzvA+PXu25zvpY97NoFZ+UtVn/LsvQ==
X-Google-Smtp-Source: ABdhPJwWNRcyXwp73cuexTBgOVifqZyV/8NZGgpS8ZQNii0roqyP3+W60O7H2VdrnO3sDDnl8LoM/Q==
X-Received: by 2002:a17:90a:bb85:: with SMTP id v5mr16018567pjr.106.1618683583040;
        Sat, 17 Apr 2021 11:19:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id t19sm8393225pjs.1.2021.04.17.11.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 11:19:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 2/3] nodejs: Fix build with icu-69
Date: Sat, 17 Apr 2021 11:19:37 -0700
Message-Id: <20210417181938.3824401-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210417181938.3824401-1-raj.khem@gmail.com>
References: <20210417181938.3824401-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

backport relevant v8 patch to fix the build issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

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
index b24a6d6567..32bdd713b5 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://big-endian.patch \
            file://mips-warnings.patch \
+           file://v8-call-new-ListFormatter-createInstance.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.31.1

