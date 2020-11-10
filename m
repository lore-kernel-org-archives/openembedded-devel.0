Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.31899.1605032403871891544
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2020 10:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aL9Fx4LM;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: viktor.rosendahl@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id 23so13780452wrc.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2020 10:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VY0maJjjMysHwMFtZssEyEYRWOLeB83QdFMjEtlBzgM=;
        b=aL9Fx4LMstApugiLAL7hCE8PgeTFsQK2OOrF6/QcyNwJ1jSSUrqzi3XuotULLPKKPb
         rwOefsHuoqNh9UK41TvlOpZXZvUs5lzYluLUjZef892/7RLrT4nFi5QA7UdouoUPdGxM
         KJUBTfdK6MOl5SWrCPyg4XbBAqIRD/vvyEoMw9jIQ2vhifqp3NqTZnJPpt7jMvYY8yAc
         FC0GxPIsOfBaMhgwlCMhRIpQUQA1376elDCmzz2FtDqi3sKrsbCZTm1b9PREuJIh1h0X
         bPynlmZe80TuuzVCP3qiuEsbqaYU1Vcqmsemf4y+09wvMaqvQBmaPdRwr2LOrkmk3Ep4
         rXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VY0maJjjMysHwMFtZssEyEYRWOLeB83QdFMjEtlBzgM=;
        b=TpNhrXLJILqaYXJQcA7A3bUKzE+HJaDxX+ZoajyflP1mDbkTlNYBLBlG/Y2Sex2cWP
         mxa8N/cqjHZeBYO4j3Z6mV0GOr6n2PiH6wBEHAS7BroPqnjw/oZRg7aRvOh11+DeZpUm
         fdxISlD8A4O2PXRwFkgb4MQFiFxTsyV41VtQniyaAXW7VIkF117DvA2BDTBCDjDcidXb
         QUeoUTQBzQVSQ0cpiC85+iFSlCeDf7BkRfxnDFz705WYmEis0VFLcLKdqjiYKxU8R4Xh
         qp5uCGekLJINeoyLhLUBZ1vQToxyjv5DuND4uDOeCyf27iE6VMrh7++BvidBxzI38iMH
         vw3w==
X-Gm-Message-State: AOAM533e7eMaUPpPSv+MEnn6zRNztV0S41ouenFBsGDHU/ygSW++Qnm9
	gr59G6hEE/LYcc+Z2qPaNXls2DtwE5UF
X-Google-Smtp-Source: ABdhPJwArMD2Zxj0KFpYu7u7kNzvX0PfXbuJF9RVil2pFExAIyTa5djcHtOjT7Amh22PVqz7xhYNZw==
X-Received: by 2002:adf:dd08:: with SMTP id a8mr14066715wrm.344.1605032401871;
        Tue, 10 Nov 2020 10:20:01 -0800 (PST)
Return-Path: <viktor.rosendahl@gmail.com>
Received: from greenhouse.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id v6sm20194471wrb.53.2020.11.10.10.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 10:20:00 -0800 (PST)
From: "Viktor Rosendahl" <viktor.rosendahl@gmail.com>
X-Google-Original-From: Viktor Rosendahl <viktor.rosendahl@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Viktor Rosendahl <viktor.rosendahl@bmw.de>,
	Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
Subject: [dunfell][PATCH v2] jsoncpp: Fix broken handling of escape characters
Date: Tue, 10 Nov 2020 19:19:57 +0100
Message-Id: <20201110181957.23414-1-viktor.rosendahl@bmw.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

New in v2: I removed the unescaped characters from the quoted error
message because it seems that they broke patchwork.

Applying this backported patch from upstream fixes the following
test failure:

* Detail of EscapeSequenceTest/writeEscapeSequence test failure:
/home/viktor/jsoncpp/src/test_lib_json/main.cpp(3370): expected == result
  Expected: '["\"","\\","\b","\f","\n","\r","\t","\u0278","\ud852\udf62"]
  '
  Actual  : '["\"","\\","\b","\f","\n","\r","\t","<unescaped char>",
  "<unescaped char>"]
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

