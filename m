Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2671EF589B6
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:48:55 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18524.1776948532359787802
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VIcg7BCV;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b23fcf90b2so63439615ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948531; x=1777553331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsZb8JOM11D3/bziILA8/RlDEPZr+Npjm7b/3KXQ7Yw=;
        b=VIcg7BCVMCn4eQkZ46kRxTFMmPDCAyhXXaJ+YZwDxpw+xaXeEPWSw+08vvSDLcoAgE
         jnbFSMKItNl5CoATX9rmBJ2cFtQX+eiVRCpylDgeNFOK4uh7pfDeY6m3e36PQK/XOirg
         Rg72y+ZlnuMYh34mq9qPkxY+GrkI+sa/pdzvLlAEWBUwUYT78aMz02yvTrb/A5RCYM8z
         SHT2wicPvkM5M/90GPLWPPhRLcShUQK1M2F4IoEOUvS7qrCIbFk6OPcOtgddPLNCiGwB
         zoBUIT4onsgKDICS4cKWFTJ2h4QasJvO1E3CfO48MWEhlGr9Ibb4ZNY8KLsM/JY6UExa
         Z52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948531; x=1777553331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsZb8JOM11D3/bziILA8/RlDEPZr+Npjm7b/3KXQ7Yw=;
        b=Wc8Bpc53GmkOdfOG9frk+hbP+e2CP+EL4YjylLiTDGe58qPXdbWZII7xKqy8y/fzCx
         WdkfShev9bYGgSPbH3yVIf96cK9cQDi1zyIPwAzvHmOOX8FC0wZAldGFRRmqrGKdMVa7
         4il7WnkCUhnLUP4Og7/q47GcfRW9bmSQmxjl3GhhvFL8xJCcTsJK8urjeqiJ4U3+msyw
         wwMa1LiqWui1jfJ7Y526VODOWWf1C68LTUCMfaSFAZ3Xh8I3J3ZWjBgmiYTuKZIK+++3
         e0/zZn2uPwlUGAWbqxShox9XLgn3t7Kt1Tfjkcr2DWT/OG42dIjv1/kXNCOreAzLh/0j
         wqNw==
X-Gm-Message-State: AOJu0YzNDXJ6cbgpsQRIiWUb1RuvQF5JaAZ3b2LiPE/Z87KXsUcw8dLE
	A378SfNf49xhMkhN5kO+hKXqq7vwqlzEYEl44eY2e5GNKeJWvCuM1wznAOI2ehvq
X-Gm-Gg: AeBDietES/h77wwy5Q9H3VpgbGDNDeTtbIB3h9AckqFDLxTxLk96q6zG9h+xDXqT4sH
	kpFIX9xX7nN49G+1ccPeM0kt+dATNcj++ksKKpB1aEESGFzI6XxMQJnnj3ki500fTjZL3BsDMrD
	h5mC9XASDu7w2MXntzqjHfMYjx4VbCOmcNa7ZDB4TraLOuhGPVifSc09SjZ74sjHyT5QmOotIhi
	z0gUPhIlh7sy85ruzAdgcl8sWdCim3YuBseB2LpI+9EMqf+w3tahwMHh7zM7rTC9A64TQIxFqew
	zOM9sFPOqnb2kHbmn2WvleZaG066rcO70dZ/JfRmHBnk1tG6N5du4NMiZI3pOYYR6/zxjWinjP3
	WS4MO+CzXhE8vJ3n9lLoAsAkmfKBZbB0pzT7iPtmUF88quh+DiK3bGAPjPDIn7evOMLZ4H6bTuU
	Y0x42QEtAFPf4G2whgCTpGvCph2JJliSV8K4muWEn7HeiMXg0=
X-Received: by 2002:a17:902:7585:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2b5f9f61d74mr175970195ad.35.1776948531403;
        Thu, 23 Apr 2026 05:48:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:48:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 2/19] jq: patch CVE-2026-32316
Date: Fri, 24 Apr 2026 00:48:00 +1200
Message-ID: <20260423124823.1983261-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126578

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-32316

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit e94ab85126f12d77253107084dc8463c79b3e776)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
 

