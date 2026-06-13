Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDD1CD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:19:05 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87392.1781338736400087199
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KgdRdePw;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso13853225ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338736; x=1781943536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOv2oixjsoUAbVEeg68DZnQHuF31EyL0NCtN1MZTQrE=;
        b=KgdRdePwRSFGYH5/HjIhSXToFEA7gWkkQGunyOktJ3f9FLezFuyBWXbMl18+BwI/zR
         GOPqspGV0g9AMKQ9jPFvSlDV+pRWJ396728BaW9Xx8fODkVKxWnnNq25YpXqBKhmsFVS
         pHDzlFDWK0WzPuL0rVSYL6FLqJoXWr1QjViVRzBRmusWgb8uChW0yYbQYYjHQNYrZNUZ
         BpbTfNPpqGpLLtj/eYCL2bGONIWTqwFondvDeGyqjFK8CqwgdDh9+MpqOZz/aXyo26+k
         To3ygvpTSwPCgmlMm1yaYcZ8MRgaE3XAw6//WBsujrKXDwnrjO5QcYvTPlIqaMQfNCvy
         RmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338736; x=1781943536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOv2oixjsoUAbVEeg68DZnQHuF31EyL0NCtN1MZTQrE=;
        b=sbBIsHjUL85pqrK0xnlJCtioXSnANK/gdBhPVEdIBytvHRcgOLI1uns/YgSEgFqMWL
         1nwrvkbCZw5OR+9Vq2nP6NNUKW6s4exQQH1jB15qoLwwaGoZiZ6IJDOrO8jcAQb4NJrj
         S7TquRSCchCxJ8xos58nY8yW9JGeKDwjgAOgFsoeYBfievj6Dfe2rf4J22pkN3e9bIIr
         rcVPIKpJjqQCpfor/aP2SGbdiZ86ROuGKbSdlJ1Rww3gHWSQgfKvSaq8HDQm0vLMg8l+
         K2AXLqNA6CGIH08YF2Q5w3onSLX4BgFKATar29P1ZydtCDppkL4oeptDhbTNS6pW4huC
         DsEw==
X-Gm-Message-State: AOJu0YyWCUd7efFeBgV0p4VCrXqKGWzegqOTrlT/ROeWzzMfd7JmPJvp
	Y62DQbiRs0SotH2ddp6ybEE/FCghNVOOFPt8vdNQHd9cI4c6J8OiM82b7fSETHKd
X-Gm-Gg: Acq92OEqODZHO9yMAaK8CLAySyzOO+XE5iM7GLbBkWKpQ1XO5+iB/ywUaPR7d6X3p72
	sHxdQkoyd054AyWNm0gpQFSljQtinu4IHqKzGbe9d+ymd42ZmIJk/a7U54RCRJv2pJAESvYeJ2z
	Kl76gvB6n7ZUxVRTTcBl6Pa8Q9OALyv9i4FwMeme/dEso1r3G/LTUEEBOejV++QA81IFiwAJt4i
	q8xooK6fff8aP5cP77MulJcw9TqaYalQHmUiXBH5RN/45e4K1J9mWLdM5XsfSYNqpkzS/ylpsqf
	sLYeze+wu+4fSlpK/uACzOkkl+dmKQlsnSjBQ59tmlUYxtDgLyEMUVnXKkS1GAPjCT7qcdFLqNt
	V5vLcPSRYPWuaweEmdgnAOoec5DQXHCBHnKhqCXf/Wfyq00CC0A+Xl3ai6AkQc7QWjhWc3EFavw
	HbBOagQWFJ7LdRm0OBUuRro/Agexkw54QROzue
X-Received: by 2002:a17:903:b4e:b0:2c1:6020:7398 with SMTP id d9443c01a7336-2c6641efbc2mr32349235ad.12.1781338735683;
        Sat, 13 Jun 2026 01:18:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:18:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 8/16] libjs-jquery-cookie: patch CVE-2026-46625
Date: Sat, 13 Jun 2026 20:18:16 +1200
Message-ID: <20260613081824.1223609-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127560

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-46625

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libjs-jquery-cookie/CVE-2026-46625.patch  | 63 +++++++++++++++++++
 .../libjs/libjs-jquery-cookie_3.0.5.bb        |  4 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery-cookie/CVE-2026-46625.patch

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie/CVE-2026-46625.patch b/meta-oe/recipes-support/libjs/libjs-jquery-cookie/CVE-2026-46625.patch
new file mode 100644
index 0000000000..973e12fc79
--- /dev/null
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie/CVE-2026-46625.patch
@@ -0,0 +1,63 @@
+From 808905ea1bb4582bcfd681ba1bb8a1c1d1113b40 Mon Sep 17 00:00:00 2001
+From: Klaus Hartl <klaus.hartl@gmail.com>
+Date: Fri, 15 May 2026 11:23:44 +0200
+Subject: [PATCH] Prevent cookie attribute injection
+
+Given that we are using a `for ... in` loop for assembling a cookie's
+attributes required for writing/removing, we are vulnerable to prototype
+pollution, where an attacker might attempt to add/overwrite certain
+attributes and with that broadening access or wiping out a cookie
+altogether.
+
+Such malicious attributes input could most likely come from an object
+parsed from a JSON string; for example looking like
+'{"__proto__":{"samesite":"None"}}'.
+
+Note that at the moment we're tied to using this kind of for-loop for
+compatibility with IE 10 + 11.
+
+(cherry picked from commit eb3c40e89731e99b8970faaf35ddad249c6c0020)
+
+CVE: CVE-2026-46625
+Upstream-Status: Backport [https://github.com/js-cookie/js-cookie/commit/eb3c40e89731e99b8970faaf35ddad249c6c0020]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/assign.mjs |  1 +
+ test/tests.js  | 12 ++++++++++++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/src/assign.mjs b/src/assign.mjs
+index 2934ff3..a0e55f1 100644
+--- a/src/assign.mjs
++++ b/src/assign.mjs
+@@ -3,6 +3,7 @@ export default function (target) {
+   for (var i = 1; i < arguments.length; i++) {
+     var source = arguments[i]
+     for (var key in source) {
++      if (key === '__proto__') continue
+       target[key] = source[key]
+     }
+   }
+diff --git a/test/tests.js b/test/tests.js
+index da65d74..c3ab54e 100644
+--- a/test/tests.js
++++ b/test/tests.js
+@@ -489,6 +489,18 @@ QUnit.test(
+   }
+ )
+ 
++QUnit.test(
++  'sanitization of attributes to prevent prototype pollution from untrusted input',
++  function (assert) {
++    var untrusted = JSON.parse('{"__proto__":{"foo":"bar"}}')
++    assert.strictEqual(
++      Cookies.set('c', 'v', untrusted),
++      'c=v; path=/',
++      'should prevent attribute-injection via prototype pollution'
++    )
++  }
++)
++
+ QUnit.module('remove', lifecycle)
+ 
+ QUnit.test('deletion', function (assert) {
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
index f4e26a65fc..3740d9c16e 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.5.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/js-cookie/js-cookie"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e16cf0e247d84f8999bf55865a9c98cf"
 
-SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=https;branch=main \
+           file://CVE-2026-46625.patch \
+"
 
 SRCREV = "ab3f67fc4fad88cdf07b258c08e4164e06bf7506"
 

