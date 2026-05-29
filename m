Return-Path: <nelson831002@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5203FCD6E49
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 16:21:20 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14342.1780071678209114895
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2026 09:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C4+UjRQa;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: nelson831002@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8cceaa6f75bso9238336d6.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780071677; x=1780676477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vT/FgYLHp9NCqCixcNP7zuI0cybBd0dLmdqvvIToDH8=;
        b=C4+UjRQa/hukvjfr705Jlf1NCO0GkhXqNuv+HwO1fgG1WO/5K9tZsengCT/cWqq9PU
         IT3bHBQj2T1GJp4nNoS/SfRlQ3fWk/C3lfdytA8NrDThEvmmzSgdNMtH5IZnXRthptQd
         LenpAFGqeKXrCj+zP/eFIO6rJ34nYJ3uzdCVfoLPE7frEnWBYhmmDfdeBSe7/oDOrnoy
         h2kU1U75FBudGje1lCNPHAiL9b51O6lTfbrQdlgQnD3gGhQ67SB6PAjkCCHD2oumd25v
         l4LuG7GstIdIBKU4Eis1SawTn8yycDD7/2QSmw/COUKEWvSZGNNqBDTNT1wOThwKyfFk
         61Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780071677; x=1780676477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vT/FgYLHp9NCqCixcNP7zuI0cybBd0dLmdqvvIToDH8=;
        b=HnTcGTgUowIZLMXEaeLwoc97/CVgrI773sRxgPss6Be2RA/TLFSHoCmhTimOpRfPul
         5cx48FWz/kIFpCvBNW6Q+gRyIcA1Nr0yL8C2n4qAOkvwoj+U+3jZebXSRQWKTnYkM3C6
         NYGjn7ZjlP1XjNs1q3SjO+IyMx5C65lR0XRqgWaTPd9mMV0xy77XNwRQE1LEewj0kRnl
         PpwFcKzrT7J/kveNN1vXHerg7Rfrv0XGKBBpp+VspF6wkCxUKFMapnudvpJAz/cHE6vs
         57ygXaJcCexsZnwC3qTMKeTecAKlBEoqWUfG0WwThDW+oI/yFoDNWEHIW4SE8PoeLjLg
         7Few==
X-Gm-Message-State: AOJu0YymSMRXyVgByl2uiju/w4vGmxSTMydxEceafRbjcuxqIGtzZdSw
	wqA5G3MbjknXt4sREF0N7QBAFDNXKWPW2+R4rYpNcGpRhgXcAEneCXLtGrPD1KrS
X-Gm-Gg: Acq92OGDh3uVmWonP5TVTdWtKHZccdKu/HIFj0qm+RQaelVKPYs+NiBsL80m405yIN1
	L47jQ1QuQn+HHRu6XraCojdKkojLdlyR/YKEod3kaIYEuaGZABEWel39penQ7iS2jiDrtCAcECu
	yz2UufYrKlTwkISL2gSk6EEksW1/lbRbTGaqx4s6niBeNyciqTKh/S7/7O7lvtptmiWA9GJ4zpg
	xv13g9+36KHHAiPlH0LDy6+wmuoifFv6CkevBVJr4HkbGEThp8pekQuPBJrUaoLJBdPw53X1ard
	ARwAQsprcM4vILb1sSwnVjA4QxhYldZd7/NV9BSfN1dtLmMc0QSxDSfc2Y6re8JKA32MCXpZRjJ
	rX50LEj1DTD1YLi6lsd24fv4mqzMUo9nZUeQHhE9+hzYBGuOnTr+EdAmuseD3GXYo79vgwaIjHv
	mwRA5/7LPcj3DiB0w786ShbPVBddN99gWb7cxZmCRNN+Dy44cgXWgc/T2B6g==
X-Received: by 2002:a05:6214:5002:b0:89c:5b90:3d80 with SMTP id 6a1803df08f44-8ccefdac13amr5389316d6.34.1780071216385;
        Fri, 29 May 2026 09:13:36 -0700 (PDT)
Received: from NGRODRIGUEZ03.genetec.com ([134.238.145.167])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea216beesm19304256d6.39.2026.05.29.09.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 09:13:35 -0700 (PDT)
From: Nelson Garcia <nelson831002@gmail.com>
X-Google-Original-From: Nelson Garcia <ngrodriguez@genetec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nelson Garcia <ngrodriguez@genetec.com>,
	Nelson Garcia <nelson831002@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] nginx: backport fix for CVE-2026-42945
Date: Fri, 29 May 2026 12:13:31 -0400
Message-ID: <20260529161332.2176858-1-ngrodriguez@genetec.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 16:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127290

A heap memory buffer overflow might occur in a worker process while
handling a specially crafted request by ngx_http_rewrite_module,
potentially resulting in arbitrary code execution.

The is_args flag was set when a rewrite replacement contained query
arguments but was never cleared, causing incorrect URI escaping and
a buffer overrun in subsequent set/if captures.

Fix by resetting e->is_args in ngx_http_script_regex_end_code().

Upstream-Status: Backport [https://github.com/nginx/nginx/commit/524977e7c534e87e5b55739fa74601c9f1102686]
CVE: CVE-2026-42945
Signed-off-by: Nelson Garcia <nelson831002@gmail.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-42945.patch   | 40 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42945.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42945.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42945.patch
new file mode 100644
index 0000000000..cb476bcd96
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42945.patch
@@ -0,0 +1,40 @@
+From 524977e7c534e87e5b55739fa74601c9f1102686 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Tue, 13 May 2026 00:00:00 +0400
+Subject: [PATCH] Rewrite: fixed escaping and possible buffer overrun.
+
+The following code resulted in incorrect escaping of $1 and possible
+segfault:
+
+    location / {
+        rewrite ^(.*) /new?c=1;
+        set $myvar $1;
+        return 200 $myvar;
+    }
+
+If there were arguments in a rewrite's replacement string, the is_args flag
+was set and incorrectly never cleared.  This resulted in escaping applied
+to any captures evaluated afterwards in set or if.  Additionally buffer was
+allocated by ngx_http_script_complex_value_code() without escaping expected,
+thus this also resulted in buffer overrun and possible segfault.
+
+Reported by Leo Lin.
+
+CVE: CVE-2026-42945
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/524977e7c534e87e5b55739fa74601c9f1102686]
+Signed-off-by: Roman Arutyunyan <arut@nginx.com>
+---
+ src/http/ngx_http_script.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/http/ngx_http_script.c b/src/http/ngx_http_script.c
+--- a/src/http/ngx_http_script.c
++++ b/src/http/ngx_http_script.c
+@@ -1202,6 +1202,7 @@ ngx_http_script_regex_end_code(ngx_http_script_engine_t *e)
+ 
+     r = e->request;
+ 
++    e->is_args = 0;
+     e->quote = 0;
+ 
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, r->connection->log, 0,
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index b732e92b18..c1f277517f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -9,6 +9,7 @@ SRC_URI:append = " \
                   file://CVE-2026-27654.patch \
                   file://CVE-2026-28753.patch \
                   file://CVE-2026-32647.patch \
+                  file://CVE-2026-42945.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-- 
2.43.0


