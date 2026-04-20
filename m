Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9A7F36C3A
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13763.1776666474596012560
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kzehSIRK;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488c2690057so25244625e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666473; x=1777271273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96iFcisf+ApYG8HqNz0coW9LHkUEvUohTrhdn9wLFh0=;
        b=kzehSIRK4+oHwmTTdvhM8hdQLcIXr+QK1TlQf8tBLMCjWGuwGp4cc6nC3Lbhk/etEH
         iZ6H8g2FcVzCvqodbfJcSwNRFzQQkEBmcIyEETR2ZzKW3dK4ECQkM6fe8UiH335a/CrU
         b7RI5PIARc7kpNob354/ROwu+3U5gRCfzkLOW6UdEZiJc9UPbPm7+CPI9yiUXIDlYdFX
         qgBGmtWxYJj2EHe/A/sbAxydxFDjkdalVg+jroaGEvJMqDEDXaUrvaEIv/2CnzjOFgQh
         m60hmGqiJHdmyOQQSGARLzRwJ1+orXpP6XDBKrD2HieEKtDpk3rYrWJfirHtsqGp6YDc
         0BLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666473; x=1777271273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=96iFcisf+ApYG8HqNz0coW9LHkUEvUohTrhdn9wLFh0=;
        b=StmOCIzpGIfJa7xOGWuIDzm1eEUCfmDfS2IrnzAwU3JAbrnRGKb5REClF7Zut3tTYA
         m/UMxyPGLsSE8XJmYi+6pwZNE6TldjRQoun0ommpL83pKD4NBy1xoKQfSmSJSO5BLZCw
         bhOhlUQX2lINnQJNYTi+lMCS588VhtNgcwXHBlOjam6RmCi9AnG65oQiae8Yd5EItgvO
         /LRYWLHm7os8+7lB/XLzVRyMBTA2tvXKQ3cY9esqsEefJZmqrvzrZoMIJflupfvwHKZr
         C4hLv25ZqdXE5nhZ50iVUhfG8hToJxePRUi2o67oTjVvFJwkHab3SrhsNlFwPyOAYRCS
         EoFA==
X-Gm-Message-State: AOJu0YyD0HdFA/PTsE/2ceKPYU3a9DGrdCYpnh5aNMebdktPvAJnwZWx
	Ml7ONYOMEdLVxcLoao2TGmP/26idux53KtJ2Sb/1lpwPiOm54fAF2pu/ZUTu3w==
X-Gm-Gg: AeBDietbsustHrk/p+j67snkEUgep6xANA1i5zzkA97Ax8Q2kv7Q1fhfq/Mx3H9peev
	7s4R2bNsd/SRGXS+4qxT4CuOB83Y+wtBFLHpHKOnGYXXNTNtc91dqAF2gJGHsbi3yLUJ3vDjUsk
	Sx9++b1qmurnfl0MwLLBO+AAeOf+e3XVY85+F3DYeyM6H9Agi03dDjm1yi1OGTWgIYXecnTNAvg
	BEqZNAGKdS/hIGu4J4TwExEx3NuICgYEolnnGyb5kxUrx+zxRDS0WTxT2eiwODUJXTxfraqqBTp
	6GjjNAQQbeDPdIjtrivihS5wAzebZOUQc29fAiwYAS5wEsQSOoNbXZOarb4dp5BbLfHEQh0prsX
	wvGjFRJF3WMed3BmSXfJHChK50oCnWTmSl4jxmNxdeB2LhpSOpandxOlQ+SUyMk8HWgqzjLmMj+
	KcQxZEZ7MHDMFr3e4nrEt6bYRSxr0Wv3s=
X-Received: by 2002:a05:600c:42cc:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-488ffb14a0cmr69721045e9.12.1776666472825;
        Sun, 19 Apr 2026 23:27:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 02/17] jq: patch CVE-2026-32316
Date: Mon, 20 Apr 2026 08:27:34 +0200
Message-ID: <20260420062750.3795917-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126466

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-32316

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jq/jq/CVE-2026-32316.patch                | 53 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       | 10 ++--
 2 files changed, 58 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
new file mode 100644
index 0000000000..1277b356d8
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-32316.patch
@@ -0,0 +1,53 @@
+From 321e62b356df2d4ed47aba4f3818e447ec4d77fc Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Thu, 12 Mar 2026 20:28:43 +0900
+Subject: [PATCH] Fix heap buffer overflow in `jvp_string_append` and
+ `jvp_string_copy_replace_bad`
+
+In `jvp_string_append`, the allocation size `(currlen + len) * 2` could
+overflow `uint32_t` when `currlen + len` exceeds `INT_MAX`, causing a small
+allocation followed by a large `memcpy`.
+
+In `jvp_string_copy_replace_bad`, the output buffer size calculation
+`length * 3 + 1` could overflow `uint32_t`, again resulting in a small
+allocation followed by a large write.
+
+Add overflow checks to both functions to return an error for strings
+that would exceed `INT_MAX` in length. Fixes CVE-2026-32316.
+
+CVE: CVE-2026-32316
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/e47e56d226519635768e6aab2f38f0ab037c09e5]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/jv.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index e4529a4..74be05a 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1114,7 +1114,12 @@ static jv jvp_string_copy_replace_bad(const char* data, uint32_t length) {
+   const char* end = data + length;
+   const char* i = data;
+ 
+-  uint32_t maxlength = length * 3 + 1; // worst case: all bad bytes, each becomes a 3-byte U+FFFD
++  // worst case: all bad bytes, each becomes a 3-byte U+FFFD
++  uint64_t maxlength = (uint64_t)length * 3 + 1;
++  if (maxlength >= INT_MAX) {
++    return jv_invalid_with_msg(jv_string("String too long"));
++  }
++
+   jvp_string* s = jvp_string_alloc(maxlength);
+   char* out = s->data;
+   int c = 0;
+@@ -1174,6 +1179,10 @@ static uint32_t jvp_string_remaining_space(jvp_string* s) {
+ static jv jvp_string_append(jv string, const char* data, uint32_t len) {
+   jvp_string* s = jvp_string_ptr(string);
+   uint32_t currlen = jvp_string_length(s);
++  if ((uint64_t)currlen + len >= INT_MAX) {
++    jv_free(string);
++    return jv_invalid_with_msg(jv_string("String too long"));
++  }
+ 
+   if (jvp_refcnt_unshared(string.u.ptr) &&
+       jvp_string_remaining_space(s) >= len) {
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 6eaa2de6df..71d7387bf8 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cf7fcb0a1def4a7ad62c028f7d0dca47"
 
 SRCREV = "4467af7068b1bcd7f882defff6e7ea674c5357f4"
 
-SRC_URI = " \
-    git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${PV} \
-    file://run-ptest \
-    file://0001-Support-building-with-disable-maintainer-mode-and-so.patch \
-"
+SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${PV} \
+           file://run-ptest \
+           file://0001-Support-building-with-disable-maintainer-mode-and-so.patch \
+           file://CVE-2026-32316.patch \
+           "
 
 inherit autotools ptest
 

