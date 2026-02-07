Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6CAEE0AD1
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2676.1770460446835529784
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BKO7GRGR;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so16778205e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460445; x=1771065245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVc64dTlgqEmNKNF7KAQP3AnYLyalzecOq5ugW40Z70=;
        b=BKO7GRGRovkEfbsXU4ZKpHc79XzYAO4VoHTyGWrSXcVmkwLlAQLQH/3zp5yDz7w8Jp
         61j873/uYm8UUD3P7CJDpMZIA1K8Xzj5GH9c8lsA7Gmjig4SEvog9aA1XZ8mb7eLYqQz
         1Lu/Wqgkw3dIvlMQTYdJJCLkCV6boRJ9hl2Bxf3mxpUdsYJLTREgpNeDo/80kQL7jB5L
         uiA/ZrmUFc02meZmyz18SLsHcLB+w7ZdP4DhA5fhtdYdCxyORRI7/HQfXOsiH6C5HEx8
         92EAICojczImsXCLZtwPg/NbLteHdzqGRQM27EJqYtlQjx2LU9alUYU/95xp77ty6JV7
         XQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460445; x=1771065245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DVc64dTlgqEmNKNF7KAQP3AnYLyalzecOq5ugW40Z70=;
        b=A8cnK8UT4YWQopdUlKcNNu5IYoPGdpP6okc2XwUz1ecljpoVj0X8RK+Vv645NMcVjX
         HpoKf6aCmq7clAoDTsuVbUo2/YqBriWmUW33xLbhsnl3XJOqpUSLfFxg10I4P69QP7wx
         7kfudvuffXv8gBWVPi7GtjBQy5jCglpTXNDKRkYNANGRADAIBPa/f+g9VxHJEkAPLC37
         rZif4dexMcciGUQ2B+VA6EoXo3H3k9PBCBdL3+DWVcS3R5u/VIQyci9Zs3VvaMJT5zkm
         i4FI5P3PpDBox6PjjI66ZI6p2XjVZ6nMT5efWIweHho6ZNcY3XS6/raxAfl/MIi2/gga
         S9xw==
X-Gm-Message-State: AOJu0YyxnkKYmYzFkif5Em/lg9QZFo3C5hpYTJsfIG3mYyHA820Tn+4a
	+5iygUEmLn/uEFKLfwLoWfZrtOYzArecYyS9ME/EZkpkyk7xHMFcT6BVizeEpg==
X-Gm-Gg: AZuq6aJX+2OU+WqnszzGH04lzoD85RzOl+CAHGJPffXkgV2z6zsnYKcpXXCT4Xg+4se
	YVpoJ4X4quA0c7OZBnXnqo82mCz23vAHYzXHu1xh87Mn71knXe1hxaiPx5v4G7hARWjrf8cNEmB
	u05GpCFud/yHRaVCkdPT4DlYP8fmMPJeGYe2WaGLJNCQxtaeEHTUBzSlqg2G8bgjHNnONtPdFbM
	sHiXE1Q1OfVsHIIVV0ogurq7kK7yGBmYE9cQvGN6CEJq/o0D2Sk5nATXpiKP+VUyRC6YVhM4m4S
	al5c8Q/GFX6yx/gPC2kFEwHS/w7e8YeWxIB2zUKD2P0UhWMUoTnat1vQHC4aDESmw0d6VL6QhsO
	BUUsKQMkvR1OXie8rQrd00gYurIi6hpUlokQTxZQSmwcufDvNkoX4aGEU8zFkUm1dHPkCMJ3lj8
	iNl3zYxIpmaENRznZQDFaI
X-Received: by 2002:a05:600c:630f:b0:482:dbd7:a1c1 with SMTP id 5b1f17b1804b1-48320226287mr75834315e9.34.1770460444776;
        Sat, 07 Feb 2026 02:34:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 06/15] nodejs: upgrade 20.18.2 -> 20.20.0
Date: Sat,  7 Feb 2026 11:33:48 +0100
Message-ID: <20260207103359.4177243-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124247

Part of nodejs LTS release, contains many security- and bugfixes.

Ptests passed successfully.

Full changelog:
https://github.com/nodejs/node/blob/v20.x/doc/changelogs/CHANGELOG_V20.md

Dropped patches that are included in this release.

Added 0001-Revert-stop-using-deprecated-ares_query.patch:
Nodejs has changed a deprecated c-ares call to a newer version,
however this newer method is not available in the c-ares shipped
in meta-oe, and it failed to compile (the new call was added to c-ares
in v1.28.0, but Scarthgap comes with v1.27.0). This patch reverts this
failing commit completely. Based on the PR/issue discussions, the
only goal was to eliminate deprecation warnings. There seem to be
no logic change from this change.

License-Update:
- The license file was regenerated, to ensure it is up to date.
  It contains all licenses from all vendored dependecies. This
  resulted in adding nlohmann-json license to the file, which
  is MIT. There were already other MIT dependencies, so this
  didn't change the overall license declaration.
- base64 related license was removed, because base64 code was
  simplified, so it doesn't depend on this library anymore.
  (It was BSD-2-Clause, but there ar other dependencies using
  this license, so the overall license didn't change)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../oe-npm-cache                              |   0
 ....18.bb => nodejs-oe-cache-native_20.20.bb} |   0
 ...e-running-gyp-files-for-bundled-deps.patch |  46 -----
 ...ert-stop-using-deprecated-ares_query.patch | 164 ++++++++++++++++
 ...4-Do-not-use-mminimal-toc-with-clang.patch |  27 ++-
 .../0001-src-fix-build-with-GCC-15.patch      |  33 ----
 .../nodejs/nodejs/182d9c05e78.patch           | 182 ------------------
 .../nodejs/zlib-fix-pointer-alignment.patch   |  64 ------
 .../{nodejs_20.18.2.bb => nodejs_20.20.0.bb}  |   9 +-
 9 files changed, 185 insertions(+), 340 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.18 => nodejs-oe-cache-20.20}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.18.bb => nodejs-oe-cache-native_20.20.bb} (100%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-deprecated-ares_query.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.18.2.bb => nodejs_20.20.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.18/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.20/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.18/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.20/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.20.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.18.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.20.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
deleted file mode 100644
index 12f6cd8b96..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 7d94bfe53beeb2d25eb5f2ff6b1d509df7e6ab80 Mon Sep 17 00:00:00 2001
-From: Zuzana Svetlikova <zsvetlik@redhat.com>
-Date: Thu, 27 Apr 2017 14:25:42 +0200
-Subject: [PATCH] Disable running gyp on shared deps
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Probably imported from:
-https://src.fedoraproject.org/rpms/nodejs/c/41af04f2a3c050fb44628e91ac65fd225b927acb?branch=22609d8c1bfeaa21fe0057645af20b3a2ccc7f53
-which is probably based on dont-run-gyp-files-for-bundled-deps.patch added in:
-https://github.com/alpinelinux/aports/commit/6662eb3199902e8451fb20dce82554ad96f796bb
-
-We also explicitly prune some dependencies from source in the bitbake recipe:
-
-python prune_sources() {
-    import shutil
-
-    shutil.rmtree(d.getVar('S') + '/deps/openssl')
-    if 'ares' in d.getVar('PACKAGECONFIG'):
-        shutil.rmtree(d.getVar('S') + '/deps/cares')
-    if 'brotli' in d.getVar('PACKAGECONFIG'):
-        shutil.rmtree(d.getVar('S') + '/deps/brotli')
-    if 'libuv' in d.getVar('PACKAGECONFIG'):
-        shutil.rmtree(d.getVar('S') + '/deps/uv')
-    if 'nghttp2' in d.getVar('PACKAGECONFIG'):
-        shutil.rmtree(d.getVar('S') + '/deps/nghttp2')
-    if 'zlib' in d.getVar('PACKAGECONFIG'):
-        shutil.rmtree(d.getVar('S') + '/deps/zlib')
-}
-do_unpack[postfuncs] += "prune_sources"
-
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/Makefile
-+++ b/Makefile
-@@ -169,7 +169,7 @@ with-code-cache test-code-cache:
- 	$(warning '$@' target is a noop)
- 
- out/Makefile: config.gypi common.gypi node.gyp \
--	deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
-+	deps/llhttp/llhttp.gyp \
- 	deps/simdutf/simdutf.gyp deps/ada/ada.gyp \
- 	tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features.gypi \
- 	tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-deprecated-ares_query.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-deprecated-ares_query.patch
new file mode 100644
index 0000000000..ae4c316baf
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Revert-stop-using-deprecated-ares_query.patch
@@ -0,0 +1,164 @@
+From f421a0f1f962acff2c71cba06c9ae2af85bd09ee Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 6 Feb 2026 21:42:56 +0100
+Subject: [PATCH] Revert "stop using deprecated ares_query"
+
+Nodejs has removed the usage of some deprecated c-ares calls[1],
+however as a result the c-ares requirements have increased beyond
+the c-ares version than what is available in Scarthgap.
+
+Due to this it failed to compile:
+../src/cares_wrap.h:264:22: error: 'ares_query_dnsrec' was not declared in this scope
+
+To be able to still compile nodejs, keep using the original, deprectaed
+calls. This patch reverts the below linked commit.
+
+[1]: https://github.com/nodejs/node/commit/22e0d17097fa419cde5fcd5d648fe70aa9fb80e2
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/cares_wrap.cc | 24 ++++++++++++------------
+ src/cares_wrap.h  | 35 ++++++++++++++++-------------------
+ 2 files changed, 28 insertions(+), 31 deletions(-)
+
+diff --git a/src/cares_wrap.cc b/src/cares_wrap.cc
+index 2388c604..5a8e11c7 100644
+--- a/src/cares_wrap.cc
++++ b/src/cares_wrap.cc
+@@ -825,62 +825,62 @@ void ChannelWrap::EnsureServers() {
+ }
+ 
+ int AnyTraits::Send(QueryWrap<AnyTraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_ANY);
++  wrap->AresQuery(name, ns_c_in, ns_t_any);
+   return ARES_SUCCESS;
+ }
+ 
+ int ATraits::Send(QueryWrap<ATraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_A);
++  wrap->AresQuery(name, ns_c_in, ns_t_a);
+   return ARES_SUCCESS;
+ }
+ 
+ int AaaaTraits::Send(QueryWrap<AaaaTraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_AAAA);
++  wrap->AresQuery(name, ns_c_in, ns_t_aaaa);
+   return ARES_SUCCESS;
+ }
+ 
+ int CaaTraits::Send(QueryWrap<CaaTraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_CAA);
++  wrap->AresQuery(name, ns_c_in, T_CAA);
+   return ARES_SUCCESS;
+ }
+ 
+ int CnameTraits::Send(QueryWrap<CnameTraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_CNAME);
++  wrap->AresQuery(name, ns_c_in, ns_t_cname);
+   return ARES_SUCCESS;
+ }
+ 
+ int MxTraits::Send(QueryWrap<MxTraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_MX);
++  wrap->AresQuery(name, ns_c_in, ns_t_mx);
+   return ARES_SUCCESS;
+ }
+ 
+ int NsTraits::Send(QueryWrap<NsTraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_NS);
++  wrap->AresQuery(name, ns_c_in, ns_t_ns);
+   return ARES_SUCCESS;
+ }
+ 
+ int TxtTraits::Send(QueryWrap<TxtTraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_TXT);
++  wrap->AresQuery(name, ns_c_in, ns_t_txt);
+   return ARES_SUCCESS;
+ }
+ 
+ int SrvTraits::Send(QueryWrap<SrvTraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_SRV);
++  wrap->AresQuery(name, ns_c_in, ns_t_srv);
+   return ARES_SUCCESS;
+ }
+ 
+ int PtrTraits::Send(QueryWrap<PtrTraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_PTR);
++  wrap->AresQuery(name, ns_c_in, ns_t_ptr);
+   return ARES_SUCCESS;
+ }
+ 
+ int NaptrTraits::Send(QueryWrap<NaptrTraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_NAPTR);
++  wrap->AresQuery(name, ns_c_in, ns_t_naptr);
+   return ARES_SUCCESS;
+ }
+ 
+ int SoaTraits::Send(QueryWrap<SoaTraits>* wrap, const char* name) {
+-  wrap->AresQuery(name, ARES_CLASS_IN, ARES_REC_TYPE_SOA);
++  wrap->AresQuery(name, ns_c_in, ns_t_soa);
+   return ARES_SUCCESS;
+ }
+ 
+diff --git a/src/cares_wrap.h b/src/cares_wrap.h
+index a770d9e3..820c5d88 100644
+--- a/src/cares_wrap.h
++++ b/src/cares_wrap.h
+@@ -254,20 +254,18 @@ class QueryWrap final : public AsyncWrap {
+     return Traits::Send(this, name);
+   }
+ 
+-  void AresQuery(const char* name,
+-                 ares_dns_class_t dnsclass,
+-                 ares_dns_rec_type_t type) {
++  void AresQuery(const char* name, int dnsclass, int type) {
+     channel_->EnsureServers();
+     TRACE_EVENT_NESTABLE_ASYNC_BEGIN1(
+       TRACING_CATEGORY_NODE2(dns, native), trace_name_, this,
+       "name", TRACE_STR_COPY(name));
+-    ares_query_dnsrec(channel_->cares_channel(),
+-                      name,
+-                      dnsclass,
+-                      type,
+-                      Callback,
+-                      MakeCallbackPointer(),
+-                      nullptr);
++    ares_query(
++        channel_->cares_channel(),
++        name,
++        dnsclass,
++        type,
++        Callback,
++        MakeCallbackPointer());
+   }
+ 
+   void ParseError(int status) {
+@@ -314,20 +312,19 @@ class QueryWrap final : public AsyncWrap {
+     return wrap;
+   }
+ 
+-  static void Callback(void* arg,
+-                       ares_status_t status,
+-                       size_t timeouts,
+-                       const ares_dns_record_t* dnsrec) {
++  static void Callback(
++      void* arg,
++      int status,
++      int timeouts,
++      unsigned char* answer_buf,
++      int answer_len) {
+     QueryWrap<Traits>* wrap = FromCallbackPointer(arg);
+     if (wrap == nullptr) return;
+ 
+     unsigned char* buf_copy = nullptr;
+-    size_t answer_len = 0;
+     if (status == ARES_SUCCESS) {
+-      // No need to explicitly call ares_free_string here,
+-      // as it is a wrapper around free, which is already
+-      // invoked when MallocedBuffer is destructed.
+-      ares_dns_write(dnsrec, &buf_copy, &answer_len);
++      buf_copy = node::Malloc<unsigned char>(answer_len);
++      memcpy(buf_copy, answer_buf, answer_len);
+     }
+ 
+     wrap->response_data_ = std::make_unique<ResponseData>();
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
index dd9c9015e2..3c78ac87ae 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
@@ -14,12 +14,21 @@ Upstream-Status: Pending
 
 --- a/common.gypi
 +++ b/common.gypi
-@@ -417,7 +417,7 @@
-             'ldflags': [ '-m32' ],
-           }],
-           [ 'target_arch=="ppc64" and OS!="aix"', {
--            'cflags': [ '-m64', '-mminimal-toc' ],
-+            'cflags': [ '-m64' ],
-             'ldflags': [ '-m64' ],
-           }],
-           [ 'target_arch=="s390x"', {
+@@ -498,7 +498,7 @@
+                 'ldflags': [ '-m32' ],
+               }],
+               [ 'host_arch=="ppc64" and OS not in "aix os400"', {
+-                'cflags': [ '-m64', '-mminimal-toc' ],
++                'cflags': [ '-m64' ],
+                 'ldflags': [ '-m64' ],
+               }],
+               [ 'host_arch=="s390x" and OS=="linux"', {
+@@ -522,7 +522,7 @@
+                 'ldflags': [ '-m32' ],
+               }],
+               [ 'target_arch=="ppc64" and OS not in "aix os400"', {
+-                'cflags': [ '-m64', '-mminimal-toc' ],
++                'cflags': [ '-m64' ],
+                 'ldflags': [ '-m64' ],
+               }],
+               [ 'target_arch=="s390x" and OS=="linux"', {
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch
deleted file mode 100644
index 9d09f4f482..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From bade7a1866618b9e46358b839fe5fdf16b1db2be Mon Sep 17 00:00:00 2001
-From: tjuhaszrh <tjuhasz@redhat.com>
-Date: Sat, 25 Jan 2025 10:34:54 +0100
-Subject: [PATCH] src: fix build with GCC 15
-
-Added cstdint to worker_inspector as on more recent version of gcc
-the build was failing due to changes to libstdc++ and the removal
-of transitive includes.
-
-PR-URL: https://github.com/nodejs/node/pull/56740
-Fixes: https://github.com/nodejs/node/issues/56731
-Reviewed-By: Antoine du Hamel <duhamelantoine1995@gmail.com>
-Reviewed-By: Chengzhong Wu <legendecas@gmail.com>
-Reviewed-By: Richard Lau <rlau@redhat.com>
-Reviewed-By: James M Snell <jasnell@gmail.com>
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/bade7a1866618b9e46358b839fe5fdf16b1db2be]
----
- src/inspector/worker_inspector.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/inspector/worker_inspector.h b/src/inspector/worker_inspector.h
-index d3254d5aa0ebe4..24403bb1704c40 100644
---- a/src/inspector/worker_inspector.h
-+++ b/src/inspector/worker_inspector.h
-@@ -5,6 +5,7 @@
- #error("This header can only be used when inspector is enabled")
- #endif
- 
-+#include <cstdint>
- #include <memory>
- #include <string>
- #include <unordered_map>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch b/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
deleted file mode 100644
index 9b3fc566c8..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
+++ /dev/null
@@ -1,182 +0,0 @@
-From 182d9c05e78b1ddb1cb8242cd3628a7855a0336f Mon Sep 17 00:00:00 2001
-From: Andrey Kosyakov <caseq@chromium.org>
-Date: Thu, 17 Aug 2023 13:50:11 -0700
-Subject: [PATCH] Define UChar as char16_t
-
-We used to have UChar defined as uint16_t which does not go along
-with STL these days if you try to have an std::basic_string<> of it,
-as there are no standard std::char_traits<> specialization for uint16_t.
-
-This switches UChar to char16_t where practical, introducing a few
-compatibility shims to keep CL size small, as (1) this would likely
-have to be back-ported and (2) crdtp extensively uses uint16_t for
-wide chars.
-
-Bug: b:296390693
-Change-Id: I66a32d8f0050915225b187de56896c26dd76163d
-Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/4789966
-Reviewed-by: Jaroslav Sevcik <jarin@chromium.org>
-Commit-Queue: Jaroslav Sevcik <jarin@chromium.org>
-Auto-Submit: Andrey Kosyakov <caseq@chromium.org>
-Cr-Commit-Position: refs/heads/main@{#89559}
-
-Upstream-Status: Backport [https://chromium-review.googlesource.com/c/v8/v8/+/4789966]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/inspector/string-16.cc                             |  8 +++++++-
- src/inspector/string-16.h                              | 10 ++++++++--
- src/inspector/v8-string-conversions.cc                 |  6 +++---
- src/inspector/v8-string-conversions.h                  |  6 ++++--
- .../inspector_protocol/crdtp/test_platform_v8.cc       |  9 ++++++---
- 5 files changed, 28 insertions(+), 11 deletions(-)
-
---- a/deps/v8/src/inspector/string-16.cc
-+++ b/deps/v8/src/inspector/string-16.cc
-@@ -27,7 +27,7 @@ bool isSpaceOrNewLine(UChar c) {
-   return isASCII(c) && c <= ' ' && (c == ' ' || (c <= 0xD && c >= 0x9));
- }
-
--int64_t charactersToInteger(const UChar* characters, size_t length,
-+int64_t charactersToInteger(const uint16_t* characters, size_t length,
-                             bool* ok = nullptr) {
-   std::vector<char> buffer;
-   buffer.reserve(length + 1);
-@@ -50,6 +50,8 @@ int64_t charactersToInteger(const UChar*
-
- String16::String16(const UChar* characters, size_t size)
-     : m_impl(characters, size) {}
-+String16::String16(const uint16_t* characters, size_t size)
-+    : m_impl(reinterpret_cast<const UChar*>(characters), size) {}
-
- String16::String16(const UChar* characters) : m_impl(characters) {}
-
-@@ -241,6 +243,10 @@ String16 String16::fromUTF16LE(const UCh
- #endif  // V8_TARGET_BIG_ENDIAN
- }
-
-+String16 String16::fromUTF16LE(const uint16_t* stringStart, size_t length) {
-+  return fromUTF16LE(reinterpret_cast<const UChar*>(stringStart), length);
-+}
-+
- std::string String16::utf8() const {
-   return UTF16ToUTF8(m_impl.data(), m_impl.size());
- }
---- a/deps/v8/src/inspector/string-16.h
-+++ b/deps/v8/src/inspector/string-16.h
-@@ -6,6 +6,7 @@
- #define V8_INSPECTOR_STRING_16_H_
-
- #include <stdint.h>
-+#include <uchar.h>
-
- #include <cctype>
- #include <climits>
-@@ -17,7 +18,7 @@
-
- namespace v8_inspector {
-
--using UChar = uint16_t;
-+using UChar = char16_t;
-
- class String16 {
-  public:
-@@ -27,6 +28,7 @@ class String16 {
-   String16(const String16&) V8_NOEXCEPT = default;
-   String16(String16&&) V8_NOEXCEPT = default;
-   String16(const UChar* characters, size_t size);
-+  String16(const uint16_t* characters, size_t size);
-   V8_EXPORT String16(const UChar* characters);
-   V8_EXPORT String16(const char* characters);
-   String16(const char* characters, size_t size);
-@@ -48,7 +50,9 @@ class String16 {
-   int toInteger(bool* ok = nullptr) const;
-   std::pair<size_t, size_t> getTrimmedOffsetAndLength() const;
-   String16 stripWhiteSpace() const;
--  const UChar* characters16() const { return m_impl.c_str(); }
-+  const uint16_t* characters16() const {
-+    return reinterpret_cast<const uint16_t*>(m_impl.c_str());
-+  }
-   size_t length() const { return m_impl.length(); }
-   bool isEmpty() const { return !m_impl.length(); }
-   UChar operator[](size_t index) const { return m_impl[index]; }
-@@ -78,6 +82,8 @@ class String16 {
-   // On Big endian architectures, byte order needs to be flipped.
-   V8_EXPORT static String16 fromUTF16LE(const UChar* stringStart,
-                                         size_t length);
-+  V8_EXPORT static String16 fromUTF16LE(const uint16_t* stringStart,
-+                                        size_t length);
-
-   std::size_t hash() const {
-     if (!hash_code) {
---- a/deps/v8/src/inspector/v8-string-conversions.cc
-+++ b/deps/v8/src/inspector/v8-string-conversions.cc
-@@ -12,7 +12,7 @@
-
- namespace v8_inspector {
- namespace {
--using UChar = uint16_t;
-+using UChar = char16_t;
- using UChar32 = uint32_t;
-
- bool isASCII(UChar c) { return !(c & ~0x7F); }
-@@ -386,7 +386,7 @@ std::string UTF16ToUTF8(const UChar* str
-
- std::basic_string<UChar> UTF8ToUTF16(const char* stringStart, size_t length) {
-   if (!stringStart || !length) return std::basic_string<UChar>();
--  std::vector<uint16_t> buffer(length);
-+  std::vector<UChar> buffer(length);
-   UChar* bufferStart = buffer.data();
-
-   UChar* bufferCurrent = bufferStart;
-@@ -395,7 +395,7 @@ std::basic_string<UChar> UTF8ToUTF16(con
-                          reinterpret_cast<const char*>(stringStart + length),
-                          &bufferCurrent, bufferCurrent + buffer.size(), nullptr,
-                          true) != conversionOK)
--    return std::basic_string<uint16_t>();
-+    return std::basic_string<UChar>();
-   size_t utf16Length = bufferCurrent - bufferStart;
-   return std::basic_string<UChar>(bufferStart, bufferStart + utf16Length);
- }
---- a/deps/v8/src/inspector/v8-string-conversions.h
-+++ b/deps/v8/src/inspector/v8-string-conversions.h
-@@ -5,14 +5,16 @@
- #ifndef V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
- #define V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
-
-+#include <uchar.h>
-+
- #include <cstdint>
- #include <string>
-
- // Conversion routines between UT8 and UTF16, used by string-16.{h,cc}. You may
- // want to use string-16.h directly rather than these.
- namespace v8_inspector {
--std::basic_string<uint16_t> UTF8ToUTF16(const char* stringStart, size_t length);
--std::string UTF16ToUTF8(const uint16_t* stringStart, size_t length);
-+std::basic_string<char16_t> UTF8ToUTF16(const char* stringStart, size_t length);
-+std::string UTF16ToUTF8(const char16_t* stringStart, size_t length);
- }  // namespace v8_inspector
-
- #endif  // V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
---- a/deps/v8/third_party/inspector_protocol/crdtp/test_platform_v8.cc
-+++ b/deps/v8/third_party/inspector_protocol/crdtp/test_platform_v8.cc
-@@ -11,13 +11,16 @@
- namespace v8_crdtp {
-
- std::string UTF16ToUTF8(span<uint16_t> in) {
--  return v8_inspector::UTF16ToUTF8(in.data(), in.size());
-+  return v8_inspector::UTF16ToUTF8(reinterpret_cast<const char16_t*>(in.data()),
-+                                   in.size());
- }
-
- std::vector<uint16_t> UTF8ToUTF16(span<uint8_t> in) {
--  std::basic_string<uint16_t> utf16 = v8_inspector::UTF8ToUTF16(
-+  std::basic_string<char16_t> utf16 = v8_inspector::UTF8ToUTF16(
-       reinterpret_cast<const char*>(in.data()), in.size());
--  return std::vector<uint16_t>(utf16.begin(), utf16.end());
-+  return std::vector<uint16_t>(
-+      reinterpret_cast<const uint16_t*>(utf16.data()),
-+      reinterpret_cast<const uint16_t*>(utf16.data()) + utf16.size());
- }
-
- }  // namespace v8_crdtp
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch b/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch
deleted file mode 100644
index 824ff678c6..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From bbcd1f33161fd9874e8a61999d2739b177f99723 Mon Sep 17 00:00:00 2001
-From: Jeroen Hofstee <jhofstee@victronenergy.com>
-Date: Mon, 28 Apr 2025 14:21:44 +0000
-Subject: [PATCH] zlib: fix pointer alignment
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The function AllocForBrotli prefixes the allocated memory with its
-size, and returns a pointer to the region after it. This pointer can
-however no longer be suitably aligned. Correct this by allocating
-the maximum of the the size of the size_t and the max alignment.
-
-On Arm 32bits the size_t is 4 bytes long, but the alignment is 8 for
-some NEON instructions. When Brotli is compiled with optimizations
-enabled newer GCC versions will use the NEON instructions and trigger
-a bus error killing node.
-
-see https://github.com/google/brotli/issues/1159
-
-PR-URL: https://github.com/nodejs/node/pull/57727
-Reviewed-By: Shelley Vohr <shelley.vohr@gmail.com>
-Reviewed-By: Tobias Nießen <tniessen@tnie.de>
-Reviewed-By: Daniel Lemire <daniel@lemire.me>
-Reviewed-By: Gerhard Stöbich <deb2001-github@yahoo.de>
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/dc035bbc9b310ff8067bc0dad22230978489c061]
----
- src/node_zlib.cc | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/src/node_zlib.cc b/src/node_zlib.cc
-index 66370e41..a537e766 100644
---- a/src/node_zlib.cc
-+++ b/src/node_zlib.cc
-@@ -493,20 +493,22 @@ class CompressionStream : public AsyncWrap, public ThreadPoolWork {
-   }
- 
-   static void* AllocForBrotli(void* data, size_t size) {
--    size += sizeof(size_t);
-+    constexpr size_t offset = std::max(sizeof(size_t), alignof(max_align_t));
-+    size += offset;
-     CompressionStream* ctx = static_cast<CompressionStream*>(data);
-     char* memory = UncheckedMalloc(size);
-     if (UNLIKELY(memory == nullptr)) return nullptr;
-     *reinterpret_cast<size_t*>(memory) = size;
-     ctx->unreported_allocations_.fetch_add(size,
-                                            std::memory_order_relaxed);
--    return memory + sizeof(size_t);
-+    return memory + offset;
-   }
- 
-   static void FreeForZlib(void* data, void* pointer) {
-     if (UNLIKELY(pointer == nullptr)) return;
-     CompressionStream* ctx = static_cast<CompressionStream*>(data);
--    char* real_pointer = static_cast<char*>(pointer) - sizeof(size_t);
-+    constexpr size_t offset = std::max(sizeof(size_t), alignof(max_align_t));
-+    char* real_pointer = static_cast<char*>(pointer) - offset;
-     size_t real_size = *reinterpret_cast<size_t*>(real_pointer);
-     ctx->unreported_allocations_.fetch_sub(real_size,
-                                            std::memory_order_relaxed);
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb
index d757a7395c..1bc5a6e9cd 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c83fcdcd43ab352be6429ee1fd8827a0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ac91fab5dbaf757274d2b29888f943ef"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -20,14 +20,11 @@ COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:powerpc = "null"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
-           file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://libatomic.patch \
-           file://182d9c05e78.patch \
-           file://zlib-fix-pointer-alignment.patch \
-           file://0001-src-fix-build-with-GCC-15.patch \
+           file://0001-Revert-stop-using-deprecated-ares_query.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \
@@ -36,7 +33,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "69bf81b70f3a95ae0763459f02860c282d7e3a47567c8afaf126cc778176a882"
+SRC_URI[sha256sum] = "5294d9d2915620e819e6892fd7e545b98d650bad36dae54e6527eaac482add98"
 
 S = "${WORKDIR}/node-v${PV}"
 

