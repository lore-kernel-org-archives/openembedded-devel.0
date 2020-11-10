Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web08.32012.1605033858869770707
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2020 10:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RfyXh7q6;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: viktor.rosendahl@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id a65so4183700wme.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2020 10:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=uihLFBdErMQap9EtUx1myIFKUoWGSL2X8fiLOrbaFa4=;
        b=RfyXh7q6N2hhto/8XMkEL4zFLZ1fTqVmilr/Vo9bz8OA01NQ2uWIcfIjasLujSdTUP
         s4Xo4kFbyzl0B4ivRMJF+hB8baGnxHskM4JqKwc0XIIdnK1FLGvbVdbH6JYWRgaSTK5h
         5yJh1bPzPwJh5KBjIQh5CpG/ox1eR1h73HdW/GhuCwhmH/agTlDxhH9+Kg8hHgJw2Iby
         Qy+n46ZV61vLVuhxeCgbm/rsO3DQIxlWe/fDnQ66JS7JfNPqMcwJwzmesvI1M1qqpoIM
         YczYsWM1BdQdGkyF+9KjmXDR82tDsHYp2oBOIzCSl42sLaybtLCqMGYgdh7Sj5wasxdm
         t85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uihLFBdErMQap9EtUx1myIFKUoWGSL2X8fiLOrbaFa4=;
        b=hs3FlrAD3VixSsgQ0yngiUUJHXOH7u5ikBXVDKN71YoA8w/tzMZurv+pYBaKQPBIHl
         abe5dxQF4D5AGfhDKztgsKweLBN0kCtYAmxbbwbjc+jS05EQOgyIP4iQyUEOgHxAn1wp
         YOn+U4N/coGl1iisgQuUEi1mrS2nKbZUExP2OizEAaJWCx+ADdlnIuQ7cJtElG4vJWtw
         w+VC8A62mC7ytJREdaCCK4JyNNvl/11qs2fFfKHJQvIP6EhX3lz3JPHrgEuMcIHazMfc
         KGjfVGc764kCnkHMJuRJ0Z726RfBLTmKwAtL9iwJ1//s/lVNIpMxVfuAtuPvIpWk+eDa
         cCIQ==
X-Gm-Message-State: AOAM533q9WweMdB1QfT3YBRgebiXoIgYsTr7d3W51b1vgk+SrRBNWxUj
	7shpRRReOXLDO7eZ1I3HfKcnZNIcqL4y
X-Google-Smtp-Source: ABdhPJy5ilx0GufaoUL4e6ZTdjaaEm0hEAa/YupHgnLL8mXCbbku2c5MUIaLNm6BQ5jh+pY2+TJCXQ==
X-Received: by 2002:a1c:5f45:: with SMTP id t66mr556959wmb.20.1605033856939;
        Tue, 10 Nov 2020 10:44:16 -0800 (PST)
Return-Path: <viktor.rosendahl@gmail.com>
Received: from greenhouse.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id 90sm17618776wrl.30.2020.11.10.10.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 10:44:16 -0800 (PST)
From: "Viktor Rosendahl" <viktor.rosendahl@gmail.com>
X-Google-Original-From: Viktor Rosendahl <viktor.rosendahl@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Viktor Rosendahl <viktor.rosendahl@bmw.de>,
	Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
Subject: [dunfell][PATCH v3] jsoncpp: Fix broken handling of escape characters
Date: Tue, 10 Nov 2020 19:44:12 +0100
Message-Id: <20201110184412.24935-1-viktor.rosendahl@bmw.de>
X-Mailer: git-send-email 2.17.1

Applying this backported patch from upstream fixes the following
test failure:

* Detail of EscapeSequenceTest/writeEscapeSequence test failure:
/home/viktor/jsoncpp/src/test_lib_json/main.cpp(3370): expected == result
  Expected: '["\"","\\","\b","\f","\n","\r","\t","\u0278","\ud852\udf62"]
  '
  Actual  : '["\"","\\","\b","\f","\n","\r","\t","",""]
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
 ...inverted-sense-in-isAnyCharRequiredQ.patch | 49 +++++++++++++++++++
 .../recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb |  5 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch
new file mode 100644
index 000000000..ff03e0565
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch
@@ -0,0 +1,49 @@
+From 2d5a94aeeab01f0448b5a0bb8d4a9a23a5b790d5 Mon Sep 17 00:00:00 2001
+From: Andrew Childs <lorne@cons.org.nz>
+Date: Sat, 28 Dec 2019 16:04:24 +0900
+Subject: [PATCH] json_writer: fix inverted sense in isAnyCharRequiredQuoting
+ (#1120)
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
+  Actual  : '["\"","\\","\b","\f","\n","\r","\t","",""]
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

