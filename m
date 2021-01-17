Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.21197.1610905612635208712
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T7R7WUQj;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id c12so8810349pfo.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=4F8+hdNOjur9K2hpGipQBeMiy0SzbZYgS/3CgllIRfw=;
        b=T7R7WUQjyk64dxKwXpk+mxFmmJPE4GIaZqN6PMChULj3IPQE6tV8KFENczeKME5YjK
         12L7TSZJO+TvhUJlqUPDs4BDFc+3Y9qhi107zyKLPZDx/YF5B0bHfKuBmJnykfoMHkMN
         4ktcpc9RqaMnBHJBChJ/b5MuGk4OS+RiObOWdvhmQzA1FlIOw2VXV8uF5VUTn2YRoxBU
         r0gIgTnsVIpR6uzFyEY97h48xdz6NiUkfcAzScyta6YNqae5/+EVmrZLiUPh9McefeZ2
         4AD3z7V9cYyb/9I+2bEb6JFPerRfrhm4hxsEc6nX+mLXCyK+W0Qv6wlz3bspukDaHTAl
         +o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=4F8+hdNOjur9K2hpGipQBeMiy0SzbZYgS/3CgllIRfw=;
        b=DkuPFK6YHtGMzgQMdKGXGI5a/ZeF894NRQuhX0FCEv8s8cpOe2QuaY3mvJKPyxpYfl
         e6NbSmboSEaXL/QOQRcRxH1jNQE+PBvP7P94fTDGvePJAZHlDE9C0RUhZFXYFRQWOPVI
         mT/fIiCNEpHR29G20trGe6XN4D23r0Afi56EdY/TnwhLfangDA5JLPKw6hVh7jOwwDjS
         tzs7dz1OgE+QZtUBOfhJ7/0QT5pePKa1wTSzKO72WW38L7SwWxQIjSR+mQf1ebUoiQcX
         JdATPoSrPm0/7hMzGyaMEJe565FEA047fAE4w3V2f4INv4UG1oWz6wWqeJOLZVbmruvy
         zNhA==
X-Gm-Message-State: AOAM533cUA79XQNQXni6uH6gqew0qW1VGaMCCV4nnv5k3p+LGht7hCiM
	VSvrIa+IvXZ/Q7Pp41IGrDh4NAQ3ILGN/g==
X-Google-Smtp-Source: ABdhPJxtMSQIoNVSB7XcXWTNMQFSo0LCLP7QjlKItU2IIxYQvYbDdYPflC22q6Co9U8UzO0l9aOH0Q==
X-Received: by 2002:a63:5407:: with SMTP id i7mr22869402pgb.418.1610905612002;
        Sun, 17 Jan 2021 09:46:52 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:51 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 20/28] nodejs: Fix build with icu 67.1
Date: Sun, 17 Jan 2021 09:46:18 -0800
Message-Id: <85f254c7444a3fa51556502b1c3f6efe1ad5e8a0.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Remove soon-to-be removed getAllFieldPositions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrej Valek <andrej.valek@siemens.com>
(cherry picked from commit 7910f2b64575dcd3352effd441accb3b56e3554d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1

