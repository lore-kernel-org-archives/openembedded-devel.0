Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B6ACCD184
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 03:43:09 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.7495.1760499784808644489
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 20:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OyGN716D;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-26a0a694ea8so44399955ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760499784; x=1761104584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEw3EOfBGKeI7lqiSXyx7HBho1wYVOHXpDoE3Qv8SAY=;
        b=OyGN716DxJ2e6oAI2F+oHcDvFsKHZY5mHubHo2dkO3WxPA9BfUrzZMmsOCD9O9X/1S
         1dqJdlY/IdYRgrY8ZW0ItppnxgoRPgEH/85RQO6svUsdbL15PHYwNRiH7ufX3gdxzzpc
         OoOU48dftb/atW0qOJBZ9TV/FzV5vLRVmUkxT7JEYIAPElI5D08vDJ0BF91IY3q2BOvh
         MxVyPgUP5sA4/GLmQ/aBtajGKy+Ci9HOt5jvudf8FrVt2DPOHMUSb6vtEqdlmZHBg1Bi
         j0ZGncz46ox9udbHao5dzJ1VtfRw+6o3i1KkEbZZReZ3yZB+TzozaQezh43ijAwGKrO8
         lQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760499784; x=1761104584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEw3EOfBGKeI7lqiSXyx7HBho1wYVOHXpDoE3Qv8SAY=;
        b=P98/d/8XjBffDP7BTz0GVzeZklAKr0QyzgvYV3ryOOlk/HQk0ngvtdacQJyVrk1m1n
         YhVsrf9M9+0376Zbz7Pk1k/NRq7Kn+xQMmupzVdPgCzhmUOnisuNY0v9NFpLiKrbOvHR
         wM9GO1v7/+pgUMYip5dH2I5I7jtr8AwBv0lFni1hfO2As/LUyGKtWnDpnOs250CAs0E/
         FOIRZ8WhQ7bGk64Mb0PhbnUr9b9sfFGC1cWVg5E27/cwMZT47vNWVmF2dVRy5vVGc2QE
         /AIWPnQYrW2IGgA921CK939TI3vgCuIV67YjHX2OMx/g49OB+6B+2wNwE82UYJ83wGkE
         Cf8A==
X-Gm-Message-State: AOJu0Yx5S2BlWlUKDpx2cPVb85czDYV2jimhdtESkV41HfjVtWHdazNq
	COjcnh4NhXLP7TqUw5GIeh9TH3kTEsv3/t4XwyqdZ7XMri9uhid/sglCMJIegw==
X-Gm-Gg: ASbGncv/R+a+mOw4nvl2b1+vqNOqP3s247CyXqZbrLoCEonHB1n8X7SxH6Fv0Vz0fa0
	bodLeOa5HBcGj+MKC4Zit7eqmBsii2G05sJoWLBBZFRkuBGd6bad84YaBXoWXKHeNuE+f1q5Bx4
	MZGlpOOjJZAIHrKl1fWFBO7mgxBuC/miguIRWVa9w3zsMA4f/NFoumlH3tl6GEr+Xb2eIbIVCln
	HG7YtPT4YdjHg+exHWLNCQ3qozbQr/6UUN0hh8a3x7MoDb8b6Bai1I1sHWR/37OC6XPyFAM9CFJ
	1s/JAThx9aHS8TmD3ulEandVFToue7gBYAKVy5/cYoHG9VrfQkQM6cP/+vZVJjCYBB2qCNFs/G7
	UuMEWM/aF1qkkLbGc+KopXVYW2oTOpirCInXqu3qblxYxlywjSqaxb1k=
X-Google-Smtp-Source: AGHT+IHT3bTXq2HwIr9+T7b/tzA6CrXpzvxl2MJyATWurE9vO8GN+HALsngXMyBTmgVXvfDm3cmj8A==
X-Received: by 2002:a17:903:1510:b0:27e:ec72:f62 with SMTP id d9443c01a7336-2902728b8a2mr338622845ad.6.1760499783944;
        Tue, 14 Oct 2025 20:43:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a096870a3sm888627a12.33.2025.10.14.20.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 20:43:03 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 4/4] memcached: patch CVE-2023-46853
Date: Wed, 15 Oct 2025 16:42:44 +1300
Message-ID: <20251015034244.1445689-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015034244.1445689-1-ankur.tyagi85@gmail.com>
References: <20251015034244.1445689-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 03:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120682

Details https://nvd.nist.gov/vuln/detail/CVE-2023-46853

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../memcached/memcached/CVE-2023-46853.patch  | 117 ++++++++++++++++++
 .../memcached/memcached_1.6.17.bb             |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta-networking/recipes-support/memcached/memcached/CVE-2023-46853.patch

diff --git a/meta-networking/recipes-support/memcached/memcached/CVE-2023-46853.patch b/meta-networking/recipes-support/memcached/memcached/CVE-2023-46853.patch
new file mode 100644
index 0000000000..cf8aaf467b
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached/CVE-2023-46853.patch
@@ -0,0 +1,117 @@
+From 51c1f144d57379bd77f5b04c462171d26ebc5514 Mon Sep 17 00:00:00 2001
+From: dormando <dormando@rydia.net>
+Date: Wed, 2 Aug 2023 15:45:56 -0700
+Subject: [PATCH] CVE-2023-46853
+
+proxy: fix off-by-one if \r is missing
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
+(cherry picked from commit 6987918e9a3094ec4fc8976f01f769f624d790fa)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ proxy.h         |  1 +
+ proxy_request.c | 22 ++++++++++++++++------
+ t/proxy.t       |  5 +++--
+ 3 files changed, 20 insertions(+), 8 deletions(-)
+
+diff --git a/proxy.h b/proxy.h
+index 015c093..29e5175 100644
+--- a/proxy.h
++++ b/proxy.h
+@@ -271,6 +271,7 @@ struct mcp_parser_s {
+     uint8_t keytoken; // because GAT. sigh. also cmds without a key.
+     uint32_t parsed; // how far into the request we parsed already
+     uint32_t reqlen; // full length of request buffer.
++    uint32_t endlen; // index to the start of \r\n or \n
+     int vlen;
+     uint32_t klen; // length of key.
+     uint16_t tokens[PARSER_MAX_TOKENS]; // offsets for start of each token
+diff --git a/proxy_request.c b/proxy_request.c
+index 457e9a1..6351d02 100644
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
+@@ -93,7 +93,7 @@ static int _process_request_key(mcp_parser_t *pr) {
+ // Returns the offset for the next key.
+ size_t _process_request_next_key(mcp_parser_t *pr) {
+     const char *cur = pr->request + pr->parsed;
+-    int remain = pr->reqlen - pr->parsed - 2;
++    int remain = pr->endlen - pr->parsed;
+ 
+     // chew off any leading whitespace.
+     while (remain) {
+@@ -126,7 +126,7 @@ static int _process_request_metaflags(mcp_parser_t *pr, int token) {
+         return 0;
+     }
+     const char *cur = pr->request + pr->tokens[token];
+-    const char *end = pr->request + pr->reqlen - 2;
++    const char *end = pr->request + pr->endlen;
+ 
+     // We blindly convert flags into bits, since the range of possible
+     // flags is deliberately < 64.
+@@ -290,15 +290,25 @@ int process_request(mcp_parser_t *pr, const char *command, size_t cmdlen) {
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
+index 37caa27..af6213a 100644
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
diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
index b4c1847bf6..bfa1450368 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            file://0001-Fix-function-protypes.patch \
            file://CVE-2023-46852.patch \
+           file://CVE-2023-46853.patch \
            "
 SRC_URI[sha256sum] = "2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224"
 

