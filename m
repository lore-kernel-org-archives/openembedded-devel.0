Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A3FEB48FC
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 10:32:53 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38879.1770873688848250541
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 21:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Q5kYWpUR;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=20944; q=dns/txt;
  s=iport01; t=1770873689; x=1772083289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dTx7fm1OMI6O+k1xUM5LFLuFM6smWAM5fAhNuoS737M=;
  b=Q5kYWpURipSPDpgvWoSOIRype9MHXEAbmI7PYsLVjifuJRQLepyv2XE1
   tD9UpP1dO/EOfvj7ia5ouruHJfJpdKqYByShdCrDa1s/lE0odVIZse3NK
   202DW797WXYEZ28MF+c4cIRIzV8p3EMGNvC6e7ZGvP1iKGesGArVu0XVV
   H8KhJvAEfBVGIqy9qNKQH9mWMpJU0Lz4NIRMgwpZjqWCnQEIFjhEr/kgS
   Wzito+ly/DYok2WUDNeZFwfa/ydnI5om+u9wKZas7GefcnxW+2bFFJ5GG
   uuKnUgs9eDKmH6m5maqFnjhdWs7tELImuFOder/g4l0xH/WuAUFhjdr2R
   g==;
X-CSE-ConnectionGUID: UdQntKpOS/SA6/W0XNJz2g==
X-CSE-MsgGUID: jLkjp7FURQeU6pdJJO3trw==
X-IPAS-Result: =?us-ascii?q?A0CCCABQYo1p/5X/Ja1aHgEBCxIMggULghgwD3FeQ0mWS?=
 =?us-ascii?q?wOBE4FriGaFZolxgl8UgWgDDwEBAQ89FAQBAYUHAo0dAiY1CA4BAgQBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLARgBLRAcA?=
 =?us-ascii?q?wECLyALIwgZgwIBgjoDNgMRqCxCgXkzgQGDKAE/AkNP2EcNA4JPAQsUAYE4h?=
 =?us-ascii?q?TuCeYUfWxgBhHgnGxuBcoEVgnJ2gQWBGkIBAYEtGoZdBIIigQ6BZCcPiU6IB?=
 =?us-ascii?q?kiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYgVD4kPeHCBIHIDC?=
 =?us-ascii?q?xgNSBEsNxQbBD5uB45LQYIsBwEVJxMJGwcTASoBIAJjEzU2Aw4YHB6SVxQQA?=
 =?us-ascii?q?ZAdgiGgHXEKKIN0jB6PPgGFexozhVulEAuYe4smgmOECZFXBBxQhGiBagE5R?=
 =?us-ascii?q?oEBCwdwFYMiCUkZD44tCwuBEgECfIFNgX+DFLxOJTICOgIHCwEBAwmRa4F8A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:fSVagK8vwa3Km+J63RpTDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WoZWjyDPf/YMTb3c951btix/UsFvZHTz4BgQQdk+SxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mryyHjEAX9gWAsaDtOs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kLMbQe5sVvJloJz
 tVGbw9VXjahlbi5lefTpulE3qzPLeHxN48Z/3UlxjbDALN/G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0wn1lQ/UPrSmM+hin75fDRCpXqepLE85C7YywkZPL3FboSJIo3aHZsE9qqej
 mDi/GbhXT8nDuWS9GSd/lCOobTThzyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:6r7vuaitJFdkN+I/6oA5QWOLBnBQXt0ji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHZQKQ2njALz7mq+P3lpyVuQ==
X-Talos-CUID: 9a23:rv9siG/1K9fZAFeCLKWVv3MYI8Y5UWX69zDrChH/Nj5Zbp+HE1DFrQ==
X-Talos-MUID: 9a23:m2wWCAWiSRAdp6/q/D3IhzN6a+lV2Z2jNR4VnbcknJKYLzMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208";a="664098069"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 05:21:28 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id AD6F9180001E9;
	Thu, 12 Feb 2026 05:21:28 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 5B542CC12A6; Wed, 11 Feb 2026 21:21:28 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH 3/5] Nodejs 20.18.2: Fix CVE-2025-59466
Date: Wed, 11 Feb 2026 21:21:08 -0800
Message-ID: <20260212052114.3215220-3-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260212052114.3215220-1-adongare@cisco.com>
References: <20260212052114.3215220-1-adongare@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 10:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124350

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/nodejs/node.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-59466
Type: Security Fix
CVE: CVE-2025-59466
Score: 7.5
Patch: https://github.com/nodejs/node/commit/ddadc31f09af

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../nodejs/nodejs/CVE-2025-59466.patch        | 508 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.18.2.bb |   1 +
 2 files changed, 509 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-59466.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-59466.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-59466.patch
new file mode 100644
index 0000000000..6121432697
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-59466.patch
@@ -0,0 +1,508 @@
+From c5cad9d8ec0bccc8136903823c079da7cc6b1930 Mon Sep 17 00:00:00 2001
+From: Matteo Collina <hello@matteocollina.com>
+Date: Tue, 9 Dec 2025 23:50:18 +0100
+Subject: [PATCH 3/6] src: rethrow stack overflow exceptions in async_hooks
+
+When a stack overflow exception occurs during async_hooks callbacks
+(which use TryCatchScope::kFatal), detect the specific "Maximum call
+stack size exceeded" RangeError and re-throw it instead of immediately
+calling FatalException. This allows user code to catch the exception
+with try-catch blocks instead of requiring uncaughtException handlers.
+
+The implementation adds IsStackOverflowError() helper to detect stack
+overflow RangeErrors and re-throws them in TryCatchScope destructor
+instead of calling FatalException.
+
+This fixes the issue where async_hooks would cause stack overflow
+exceptions to exit with code 7 (kExceptionInFatalExceptionHandler)
+instead of being catchable.
+
+Fixes: https://github.com/nodejs/node/issues/37989
+Ref: https://hackerone.com/reports/3456295
+PR-URL: https://github.com/nodejs-private/node-private/pull/773
+Refs: https://hackerone.com/reports/3456295
+Reviewed-By: Robert Nagy <ronagy@icloud.com>
+Reviewed-By: Paolo Insogna <paolo@cowtech.it>
+Reviewed-By: Marco Ippolito <marcoippolito54@gmail.com>
+Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
+Reviewed-By: Anna Henningsen <anna@addaleax.net>
+CVE-ID: CVE-2025-59466
+
+CVE: CVE-2025-59466
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/ddadc31f09af]
+
+(cherry picked from commit ddadc31f09afdbab7545c86cc0f17d137beb8048)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/async_wrap.cc                             |  9 ++-
+ src/debug_utils.cc                            |  3 +-
+ src/node_errors.cc                            | 71 ++++++++++++++--
+ src/node_errors.h                             |  2 +-
+ src/node_report.cc                            |  3 +-
+ ...async-hooks-stack-overflow-nested-async.js | 80 +++++++++++++++++++
+ ...st-async-hooks-stack-overflow-try-catch.js | 47 +++++++++++
+ .../test-async-hooks-stack-overflow.js        | 47 +++++++++++
+ ...andler-stack-overflow-on-stack-overflow.js | 29 +++++++
+ ...caught-exception-handler-stack-overflow.js | 29 +++++++
+ 10 files changed, 306 insertions(+), 14 deletions(-)
+ create mode 100644 test/parallel/test-async-hooks-stack-overflow-nested-async.js
+ create mode 100644 test/parallel/test-async-hooks-stack-overflow-try-catch.js
+ create mode 100644 test/parallel/test-async-hooks-stack-overflow.js
+ create mode 100644 test/parallel/test-uncaught-exception-handler-stack-overflow-on-stack-overflow.js
+ create mode 100644 test/parallel/test-uncaught-exception-handler-stack-overflow.js
+
+diff --git a/src/async_wrap.cc b/src/async_wrap.cc
+index 65829a31a36..2b6fa142385 100644
+--- a/src/async_wrap.cc
++++ b/src/async_wrap.cc
+@@ -67,7 +67,8 @@ static const char* const provider_names[] = {
+ void AsyncWrap::DestroyAsyncIdsCallback(Environment* env) {
+   Local<Function> fn = env->async_hooks_destroy_function();
+
+-  TryCatchScope try_catch(env, TryCatchScope::CatchMode::kFatal);
++  TryCatchScope try_catch(env,
++                          TryCatchScope::CatchMode::kFatalRethrowStackOverflow);
+
+   do {
+     std::vector<double> destroy_async_id_list;
+@@ -96,7 +97,8 @@ void Emit(Environment* env, double async_id, AsyncHooks::Fields type,
+
+   HandleScope handle_scope(env->isolate());
+   Local<Value> async_id_value = Number::New(env->isolate(), async_id);
+-  TryCatchScope try_catch(env, TryCatchScope::CatchMode::kFatal);
++  TryCatchScope try_catch(env,
++                          TryCatchScope::CatchMode::kFatalRethrowStackOverflow);
+   USE(fn->Call(env->context(), Undefined(env->isolate()), 1, &async_id_value));
+ }
+
+@@ -668,7 +670,8 @@ void AsyncWrap::EmitAsyncInit(Environment* env,
+     object,
+   };
+
+-  TryCatchScope try_catch(env, TryCatchScope::CatchMode::kFatal);
++  TryCatchScope try_catch(env,
++                          TryCatchScope::CatchMode::kFatalRethrowStackOverflow);
+   USE(init_fn->Call(env->context(), object, arraysize(argv), argv));
+ }
+
+diff --git a/src/debug_utils.cc b/src/debug_utils.cc
+index 9d36082db67..7d85ab72615 100644
+--- a/src/debug_utils.cc
++++ b/src/debug_utils.cc
+@@ -333,7 +333,8 @@ void DumpJavaScriptBacktrace(FILE* fp) {
+   }
+
+   Local<StackTrace> stack;
+-  if (!GetCurrentStackTrace(isolate).ToLocal(&stack)) {
++  if (!GetCurrentStackTrace(isolate).ToLocal(&stack) ||
++      stack->GetFrameCount() == 0) {
+     return;
+   }
+
+diff --git a/src/node_errors.cc b/src/node_errors.cc
+index 69e474257b0..f984fd4c3d9 100644
+--- a/src/node_errors.cc
++++ b/src/node_errors.cc
+@@ -188,7 +188,7 @@ static std::string GetErrorSource(Isolate* isolate,
+ }
+
+ static std::atomic<bool> is_in_oom{false};
+-static std::atomic<bool> is_retrieving_js_stacktrace{false};
++static thread_local std::atomic<bool> is_retrieving_js_stacktrace{false};
+ MaybeLocal<StackTrace> GetCurrentStackTrace(Isolate* isolate, int frame_count) {
+   if (isolate == nullptr) {
+     return MaybeLocal<StackTrace>();
+@@ -216,9 +216,6 @@ MaybeLocal<StackTrace> GetCurrentStackTrace(Isolate* isolate, int frame_count) {
+       StackTrace::CurrentStackTrace(isolate, frame_count, options);
+
+   is_retrieving_js_stacktrace.store(false);
+-  if (stack->GetFrameCount() == 0) {
+-    return MaybeLocal<StackTrace>();
+-  }
+
+   return scope.Escape(stack);
+ }
+@@ -293,7 +290,8 @@ void PrintStackTrace(Isolate* isolate,
+
+ void PrintCurrentStackTrace(Isolate* isolate, StackTracePrefix prefix) {
+   Local<StackTrace> stack;
+-  if (GetCurrentStackTrace(isolate).ToLocal(&stack)) {
++  if (GetCurrentStackTrace(isolate).ToLocal(&stack) &&
++      stack->GetFrameCount() > 0) {
+     PrintStackTrace(isolate, stack, prefix);
+   }
+ }
+@@ -664,13 +662,52 @@ v8::ModifyCodeGenerationFromStringsResult ModifyCodeGenerationFromStrings(
+   };
+ }
+
++// Check if an exception is a stack overflow error (RangeError with
++// "Maximum call stack size exceeded" message). This is used to handle
++// stack overflow specially in TryCatchScope - instead of immediately
++// exiting, we can use the red zone to re-throw to user code.
++static bool IsStackOverflowError(Isolate* isolate, Local<Value> exception) {
++  if (!exception->IsNativeError()) return false;
++
++  Local<Object> err_obj = exception.As<Object>();
++  Local<String> constructor_name = err_obj->GetConstructorName();
++
++  // Must be a RangeError
++  Utf8Value name(isolate, constructor_name);
++  if (name.ToStringView() != "RangeError") return false;
++
++  // Check for the specific stack overflow message
++  Local<Context> context = isolate->GetCurrentContext();
++  Local<Value> message_val;
++  if (!err_obj->Get(context, String::NewFromUtf8Literal(isolate, "message"))
++           .ToLocal(&message_val)) {
++    return false;
++  }
++
++  if (!message_val->IsString()) return false;
++
++  Utf8Value message(isolate, message_val.As<String>());
++  return message.ToStringView() == "Maximum call stack size exceeded";
++}
++
+ namespace errors {
+
+ TryCatchScope::~TryCatchScope() {
+-  if (HasCaught() && !HasTerminated() && mode_ == CatchMode::kFatal) {
++  if (HasCaught() && !HasTerminated() && mode_ != CatchMode::kNormal) {
+     HandleScope scope(env_->isolate());
+     Local<v8::Value> exception = Exception();
+     Local<v8::Message> message = Message();
++
++    // Special handling for stack overflow errors in async_hooks: instead of
++    // immediately exiting, re-throw the exception. This allows the exception
++    // to propagate to user code's try-catch blocks.
++    if (mode_ == CatchMode::kFatalRethrowStackOverflow &&
++        IsStackOverflowError(env_->isolate(), exception)) {
++      ReThrow();
++      Reset();
++      return;
++    }
++
+     EnhanceFatalException enhance = CanContinue() ?
+         EnhanceFatalException::kEnhance : EnhanceFatalException::kDontEnhance;
+     if (message.IsEmpty())
+@@ -1221,8 +1258,26 @@ void TriggerUncaughtException(Isolate* isolate,
+   if (env->can_call_into_js()) {
+     // We do not expect the global uncaught exception itself to throw any more
+     // exceptions. If it does, exit the current Node.js instance.
+-    errors::TryCatchScope try_catch(env,
+-                                    errors::TryCatchScope::CatchMode::kFatal);
++    // Special case: if the original error was a stack overflow and calling
++    // _fatalException causes another stack overflow, rethrow it to allow
++    // user code's try-catch blocks to potentially catch it.
++    auto is_stack_overflow = [&] {
++      return IsStackOverflowError(env->isolate(), error);
++    };
++    // Without a JS stack, rethrowing may or may not do anything.
++    // TODO(addaleax): In V8, expose a way to check whether there is a JS stack
++    // or TryCatch that would capture the rethrown exception.
++    auto has_js_stack = [&] {
++      HandleScope handle_scope(env->isolate());
++      Local<StackTrace> stack;
++      return GetCurrentStackTrace(env->isolate(), 1).ToLocal(&stack) &&
++             stack->GetFrameCount() > 0;
++    };
++    errors::TryCatchScope::CatchMode mode =
++        is_stack_overflow() && has_js_stack()
++            ? errors::TryCatchScope::CatchMode::kFatalRethrowStackOverflow
++            : errors::TryCatchScope::CatchMode::kFatal;
++    errors::TryCatchScope try_catch(env, mode);
+     // Explicitly disable verbose exception reporting -
+     // if process._fatalException() throws an error, we don't want it to
+     // trigger the per-isolate message listener which will call this
+diff --git a/src/node_errors.h b/src/node_errors.h
+index ac07b96b5ca..0b60e521df1 100644
+--- a/src/node_errors.h
++++ b/src/node_errors.h
+@@ -265,7 +265,7 @@ namespace errors {
+
+ class TryCatchScope : public v8::TryCatch {
+  public:
+-  enum class CatchMode { kNormal, kFatal };
++  enum class CatchMode { kNormal, kFatal, kFatalRethrowStackOverflow };
+
+   explicit TryCatchScope(Environment* env, CatchMode mode = CatchMode::kNormal)
+       : v8::TryCatch(env->isolate()), env_(env), mode_(mode) {}
+diff --git a/src/node_report.cc b/src/node_report.cc
+index 5368d8eef2f..f7ec2c6ed0e 100644
+--- a/src/node_report.cc
++++ b/src/node_report.cc
+@@ -463,7 +463,8 @@ static void PrintJavaScriptStack(JSONWriter* writer,
+                                  const char* trigger) {
+   HandleScope scope(isolate);
+   Local<v8::StackTrace> stack;
+-  if (!GetCurrentStackTrace(isolate, MAX_FRAME_COUNT).ToLocal(&stack)) {
++  if (!GetCurrentStackTrace(isolate, MAX_FRAME_COUNT).ToLocal(&stack) ||
++      stack->GetFrameCount() == 0) {
+     PrintEmptyJavaScriptStack(writer);
+     return;
+   }
+diff --git a/test/parallel/test-async-hooks-stack-overflow-nested-async.js b/test/parallel/test-async-hooks-stack-overflow-nested-async.js
+new file mode 100644
+index 00000000000..779f8d75ae2
+--- /dev/null
++++ b/test/parallel/test-async-hooks-stack-overflow-nested-async.js
+@@ -0,0 +1,80 @@
++'use strict';
++
++// This test verifies that stack overflow during deeply nested async operations
++// with async_hooks enabled can be caught by try-catch. This simulates real-world
++// scenarios like processing deeply nested JSON structures where each level
++// creates async operations (e.g., database calls, API requests).
++
++require('../common');
++const assert = require('assert');
++const { spawnSync } = require('child_process');
++
++if (process.argv[2] === 'child') {
++  const { createHook } = require('async_hooks');
++
++  // Enable async_hooks with all callbacks (simulates APM tools)
++  createHook({
++    init() {},
++    before() {},
++    after() {},
++    destroy() {},
++    promiseResolve() {},
++  }).enable();
++
++  // Simulate an async operation (like a database call or API request)
++  async function fetchThing(id) {
++    return { id, data: `data-${id}` };
++  }
++
++  // Recursively process deeply nested data structure
++  // This will cause stack overflow when the nesting is deep enough
++  function processData(data, depth = 0) {
++    if (Array.isArray(data)) {
++      for (const item of data) {
++        // Create a promise to trigger async_hooks init callback
++        fetchThing(depth);
++        processData(item, depth + 1);
++      }
++    }
++  }
++
++  // Create deeply nested array structure iteratively (to avoid stack overflow
++  // during creation)
++  function createNestedArray(depth) {
++    let result = 'leaf';
++    for (let i = 0; i < depth; i++) {
++      result = [result];
++    }
++    return result;
++  }
++
++  // Create a very deep nesting that will cause stack overflow during processing
++  const deeplyNested = createNestedArray(50000);
++
++  try {
++    processData(deeplyNested);
++    // Should not complete successfully - the nesting is too deep
++    console.log('UNEXPECTED: Processing completed without error');
++    process.exit(1);
++  } catch (err) {
++    assert.strictEqual(err.name, 'RangeError');
++    assert.match(err.message, /Maximum call stack size exceeded/);
++    console.log('SUCCESS: try-catch caught the stack overflow in nested async');
++    process.exit(0);
++  }
++} else {
++  // Parent process - spawn the child and check exit code
++  const result = spawnSync(
++    process.execPath,
++    [__filename, 'child'],
++    { encoding: 'utf8', timeout: 30000 }
++  );
++
++  // Should exit successfully (try-catch worked)
++  assert.strictEqual(result.status, 0,
++                     `Expected exit code 0, got ${result.status}.\n` +
++                     `stdout: ${result.stdout}\n` +
++                     `stderr: ${result.stderr}`);
++  // Verify the error was handled by try-catch
++  assert.match(result.stdout, /SUCCESS: try-catch caught the stack overflow/);
++}
+diff --git a/test/parallel/test-async-hooks-stack-overflow-try-catch.js b/test/parallel/test-async-hooks-stack-overflow-try-catch.js
+new file mode 100644
+index 00000000000..43338905e78
+--- /dev/null
++++ b/test/parallel/test-async-hooks-stack-overflow-try-catch.js
+@@ -0,0 +1,47 @@
++'use strict';
++
++// This test verifies that when a stack overflow occurs with async_hooks
++// enabled, the exception can be caught by try-catch blocks in user code.
++
++require('../common');
++const assert = require('assert');
++const { spawnSync } = require('child_process');
++
++if (process.argv[2] === 'child') {
++  const { createHook } = require('async_hooks');
++
++  createHook({ init() {} }).enable();
++
++  function recursive(depth = 0) {
++    // Create a promise to trigger async_hooks init callback
++    new Promise(() => {});
++    return recursive(depth + 1);
++  }
++
++  try {
++    recursive();
++    // Should not reach here
++    process.exit(1);
++  } catch (err) {
++    assert.strictEqual(err.name, 'RangeError');
++    assert.match(err.message, /Maximum call stack size exceeded/);
++    console.log('SUCCESS: try-catch caught the stack overflow');
++    process.exit(0);
++  }
++
++  // Should not reach here
++  process.exit(2);
++} else {
++  // Parent process - spawn the child and check exit code
++  const result = spawnSync(
++    process.execPath,
++    [__filename, 'child'],
++    { encoding: 'utf8', timeout: 30000 }
++  );
++
++  assert.strictEqual(result.status, 0,
++                     `Expected exit code 0 (try-catch worked), got ${result.status}.\n` +
++                     `stdout: ${result.stdout}\n` +
++                     `stderr: ${result.stderr}`);
++  assert.match(result.stdout, /SUCCESS: try-catch caught the stack overflow/);
++}
+diff --git a/test/parallel/test-async-hooks-stack-overflow.js b/test/parallel/test-async-hooks-stack-overflow.js
+new file mode 100644
+index 00000000000..aff41969dbd
+--- /dev/null
++++ b/test/parallel/test-async-hooks-stack-overflow.js
+@@ -0,0 +1,47 @@
++'use strict';
++
++// This test verifies that when a stack overflow occurs with async_hooks
++// enabled, the uncaughtException handler is still called instead of the
++// process crashing with exit code 7.
++
++const common = require('../common');
++const assert = require('assert');
++const { spawnSync } = require('child_process');
++
++if (process.argv[2] === 'child') {
++  const { createHook } = require('async_hooks');
++
++  let handlerCalled = false;
++
++  function recursive() {
++    // Create a promise to trigger async_hooks init callback
++    new Promise(() => {});
++    return recursive();
++  }
++
++  createHook({ init() {} }).enable();
++
++  process.on('uncaughtException', common.mustCall((err) => {
++    assert.strictEqual(err.name, 'RangeError');
++    assert.match(err.message, /Maximum call stack size exceeded/);
++    // Ensure handler is only called once
++    assert.strictEqual(handlerCalled, false);
++    handlerCalled = true;
++  }));
++
++  setImmediate(recursive);
++} else {
++  // Parent process - spawn the child and check exit code
++  const result = spawnSync(
++    process.execPath,
++    [__filename, 'child'],
++    { encoding: 'utf8', timeout: 30000 }
++  );
++
++  // Should exit with code 0 (handler was called and handled the exception)
++  // Previously would exit with code 7 (kExceptionInFatalExceptionHandler)
++  assert.strictEqual(result.status, 0,
++                     `Expected exit code 0, got ${result.status}.\n` +
++                     `stdout: ${result.stdout}\n` +
++                     `stderr: ${result.stderr}`);
++}
+diff --git a/test/parallel/test-uncaught-exception-handler-stack-overflow-on-stack-overflow.js b/test/parallel/test-uncaught-exception-handler-stack-overflow-on-stack-overflow.js
+new file mode 100644
+index 00000000000..1923b7f24d9
+--- /dev/null
++++ b/test/parallel/test-uncaught-exception-handler-stack-overflow-on-stack-overflow.js
+@@ -0,0 +1,29 @@
++'use strict';
++
++// This test verifies that when the uncaughtException handler itself causes
++// a stack overflow, the process exits with a non-zero exit code.
++// This is important to ensure we don't silently swallow errors.
++
++require('../common');
++const assert = require('assert');
++const { spawnSync } = require('child_process');
++
++if (process.argv[2] === 'child') {
++  function f() { f(); }
++  process.on('uncaughtException', f);
++  f();
++} else {
++  // Parent process - spawn the child and check exit code
++  const result = spawnSync(
++    process.execPath,
++    [__filename, 'child'],
++    { encoding: 'utf8', timeout: 30000 }
++  );
++
++  // Should exit with non-zero exit code since the uncaughtException handler
++  // itself caused a stack overflow.
++  assert.notStrictEqual(result.status, 0,
++                        `Expected non-zero exit code, got ${result.status}.\n` +
++                        `stdout: ${result.stdout}\n` +
++                        `stderr: ${result.stderr}`);
++}
+diff --git a/test/parallel/test-uncaught-exception-handler-stack-overflow.js b/test/parallel/test-uncaught-exception-handler-stack-overflow.js
+new file mode 100644
+index 00000000000..050cd0923ee
+--- /dev/null
++++ b/test/parallel/test-uncaught-exception-handler-stack-overflow.js
+@@ -0,0 +1,29 @@
++'use strict';
++
++// This test verifies that when the uncaughtException handler itself causes
++// a stack overflow, the process exits with a non-zero exit code.
++// This is important to ensure we don't silently swallow errors.
++
++require('../common');
++const assert = require('assert');
++const { spawnSync } = require('child_process');
++
++if (process.argv[2] === 'child') {
++  function f() { f(); }
++  process.on('uncaughtException', f);
++  throw new Error('X');
++} else {
++  // Parent process - spawn the child and check exit code
++  const result = spawnSync(
++    process.execPath,
++    [__filename, 'child'],
++    { encoding: 'utf8', timeout: 30000 }
++  );
++
++  // Should exit with non-zero exit code since the uncaughtException handler
++  // itself caused a stack overflow.
++  assert.notStrictEqual(result.status, 0,
++                        `Expected non-zero exit code, got ${result.status}.\n` +
++                        `stdout: ${result.stdout}\n` +
++                        `stderr: ${result.stderr}`);
++}
+--
+2.43.7
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
index 7c97c7282c..779c70dbd0 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://run-ptest \
            file://CVE-2025-55132.patch \
            file://CVE-2025-55130.patch \
+           file://CVE-2025-59466.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.44.1


