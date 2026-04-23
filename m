Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C9AF589BB
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:25 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18538.1776948559828701222
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IEURxt3h;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35691a231a7so4531830a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948559; x=1777553359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADczkm/XQ53pvagM37tymCrf2dmm6h61keyEJu9gfUE=;
        b=IEURxt3hyphrT/+h2Yh6zxVDWxldV00tVOslURH3JifAkn7070fNV1wXvRlqwo+BZp
         7QS/sk/9Ug966HLDeizOzCaxNvnb6xpT/VquOVWq1X1LbST4EybzQFezKXCq984Hgfql
         nLtCqSlUd2MyTs4gfW8QDuJfCXLno7TjR6VBFFkS7lM2xzStHbqSpS8N/EUIrJAkLiUu
         Hm3x1OKwxlTfNWBzCq4yJXdJHXlBCg6Wvn2S7agZumFfSlMk8Lk7GVru+GUvh55AUNHO
         HXqWZbHy0iBz6rwoDAoq1/5SsttAt2RKjYZ7UYRTjWFSRWVtroSlCRmXsYCkb3o1eAly
         GGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948559; x=1777553359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADczkm/XQ53pvagM37tymCrf2dmm6h61keyEJu9gfUE=;
        b=Dh9sKVQugHsJh4ZRSrub6XULJi+oRf/axScW05ygviWxCMit6yUWUTVPfpWCmftKwm
         9nUabJfJ7Xd9JkgjEBrLMM1jxjeYIlaRZDxbpXz2tQjWO4K817YtWAV0ymiL+fua5JgJ
         i4sR1Ul27L6shQEXGa/jW1AYNF3qeWk+DPp5GKoDyss1ma/XWLwQldR+Nw8ptWem1tfj
         QSWPA0JauTD8bLM9sUaIDn65ORCM49B5kJwVJ5YXKdgrL97l2LeRmc3Cb4OkgnD9Qvc0
         Tis8DgZnQW6CPisZvWHVEsLneVX3bO+EtkBOXhVgBhvBeVXWC3c0I9LNQe3QOJVCguNH
         ZN1w==
X-Gm-Message-State: AOJu0YzSFWSSWsunbhmzwAoWawxfu5CkvpGqWylpb6XsVDb+Vap0lfAL
	LssPv37gdKn+Z4U9xPY2bC7ZKgmLBTfbANrVr5xzAhLBotqyh0CSGxB9A4Pqxpd3
X-Gm-Gg: AeBDietDys7uHoAkg13Pj3aT8tNmgbELE7apYNc0+BevUaDxYr7L8vogozPaDORXYzo
	GTZfH4iVSCseLi6+vWKk5QguDSCdIRM0FK5oIfw0zqOu6HtttVBz0AEW4cfEAb7P6pWe0r5hRQV
	Kcxf6O5jfF5FU4ICYv5Oi4Tg8EjFAr2ISRuH5y/yI8Jx1xVBn3/J+CosEuqM46AFqybDRTqXUZ3
	DRjJQAfdzaHk0SzO3iKPHJGQjh7vd6V6hiAhSFaNPXUB2lX40lCwvka8MoJRYOcRz9USRG2gPZx
	ot3wvYWRPVLtDtT3BhaS6RZIcCLOM59wWqCUSltHD+mKpoUzNvnLYHmVgx7heCYsduAx0kwIEj2
	J5HYrmEARtP3K2goGXgEsOS/mX5fPwB0qmFDmm7Ip5qqbx3+b55MbBWg+NdJ+bjFQHj3WgzsM1g
	p2EYqM9BJnX0hsBcmLTDTsip4Vjfc4VD56Kr3o4SBWWxKGFaI=
X-Received: by 2002:a17:90b:55cf:b0:35d:9c43:57fe with SMTP id 98e67ed59e1d1-3614046583dmr27728698a91.13.1776948558954;
        Thu, 23 Apr 2026 05:49:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 7/19] libcoap: patch CVE-2026-29013
Date: Fri, 24 Apr 2026 00:48:05 +1200
Message-ID: <20260423124823.1983261-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126583

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-29013

Debian[1] also identified this as a fix.
[1] https://security-tracker.debian.org/tracker/CVE-2026-29013

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libcoap/libcoap/CVE-2026-29013.patch      | 86 +++++++++++++++++++
 .../libcoap/libcoap_4.3.5a.bb                 |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/CVE-2026-29013.patch

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2026-29013.patch b/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2026-29013.patch
new file mode 100644
index 0000000000..87d4016af9
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2026-29013.patch
@@ -0,0 +1,86 @@
+From 9e830709e98b0213c8806157ccae13df9d3fed74 Mon Sep 17 00:00:00 2001
+From: Jon Shallow <supjps-libcoap@jpshallow.com>
+Date: Tue, 24 Mar 2026 14:15:09 +0000
+Subject: [PATCH] sanitizer: Fix reported issues
+
+coap_new_cache_entry() does not correctly check for no PDU data when called
+with COAP_CACHE_RECORD_PDU. No current libcoap code (examples and library)
+call coap_new_cache_entry() with COAP_CACHE_RECORD_PDU set.
+
+Internal function coap_pdu_resize() can be used to reduce a PDU size,
+creating current options confusion.  Fix is not to reduce PDU if new
+size is smaller than the current used size. No current libcoap code calls
+coap_pdu_resize() to reduce the size.
+
+If there is an issue with the PDU options where the maximum used option
+value is larger than the last defined option value, an assert() is triggered.
+
+All of the coap_*_option() functions correctly manage pdu->max_opt, but
+this issue could occur if coap_pdu_resize() was called to reduce the PDU size
+below that of pdu->used_size.
+
+(cherry picked from commit b7847c4dbb0dbee7c90b09a673d4cae256f03718)
+
+CVE: CVE-2026-29013
+Upstream-Status: Backport [https://github.com/obgm/libcoap/commit/b7847c4dbb0dbee7c90b09a673d4cae256f03718]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/coap_cache.c |  3 ++-
+ src/coap_pdu.c   | 11 +++++++++--
+ 2 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/src/coap_cache.c b/src/coap_cache.c
+index 16931f56..e018604d 100644
+--- a/src/coap_cache.c
++++ b/src/coap_cache.c
+@@ -203,7 +203,8 @@ coap_new_cache_entry_lkd(coap_session_t *session, const coap_pdu_t *pdu,
+       memcpy(entry->pdu, pdu, offsetof(coap_pdu_t, token));
+       memcpy(entry->pdu->token, pdu->token, pdu->used_size);
+       /* And adjust all the pointers etc. */
+-      entry->pdu->data = entry->pdu->token + (pdu->data - pdu->token);
++      if (pdu->data)
++        entry->pdu->data = entry->pdu->token + (pdu->data - pdu->token);
+     }
+   }
+   entry->cache_key = coap_cache_derive_key(session, pdu, session_based);
+diff --git a/src/coap_pdu.c b/src/coap_pdu.c
+index 9394e6fe..2e06ccbc 100644
+--- a/src/coap_pdu.c
++++ b/src/coap_pdu.c
+@@ -280,10 +280,12 @@ fail:
+ int
+ coap_pdu_resize(coap_pdu_t *pdu, size_t new_size) {
+   if (new_size > pdu->alloc_size) {
++    /* Expanding the PDU usage */
+ #if !defined(WITH_LWIP)
+     uint8_t *new_hdr;
+     size_t offset;
+ #endif
++
+     if (pdu->max_size && new_size > pdu->max_size) {
+       coap_log_warn("coap_pdu_resize: pdu too big\n");
+       return 0;
+@@ -314,8 +316,8 @@ coap_pdu_resize(coap_pdu_t *pdu, size_t new_size) {
+     else
+       pdu->actual_token.s = &pdu->token[2];
+ #endif
++    pdu->alloc_size = new_size;
+   }
+-  pdu->alloc_size = new_size;
+   return 1;
+ }
+ 
+@@ -629,7 +631,12 @@ coap_insert_option(coap_pdu_t *pdu, coap_option_num_t number, size_t len,
+     }
+     prev_number = opt_iter.number;
+   }
+-  assert(option != NULL);
++  if (option == NULL) {
++    /* Code is broken somewhere */
++    coap_log_warn("coap_insert_option: Broken max_opt\n");
++    return 0;
++  }
++
+   /* size of option inc header to insert */
+   shift = coap_opt_encode_size(number - prev_number, len);
+ 
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
index 611795e17d..eaece6f1f0 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=05d17535846895e23ea4c79b16a9e904"
 
 SRC_URI = "git://github.com/obgm/libcoap.git;branch=release-4.3.5-patches;protocol=https;tag=v${PV} \
            file://run-ptest \
+           file://CVE-2026-29013.patch \
            "
 SRCREV = "e3fdcdcfbd1588754fe9dd4b754ac9397260f0f9"
 

