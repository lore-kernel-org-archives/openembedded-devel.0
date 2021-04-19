Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.988.1618866284860949736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 14:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EJitZfcE;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id cu16so16648261pjb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Apr 2021 14:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vlTVnzSZS+lb5by9euEcYUEQd64sJbykntT4sRD1CUs=;
        b=EJitZfcEZPwfZ5i1pehwI1otfN7xEIi6x7GdXhRkEsZvmCEbPnStcsud1QZbnt9b6c
         sOrAz/CGBnlH6KxI/e/DkBGGkqf/stpJBNoG9edX4Srw+uyt2vsJ8QLwOaK0khx8wGAw
         h/dMnFniBx4RwGEZoC7kYtN9VcfAEpZuMrZZrGvSpvIE0DYz1X/Zw5BmC9Bk2kmO8SKQ
         6Lee3o4nxsBfa+nhZidPjJtqOahOJbgcxwHyYc9Z7XuU7fiHmHkOImnqRXJFjGezr3zr
         iHEuLQPk40qHaD+uh4ByEP1xhN+wm6wPUfIn0cjrCzpH05Mv2I94xXMCcVnh15QUTIUo
         MyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlTVnzSZS+lb5by9euEcYUEQd64sJbykntT4sRD1CUs=;
        b=ItYwqj0w/hqrCPIz+MsOgbUSjWzcfkGJbUNCOihPnjor+tqvnRYdpQZC615B4RLU+3
         Ggt+/43cy0fgjBFPjxbAduy4i5KWZe9nDxyFiq2yjlLg/E3BlLMWmIcUzpjdXJoEj0xj
         4xP7gCcyErIhVt3H5cwq+ua0R2tN8l2vDY8Ud7nH8xKhbvz+x9MjiPXSbGsTubfSjy2N
         wSI1xd2su4/zFQFFOYr/Eel3Qs427J2BduPsd6wA4Okkw+Wc9w2xM0/b6EQl/iSCjRZE
         njQI5nBekMa2i4iA+UhoqsczvrJw6LzH/D/8NhJrKtB5gqHNbH5ZWgvSQ2jit2FsK3s+
         i/PQ==
X-Gm-Message-State: AOAM533yxF4JPUOI7dKe5rX9yYU2plUdjTDV3HF9uZUuCU6sZxIWetfA
	DMoy7erZa27iOatlkWKeqx6JRwMe2Ad4vg==
X-Google-Smtp-Source: ABdhPJwO2GQ626QHwVsq4B2QUp4P3koO8luTP0/EJP5IsWZQc5JJ16mMio2/BeTxrNuMJZNvwjncDA==
X-Received: by 2002:a17:90a:6f45:: with SMTP id d63mr1083776pjk.39.1618866284144;
        Mon, 19 Apr 2021 14:04:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id b7sm305439pjq.36.2021.04.19.14.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 14:04:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3 2/4] nodejs: Fix build with icu-69
Date: Mon, 19 Apr 2021 14:04:38 -0700
Message-Id: <20210419210440.2446040-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419210440.2446040-1-raj.khem@gmail.com>
References: <20210419210440.2446040-1-raj.khem@gmail.com>
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

