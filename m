Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.12379.1597383439561275106
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=leYgZRJW;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id m8so4025486pfh.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3PyNBjCb9ADUX/4IocYyihAns42eYhnhLhBg/SWIKZw=;
        b=leYgZRJWNKvruKLupa6zr8sud7ONZ1W3eBpdffDC0vgAqFNQSGWTQHRYFJMZXHf5kA
         o10uKsryKghrQPbU8aiBTTgj8Qk79Hh+xIqVKdtNVy3AzjkeddSVGDdlvmfOS5IeFs2G
         suxRfprLNkCvbJj4VKNNU4n7L+06zF+TXPZVli6yY1Cyj3N2nrZCfYPkTlfsb2BR7Xtz
         w4gN6ZNW8UIBgPOBDGSEWWapmMy8R7Hpy4VyImOnBufXtP2hPOu/w/iHIBaHTSbnQ643
         7DDr7HNfkI9kpxn/im7ZilDpUaLq7iP4mmc62vjd8hVtnh/OeO4kb/VpCGBQB89sN63Y
         xX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3PyNBjCb9ADUX/4IocYyihAns42eYhnhLhBg/SWIKZw=;
        b=uZBc3tJBFGbBZVADBf0juZpGn6BqIolsNg0WA2Ca5spEzLfDSQVh7MFZS5pzHafBI7
         cbhalh2xSwIXxL7Tbpr9d27GYaRiAVdT8rVCdEqCeiEIKuCk8EqmjVtoPXL5osiSzTS9
         UIPaKwa7n5LMcBRSpDkQcPqaIQJ2k/Y0K/VnPpA4JjLdP5mxYD1l8t0YjvQwr10igqks
         EYk44YcyKx5TdGqqlPuWVarEX2wRLqJBvMrTJZgcaACo1dNs5fM20zLvCFA8qn2u9n7q
         G/EC7AxiJNr1H1hxwb+4nndRZ6R1xZ0GlZLfkDQevmk2fFGczU9Dlu23y3vmy3Oh16dh
         fnWg==
X-Gm-Message-State: AOAM531CTbD5tTzvbyaL7Afeo0sHxpGm1aPCfnofUat78TooFBOjwe+L
	HLXY0l3VEp/EMKsWOc/wqzsYuE0B5nbRgA==
X-Google-Smtp-Source: ABdhPJwAef1exscQsBh+lms2Dq9gYgHcA0UYyKCDnzRNU5FswZKKKsAwhsDUskeBE20hBZpnEnKg2w==
X-Received: by 2002:a05:6a00:1343:: with SMTP id k3mr681079pfu.91.1597383438322;
        Thu, 13 Aug 2020 22:37:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 18/21] nodejs: Upgrade to 12.18.3
Date: Thu, 13 Aug 2020 22:36:54 -0700
Message-Id: <20200814053657.1701247-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop already upstreamed patches
use builtin uv, it does not build without it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-passing-multiple-libs-to-pkg_config.patch |  41 ----
 .../0001-deps-V8-backport-3f8dc4b2e5ba.patch  | 194 ------------------
 ...allow-use-of-system-installed-brotli.patch |  66 ------
 ...Install-both-binaries-and-use-libdir.patch |  28 +--
 .../{nodejs_12.14.1.bb => nodejs_12.18.3.bb}  |  12 +-
 5 files changed, 14 insertions(+), 327 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-V8-backport-3f8dc4b2e5ba.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-system-installed-brotli.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.14.1.bb => nodejs_12.18.3.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch
deleted file mode 100644
index 13edf229b3..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From fdaa0e3bef93c5c72a7258b5f1e30718e7d81f9b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
-Date: Mon, 2 Mar 2020 12:17:09 +0000
-Subject: [PATCH 1/2] build: allow passing multiple libs to pkg_config
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Sometimes it's necessary to pass multiple library names to pkg-config,
-e.g. the brotli shared libraries can be pulled in with
-    pkg-config libbrotlienc libbrotlidec
-
-Update the code to handle both, strings (as used so far), and lists
-of strings.
-
-Signed-off-by: André Draszik <git@andred.net>
----
-Upstream-Status: Submitted [https://github.com/nodejs/node/pull/32046]
- configure.py | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.py b/configure.py
-index beb08df088..e3f78f2fed 100755
---- a/configure.py
-+++ b/configure.py
-@@ -680,7 +680,11 @@ def pkg_config(pkg):
-   retval = ()
-   for flag in ['--libs-only-l', '--cflags-only-I',
-                '--libs-only-L', '--modversion']:
--    args += [flag, pkg]
-+    args += [flag]
-+    if isinstance(pkg, list):
-+      args += pkg
-+    else:
-+      args += [pkg]
-     try:
-       proc = subprocess.Popen(shlex.split(pkg_config) + args,
-                               stdout=subprocess.PIPE)
--- 
-2.25.0
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-V8-backport-3f8dc4b2e5ba.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-V8-backport-3f8dc4b2e5ba.patch
deleted file mode 100644
index 07dbdfe564..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-V8-backport-3f8dc4b2e5ba.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From 836311710ca8d49fdf4d619e3a738a445c413605 Mon Sep 17 00:00:00 2001
-From: Ujjwal Sharma <ryzokuken@disroot.org>
-Date: Wed, 22 Apr 2020 12:20:17 +0530
-Subject: [PATCH] deps: V8: backport 3f8dc4b2e5ba
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Original commit message:
-
-    [intl] Remove soon-to-be removed getAllFieldPositions
-
-    Needed to land ICU67.1 soon.
-
-    Bug: v8:10393
-    Change-Id: I3c7737ca600d6ccfdc46ffaddfb318ce60bc7618
-    Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/2136489
-    Reviewed-by: Jakob Kummerow <jkummerow@chromium.org>
-    Commit-Queue: Frank Tang <ftang@chromium.org>
-    Cr-Commit-Position: refs/heads/master@{#67027}
-
-Refs: https://github.com/v8/v8/commit/3f8dc4b2e5baf77b463334c769af85b79d8c1463
-
-PR-URL: https://github.com/nodejs/node/pull/32993
-Reviewed-By: Michaël Zasso <targos@protonmail.com>
-Reviewed-By: Matheus Marchini <mat@mmarchini.me>
-Reviewed-By: Steven R Loomis <srloomis@us.ibm.com>
-Reviewed-By: Richard Lau <riclau@uk.ibm.com>
----
- common.gypi                             |  2 +-
- deps/v8/src/objects/js-number-format.cc | 72 +++++++++++++------------
- 2 files changed, 38 insertions(+), 36 deletions(-)
-
-diff --git a/common.gypi b/common.gypi
-index b86e5e0..a7b37e6 100644
---- a/common.gypi
-+++ b/common.gypi
-@@ -38,7 +38,7 @@
- 
-     # Reset this number to 0 on major V8 upgrades.
-     # Increment by one for each non-official patch applied to deps/v8.
--    'v8_embedder_string': '-node.16',
-+    'v8_embedder_string': '-node.17',
- 
-     ##### V8 defaults for Node.js #####
- 
-diff --git a/deps/v8/src/objects/js-number-format.cc b/deps/v8/src/objects/js-number-format.cc
-index d1e3ef4..757c665 100644
---- a/deps/v8/src/objects/js-number-format.cc
-+++ b/deps/v8/src/objects/js-number-format.cc
-@@ -1252,42 +1252,31 @@ MaybeHandle<JSNumberFormat> JSNumberFormat::New(Isolate* isolate,
- }
- 
- namespace {
--Maybe<icu::UnicodeString> IcuFormatNumber(
-+Maybe<bool> IcuFormatNumber(
-     Isolate* isolate,
-     const icu::number::LocalizedNumberFormatter& number_format,
--    Handle<Object> numeric_obj, icu::FieldPositionIterator* fp_iter) {
-+    Handle<Object> numeric_obj, icu::number::FormattedNumber* formatted) {
-   // If it is BigInt, handle it differently.
-   UErrorCode status = U_ZERO_ERROR;
--  icu::number::FormattedNumber formatted;
-   if (numeric_obj->IsBigInt()) {
-     Handle<BigInt> big_int = Handle<BigInt>::cast(numeric_obj);
-     Handle<String> big_int_string;
-     ASSIGN_RETURN_ON_EXCEPTION_VALUE(isolate, big_int_string,
-                                      BigInt::ToString(isolate, big_int),
--                                     Nothing<icu::UnicodeString>());
--    formatted = number_format.formatDecimal(
-+                                     Nothing<bool>());
-+    *formatted = number_format.formatDecimal(
-         {big_int_string->ToCString().get(), big_int_string->length()}, status);
-   } else {
-     double number = numeric_obj->Number();
--    formatted = number_format.formatDouble(number, status);
-+    *formatted = number_format.formatDouble(number, status);
-   }
-   if (U_FAILURE(status)) {
-     // This happen because of icu data trimming trim out "unit".
-     // See https://bugs.chromium.org/p/v8/issues/detail?id=8641
--    THROW_NEW_ERROR_RETURN_VALUE(isolate,
--                                 NewTypeError(MessageTemplate::kIcuError),
--                                 Nothing<icu::UnicodeString>());
--  }
--  if (fp_iter) {
--    formatted.getAllFieldPositions(*fp_iter, status);
-+    THROW_NEW_ERROR_RETURN_VALUE(
-+        isolate, NewTypeError(MessageTemplate::kIcuError), Nothing<bool>());
-   }
--  icu::UnicodeString result = formatted.toString(status);
--  if (U_FAILURE(status)) {
--    THROW_NEW_ERROR_RETURN_VALUE(isolate,
--                                 NewTypeError(MessageTemplate::kIcuError),
--                                 Nothing<icu::UnicodeString>());
--  }
--  return Just(result);
-+  return Just(true);
- }
- 
- }  // namespace
-@@ -1298,10 +1287,16 @@ MaybeHandle<String> JSNumberFormat::FormatNumeric(
-     Handle<Object> numeric_obj) {
-   DCHECK(numeric_obj->IsNumeric());
- 
--  Maybe<icu::UnicodeString> maybe_format =
--      IcuFormatNumber(isolate, number_format, numeric_obj, nullptr);
-+  icu::number::FormattedNumber formatted;
-+  Maybe<bool> maybe_format =
-+      IcuFormatNumber(isolate, number_format, numeric_obj, &formatted);
-   MAYBE_RETURN(maybe_format, Handle<String>());
--  return Intl::ToString(isolate, maybe_format.FromJust());
-+  UErrorCode status = U_ZERO_ERROR;
-+  icu::UnicodeString result = formatted.toString(status);
-+  if (U_FAILURE(status)) {
-+    THROW_NEW_ERROR(isolate, NewTypeError(MessageTemplate::kIcuError), String);
-+  }
-+  return Intl::ToString(isolate, result);
- }
- 
- namespace {
-@@ -1414,12 +1409,18 @@ std::vector<NumberFormatSpan> FlattenRegionsToParts(
- }
- 
- namespace {
--Maybe<int> ConstructParts(Isolate* isolate, const icu::UnicodeString& formatted,
--                          icu::FieldPositionIterator* fp_iter,
-+Maybe<int> ConstructParts(Isolate* isolate,
-+                          icu::number::FormattedNumber* formatted,
-                           Handle<JSArray> result, int start_index,
-                           Handle<Object> numeric_obj, bool style_is_unit) {
-+  UErrorCode status = U_ZERO_ERROR;
-+  icu::UnicodeString formatted_text = formatted->toString(status);
-+  if (U_FAILURE(status)) {
-+    THROW_NEW_ERROR_RETURN_VALUE(
-+        isolate, NewTypeError(MessageTemplate::kIcuError), Nothing<int>());
-+  }
-   DCHECK(numeric_obj->IsNumeric());
--  int32_t length = formatted.length();
-+  int32_t length = formatted_text.length();
-   int index = start_index;
-   if (length == 0) return Just(index);
- 
-@@ -1428,13 +1429,14 @@ Maybe<int> ConstructParts(Isolate* isolate, const icu::UnicodeString& formatted,
-   // other region covers some part of the formatted string. It's possible
-   // there's another field with exactly the same begin and end as this backdrop,
-   // in which case the backdrop's field_id of -1 will give it lower priority.
--  regions.push_back(NumberFormatSpan(-1, 0, formatted.length()));
-+  regions.push_back(NumberFormatSpan(-1, 0, formatted_text.length()));
- 
-   {
--    icu::FieldPosition fp;
--    while (fp_iter->next(fp)) {
--      regions.push_back(NumberFormatSpan(fp.getField(), fp.getBeginIndex(),
--                                         fp.getEndIndex()));
-+    icu::ConstrainedFieldPosition cfp;
-+    cfp.constrainCategory(UFIELD_CATEGORY_NUMBER);
-+    while (formatted->nextPosition(cfp, status)) {
-+      regions.push_back(
-+          NumberFormatSpan(cfp.getField(), cfp.getStart(), cfp.getLimit()));
-     }
-   }
- 
-@@ -1456,7 +1458,7 @@ Maybe<int> ConstructParts(Isolate* isolate, const icu::UnicodeString& formatted,
-     Handle<String> substring;
-     ASSIGN_RETURN_ON_EXCEPTION_VALUE(
-         isolate, substring,
--        Intl::ToString(isolate, formatted, part.begin_pos, part.end_pos),
-+        Intl::ToString(isolate, formatted_text, part.begin_pos, part.end_pos),
-         Nothing<int>());
-     Intl::AddElement(isolate, result, index, field_type_string, substring);
-     ++index;
-@@ -1476,14 +1478,14 @@ MaybeHandle<JSArray> JSNumberFormat::FormatToParts(
-       number_format->icu_number_formatter().raw();
-   CHECK_NOT_NULL(fmt);
- 
--  icu::FieldPositionIterator fp_iter;
--  Maybe<icu::UnicodeString> maybe_format =
--      IcuFormatNumber(isolate, *fmt, numeric_obj, &fp_iter);
-+  icu::number::FormattedNumber formatted;
-+  Maybe<bool> maybe_format =
-+      IcuFormatNumber(isolate, *fmt, numeric_obj, &formatted);
-   MAYBE_RETURN(maybe_format, Handle<JSArray>());
- 
-   Handle<JSArray> result = factory->NewJSArray(0);
-   Maybe<int> maybe_format_to_parts = ConstructParts(
--      isolate, maybe_format.FromJust(), &fp_iter, result, 0, numeric_obj,
-+      isolate, &formatted, result, 0, numeric_obj,
-       number_format->style() == JSNumberFormat::Style::UNIT);
-   MAYBE_RETURN(maybe_format_to_parts, Handle<JSArray>());
- 
--- 
-2.26.2
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-system-installed-brotli.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-system-installed-brotli.patch
deleted file mode 100644
index fc038f3aae..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-system-installed-brotli.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From f0f927feee8cb1fb173835d5c3f6beb6bf7d5e54 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
-Date: Mon, 2 Mar 2020 12:17:35 +0000
-Subject: [PATCH 2/2] build: allow use of system-installed brotli
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-brotli is available as a shared library since 2016, so it makes sense
-to allow its use as a system-installed version.
-
-Some of the infrastructure was in place already (node.gyp and
-node.gypi), but some bits in the configure script here were missing.
-
-Add them, keeping the default as before, to use the bundled version.
-
-Refs: https://github.com/google/brotli/pull/421
-Signed-off-by: André Draszik <git@andred.net>
----
-Upstream-Status: Submitted [https://github.com/nodejs/node/pull/32046]
- configure.py | 22 ++++++++++++++++++++++
- 1 file changed, 22 insertions(+)
-
-diff --git a/configure.py b/configure.py
-index e3f78f2fed..0190e31b41 100755
---- a/configure.py
-+++ b/configure.py
-@@ -301,6 +301,27 @@ shared_optgroup.add_option('--shared-zlib-libpath',
-     dest='shared_zlib_libpath',
-     help='a directory to search for the shared zlib DLL')
- 
-+shared_optgroup.add_option('--shared-brotli',
-+    action='store_true',
-+    dest='shared_brotli',
-+    help='link to a shared brotli DLL instead of static linking')
-+
-+shared_optgroup.add_option('--shared-brotli-includes',
-+    action='store',
-+    dest='shared_brotli_includes',
-+    help='directory containing brotli header files')
-+
-+shared_optgroup.add_option('--shared-brotli-libname',
-+    action='store',
-+    dest='shared_brotli_libname',
-+    default='brotlidec,brotlienc',
-+    help='alternative lib name to link to [default: %default]')
-+
-+shared_optgroup.add_option('--shared-brotli-libpath',
-+    action='store',
-+    dest='shared_brotli_libpath',
-+    help='a directory to search for the shared brotli DLL')
-+
- shared_optgroup.add_option('--shared-cares',
-     action='store_true',
-     dest='shared_cares',
-@@ -1692,6 +1713,7 @@ configure_napi(output)
- configure_library('zlib', output)
- configure_library('http_parser', output)
- configure_library('libuv', output)
-+configure_library('brotli', output, pkgname=['libbrotlidec', 'libbrotlienc'])
- configure_library('cares', output, pkgname='libcares')
- configure_library('nghttp2', output, pkgname='libnghttp2')
- configure_v8(output)
--- 
-2.25.0
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch
index 599f742b2f..92386fa779 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use-libdir.patch
@@ -20,11 +20,9 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  tools/install.py | 31 ++++++++++++++-----------------
  2 files changed, 21 insertions(+), 17 deletions(-)
 
-diff --git a/configure.py b/configure.py
-index 20cce214db..e2d78a2a51 100755
 --- a/configure.py
 +++ b/configure.py
-@@ -559,6 +559,12 @@ parser.add_option('--shared',
+@@ -602,6 +602,12 @@ parser.add_option('--shared',
      help='compile shared library for embedding node in another project. ' +
           '(This mode is not officially supported for regular applications)')
  
@@ -37,16 +35,14 @@ index 20cce214db..e2d78a2a51 100755
  parser.add_option('--without-v8-platform',
      action='store_true',
      dest='without_v8_platform',
-@@ -1103,6 +1109,7 @@ def configure_node(o):
-   if o['variables']['want_separate_host_toolset'] == 0:
-     o['variables']['node_code_cache'] = 'yes' # For testing
+@@ -1168,6 +1174,7 @@ def configure_node(o):
+   o['variables']['node_no_browser_globals'] = b(options.no_browser_globals)
+ 
    o['variables']['node_shared'] = b(options.shared)
 +  o['variables']['libdir'] = options.libdir
    node_module_version = getmoduleversion.get_version()
  
-   if sys.platform == 'darwin':
-diff --git a/tools/install.py b/tools/install.py
-index 655802980a..fe4723bf15 100755
+   if options.dest_os == 'android':
 --- a/tools/install.py
 +++ b/tools/install.py
 @@ -121,26 +121,23 @@ def subdir_files(path, dest, action):
@@ -72,24 +68,20 @@ index 655802980a..fe4723bf15 100755
 -      # in its source - see the _InstallableTargetInstallPath function.
 -      if sys.platform != 'darwin':
 -        output_prefix += 'lib.target/'
--
--  if 'false' == variables.get('node_shared'):
--    action([output_prefix + output_file], 'bin/' + output_file)
--  else:
--    action([output_prefix + output_file], 'lib/' + output_file)
 +    output_bin = 'node'
 +    output_lib = 'libnode.' + variables.get('shlib_suffix')
 +    # GYP will output to lib.target except on OS X, this is hardcoded
 +    # in its source - see the _InstallableTargetInstallPath function.
 +    if sys.platform != 'darwin':
 +      output_libprefix += 'lib.target/'
-+
+ 
+-  if 'false' == variables.get('node_shared'):
+-    action([output_prefix + output_file], 'bin/' + output_file)
+-  else:
+-    action([output_prefix + output_file], 'lib/' + output_file)
 +  action([output_prefix + output_bin], 'bin/' + output_bin)
 +  if 'true' == variables.get('node_shared'):
 +    action([output_libprefix + output_lib], variables.get('libdir') + '/' + output_lib)
  
    if 'true' == variables.get('node_use_dtrace'):
      action(['out/Release/node.d'], 'lib/dtrace/node.d')
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb
index 9f9f320aa7..8a9f32bce2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=be4d5107c64dc3d7c57e3797e1a0674b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=30e27bd6830002d9415e4a5da7901f03"
 
 DEPENDS = "openssl"
 DEPENDS_append_class-target = " nodejs-native"
@@ -20,17 +20,12 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0003-Install-both-binaries-and-use-libdir.patch \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://big-endian.patch \
-           file://0001-build-allow-passing-multiple-libs-to-pkg_config.patch \
-           file://0002-build-allow-use-of-system-installed-brotli.patch \
            file://mips-warnings.patch \
-           file://0001-deps-V8-backport-3f8dc4b2e5ba.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-
-SRC_URI[md5sum] = "1c78a75f5c95321f533ecccca695e814"
-SRC_URI[sha256sum] = "877b4b842318b0e09bc754faf7343f2f097f0fc4f88ab9ae57cf9944e88e7adb"
+SRC_URI[sha256sum] = "71158026579487422fd13cc2553b34cddb76519098aa6030faab52f88c6e0d0e"
 
 S = "${WORKDIR}/node-v${PV}"
 
@@ -55,7 +50,8 @@ ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '-
 GYP_DEFINES_append_mipsel = " mips_arch_variant='r1' "
 ARCHFLAGS ?= ""
 
-PACKAGECONFIG ??= "ares brotli icu libuv zlib"
+PACKAGECONFIG ??= "ares brotli icu zlib"
+
 PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
 PACKAGECONFIG[brotli] = "--shared-brotli,,brotli"
 PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
-- 
2.28.0

