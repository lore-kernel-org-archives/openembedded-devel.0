Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA9EC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 16:26:53 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.25659.1682612813118533667
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 09:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=myCaWKXQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1a66e7a52d3so65952105ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682612812; x=1685204812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oYby0tG4HMZXKU24HvLUJ9/1zds6u7a4Y7GcHp4MDyE=;
        b=myCaWKXQmLWyorCVZrPtbnqSJWCfrFB/aHAOl4iMI3p/JuVW3NnTBHoIh4MSVzn2eL
         063jt2q61Uy5GATNRL7ZO4EdiQawH0Z2f3K//NxJQiIFGyKp7E7IWHQi61ktxRYVlUL1
         RNetEcBfabnGTZRVv8edYRRh1kZdHA7gDwEGsuWsXtXlW4QMXH4hYsKEXAallp5GblzT
         0tbgN4ozCX5jsnIxlKYN99xH1c+9UAzTaSbihqb0ReciXa8P1X2IgPbqzuvYRFv37qmb
         nr+NI4owMqlrodoKLOsRouhWpkLAf1ZgN9U+/ITPcQNV+0BTEjRxCz/Zn3qChKr4Kile
         tZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682612812; x=1685204812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYby0tG4HMZXKU24HvLUJ9/1zds6u7a4Y7GcHp4MDyE=;
        b=J+CX6AEErWvyklKOWRFG61FV2ipd6qywcX+Zq+2mElYB2SymkYFFz3YADNP2sY9PHM
         GMIieETg86f84iZySYi5WMsAKdIYceFOfD8PUv67xJDpNDBaVm4tnYbBm/obYyPnTnmd
         HFfKvq4alop0cziym55Xg/X3rWqxIRUo91qXvVghH9hjV4upA7SSyffkVVJNdBGJcKkq
         /b6ug62aOwWP5piRjHIwnM4c7hsZuNAXkU4hM/j/sAXuLZFRpgP3iBu2iJZ+whWNkhtp
         Jw+N29mo4szte7YxvLZcjlapj3oww5JAZgM9dN0VLQqS2NLBeLAWO+jU9G6PZRHEW7P2
         B2SQ==
X-Gm-Message-State: AC+VfDw/Soh6WgSiR/rRKIzlW4VZrwoP+zlQ2kYRRyxMHqF2hcZZN4hZ
	zEJCjWWOJuCGJPqTSzePNiPwqWpVeIM=
X-Google-Smtp-Source: ACHHUZ7qBwBuKrodiY4GHrZmCDhKNB2YxeVQbwlJkgz49l/v6xTfG+ItYpVuRpFgIcVifLlkukVTUQ==
X-Received: by 2002:a17:903:298f:b0:1a5:f36:ae09 with SMTP id lm15-20020a170903298f00b001a50f36ae09mr2178278plb.7.1682612811866;
        Thu, 27 Apr 2023 09:26:51 -0700 (PDT)
Received: from localhost.localdomain ([103.161.99.24])
        by smtp.gmail.com with ESMTPSA id jd9-20020a170903260900b001a681fb3e77sm11553504plb.44.2023.04.27.09.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 09:26:51 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Viktor Rosendahl <viktor.rosendahl@bmw.de>
Subject: [meta-oe][dunfell][PATCH] jsoncpp: Fix broken handling of escape characters
Date: Thu, 27 Apr 2023 21:56:44 +0530
Message-Id: <20230427162644.106954-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 16:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102212

From: Viktor Rosendahl <viktor.rosendahl@bmw.de>

Applying this backported patch from upstream fixes the following
BAT test failure:

jsoncpp.jsoncpp_system_tests.TestJsoncpp.test_run_jsoncpp_test
(from systemtests--bmt--BAT) :
* Detail of EscapeSequenceTest/writeEscapeSequence test failure:
/usr/src/debug/jsoncpp/1.9.2-r0/git/src/test_lib_json/main.cpp(3370): expected == result
  Expected: '["\"","\\","\b","\f","\n","\r","\t","\u0278","\ud852\udf62"]
  '
  Actual  : '["\"","\\","\b","\f","\n","\r","\t","ɸ","𤭢"]

This test failure happens because aarch64 uses unsigned char as
default type for char, while x86 uses signed char. Also, there
is another bug in the code that is fixed by this upstream patch:

 "static_cast<unsigned char>(*cur) < 0x80" should be:
 "static_cast<unsigned char>(*cur) >= 0x80"

Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
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
index 629881f0c..ae4b4c984 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
@@ -14,7 +14,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
 
 SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"
-SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https"
+SRC_URI = "\
+           git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https \
+           file://0001-json_writer-fix-inverted-sense-in-isAnyCharRequiredQ.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


