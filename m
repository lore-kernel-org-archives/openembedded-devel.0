Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA30E75423
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 07:49:59 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116910.1766562591079698441
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 23:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HPw3i1AV;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b80fed1505so6037987b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 23:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766562590; x=1767167390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwe4bFRpQ+pGJWCmHXDz3DtyyGFS4HKo9mhHLAKgofQ=;
        b=HPw3i1AV59oOcJMu2x03Q8jGuneIPEXBEoXWH4qIRmfNzbotGkRWNPafeaIkYFmpit
         vZyTSebJEAWSokgH9rRpBrKovjTizcWDniydQDdeLtpOdj8j29Y1w7XgjW+0Wc862eKi
         rup+rolOI5nNltr+BtsB6cuDWVqsy4PuZfp3+CodDyYD7ZMB3BgPHv6aDaRREdDqF6i6
         4j9/VmOiT39B+M5X3nL+RvQWV7BvQdcZxsThAO1MIPKL+lox/Gd9GbcbE6UEzTHFeEqY
         +mrpU18qHpFPLzGj3ATCGFUCRosrx6FaCexBZ0AjBfJZRpEFet7lYb8Jxn/BGWWSpvu6
         TRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766562590; x=1767167390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gwe4bFRpQ+pGJWCmHXDz3DtyyGFS4HKo9mhHLAKgofQ=;
        b=MU4wlf5yx09qE0fEyfxVHMLYvymVMXu/T6lMFAFRK+LbdncpmkPVLFfazRgRNynbpL
         /fdzrxe5BbxVj9f0bA+Ou8LJRa167Fa1O0H8rj1XYl70rh7u503s0GZWl2iNFeyJmsCJ
         MuJurDdZ1FtudqxGd9K/bAa/oe0eb/BEC2qGkd8tFTgJ+A0YnlWA3YXDO81Qn1B9P2k2
         Jo2SwaKoIgYllXD12YR/hls6IsYm/8i9coAkjrumw2UDN9ALia4uvtBtKjK8kfola7QL
         pxr9ixJmngBfx+hq/agP9Ic3a/pTR6JENGEN52fMgSvLRR9mpiuv0/s++yiD/3O0e7Qa
         RsUQ==
X-Gm-Message-State: AOJu0YzyJ5m7qjkW5lj8DfqlifrQdHwfsufeIV2LaW1MpXk4zvoP7s0v
	6BUCLulVPAYepfUVoxhdoeST4dnetMUbnct0jcZA3yGB6DlbPT8UoyUrdX3Kig==
X-Gm-Gg: AY/fxX6vHTTU9Bk07XPnjveYm5g43QBnA2v+KuLaWgzVkGmnz43fRY50sUCgU3tI7B6
	+Y3XkzLIiCCaOCQvwsHDCIiSkO3PygEk+JDIS3VITuHaYGYr9ivqNEnIDyhK+xYp8DsweR2AymX
	AB/KjTanp1D1wfxtyFAGNDSODyvsthnYBea+BeIazr1SMGN6deRchUT1JZVFeKz902/xhDV24eu
	GgDtEO61mR+wI5ptGbIooDjhUZej74nzSFh9tcd/t7M2DoxzLbtN+XjOb6qiknqC6qAzDc5Z0xP
	Hcbgfclvt8n3i2AV9c5biwTcMtqdM5qUd4s5QGf/CbehQEqxvlzDoMAAatAG7IJDNGUzwGrNNZk
	vDvT57rSm2F945LEweU2fCcSVeZ2s217Uu5GxCbL1/JF6n5v9Hx4TjKB54p66M+qfJZAScktguJ
	Jd58kRo5iMWgsKRaA/mtzn93Vk96NPtLXUnug=
X-Google-Smtp-Source: AGHT+IGAB0lowC65jy4zeXF0L4E51P9XIBzWHrkTJcbCxSwZ+BMZK1UE8hzcdXCynIaMiGHBHrwkFQ==
X-Received: by 2002:a05:6a20:430f:b0:364:131c:40dd with SMTP id adf61e73a8af0-376aa1f7e2fmr18655654637.37.1766562590273;
        Tue, 23 Dec 2025 23:49:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7ca0b587sm13847084a12.33.2025.12.23.23.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 23:49:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 6/6] libcoap: patch CVE-2025-59391
Date: Wed, 24 Dec 2025 13:19:32 +0530
Message-ID: <20251224074932.1379914-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224074932.1379914-1-ankur.tyagi85@gmail.com>
References: <20251224074932.1379914-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 07:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122850

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-59391

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libcoap/libcoap/CVE-2025-59391.patch      | 88 +++++++++++++++++++
 .../recipes-devtools/libcoap/libcoap_4.3.4.bb |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/CVE-2025-59391.patch

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2025-59391.patch b/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2025-59391.patch
new file mode 100644
index 0000000000..7136481b05
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2025-59391.patch
@@ -0,0 +1,88 @@
+From 947bead23940cacf081f93c3e29f540e3e867b7b Mon Sep 17 00:00:00 2001
+From: Jon Shallow <supjps-libcoap@jpshallow.com>
+Date: Thu, 4 Sep 2025 13:26:06 +0100
+Subject: [PATCH] OSCORE: Fix OSCORE configuration file parsing issue
+
+With a large boolean parameter value, (longer than "false"), memory
+would be read past the "true" or "false" string boundaries in the ".rodata"
+section when doing a memcmp(), potetially causing the application to crash
+when calling coap_new_oscore_conf() with a specially crafted configuration
+file.
+
+It also can provide a mechanism to determine the byte values following the
+"true" or "false" string boundaries which could lead to accessing sensitive
+information. The standard libcoap library does not have defined keys or
+certificates. This can only be done by a specially crafted local application.
+
+Discovered by SecMate (https://secmate.dev).
+
+Now fixed.
+
+CVE: CVE-2025-59391
+Upstream-Status: Backport [https://github.com/obgm/libcoap/commit/da534de75edd1b3628a28908d30b0efbaa01be09]
+(cherry picked from commit da534de75edd1b3628a28908d30b0efbaa01be09)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/coap_oscore.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/src/coap_oscore.c b/src/coap_oscore.c
+index 2d7dd6d0..723b5ef5 100644
+--- a/src/coap_oscore.c
++++ b/src/coap_oscore.c
+@@ -1675,6 +1675,7 @@ get_split_entry(const char **start,
+   const char *kend;
+   const char *split;
+   size_t i;
++  size_t len;
+ 
+ retry:
+   kend = end = memchr(begin, '\n', size);
+@@ -1751,9 +1752,10 @@ retry:
+     value->u.value_str.length = end - begin;
+     break;
+   case COAP_ENC_BOOL:
+-    if (memcmp("true", begin, end - begin) == 0)
++    len = (size_t)(end - begin);
++    if (len == 4 && memcmp("true", begin, len) == 0)
+       value->u.value_int = 1;
+-    else if (memcmp("false", begin, end - begin) == 0)
++    else if (len == 5 && memcmp("false", begin, len) == 0)
+       value->u.value_int = 0;
+     else
+       goto bad_entry;
+@@ -1768,7 +1770,7 @@ bad_entry:
+   coap_log_warn("oscore_conf: Unrecognized configuration entry '%.*s'\n",
+                 (int)(end - begin),
+                 begin);
+-  return 0;
++  return -1;
+ }
+ 
+ #undef CONFIG_ENTRY
+@@ -1840,6 +1842,7 @@ coap_parse_oscore_conf_mem(coap_str_const_t conf_mem) {
+   coap_str_const_t keyword;
+   oscore_value_t value;
+   coap_oscore_conf_t *oscore_conf;
++  int split_ok = -1;
+ 
+   oscore_conf = coap_malloc_type(COAP_STRING, sizeof(coap_oscore_conf_t));
+   if (oscore_conf == NULL)
+@@ -1858,7 +1861,7 @@ coap_parse_oscore_conf_mem(coap_str_const_t conf_mem) {
+   oscore_conf->break_recipient_key = 0;
+ 
+   while (end > start &&
+-         get_split_entry(&start, end - start, &keyword, &value)) {
++         (split_ok = get_split_entry(&start, end - start, &keyword, &value)) > 0) {
+     size_t i;
+     size_t j;
+ 
+@@ -1944,6 +1947,8 @@ coap_parse_oscore_conf_mem(coap_str_const_t conf_mem) {
+       goto error;
+     }
+   }
++  if (split_ok == -1)
++    goto error;
+   if (!oscore_conf->master_secret) {
+     coap_log_warn("oscore_conf: master_secret not defined\n");
+     goto error;
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
index 9c45cd248e..da0cf50f92 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
            file://run-ptest \
            file://CVE-2024-0962.patch \
            file://CVE-2024-31031.patch \
+           file://CVE-2025-59391.patch \
            "
 SRCREV = "5fd2f89ef068214130e5d60b7087ef48711fa615"
 

