Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F516C64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 01:52:22 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.733.1677894741269901004
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Mar 2023 17:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mbdOxnSK;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so4038805pjz.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 17:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677894740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCnaQh/ANMSh+NKcHlUvTyjfLP8GGhRDO+JR8mUkBX4=;
        b=mbdOxnSKF57HtE25iZGyfOlAk2wqJJ57RZuxk3ssczIWgbj3q3lMjNuifLFyDor+0X
         IZkcO/eBZDGRLuQ/b62baHYItftowzhtq7SJQbAFC5a3C1qk51yE3nKOjRCalsDbqirh
         gQjsoUFLCu8T7MPA6awCffHiZO5VzHsb1T8riVZj/0ASfMQo+4wCeOjFEPcbrc4BwVqU
         GhYCa/oONlzkuiWEG3mbLG6w7CVpKAqELNMAZJMi8L826pqH069iJnW2uJIswv7rwOwb
         nQgmW3Z/2bjtn3rwXzB9M6uSjMDMBtNunqWGcRhMbO6Xdkb3QC7TLUOWm3yclh2K1NXk
         2nCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677894740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCnaQh/ANMSh+NKcHlUvTyjfLP8GGhRDO+JR8mUkBX4=;
        b=Mdopr9FeexewNdHybcs7TYcYiyReidwHSzpwAT1FWnZFNULtvjDV3ebeAnTQiACaVG
         F7XsraJlHSDZ1REd/oudCyM+qOxeGE5GudHBh6dEBvbKGBCutXeBF2xh/XZxAXFeHiMr
         5aEj3vT/mhsHcGqGwZ6NMOWY7ubU+ut+pWhe4VezxB6DcIk/7pJaeawQ9lwaZ0xrniU8
         xzKBjcLKZ4UZHh3pNqkcflSaJpsZKrEGHvPLN5KIOjwcVr1i8gJVrsemHb6SBIxVal2B
         1dh+sqyCh11TTjjG9e6m3IYzU8MglDjxS2hWoRe7xyEXC3acbp9nQts0xz3V83uIuXZB
         XNFg==
X-Gm-Message-State: AO0yUKUogvtOZwZO42woQXYs+NiG/tRqHJsNpXXfZPPSxg+lCwgoJB3A
	4EFjjYTUCBYW+667rZxQKtLkt85mxYE=
X-Google-Smtp-Source: AK7set/5T+U1Kw4ksu9gm0J6iBDV1HyNZOkMLg2NHKg8q9Hrd4N8bZtjKy+WWq7Yq/ojAd6vbSqD+Q==
X-Received: by 2002:a17:903:441:b0:19e:7d51:3a41 with SMTP id iw1-20020a170903044100b0019e7d513a41mr3377042plb.69.1677894740273;
        Fri, 03 Mar 2023 17:52:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902bd0300b0019a96a6543esm2117344pls.184.2023.03.03.17.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 17:52:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] nodejs: Upgrade to 18.14.2
Date: Fri,  3 Mar 2023 17:52:17 -0800
Message-Id: <20230304015217.4089514-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304015217.4089514-1-raj.khem@gmail.com>
References: <20230304015217.4089514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 01:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101353

License-Update: Add base64 license information [1] and postject [2]

Backport patch to fix enum size errors with clang

[1] https://github.com/nodejs/node/commit/2ec8092e2cf70267e765dfe4baf13d72838a58ed
[2] https://github.com/nodejs/node/commit/4aaec0726694ad0d3cb05d7f2593a90363c32f32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../oe-npm-cache                              |   0
 ....12.bb => nodejs-oe-cache-native_18.14.bb} |   0
 ...e-running-gyp-files-for-bundled-deps.patch |   6 +-
 ...-only-as-wide-as-necessary-for-enums.patch | 158 ++++++++++++++++++
 .../nodejs/nodejs/gcc13.patch                 |  70 --------
 .../{nodejs_18.12.1.bb => nodejs_18.14.2.bb}  |   8 +-
 6 files changed, 164 insertions(+), 78 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.12 => nodejs-oe-cache-18.14}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.12.bb => nodejs-oe-cache-native_18.14.bb} (100%)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Make-bitfields-only-as-wide-as-necessary-for-enums.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_18.12.1.bb => nodejs_18.14.2.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.12/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.14/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.12/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.14/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.14.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.12.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.14.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
index e949c635b0..356c98d176 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
@@ -33,16 +33,14 @@ do_unpack[postfuncs] += "prune_sources"
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile b/Makefile
-index 93d63110..79caaec2 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -138,7 +138,7 @@ with-code-cache test-code-cache:
+@@ -169,7 +169,7 @@ with-code-cache test-code-cache:
  	$(warning '$@' target is a noop)
  
  out/Makefile: config.gypi common.gypi node.gyp \
 -	deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
 +	deps/llhttp/llhttp.gyp \
+ 	deps/simdutf/simdutf.gyp \
  	tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features.gypi \
  	tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
- 	$(PYTHON) tools/gyp_node.py -f make
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Make-bitfields-only-as-wide-as-necessary-for-enums.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Make-bitfields-only-as-wide-as-necessary-for-enums.patch
new file mode 100644
index 0000000000..400d988d88
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Make-bitfields-only-as-wide-as-necessary-for-enums.patch
@@ -0,0 +1,158 @@
+From 5af909e2222dbf2d5e16d590782c045ad32b8b7d Mon Sep 17 00:00:00 2001
+From: Nico Weber <thakis@chromium.org>
+Date: Fri, 29 Jul 2022 20:07:40 -0400
+Subject: [PATCH] Make bitfields only as wide as necessary for enums
+
+clang now complains when a BitField for an enum is too wide.
+We could suppress this, but it seems kind of useful from an
+uninformed distance, so I made a few bitfields smaller instead.
+
+(For AddressingMode, since its size is target-dependent, I added
+an explicit underlying type to the enum instead, which suppresses
+the diag on a per-enum basis.)
+
+This is without any understanding of the code I'm touching.
+Especially the change in v8-internal.h feels a bit risky to me.
+
+Upstream-Status: Backport [https://github.com/v8/v8/commit/d15d49b09dc7aef9edcc4cf6a0cb2b77a0db203f]
+Bug: chromium:1348574
+Change-Id: I73395de593045036b72dadf4e3147b5f7e13c958
+Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/3794708
+Commit-Queue: Nico Weber <thakis@chromium.org>
+Reviewed-by: Leszek Swirski <leszeks@chromium.org>
+Reviewed-by: Hannes Payer <hpayer@chromium.org>
+Auto-Submit: Nico Weber <thakis@chromium.org>
+Cr-Commit-Position: refs/heads/main@{#82109}
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ deps/v8/include/v8-internal.h                    | 2 +-
+ deps/v8/src/ast/ast.h                            | 2 +-
+ deps/v8/src/base/bit-field.h                     | 5 +++++
+ deps/v8/src/compiler/backend/instruction-codes.h | 4 ++--
+ deps/v8/src/compiler/backend/instruction.h       | 4 ++--
+ deps/v8/src/handles/global-handles.cc            | 2 +-
+ deps/v8/src/maglev/maglev-ir.h                   | 2 +-
+ deps/v8/src/wasm/wasm-code-manager.h             | 2 +-
+ 8 files changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/deps/v8/include/v8-internal.h b/deps/v8/include/v8-internal.h
+index e6e9cc5f..a5a05785 100644
+--- a/deps/v8/include/v8-internal.h
++++ b/deps/v8/include/v8-internal.h
+@@ -404,7 +404,7 @@ class Internals {
+ 
+   static const int kNodeClassIdOffset = 1 * kApiSystemPointerSize;
+   static const int kNodeFlagsOffset = 1 * kApiSystemPointerSize + 3;
+-  static const int kNodeStateMask = 0x7;
++  static const int kNodeStateMask = 0x3;
+   static const int kNodeStateIsWeakValue = 2;
+   static const int kNodeStateIsPendingValue = 3;
+ 
+diff --git a/deps/v8/src/ast/ast.h b/deps/v8/src/ast/ast.h
+index 971a2b0e..be1fe09e 100644
+--- a/deps/v8/src/ast/ast.h
++++ b/deps/v8/src/ast/ast.h
+@@ -999,7 +999,7 @@ class Literal final : public Expression {
+   friend class AstNodeFactory;
+   friend Zone;
+ 
+-  using TypeField = Expression::NextBitField<Type, 4>;
++  using TypeField = Expression::NextBitField<Type, 3>;
+ 
+   Literal(int smi, int position) : Expression(position, kLiteral), smi_(smi) {
+     bit_field_ = TypeField::update(bit_field_, kSmi);
+diff --git a/deps/v8/src/base/bit-field.h b/deps/v8/src/base/bit-field.h
+index 63142a20..9605c41c 100644
+--- a/deps/v8/src/base/bit-field.h
++++ b/deps/v8/src/base/bit-field.h
+@@ -40,6 +40,11 @@ class BitField final {
+   static constexpr U kNumValues = U{1} << kSize;
+ 
+   // Value for the field with all bits set.
++  // If clang complains
++  // "constexpr variable 'kMax' must be initialized by a constant expression"
++  // on this line, then you're creating a BitField for an enum with more bits
++  // than needed for the enum values. Either reduce the BitField size,
++  // or give the enum an explicit underlying type.
+   static constexpr T kMax = static_cast<T>(kNumValues - 1);
+ 
+   template <class T2, int size2>
+diff --git a/deps/v8/src/compiler/backend/instruction-codes.h b/deps/v8/src/compiler/backend/instruction-codes.h
+index b06b5222..19cb21d0 100644
+--- a/deps/v8/src/compiler/backend/instruction-codes.h
++++ b/deps/v8/src/compiler/backend/instruction-codes.h
+@@ -195,7 +195,7 @@ V8_EXPORT_PRIVATE std::ostream& operator<<(std::ostream& os,
+   V(None)                       \
+   TARGET_ADDRESSING_MODE_LIST(V)
+ 
+-enum AddressingMode {
++enum AddressingMode : uint8_t {
+ #define DECLARE_ADDRESSING_MODE(Name) kMode_##Name,
+   ADDRESSING_MODE_LIST(DECLARE_ADDRESSING_MODE)
+ #undef DECLARE_ADDRESSING_MODE
+@@ -306,7 +306,7 @@ using MiscField = base::BitField<int, 22, 10>;
+ // LaneSizeField and AccessModeField are helper types to encode/decode a lane
+ // size, an access mode, or both inside the overlapping MiscField.
+ using LaneSizeField = base::BitField<int, 22, 8>;
+-using AccessModeField = base::BitField<MemoryAccessMode, 30, 2>;
++using AccessModeField = base::BitField<MemoryAccessMode, 30, 1>;
+ // TODO(turbofan): {HasMemoryAccessMode} is currently only used to guard
+ // decoding (in CodeGenerator and InstructionScheduler). Encoding (in
+ // InstructionSelector) is not yet guarded. There are in fact instructions for
+diff --git a/deps/v8/src/compiler/backend/instruction.h b/deps/v8/src/compiler/backend/instruction.h
+index 89394b2c..66a6232c 100644
+--- a/deps/v8/src/compiler/backend/instruction.h
++++ b/deps/v8/src/compiler/backend/instruction.h
+@@ -586,8 +586,8 @@ class LocationOperand : public InstructionOperand {
+   }
+ 
+   STATIC_ASSERT(KindField::kSize == 3);
+-  using LocationKindField = base::BitField64<LocationKind, 3, 2>;
+-  using RepresentationField = base::BitField64<MachineRepresentation, 5, 8>;
++  using LocationKindField = base::BitField64<LocationKind, 3, 1>;
++  using RepresentationField = LocationKindField::Next<MachineRepresentation, 8>;
+   using IndexField = base::BitField64<int32_t, 35, 29>;
+ };
+ 
+diff --git a/deps/v8/src/handles/global-handles.cc b/deps/v8/src/handles/global-handles.cc
+index 38113c00..a857e475 100644
+--- a/deps/v8/src/handles/global-handles.cc
++++ b/deps/v8/src/handles/global-handles.cc
+@@ -649,7 +649,7 @@ class GlobalHandles::Node final : public NodeBase<GlobalHandles::Node> {
+ 
+   // This stores three flags (independent, partially_dependent and
+   // in_young_list) and a State.
+-  using NodeState = base::BitField8<State, 0, 3>;
++  using NodeState = base::BitField8<State, 0, 2>;
+   using IsInYoungList = NodeState::Next<bool, 1>;
+   using NodeWeaknessType = IsInYoungList::Next<WeaknessType, 2>;
+ 
+diff --git a/deps/v8/src/maglev/maglev-ir.h b/deps/v8/src/maglev/maglev-ir.h
+index 1f7c5471..9ff1a308 100644
+--- a/deps/v8/src/maglev/maglev-ir.h
++++ b/deps/v8/src/maglev/maglev-ir.h
+@@ -196,7 +196,7 @@ class OpProperties {
+   }
+ 
+   constexpr bool is_pure() const {
+-    return (bitfield_ | kPureMask) == kPureValue;
++    return (bitfield_ & kPureMask) == kPureValue;
+   }
+   constexpr bool is_required_when_unused() const {
+     return can_write() || non_memory_side_effects();
+diff --git a/deps/v8/src/wasm/wasm-code-manager.h b/deps/v8/src/wasm/wasm-code-manager.h
+index 137c3074..c6e878a1 100644
+--- a/deps/v8/src/wasm/wasm-code-manager.h
++++ b/deps/v8/src/wasm/wasm-code-manager.h
+@@ -474,7 +474,7 @@ class V8_EXPORT_PRIVATE WasmCode final {
+   int trap_handler_index_ = -1;
+ 
+   // Bits encoded in {flags_}:
+-  using KindField = base::BitField8<Kind, 0, 3>;
++  using KindField = base::BitField8<Kind, 0, 2>;
+   using ExecutionTierField = KindField::Next<ExecutionTier, 2>;
+   using ForDebuggingField = ExecutionTierField::Next<ForDebugging, 2>;
+ 
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch b/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
deleted file mode 100644
index be82c3369c..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 0be1c5728173ea9ac42843058e26b6268568acf0 Mon Sep 17 00:00:00 2001
-From: Jiawen Geng <technicalcute@gmail.com>
-Date: Fri, 14 Oct 2022 09:54:33 +0800
-Subject: [PATCH] deps: V8: cherry-pick c2792e58035f
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Original commit message:
-
-    [base] Fix build with gcc-13
-
-    See https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes.
-
-    Also see Gentoo Linux bug report: https://bugs.gentoo.org/865981
-
-    Change-Id: I421f396b02ba37e12ee70048ee33e034f8113566
-    Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/3934140
-    Reviewed-by: Clemens Backes <clemensb@chromium.org>
-    Reviewed-by: Simon Zünd <szuend@chromium.org>
-    Commit-Queue: Clemens Backes <clemensb@chromium.org>
-    Cr-Commit-Position: refs/heads/main@{#83587}
-
-Refs: https://github.com/v8/v8/commit/c2792e58035fcbaa16d0cb70998852fbeb5df4cc
-PR-URL: https://github.com/nodejs/node/pull/44961
-Fixes: https://github.com/nodejs/node/issues/43642
-Reviewed-By: Michaël Zasso <targos@protonmail.com>
-Reviewed-By: Richard Lau <rlau@redhat.com>
-Reviewed-By: Luigi Pinca <luigipinca@gmail.com>
-Reviewed-By: Colin Ihrig <cjihrig@gmail.com>
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/0be1c5728173ea9ac42843058e26b6268568acf0]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- common.gypi                                   | 2 +-
- deps/v8/AUTHORS                               | 1 +
- deps/v8/src/base/logging.h                    | 1 +
- deps/v8/src/inspector/v8-string-conversions.h | 1 +
- 4 files changed, 4 insertions(+), 1 deletion(-)
-
---- a/deps/v8/AUTHORS
-+++ b/deps/v8/AUTHORS
-@@ -247,6 +247,7 @@ Vlad Burlik <vladbph@gmail.com>
- Vladimir Krivosheev <develar@gmail.com>
- Vladimir Shutoff <vovan@shutoff.ru>
- Wael Almattar <waelsy123@gmail.com>
-+WANG Xuerui <git@xen0n.name>
- Wei Wu <lazyparser@gmail.com>
- Wenlu Wang <kingwenlu@gmail.com>
- Wenming Yang <yangwenming@bytedance.com>
---- a/deps/v8/src/base/logging.h
-+++ b/deps/v8/src/base/logging.h
-@@ -5,6 +5,7 @@
- #ifndef V8_BASE_LOGGING_H_
- #define V8_BASE_LOGGING_H_
- 
-+#include <cstdint>
- #include <cstring>
- #include <sstream>
- #include <string>
---- a/deps/v8/src/inspector/v8-string-conversions.h
-+++ b/deps/v8/src/inspector/v8-string-conversions.h
-@@ -5,6 +5,7 @@
- #ifndef V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
- #define V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
- 
-+#include <cstdint>
- #include <string>
- 
- // Conversion routines between UT8 and UTF16, used by string-16.{h,cc}. You may
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
index 802c4191bb..e33e2bde42 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dfd7ae796baf5326016a3865ee1dc632"
+LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2dff1ccca11e333f1388e34f7e2d1de3"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -27,7 +27,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
-           file://gcc13.patch \
+           file://0001-Make-bitfields-only-as-wide-as-necessary-for-enums.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -39,7 +39,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "4fa406451bc52659a290e52cfdb2162a760bd549da4b8bbebe6a29f296d938df"
+SRC_URI[sha256sum] = "fbc364dd25fee2cacc0f2033db2d86115fc07575310ea0e64408b8170d09c685"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.39.2


