Return-Path: <nelson831002@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885CBCD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 16:21:00 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14339.1780071659389818106
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2026 09:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qvwpsg2d;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: nelson831002@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-57754ec3462so9283617e0c.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 09:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780071658; x=1780676458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kbojq+B1H53Zg4MifM/WVDbA13EEP1R5k2IwLLmrusY=;
        b=qvwpsg2d3im+g1ZU0eoYxfW+Se4R/kNAoKKyoErsaCKjyTwRO+hi7ZOdmcntbtC2n2
         KfYum3cmUStIi7xpF5qozevvBTgt+oAJBniXaLck1VbxOLho4W0Y7QIbJH16dfdhVmzv
         6CHxIDG+7eajMVQIXkFLfcy9PdrylBYQ98VG1Qb3K4jpjMzvZka0cuhJUl/ZDp6ZC5NE
         j7S5qRs7lLASZcMhXve5r6EzBkOeBN18NId7cs/JPvgY3amv3jRxA38Hf5ABo0Vz5o4J
         QwexaJpJATtUX0EFtsEibBuo+K70UFghEvGNzERABHvpaAbN1tf+DtmXqby7JrFOZGSX
         Z27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780071658; x=1780676458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kbojq+B1H53Zg4MifM/WVDbA13EEP1R5k2IwLLmrusY=;
        b=XW9wayA73o1E8y/YMK1TrJO/VlvL97JFJKvbVehbE55Opx4ljEsvFH9GcKhNPEV4Wp
         gnHUejxvx6RLYk+CW0lKDRAuph5RS5r+MD3cdHCWlQ8WXVPteI0n9hhVBcjMSk3Pd1qH
         znzTWGDvRjrcb1Ac5aEsDeKx27MLRhPCQ1BT+1ZvW+hAWW4i0pPopMOpNCrbgJFg/RsB
         H9viOImeUB2008yL9/0KPyqpSYUEVBlPyvnTByZSNp1+aAdgMu6bUeY5PlXJeaerUltG
         7zpD8FKBQcM1H7xMVBzq8skbNrN+P0xjFMdJn7atNFlVqaxK+qoaHRxKSqKH7cn7xB1m
         Cptg==
X-Gm-Message-State: AOJu0YzwdHeEFuumsToYD8A9Lyp7aeL5M8NBaVwE++sMfGnwyJnSpH5V
	AuqJyk9iiR6KaGoTHuJEICTyomVYBuXAwQ1fKkOykxjCYB1oHok0oqmnceK0V2Rr
X-Gm-Gg: Acq92OGzKiJ4GeWB0ZqIw4e+7PveJTbCVOzwn2VpDoRh8Z1DIMa5JHeCzeI6kT4JFBd
	aG3Cyj9ynCiO8YKig8E9w3AdnkBeaKkJtE4nMk0W8yfmu/6yjX301/bx0yJhReldWtC+RqvJDAy
	3VQpIhQme5XVtTe1S/c+vrVi/nqLL23/bsd8Ygr2YOSI087Wc5LvKw6xdlBGHd9vyhdVdOdko+A
	kv/2NRZ4pbNiuYU0Xg6PajauOD+MIpfFvKgitVuFp5BdPMSqYMLN7o+aTY1JweJR3e09/OrKJFF
	f4LJyteVHTGfNb2cvlLMuBI29w3RWGL88x+EpiZPDszkYB/t9ixoPpe04k2bBKdEIgh62N/WMv/
	WVlRr9CUoJIM6ccGfQcmp5pm4kDaCVU3tFs7TfcO7VbERcP/qy4UO9KqarFW9HYHTaRkmNiurTu
	VKSpx3BxhlTTV2PllwW4d8a/Nrx17u9Z5X6AwP5Qa1wSfQVJHrn6zUnB5dqA==
X-Received: by 2002:a05:6214:5c42:b0:8cc:d588:4518 with SMTP id 6a1803df08f44-8ccefd3360cmr5687876d6.7.1780071220339;
        Fri, 29 May 2026 09:13:40 -0700 (PDT)
Received: from NGRODRIGUEZ03.genetec.com ([134.238.145.167])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea216beesm19304256d6.39.2026.05.29.09.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 09:13:39 -0700 (PDT)
From: Nelson Garcia <nelson831002@gmail.com>
X-Google-Original-From: Nelson Garcia <ngrodriguez@genetec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nelson Garcia <ngrodriguez@genetec.com>,
	Nelson Garcia <nelson831002@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] nginx: backport fix for CVE-2026-9256
Date: Fri, 29 May 2026 12:13:32 -0400
Message-ID: <20260529161332.2176858-2-ngrodriguez@genetec.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529161332.2176858-1-ngrodriguez@genetec.com>
References: <20260529161332.2176858-1-ngrodriguez@genetec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 16:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127289

A heap memory buffer overflow might occur in a worker process when
using a configuration with overlapping captures in
ngx_http_rewrite_module, potentially resulting in arbitrary code
execution.

The buffer length calculation for static-length rewrite replacements
incorrectly used r->uri.data/r->uri.len for escape-size accounting
across all captures instead of the actual per-capture offsets into
r->captures_data.  This allowed overlapping captures to exceed the
allocated buffer.

Fix by iterating captures using the captures[] offsets into
captures_data rather than the full URI string.

Upstream-Status: Backport [https://github.com/nginx/nginx/commit/3f135ae2eb60ce376196c898a6c7cb4d774f7068]
CVE: CVE-2026-9256
Signed-off-by: Nelson Garcia <nelson831002@gmail.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-9256.patch    | 63 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-9256.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-9256.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-9256.patch
new file mode 100644
index 0000000000..996e845454
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-9256.patch
@@ -0,0 +1,63 @@
+From 3f135ae2eb60ce376196c898a6c7cb4d774f7068 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Thu, 22 May 2026 00:00:00 +0400
+Subject: [PATCH] Rewrite: fix buffer overflow with overlapping captures.
+
+A heap memory buffer overflow might occur in a worker process when using a
+configuration with overlapping captures in ngx_http_rewrite_module,
+potentially resulting in arbitrary code execution.
+
+When calculating the buffer length for a rewrite replacement with static
+length (code->lengths == NULL), the code incorrectly used r->uri.data and
+r->uri.len for the escape size calculation across all captures, instead of
+using the actual capture offsets into the captures data.  This could allow
+overlapping captures to cause a heap buffer overflow.
+
+Reported by Mufeed VH of Winfunc Research.
+
+CVE: CVE-2026-9256
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/3f135ae2eb60ce376196c898a6c7cb4d774f7068]
+Signed-off-by: Roman Arutyunyan <arut@nginx.com>
+---
+ src/http/ngx_http_script.c | 20 +++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/src/http/ngx_http_script.c b/src/http/ngx_http_script.c
+--- a/src/http/ngx_http_script.c
++++ b/src/http/ngx_http_script.c
+@@ -1037,6 +1037,8 @@ ngx_http_script_start_args_code(ngx_http_script_engine_t *e)
+ void
+ ngx_http_script_regex_start_code(ngx_http_script_engine_t *e)
+ {
++    int                           *cap;
++    u_char                        *p;
+     size_t                         len;
+     ngx_int_t                      rc;
+     ngx_uint_t                     n;
+@@ -1143,15 +1145,19 @@ ngx_http_script_regex_start_code(ngx_http_script_engine_t *e)
+     if (code->lengths == NULL) {
+         e->buf.len = code->size;
+ 
+-        if (code->uri) {
+-            if (r->ncaptures && (r->quoted_uri || r->plus_in_uri)) {
+-                e->buf.len += 2 * ngx_escape_uri(NULL, r->uri.data, r->uri.len,
+-                                                 NGX_ESCAPE_ARGS);
+-            }
+-        }
++        cap = r->captures;
++        p = r->captures_data;
+ 
+         for (n = 2; n < r->ncaptures; n += 2) {
+-            e->buf.len += r->captures[n + 1] - r->captures[n];
++            e->buf.len += cap[n + 1] - cap[n];
++
++            if (code->uri) {
++                if (r->quoted_uri || r->plus_in_uri) {
++                    e->buf.len += 2 * ngx_escape_uri(NULL, &p[cap[n]],
++                                                     cap[n + 1] - cap[n],
++                                                     NGX_ESCAPE_ARGS);
++                }
++            }
+         }
+ 
+     } else {
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index c1f277517f..d736307f1a 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -10,6 +10,7 @@ SRC_URI:append = " \
                   file://CVE-2026-28753.patch \
                   file://CVE-2026-32647.patch \
                   file://CVE-2026-42945.patch \
+                  file://CVE-2026-9256.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-- 
2.43.0


