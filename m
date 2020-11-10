Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web08.31204.1605030576310876484
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2020 09:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U7IWxrps;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: viktor.rosendahl@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id o15so5822390wru.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2020 09:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WwSYo/qkbuhTVNzu7aVadYqzaW2RR7z3bfXEhIXy5gA=;
        b=U7IWxrpsqx9Mk8jcHUfCf0sgKqhR6TcyDVjSa2YzJOS1D0GT0mmjaSS0Olul1bc8rU
         RxxpAQdxEdipYwpKQqYpG2qqdhwv7tolqxYB2Qehft4QmBNIFHMVUDqggk4k3WD0AGFN
         iiUDjb6PCaamYsXU3CWryCJk+amwfwC/KpY8CYYfMvQkHBMsvVi36hkeCMy67J2uNpSw
         9g3Sd9JXd93t/Wgl9OKTJLWvG+zQ5ow3FGPvXZXbXN7bI3DA5IWtZBt7hDOjjfGBAzVJ
         B4OEwlmMRJ9P2Jz7hL9yEOpnfUlzyF8bwsXUD25KYjbvvz/KahsChiXe2eKPKalue3Dl
         rnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WwSYo/qkbuhTVNzu7aVadYqzaW2RR7z3bfXEhIXy5gA=;
        b=jh7GMEwrBrk5+P5cvxffxo5+OTYGwLiIAyedSctPA3W67npU3Top9Ywgx9JkFwMc3S
         PoDzbHciS7vgUo/z22dCorjPEbstF3VkTMptg8YfmOgbMZzfvY1XMy45p16j1sM/GLkt
         ckA524IVZ6eFxxZ36rU8pnp+jMVKZl/yaE60xBrQm0igSIwuRvTPLp8QGXn08YCBEYnD
         LpP6uSs+DJcN4n5FmI8M9jiz53H91Q83QgfZahc8EbY5bTuEyWkaL5BZKujJo5WevBLf
         6f/LxbT96ALoA4oO+92N4nttLbTxXvmRmwM1g27FolJbnKkI/0ngUI8BiBJv/8hzR4LY
         LnXQ==
X-Gm-Message-State: AOAM532/O1W4tJ1tMw/KMvrN1PAge8+x/XxHpZVFg3EGT696gbGcTY0z
	mzhoMOwTPppsPYp6+soFGQUR/3fMK7aU
X-Google-Smtp-Source: ABdhPJwgWkJ1ftltOMr730sHlBuyKbh19q2i95Pq+5KpB2m/dzX8T+1uMmGHY/uhO5lrMmZ1tArTrQ==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr15731362wrw.43.1605030574297;
        Tue, 10 Nov 2020 09:49:34 -0800 (PST)
Return-Path: <viktor.rosendahl@gmail.com>
Received: from greenhouse.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id p4sm17635902wrm.51.2020.11.10.09.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 09:49:33 -0800 (PST)
From: "Viktor Rosendahl" <viktor.rosendahl@gmail.com>
X-Google-Original-From: Viktor Rosendahl <viktor.rosendahl@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Viktor Rosendahl <viktor.rosendahl@bmw.de>,
	Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
Subject: [dunfell][PATCH] jsoncpp: Fix broken handling of escape characters
Date: Tue, 10 Nov 2020 18:49:29 +0100
Message-Id: <20201110174929.21796-1-viktor.rosendahl@bmw.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Applying this backported patch from upstream fixes the following
test failure:

* Detail of EscapeSequenceTest/writeEscapeSequence test failure:
/home/viktor/jsoncpp/src/test_lib_json/main.cpp(3370): expected == result
  Expected: '["\"","\\","\b","\f","\n","\r","\t","\u0278","\ud852\udf62"]
  '
  Actual  : '["\"","\\","\b","\f","\n","\r","\t","ɸ","𤭢"]
  '

This failure only happens on architectures that use unsigned char as
default type for char. It doesn't happen on x86 because it uses signed
char by default. However, the failure can be emulated on x86 by adding
the following line to the beginning of CMakeLists.txt:

add_compile_options(-funsigned-char)

Also, there is another bug in the code that is fixed by this upstream
patch:

 "static_cast<unsigned char>(*cur) < 0x80" should be:
 "static_cast<unsigned char>(*cur) >= 0x80"

This patch is not needed in master or gatesgarth branches, because they
use version 1.9.3 of jsoncpp, which doesn't have the bug.

Signed-off-by: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
---
 ...inverted-sense-in-isAnyCharRequiredQ.patch | 52 +++++++++++++++++++
 .../recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb |  5 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch
new file mode 100644
index 000000000..784f175ee
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch
@@ -0,0 +1,52 @@
+From 2d5a94aeeab01f0448b5a0bb8d4a9a23a5b790d5 Mon Sep 17 00:00:00 2001
+From: Andrew Childs <lorne@cons.org.nz>
+Date: Sat, 28 Dec 2019 16:04:24 +0900
+Subject: [PATCH] json_writer: fix inverted sense in isAnyCharRequiredQuoting
+ (#1120)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This bug is only affects platforms where `char` is unsigned.
+
+When char is a signed type, values >= 0x80 are also considered < 0,
+and hence require escaping due to the < ' ' condition.
+
+When char is an unsigned type, values >= 0x80 match none of the
+conditions and are considered safe to emit without escaping.
+
+This shows up as a test failure:
+
+* Detail of EscapeSequenceTest/writeEscapeSequence test failure:
+/build/source/src/test_lib_json/main.cpp(3370): expected == result
+  Expected: '["\"","\\","\b","\f","\n","\r","\t","\u0278","\ud852\udf62"]
+  '
+  Actual  : '["\"","\\","\b","\f","\n","\r","\t","ɸ","𤭢"]
+  '
+Upstream-Status: Backport [https://github.com/open-source-parsers/jsoncpp/commit/f11611c8785082ead760494cba06196f14a06dcb]
+
+Signed-off-by: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
+
+---
+ src/lib_json/json_writer.cpp | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib_json/json_writer.cpp b/src/lib_json/json_writer.cpp
+index 519ce23..b68a638 100644
+--- a/src/lib_json/json_writer.cpp
++++ b/src/lib_json/json_writer.cpp
+@@ -178,8 +178,9 @@ static bool isAnyCharRequiredQuoting(char const* s, size_t n) {
+ 
+   char const* const end = s + n;
+   for (char const* cur = s; cur < end; ++cur) {
+-    if (*cur == '\\' || *cur == '\"' || *cur < ' ' ||
+-        static_cast<unsigned char>(*cur) < 0x80)
++    if (*cur == '\\' || *cur == '\"' ||
++        static_cast<unsigned char>(*cur) < ' ' ||
++        static_cast<unsigned char>(*cur) >= 0x80)
+       return true;
+   }
+   return false;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
index 8a5db3da3..6482a93a7 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
@@ -14,7 +14,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
 
 SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"
-SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
+SRC_URI = "\
+           git://github.com/open-source-parsers/jsoncpp \
+           file://0001-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

