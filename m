Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18166.1795794962544777684
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=U+66haTR;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so12789670c88.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794962; x=1796399762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XmqjZoY7v0uKM96H6iMz13TfIxABxnhIk1C11nk/Vo=;
        b=U+66haTRkWkc442CgtkljbmHC0JC366n9eZbq8wOpcfE+wUAHth+boJ2X2yB5lQILl
         MCgYSbtAqX4atINpIlH4O+eaCK/8IPY8hlhjO3/d0ZlzekICrFMfg0h1yFihektrupwA
         eHGoGdLJAzKevWU3opgAbWJuzljyzhNPD+5lIfXFXJDSOGLo8aSHULrlUAAD3UvQKgOW
         0hMbCUujzWjSFrNN6y4MQNgD7SYJ5D+kEOhEzc9/jL58wrepU6E736NSQUUQWd4WD1+y
         4J6/DCCDRP/qqKRRoSYS58V0ge2X1WlRIbtXSzWO5C33b1b9+fwMqvxV1TCv6+WBfojy
         tMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794962; x=1796399762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5XmqjZoY7v0uKM96H6iMz13TfIxABxnhIk1C11nk/Vo=;
        b=wR/Z9U2q00q9UFL+HlFhSnYeUXU4feXvwAcJRTy9mJnVOULXt+aRZutGXPsLV186qI
         auhiljxZ46BO/K+Lxb7MK0ip5kCdzq0jBBaZkUV0x0F/Z6E8Grc4ecQTvNEB5bIiZYIZ
         4t7/6fxTmR+mzBJdnp/9rpuwGd8/Oq7cY5AKvvV/3ljpFvfnM1ENV4ghouNSbad+YV9B
         c1xO8OJc/A70P+q7Po1lkAaBSXQKJcy24fEZBDabygm4cK3a85WBSV9b9vJPx3t5qdji
         sP6wNxtic0yF370UuF3uEGm2RZfTLrzh3eBgkSHUECLzA8Gk09W/ovsN2c/AyT35JMPZ
         bzRw==
X-Gm-Message-State: APuU4Z/nRQPQ1PRyZuUjKxF5Yw4W8SQYRNiwfPgxNWvvEdYuHtT0yL04
	j881lnw0BfyHyxntYpsoGucj54OXgNJMRwClW1/jUQASaO8YBdofITEkTlVrZgfv
X-Gm-Gg: AZFdTZcpQ0N6MxYFvCN+xlZoRee+3MfQMSASnI9B5Q0Mhg4ZdK8AE0s7Wdy6Ed0JXhp
	N7zg7qWrmZluAcM6pn0mEaNIiGw3vRrhwfAADf5HC3jYZWac3D71+dHXk3m3CoyjGFUE8bpIwJR
	2RHuv0BfdBAW+PaJULIdTRLgzLzab0fHTe/LSS2P9ChNP1lCh2K639OppYLB60ReS/hn6tYh1Hf
	qklCCtMf9xA9n/AqADP9pimsoxtuH5HzUlXTYt1XgSu0SFnJCD3DjQUmudcjHOdTkgBfhaGe13+
	h8ikTTdRVkH4DPy4wri+k6NsS7xF0wOQx4c9cVZv+edEEdksFWDVLr+HZdwnF6oLHGHK6+cvl2v
	9wMZQoj2XtyB7VBSkmTuvDRIa16TtOmpYP51W1rrfz3omyGJ4WFP/u8lFDTNlfdYV0I/vJQI7Dy
	1bk+vrAZjepzSYI2Mcc0JCP3WpY2YecxksSAlDw4WCn9tAvbjzhgRE7aeK1/7wt8lh9ub17/qAC
	oPR9niDSHPwEd4VxIfy/AO67RIJmnKMOCqW75U2yyRJWv4148kvjgmosKnX0G5L1cEKoKgMJ81u
	Zx+k/lRLpRgIsJU1GRSOhe0JPXtvZvVM08twT3w6hzQcIG1ywSd/11uxutPkR3pUGrFLtYpHnMr
	jyCG6eDhaYkTTIjFcYu2Y6JBOYOTwU/cFyUB0XEO2VaOtwvySTG0FkQeXMbxeYGulvH0xxoxcnn
	UWWcgh85yv8zQD9aM0WB9QNvbOsvBt0gc5kLHA7+/1jwxTvX2PTVa06x6O9Xn8RQFZVW7IFir3i
	ktkuQqjvGR8XI8smLBnq9Us3ndE63/S7k0ZcHIwhNCHBq08dYi25HcPsJA3h03E/7NCKUuMSdVJ
	/2pw
X-Received: by 2002:a05:7022:1701:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b55feaa6a4mr22958982c88.15.1795794961790;
        Fri, 27 Nov 2026 07:56:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm58118218c88.8.2026.11.27.07.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:56:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/3] nodejs: Fix build with gcc 12 on the build host
Date: Fri, 27 Nov 2026 07:55:55 -0800
Message-ID: <20261127155557.2874294-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127155557.2874294-1-khem.raj@oss.qualcomm.com>
References: <20261127155557.2874294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 15:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133383
Content-Type: text/plain; charset="utf-8"

Debian 12 build hosts fail to compile the V8 host tools (CXX(host))
with gcc 12:

  turboshaft/assembler.h:1838:33: error: static assertion failed
    static_assert(kTaggedSize == kInt32Size);
  note: the comparison reduces to '(8 == 4)'

GCC before 13 evaluates non-dependent static_asserts in the discarded
branch of an if constexpr inside a template. A full gcc 12 build found a
second case in builtins-iterator-inl.h. Hoist the first check in front
of the if constexpr and make the second depend on a template parameter.

Node.js 26 requires GCC 13.2, so the patch is not for upstream. Checked
with a complete native build using gcc 12.5.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...carded-constexpr-branches-for-gcc-12.patch | 73 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_26.13.1.bb |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs-26/0012-v8-Fix-static_assert-in-discarded-constexpr-branches-for-gcc-12.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-26/0012-v8-Fix-static_assert-in-discarded-constexpr-branches-for-gcc-12.patch b/meta-oe/recipes-devtools/nodejs/nodejs-26/0012-v8-Fix-static_assert-in-discarded-constexpr-branches-for-gcc-12.patch
new file mode 100644
index 0000000000..f6fa856d3a
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-26/0012-v8-Fix-static_assert-in-discarded-constexpr-branches-for-gcc-12.patch
@@ -0,0 +1,73 @@
+From f5ce52fd44c5f3f9bc6d9134fc1c14e4eabec2a4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 26 Nov 2026 17:16:05 -0800
+Subject: [PATCH] v8: Fix static_assert in discarded constexpr branches for gcc
+ 12
+
+GCC before 13 evaluates a static_assert whose condition does not depend
+on a template parameter when it parses the template, even inside the
+discarded branch of an if constexpr. GCC 13 implemented P2593 and defers
+the check. On 64-bit targets this breaks two places in V8:
+
+- turboshaft::AssemblerOpInterface::SmiLessThan() asserts the 32-bit
+  tagged layout in the branch that is only taken with 4-byte tagged
+  values.
+- IterableForEach() asserts that typed array element types fit in an
+  int, including in the branch discarded for the BigInt64, BigUint64 and
+  Uint32 element types.
+
+Hoist the first check in front of the if constexpr, where it holds for
+both layouts, and make the second depend on the IntVisitor template
+parameter so it is only checked on instantiation.
+
+Node.js 26 requires GCC 13.2, but Debian 12 build hosts ship GCC 12 and
+use it for the host tools (CXX(host)).
+
+Upstream-Status: Inappropriate [Node.js 26 requires GCC >= 13.2; this is for older build host compilers]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ deps/v8/src/builtins/builtins-iterator-inl.h | 10 ++++++----
+ deps/v8/src/compiler/turboshaft/assembler.h  |  5 +++--
+ 2 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/deps/v8/src/builtins/builtins-iterator-inl.h b/deps/v8/src/builtins/builtins-iterator-inl.h
+index a8632ba9..eb9081cf 100644
+--- a/deps/v8/src/builtins/builtins-iterator-inl.h
++++ b/deps/v8/src/builtins/builtins-iterator-inl.h
+@@ -272,10 +272,12 @@ MaybeDirectHandle<Object> IterableForEach(Isolate* isolate,
+             return MaybeDirectHandle<Object>();                             \
+           }                                                                 \
+         } else {                                                            \
+-          static_assert(std::numeric_limits<ctype>::max() <=                \
+-                        std::numeric_limits<int>::max());                   \
+-          static_assert(std::numeric_limits<ctype>::min() >=                \
+-                        std::numeric_limits<int>::min());                   \
++          static_assert(sizeof(IntVisitor) > 0 &&                           \
++                        std::numeric_limits<ctype>::max() <=                \
++                            std::numeric_limits<int>::max());               \
++          static_assert(sizeof(IntVisitor) > 0 &&                           \
++                        std::numeric_limits<ctype>::min() >=                \
++                            std::numeric_limits<int>::min());               \
+           if (!int_visitor(static_cast<int>(val))) {                        \
+             return MaybeDirectHandle<Object>();                             \
+           }                                                                 \
+diff --git a/deps/v8/src/compiler/turboshaft/assembler.h b/deps/v8/src/compiler/turboshaft/assembler.h
+index 85ca7d42..cef87c7b 100644
+--- a/deps/v8/src/compiler/turboshaft/assembler.h
++++ b/deps/v8/src/compiler/turboshaft/assembler.h
+@@ -1832,11 +1832,12 @@ class AssemblerOpInterface : public Next {
+   V<Word32> SmiOpName(ConstOrV<Smi> left, ConstOrV<Smi> right) {           \
+     V<WordPtr> l = BitcastTaggedToWordPtrForTagAndSmiBits(resolve(left));  \
+     V<WordPtr> r = BitcastTaggedToWordPtrForTagAndSmiBits(resolve(right)); \
++    static_assert(kTaggedSize == kInt64Size ||                             \
++                  (kTaggedSize == kInt32Size &&                            \
++                   v8::internal::SmiValuesAre31Bits()));                   \
+     if constexpr (kTaggedSize == kInt64Size) {                             \
+       return IntPtrOpName(l, r);                                           \
+     } else {                                                               \
+-      static_assert(kTaggedSize == kInt32Size);                            \
+-      static_assert(v8::internal::SmiValuesAre31Bits());                   \
+       return Int32OpName(TruncateWordPtrToWord32(l),                       \
+                          TruncateWordPtrToWord32(r));                      \
+     }                                                                      \
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_26.13.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_26.13.1.bb
index c42b07acf3..5d968b0f36 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_26.13.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_26.13.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0007-positional-args.patch \
            file://0008-custom-env.patch \
            file://0011-v8-handle-supplementary-case-equivalents-of-BMP-characters.patch \
+           file://0012-v8-Fix-static_assert-in-discarded-constexpr-branches-for-gcc-12.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \
