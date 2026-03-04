Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC7EEB7ED5
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 11:40:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16141.1772624400024384341
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 03:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c5peJnPi;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f454be5bso70925515e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624398; x=1773229198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RCcD2s+AhuFyal3u2xNE8auKPu66PWUibU4nNUuo3o=;
        b=c5peJnPittKH6euJQYARUbcGKRe5x6gFBtWCKGZkgxwdNG7WsszJY/tGoYnxiRCpha
         RiaMdWC5GXl/vFHZEVkB/5V8yY2C5cPFlobPocZxFy390eemLirAtJ/hl3fFiO3sMOMz
         ylXU3Z0y6lw1DIWI0ftQBhN9QV6uATTT4uXJ6OYaOD1ZGKj5H/qCN3Az069YYUlIGfRY
         /t9U18b1SCEvdjPOZcfsnZM9IaMjQMJXrMCj9bwWpoKxOuqjbwE8rQkF22TNxWcV+Jiz
         bW16aiAKIeI3+u5SEQaWevLemmWGP+YV6z2ZVzt1QNikSNyLsuuCXJVAhWhq2XmqJLkg
         bmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624398; x=1773229198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5RCcD2s+AhuFyal3u2xNE8auKPu66PWUibU4nNUuo3o=;
        b=BMwoohnNU1X8xtFJchc3LV1Y8MHf2bU69lPoA3V6Bzh8cxCBM3n5H0qgEr1YXUJ8K5
         nwYt7Y22zcsJKfj+DKUp7vB2dmWqv0K3eXcp1TqcPbeBHA63oT+gfOMWIqmh0gv643tX
         cjFntYHqe2Nkj7+vHyAkIUPX1wliGOln3ok/nbrnNIb7mbjukx7MAmH0xAN8w0T4CxlC
         /Zwdp6fcR4DdTebZGtHucBQf3KPJ4rCCrCjncZnypMQhAQo9TJ429HHMTYx7XhGi71Kv
         yOL9vhy6laBZyZIVmzSVg9KvQ1vRSCe5XeHyjuJ36a0M+RJKSeqeJU8oWGwI12pTPL75
         X32A==
X-Gm-Message-State: AOJu0Yx5zeCsPZrqxid1yEhmCqLTpUogqvtOtOST3k/IN7LyU3BcQMTb
	v6B2DvaS0FTaXLaN+fnk48spwntOPUzeMkC4CdU4LddPbMHMLmyV27jPW4be1w==
X-Gm-Gg: ATEYQzwj4xutTqV99wPdRIKlxyozjfCGZIpXLU0SjtSveR6tF3zlohjupfwk+ouXCyY
	ycQSs8Ec2H3o9ukh5lVdOkiieAJgW19EQWSfbyZDUdOAP8Kclkus3t0+wDdT3ZsbPESNSQZnHmF
	FQqebyrFWN0yUMaQnAA64h9xpRva+n92MHK/0F7zLU+vdUvfkn9vsUN3J0A9RQwNPUnRDerk03H
	WspFuo+1919xyXy56x3GoMRH2rAdlv3k0cAOvzuCT6cEN8eydrgJlkhxB4G7tS1n52ViLXO1YnE
	cqMeSawgCnCQIWI++6SdjsGwsyNQHcD9ecboBjpA9gmFg+u7QgRKEn2/e7BNKIinKokbFzepWYP
	5lsFkkWYTC07jIwBlD5bh+E7puC7knMk3vcuvshtxL3Ba56DcAVQxItCJdQdDjQIjM+bZXJT/8T
	m2vfRKbXqSCbXfGbOUeTyn
X-Received: by 2002:a05:600c:8b6a:b0:480:4a90:1afd with SMTP id 5b1f17b1804b1-485197fa2c8mr27046905e9.0.1772624398235;
        Wed, 04 Mar 2026 03:39:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851880724esm88692195e9.9.2026.03.04.03.39.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:39:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 2/3] memcached: patch CVE-2023-46853
Date: Wed,  4 Mar 2026 12:39:55 +0100
Message-ID: <20260304113956.2245844-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304113956.2245844-1-skandigraun@gmail.com>
References: <20260304113956.2245844-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 11:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124846

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-46853

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../memcached/memcached/CVE-2023-46853.patch  | 114 ++++++++++++++++++
 .../memcached/memcached_1.6.15.bb             |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta-networking/recipes-support/memcached/memcached/CVE-2023-46853.patch

diff --git a/meta-networking/recipes-support/memcached/memcached/CVE-2023-46853.patch b/meta-networking/recipes-support/memcached/memcached/CVE-2023-46853.patch
new file mode 100644
index 0000000000..52066f7e71
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached/CVE-2023-46853.patch
@@ -0,0 +1,114 @@
+From 788c8ba8fe07d0df3c425458b6e3a1590cc25401 Mon Sep 17 00:00:00 2001
+From: dormando <dormando@rydia.net>
+Date: Wed, 2 Aug 2023 15:45:56 -0700
+Subject: [PATCH] proxy: fix off-by-one if \r is missing
+
+A bunch of the parser assumed we only had \r\n, but I didn't actually
+have that strictness set. Some commands worked and some broke in subtle
+ways when just "\n" was being submitted.
+
+I'm not 100% confident in this change yet so I'm opening a PR to stage
+it while I run some more thorough tests.
+
+CVE: CVE-2023-46853
+Upstream-Status: Backport [https://github.com/memcached/memcached/commit/6987918e9a3094ec4fc8976f01f769f624d790fa]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ proxy.h         |  1 +
+ proxy_request.c | 22 ++++++++++++++++------
+ t/proxy.t       |  5 +++--
+ 3 files changed, 20 insertions(+), 8 deletions(-)
+
+diff --git a/proxy.h b/proxy.h
+index 86b4aa9..df9ebd6 100644
+--- a/proxy.h
++++ b/proxy.h
+@@ -268,6 +268,7 @@ struct mcp_parser_s {
+     uint8_t keytoken; // because GAT. sigh. also cmds without a key.
+     uint32_t parsed; // how far into the request we parsed already
+     uint32_t reqlen; // full length of request buffer.
++    uint32_t endlen; // index to the start of \r\n or \n
+     int vlen;
+     uint32_t klen; // length of key.
+     uint16_t tokens[PARSER_MAX_TOKENS]; // offsets for start of each token
+diff --git a/proxy_request.c b/proxy_request.c
+index f351cc1..1c34182 100644
+--- a/proxy_request.c
++++ b/proxy_request.c
+@@ -9,7 +9,7 @@
+ // where we later scan or directly feed data into API's.
+ static int _process_tokenize(mcp_parser_t *pr, const size_t max) {
+     const char *s = pr->request;
+-    int len = pr->reqlen - 2;
++    int len = pr->endlen;
+ 
+     // since multigets can be huge, we can't purely judge reqlen against this
+     // limit, but we also can't index past it since the tokens are shorts.
+@@ -79,7 +79,7 @@ static int _process_request_key(mcp_parser_t *pr) {
+ // Returns the offset for the next key.
+ size_t _process_request_next_key(mcp_parser_t *pr) {
+     const char *cur = pr->request + pr->parsed;
+-    int remain = pr->reqlen - pr->parsed - 2;
++    int remain = pr->endlen - pr->parsed;
+ 
+     // chew off any leading whitespace.
+     while (remain) {
+@@ -112,7 +112,7 @@ static int _process_request_metaflags(mcp_parser_t *pr, int token) {
+         return 0;
+     }
+     const char *cur = pr->request + pr->tokens[token];
+-    const char *end = pr->request + pr->reqlen - 2;
++    const char *end = pr->request + pr->endlen;
+ 
+     // We blindly convert flags into bits, since the range of possible
+     // flags is deliberately < 64.
+@@ -276,15 +276,25 @@ int process_request(mcp_parser_t *pr, const char *command, size_t cmdlen) {
+         return -1;
+     }
+ 
+-    const char *s = memchr(command, ' ', cmdlen-2);
++    // Commands can end with bare '\n's. Depressingly I intended to be strict
++    // with a \r\n requirement but never did this and need backcompat.
++    // In this case we _know_ \n is at cmdlen because we can't enter this
++    // function otherwise.
++    if (cm[cmdlen-2] == '\r') {
++        pr->endlen = cmdlen - 2;
++    } else {
++        pr->endlen = cmdlen - 1;
++    }
++
++    const char *s = memchr(command, ' ', pr->endlen);
+     if (s != NULL) {
+         cl = s - command;
+     } else {
+-        cl = cmdlen - 2;
++        cl = pr->endlen;
+     }
+     pr->keytoken = 0;
+     pr->has_space = false;
+-    pr->parsed = cl + 1;
++    pr->parsed = cl;
+     pr->request = command;
+     pr->reqlen = cmdlen;
+     int token_max = PARSER_MAX_TOKENS;
+diff --git a/t/proxy.t b/t/proxy.t
+index c85796d..203924b 100644
+--- a/t/proxy.t
++++ b/t/proxy.t
+@@ -151,13 +151,14 @@ my $p_sock = $p_srv->sock;
+ # NOTE: memcached always allowed [\r]\n for single command lines, but payloads
+ # (set/etc) require exactly \r\n as termination.
+ # doc/protocol.txt has always specified \r\n for command/response.
+-# Proxy is more strict than normal server in this case.
++# Note a bug lead me to believe that the proxy was more strict, we accept any
++# \n or \r\n terminated commands.
+ {
+     my $s = $srv[0]->sock;
+     print $s "version\n";
+     like(<$s>, qr/VERSION/, "direct server version cmd with just newline");
+     print $p_sock "version\n";
+-    like(<$p_sock>, qr/SERVER_ERROR/, "proxy version cmd with just newline");
++    like(<$p_sock>, qr/VERSION/, "proxy version cmd with just newline");
+     print $p_sock "version\r\n";
+     like(<$p_sock>, qr/VERSION/, "proxy version cmd with full CRLF");
+ }
diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.15.bb b/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
index 64065e8547..010e8591cd 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
@@ -22,6 +22,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            file://CVE-2023-46852.patch \
+           file://CVE-2023-46853.patch \
            "
 SRC_URI[sha256sum] = "8d7abe3d649378edbba16f42ef1d66ca3f2ac075f2eb97145ce164388e6ed515"
 

