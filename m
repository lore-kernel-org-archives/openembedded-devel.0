Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB57EFF8863
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 13:04:22 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18288.1777208652812611818
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 06:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ajzq/gxM;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ad21f437eeso59965635ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 06:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208652; x=1777813452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/N4GNV4PB5HHHryVU6X5g6aj8jsxfPwDfFv5enQ38YE=;
        b=ajzq/gxMqD9RS0AZbI//S2qObM7huoI+hDOX+liinsbUytZllqrPsf0LJsNka3CDgn
         KZ33IgWJQoZ//vj83yZXvV1gboZOORNiTsfd3sdG2K0629oAbGJ7GFAIux3yzgFUgynX
         qfreOOf8whXkxaIvfXD3WT6S2cWkLyCnGGb2V0CTuSQ2WFWpw3tjkMFe+q7ZV91sBS0H
         e1k6wNnBdSByXAUTUA02YvNBRIPNhbM6lYalGng/7PBah5bQRh9GWmIaO5cAPeBYvmwN
         pMsVGTx9pzdceyHBcM1LzLGLBlUGwCCPdlot82DtmNofY1z0hxQblrctUI7yOHA8RJFJ
         GRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208652; x=1777813452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/N4GNV4PB5HHHryVU6X5g6aj8jsxfPwDfFv5enQ38YE=;
        b=TTUaKi521DGAQQq0JoQKw5BWLqvwxLOgiCK1stZdnvlI2u3f2ZkFVJTeQXzb91E33D
         EXZcioJpFjF+Dc8UFGqGKOrbsLnjMVleJPl1rwqF1zRjOpUTIHr/sKwsJehQHbLoxbKp
         1Q3kSRtxriHX9TC0eSVJAwTmtPZp0dbHYagIXeCzifU0Y5GmRo/jnl7coRT+/Knb2veM
         xaVG3BYwYC1v9rwkl+hWV81j8sPSeGcZDWZkhawa8srR1KZLhofbRO1mtn7bpx84lZfT
         JhSUTy4P5LzLhEuNOYnQTJSuHEuai8fQ1kgTgW6f0/K7Ou2keFCqTebOZkRjvJIGsHug
         vTnA==
X-Gm-Message-State: AOJu0YxF3b9PDbG6f0sYX8+L1jBAPCfjU4Zn3faV5aNR9Aph5PBO8fKa
	8UJhn9PNF4+zb6pPoCgWy69cC34Lbk/mkgSJwjlRbTqvBh3f7jXOqB9snIqqHx21
X-Gm-Gg: AeBDievhkiKPSW7qDUEyTsoIR2D9Mwyggok7xEU+Qx0le2tBE3fIJnwOevkcpes9vDx
	4BZcxDVMHhvQBedvLAFx+0fiC1pjldLnwaaxVHlPg9EZrjgL1oqFjepfYCSAa7pzHVUyI397Kha
	fYtvfv6Kc/wXaP4+hqrvB34v1RJmdCxTqhaB99wbuYBxLhyf/Y4hd8NQWTVt/pdi2zc90nf4Dn9
	QbKdm5add+G1LQEt2JtfLVUR86/5mBr/qzyyQs/EUbK30zwjZLTV6xorU9RETELz2QQO2bHFyet
	64XqhhMNen4PIAfy/R0jaYFne+FnRusdRU7yCB3AeejW+jiRDLqGpkuckzD6/UIUjPDOqqauC2Y
	UhJmmJfu7j85XcysIvER/8+ok2S3ir+ljuT5Vox6tqvUCELToWcbR82nrd2KbuV2vufa3V50aBW
	WMmTCnwAuHLsuIAuH8vwRVgRlSgn6rNQF47kWy2feEc50efqQKXBCuXGBTLA==
X-Received: by 2002:a17:902:7b8f:b0:2ae:4ad5:b76c with SMTP id d9443c01a7336-2b5f9e5ec75mr225831075ad.10.1777208651944;
        Sun, 26 Apr 2026 06:04:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm277490935ad.3.2026.04.26.06.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:04:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 4/9] jq: patch CVE-2026-39979
Date: Mon, 27 Apr 2026 01:03:46 +1200
Message-ID: <20260426130351.793052-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
References: <20260426130351.793052-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 13:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126620

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-39979

Ptests passed:
root@qemux86:~# ptest-runner jq
START: ptest-runner
2026-04-26T11:09
BEGIN: /usr/lib/jq/ptest
PASS: optionaltest
PASS: mantest
PASS: jqtest
PASS: onigtest
PASS: shtest
PASS: utf8test
PASS: base64test
=== Test Summary ===
TOTAL: 7
PASSED: 7
FAILED: 0
SKIPPED: 0
DURATION: 44
END: /usr/lib/jq/ptest
2026-04-26T11:10
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jq/jq/CVE-2026-39979.patch                | 32 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
new file mode 100644
index 0000000000..7ab7e6fcdf
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-39979.patch
@@ -0,0 +1,32 @@
+From 46fac767d5007849b9a63cae2e74c0fc7afaa093 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 11:04:52 +0900
+Subject: [PATCH] Fix out-of-bounds read in jv_parse_sized()
+
+This fixes CVE-2026-39979.
+
+Co-authored-by: Mattias Wadman <mattias.wadman@gmail.com>
+(cherry picked from commit 2f09060afab23fe9390cce7cb860b10416e1bf5f)
+
+CVE: CVE-2026-39979
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/2f09060afab23fe9390cce7cb860b10416e1bf5f]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/jv_parse.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/jv_parse.c b/src/jv_parse.c
+index 9755b8a..84a847f 100644
+--- a/src/jv_parse.c
++++ b/src/jv_parse.c
+@@ -890,8 +890,9 @@ jv jv_parse_sized_custom_flags(const char* string, int length, int flags) {
+ 
+   if (!jv_is_valid(value) && jv_invalid_has_msg(jv_copy(value))) {
+     jv msg = jv_invalid_get_msg(value);
+-    value = jv_invalid_with_msg(jv_string_fmt("%s (while parsing '%s')",
++    value = jv_invalid_with_msg(jv_string_fmt("%s (while parsing '%.*s')",
+                                               jv_string_value(msg),
++                                              length,
+                                               string));
+     jv_free(msg);
+   }
diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 975d7d7007..24f49bcb13 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://CVE-2026-32316.patch \
     file://CVE-2026-33947.patch \
     file://CVE-2026-33948.patch \
+    file://CVE-2026-39979.patch \
     "
 SRC_URI[sha256sum] = "478c9ca129fd2e3443fe27314b455e211e0d8c60bc8ff7df703873deeee580c2"
 

