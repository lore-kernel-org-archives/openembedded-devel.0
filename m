Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.814.1588829758314075134
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2020 22:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=al6Wu6H3;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id a5so2143844pjh.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2020 22:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DhTwjvVQ8r081Edc412COquJPBwkfVepQdl07dOHykQ=;
        b=al6Wu6H3mhRd6kjXGdeFN2NK5ZXeOM+Iv1Ld2PErwUER1osA1sjXPGPboYdZkYs3/e
         0IynDReWNuEuQY/2rjBIR21144IoLRdS0kyUNnPGihCml4UEijQ3yyJpFKEPI45m1Oi5
         nJeipOoYsvqUJ3Z8WYjZCyH2rdVpWcZd1wQ5GQLBsjxz80bW6G1Ci25SkQYG2svih+RB
         aEi9AInGXkKPg/TDWnLEZdPiDrpSPwboSWhP5JZyq32BFTOvU1XQ7bt9BcFLkQuwahXG
         tLoUXFDkDdrg7N5wBt0qaEylTQQaepCVxJAhAA8PQwr+f9g7eIAckVVWr3oDg5d9QuGr
         ZotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DhTwjvVQ8r081Edc412COquJPBwkfVepQdl07dOHykQ=;
        b=sJhN6aqF+GYRveolbEIZNRL5LIcwVo2Uov2GE2QexTeWRBs316p5YDqx+c7v48tJGg
         Bvw487KJfUrFioj6hN09JwgU5HUFQPjuyy7Wj7yUQalEpqhBbHzhCDl4I+BtWPCeR9Vp
         TmnFJ4Y2/k3LbbcykgFY2OuW/+Io9acnj97b9aGyaipgCpsObNs7KZl2v9pCaj+OW2YH
         aW0qWCZh+UZ5MSF+GtxjNLUDaouLKNylUK8zSmLi1Tq1txvCF9H8pl85IxsoVuMQgvf5
         9g30gSKdCHqP/jNtfXINAXoevAdo0ykPRiCZCCIq5zbHhATEvGqjsUKuxkNc2FgmuJ0B
         bzEg==
X-Gm-Message-State: AGi0PuYVFxw7VwON9eKSUNvhimYXwIP7FUG1tOYjrWvLHlsxNOyvi5YL
	zNUFhjqpYaDWC/6oPlJXMxUThtNFdfs=
X-Google-Smtp-Source: APiQypLC3IKDBBFdzsjkuzuRpr0UQS8Eoi/QSkgSVVAAqCwRkKl2HCH094Insgawr59VzZ8NgNXaFw==
X-Received: by 2002:a17:90a:780d:: with SMTP id w13mr14088231pjk.20.1588829757359;
        Wed, 06 May 2020 22:35:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d90d])
        by smtp.gmail.com with ESMTPSA id v9sm6171722pju.3.2020.05.06.22.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 22:35:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrej Valek <andrej.valek@siemens.com>
Subject: [meta-oe][PATCH 2/2] nodejs: Fix build with icu 67.1
Date: Wed,  6 May 2020 22:35:53 -0700
Message-Id: <20200507053553.1540194-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507053553.1540194-1-raj.khem@gmail.com>
References: <20200507053553.1540194-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove soon-to-be removed getAllFieldPositions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrej Valek <andrej.valek@siemens.com>
---
 .../0001-deps-V8-backport-3f8dc4b2e5ba.patch  | 194 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_12.14.1.bb |   1 +
 2 files changed, 195 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-V8-backport-3f8dc4b2e5ba.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-V8-backport-3f8dc4b2e5ba.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-V8-backport-3f8dc4b2e5ba.patch
new file mode 100644
index 0000000000..07dbdfe564
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-V8-backport-3f8dc4b2e5ba.patch
@@ -0,0 +1,194 @@
+From 836311710ca8d49fdf4d619e3a738a445c413605 Mon Sep 17 00:00:00 2001
+From: Ujjwal Sharma <ryzokuken@disroot.org>
+Date: Wed, 22 Apr 2020 12:20:17 +0530
+Subject: [PATCH] deps: V8: backport 3f8dc4b2e5ba
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Original commit message:
+
+    [intl] Remove soon-to-be removed getAllFieldPositions
+
+    Needed to land ICU67.1 soon.
+
+    Bug: v8:10393
+    Change-Id: I3c7737ca600d6ccfdc46ffaddfb318ce60bc7618
+    Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/2136489
+    Reviewed-by: Jakob Kummerow <jkummerow@chromium.org>
+    Commit-Queue: Frank Tang <ftang@chromium.org>
+    Cr-Commit-Position: refs/heads/master@{#67027}
+
+Refs: https://github.com/v8/v8/commit/3f8dc4b2e5baf77b463334c769af85b79d8c1463
+
+PR-URL: https://github.com/nodejs/node/pull/32993
+Reviewed-By: Michaël Zasso <targos@protonmail.com>
+Reviewed-By: Matheus Marchini <mat@mmarchini.me>
+Reviewed-By: Steven R Loomis <srloomis@us.ibm.com>
+Reviewed-By: Richard Lau <riclau@uk.ibm.com>
+---
+ common.gypi                             |  2 +-
+ deps/v8/src/objects/js-number-format.cc | 72 +++++++++++++------------
+ 2 files changed, 38 insertions(+), 36 deletions(-)
+
+diff --git a/common.gypi b/common.gypi
+index b86e5e0..a7b37e6 100644
+--- a/common.gypi
++++ b/common.gypi
+@@ -38,7 +38,7 @@
+ 
+     # Reset this number to 0 on major V8 upgrades.
+     # Increment by one for each non-official patch applied to deps/v8.
+-    'v8_embedder_string': '-node.16',
++    'v8_embedder_string': '-node.17',
+ 
+     ##### V8 defaults for Node.js #####
+ 
+diff --git a/deps/v8/src/objects/js-number-format.cc b/deps/v8/src/objects/js-number-format.cc
+index d1e3ef4..757c665 100644
+--- a/deps/v8/src/objects/js-number-format.cc
++++ b/deps/v8/src/objects/js-number-format.cc
+@@ -1252,42 +1252,31 @@ MaybeHandle<JSNumberFormat> JSNumberFormat::New(Isolate* isolate,
+ }
+ 
+ namespace {
+-Maybe<icu::UnicodeString> IcuFormatNumber(
++Maybe<bool> IcuFormatNumber(
+     Isolate* isolate,
+     const icu::number::LocalizedNumberFormatter& number_format,
+-    Handle<Object> numeric_obj, icu::FieldPositionIterator* fp_iter) {
++    Handle<Object> numeric_obj, icu::number::FormattedNumber* formatted) {
+   // If it is BigInt, handle it differently.
+   UErrorCode status = U_ZERO_ERROR;
+-  icu::number::FormattedNumber formatted;
+   if (numeric_obj->IsBigInt()) {
+     Handle<BigInt> big_int = Handle<BigInt>::cast(numeric_obj);
+     Handle<String> big_int_string;
+     ASSIGN_RETURN_ON_EXCEPTION_VALUE(isolate, big_int_string,
+                                      BigInt::ToString(isolate, big_int),
+-                                     Nothing<icu::UnicodeString>());
+-    formatted = number_format.formatDecimal(
++                                     Nothing<bool>());
++    *formatted = number_format.formatDecimal(
+         {big_int_string->ToCString().get(), big_int_string->length()}, status);
+   } else {
+     double number = numeric_obj->Number();
+-    formatted = number_format.formatDouble(number, status);
++    *formatted = number_format.formatDouble(number, status);
+   }
+   if (U_FAILURE(status)) {
+     // This happen because of icu data trimming trim out "unit".
+     // See https://bugs.chromium.org/p/v8/issues/detail?id=8641
+-    THROW_NEW_ERROR_RETURN_VALUE(isolate,
+-                                 NewTypeError(MessageTemplate::kIcuError),
+-                                 Nothing<icu::UnicodeString>());
+-  }
+-  if (fp_iter) {
+-    formatted.getAllFieldPositions(*fp_iter, status);
++    THROW_NEW_ERROR_RETURN_VALUE(
++        isolate, NewTypeError(MessageTemplate::kIcuError), Nothing<bool>());
+   }
+-  icu::UnicodeString result = formatted.toString(status);
+-  if (U_FAILURE(status)) {
+-    THROW_NEW_ERROR_RETURN_VALUE(isolate,
+-                                 NewTypeError(MessageTemplate::kIcuError),
+-                                 Nothing<icu::UnicodeString>());
+-  }
+-  return Just(result);
++  return Just(true);
+ }
+ 
+ }  // namespace
+@@ -1298,10 +1287,16 @@ MaybeHandle<String> JSNumberFormat::FormatNumeric(
+     Handle<Object> numeric_obj) {
+   DCHECK(numeric_obj->IsNumeric());
+ 
+-  Maybe<icu::UnicodeString> maybe_format =
+-      IcuFormatNumber(isolate, number_format, numeric_obj, nullptr);
++  icu::number::FormattedNumber formatted;
++  Maybe<bool> maybe_format =
++      IcuFormatNumber(isolate, number_format, numeric_obj, &formatted);
+   MAYBE_RETURN(maybe_format, Handle<String>());
+-  return Intl::ToString(isolate, maybe_format.FromJust());
++  UErrorCode status = U_ZERO_ERROR;
++  icu::UnicodeString result = formatted.toString(status);
++  if (U_FAILURE(status)) {
++    THROW_NEW_ERROR(isolate, NewTypeError(MessageTemplate::kIcuError), String);
++  }
++  return Intl::ToString(isolate, result);
+ }
+ 
+ namespace {
+@@ -1414,12 +1409,18 @@ std::vector<NumberFormatSpan> FlattenRegionsToParts(
+ }
+ 
+ namespace {
+-Maybe<int> ConstructParts(Isolate* isolate, const icu::UnicodeString& formatted,
+-                          icu::FieldPositionIterator* fp_iter,
++Maybe<int> ConstructParts(Isolate* isolate,
++                          icu::number::FormattedNumber* formatted,
+                           Handle<JSArray> result, int start_index,
+                           Handle<Object> numeric_obj, bool style_is_unit) {
++  UErrorCode status = U_ZERO_ERROR;
++  icu::UnicodeString formatted_text = formatted->toString(status);
++  if (U_FAILURE(status)) {
++    THROW_NEW_ERROR_RETURN_VALUE(
++        isolate, NewTypeError(MessageTemplate::kIcuError), Nothing<int>());
++  }
+   DCHECK(numeric_obj->IsNumeric());
+-  int32_t length = formatted.length();
++  int32_t length = formatted_text.length();
+   int index = start_index;
+   if (length == 0) return Just(index);
+ 
+@@ -1428,13 +1429,14 @@ Maybe<int> ConstructParts(Isolate* isolate, const icu::UnicodeString& formatted,
+   // other region covers some part of the formatted string. It's possible
+   // there's another field with exactly the same begin and end as this backdrop,
+   // in which case the backdrop's field_id of -1 will give it lower priority.
+-  regions.push_back(NumberFormatSpan(-1, 0, formatted.length()));
++  regions.push_back(NumberFormatSpan(-1, 0, formatted_text.length()));
+ 
+   {
+-    icu::FieldPosition fp;
+-    while (fp_iter->next(fp)) {
+-      regions.push_back(NumberFormatSpan(fp.getField(), fp.getBeginIndex(),
+-                                         fp.getEndIndex()));
++    icu::ConstrainedFieldPosition cfp;
++    cfp.constrainCategory(UFIELD_CATEGORY_NUMBER);
++    while (formatted->nextPosition(cfp, status)) {
++      regions.push_back(
++          NumberFormatSpan(cfp.getField(), cfp.getStart(), cfp.getLimit()));
+     }
+   }
+ 
+@@ -1456,7 +1458,7 @@ Maybe<int> ConstructParts(Isolate* isolate, const icu::UnicodeString& formatted,
+     Handle<String> substring;
+     ASSIGN_RETURN_ON_EXCEPTION_VALUE(
+         isolate, substring,
+-        Intl::ToString(isolate, formatted, part.begin_pos, part.end_pos),
++        Intl::ToString(isolate, formatted_text, part.begin_pos, part.end_pos),
+         Nothing<int>());
+     Intl::AddElement(isolate, result, index, field_type_string, substring);
+     ++index;
+@@ -1476,14 +1478,14 @@ MaybeHandle<JSArray> JSNumberFormat::FormatToParts(
+       number_format->icu_number_formatter().raw();
+   CHECK_NOT_NULL(fmt);
+ 
+-  icu::FieldPositionIterator fp_iter;
+-  Maybe<icu::UnicodeString> maybe_format =
+-      IcuFormatNumber(isolate, *fmt, numeric_obj, &fp_iter);
++  icu::number::FormattedNumber formatted;
++  Maybe<bool> maybe_format =
++      IcuFormatNumber(isolate, *fmt, numeric_obj, &formatted);
+   MAYBE_RETURN(maybe_format, Handle<JSArray>());
+ 
+   Handle<JSArray> result = factory->NewJSArray(0);
+   Maybe<int> maybe_format_to_parts = ConstructParts(
+-      isolate, maybe_format.FromJust(), &fp_iter, result, 0, numeric_obj,
++      isolate, &formatted, result, 0, numeric_obj,
+       number_format->style() == JSNumberFormat::Style::UNIT);
+   MAYBE_RETURN(maybe_format_to_parts, Handle<JSArray>());
+ 
+-- 
+2.26.2
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
index d468fb3ffa..9f9f320aa7 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-build-allow-passing-multiple-libs-to-pkg_config.patch \
            file://0002-build-allow-use-of-system-installed-brotli.patch \
            file://mips-warnings.patch \
+           file://0001-deps-V8-backport-3f8dc4b2e5ba.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.26.2

