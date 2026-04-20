Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6182CF36C47
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:46:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14893.1776671173238910293
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GlKf/AKM;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4890098abbaso15744385e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 00:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776671172; x=1777275972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDPwLelRXN8oDBRrGH+WRvd2ItusBnbGbxoFLci0ax0=;
        b=GlKf/AKMa4DH93uuqVzUF3SRsrzHuiDXlNQ7W8Ql7liFlFIa3p0KARL5gwfnHOVbQ5
         KHPi7lrVoRYaBaZvy4Dzehyv5CpJWVQj6MDrvizUlOMiKeK/z4Tx1ZvbCKSbG2AU7U0F
         knc9opSYxPRrd2NOfg0Ro7S6Aak4He1O0BSiKS2J7NPLXTRAjMTQG5ZaLS3onXTs2G2w
         sV3EHlVB65yf2yZZVkxKyZqohYJVA/NFV2R9AU+TPtckYPiBGFkZdMUG6wrbPBGlKNCE
         wscAUGRsFXBOxUqykf5j5xSFlOCPg04m+rvRjfzyhH0CBW0V0XRqUUTofJL5YYq2z3FJ
         9P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776671172; x=1777275972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HDPwLelRXN8oDBRrGH+WRvd2ItusBnbGbxoFLci0ax0=;
        b=BDpgPPw9gCEolNb7L1RrHYZu7WxufxIl7GqI3QpeeiXsu8EttlcNHSlBMEwJqk5McO
         AeEn00JL5TQ4hdjHfpsyUeMvr5GgtzmpX75JwrUfNFqOQ8BN7echNuGgEHgpOMW3uqbW
         Ki2F/0l0bC6YLxyH4yjDaa3iQGAJdEuDnp3TfEXctwtMn/pE+IBHug1Yj2yd9N2CneVw
         U9udOX5Zcec5m9SJ5JTw5ZLslJXP7dL4HTDWX3AatRU9adXn69sz6W0S4UFfcAUzp9KY
         4T6cyKjJtLzUdV1Nx5637qyO0Kk9CcDBLpmHLKhfdYjUOZhJxK1gJ493aRGRJhzM/FBb
         bFkA==
X-Gm-Message-State: AOJu0YyAzUTeXq+n0xXidJuWvmR8DnH4Hw8UgHsopLj01an8kCsLpKv+
	1ny84cJvjnhdqDQKTbujuK4VHrNO1FItYmauTS2/ooXlplw5ORC35CbNweWL7A==
X-Gm-Gg: AeBDiesBnU9Sp0/MNl1a0V8hgvVheLHBBpZkmAyNo/zVK0ro3iXORBPTxKY9ZD71VAz
	gMOR2WyxPCG79bQIVuHG0FMMKvIBJJZLZof5vD/vTDB+Srgwg4qH5PrEKG2szLpd9V8s4Z3g6V1
	fQv4Zg1M/+Amqwy2hITHQFkilaOfq9pqrqQ7AsBdfgF5L6BJoIBcCwrCFIb6GHjDR/9xKTTwN7e
	zEJbZXX5epcpLJb3+2G01FtTfEVPEw21VZ/PWdTVK3x9UldeurkBS4QGT+onzyFZO+86jhv4DAF
	c9hloQEbBsIjuVev7IGH8Bins3i0WNoegJoNk88nNje1VD52aKGfFsLRO7mxFNiisQzvvEimpMQ
	GDspHPcobDbDtNE9omm9noa2att5tedM+hi6+HTHeRoH987Dv6kRiur21wnxXL7RFSnS8ELlrFg
	43HYDpRZc5k0YgbladAbEFRtxhpNYcJ3s=
X-Received: by 2002:a05:600c:308a:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-4896c22e217mr8011365e9.0.1776671171247;
        Mon, 20 Apr 2026 00:46:11 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm25904289f8f.34.2026.04.20.00.46.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:46:10 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH 2/2] monkey: patch CVEs
Date: Mon, 20 Apr 2026 09:46:09 +0200
Message-ID: <20260420074609.3901591-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420074609.3901591-1-skandigraun@gmail.com>
References: <20260420074609.3901591-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 07:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126485

These patches are about a number of CVEs files against the application:
CVE-2025-63649, CVE-2025-63650, CVE-2025-63651, CVE-2025-63652, CVE-2025-63653, CVE-2025-63655,
CVE-2025-63656, CVE-2025-63657 and CVE-2025-63658.

These patches are taken from a pull request[1] that is referenced in the relevant bug report[2].
The patches don't target specific CVEs on separately, but they fix a number of CVEs altogether.

Based on upstream analysis (in the linked issue) a number of these CVEs are duplicates of each
other and/or not exploitable. The valid CVEs are fixed by these patches.

I haven't added specific CVE info to the patches, one hand because of the above, it is hard to
separate the patches by CVE, and secondarily because NVD tracks these CVEs with incorrect version
info: NVD considers 1.8.6 fully fixed, even though the patches are only in the master branch,
untagged at this time. After updating the recipe to 1.8.6+, the vulnerabilites will disappear
from the CVE report due to this.

[1]: https://github.com/monkey/monkey/pull/434
[2]: https://github.com/monkey/monkey/issues/426

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...tp-fix-malformed-request-crash-paths.patch | 160 ++++++++++++++++++
 ...eduler-guard-protocol-close-callback.patch |  51 ++++++
 ...server-parser-harden-boundary-checks.patch | 108 ++++++++++++
 .../recipes-httpd/monkey/monkey_1.8.7.bb      |   6 +-
 4 files changed, 324 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/0001-server-http-fix-malformed-request-crash-paths.patch
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/0002-server-scheduler-guard-protocol-close-callback.patch
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/0003-server-parser-harden-boundary-checks.patch

diff --git a/meta-webserver/recipes-httpd/monkey/files/0001-server-http-fix-malformed-request-crash-paths.patch b/meta-webserver/recipes-httpd/monkey/files/0001-server-http-fix-malformed-request-crash-paths.patch
new file mode 100644
index 0000000000..b57d7ac219
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/files/0001-server-http-fix-malformed-request-crash-paths.patch
@@ -0,0 +1,160 @@
+From 839620179e2b4e5982c53d8956d92e690d82960c Mon Sep 17 00:00:00 2001
+From: Eduardo Silva <eduardo@chronosphere.io>
+Date: Thu, 9 Apr 2026 12:11:52 -0600
+Subject: [PATCH] server: http: fix malformed request crash paths
+
+Fix the reproducible malformed-request crash paths in the HTTP
+request lifecycle.
+
+Handle missing Host data in directory redirects, reject malformed
+range delimiters before substring parsing, and avoid reusing invalid
+request state while advancing pipelined requests.
+
+Verified by rebuilding with cmake --build build and replaying the
+reported crash-inducing request fixtures against build/bin/monkey.
+
+Signed-off-by: Eduardo Silva <eduardo@chronosphere.io>
+
+This patch is part of https://github.com/monkey/monkey/pull/434,
+containing assorted CVE fixes.
+
+Upstream-Status: Backport [https://github.com/monkey/monkey/commit/1570f41231888ae8c7fbd719704e2486a952e45d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ mk_core/mk_memory.c | 10 ++++++++++
+ mk_server/mk_http.c | 46 +++++++++++++++++++++++++++++++++++++++++----
+ 2 files changed, 52 insertions(+), 4 deletions(-)
+
+diff --git a/mk_core/mk_memory.c b/mk_core/mk_memory.c
+index c4073e23..008f7ac6 100644
+--- a/mk_core/mk_memory.c
++++ b/mk_core/mk_memory.c
+@@ -52,6 +52,16 @@ char *mk_ptr_to_buf(mk_ptr_t p)
+ {
+     char *buf;
+ 
++    if (!p.data || p.len == 0) {
++        buf = mk_mem_alloc(1);
++        if (!buf) {
++            return NULL;
++        }
++
++        buf[0] = '\0';
++        return buf;
++    }
++
+     buf = mk_mem_alloc(p.len + 1);
+     if (!buf) return NULL;
+ 
+diff --git a/mk_server/mk_http.c b/mk_server/mk_http.c
+index ad12a74a..f2f12554 100644
+--- a/mk_server/mk_http.c
++++ b/mk_server/mk_http.c
+@@ -457,6 +457,10 @@ static int mk_http_range_parse(struct mk_http_request *sr)
+     if ((sep_pos = mk_string_char_search(sr->range.data, '-', sr->range.len)) < 0)
+         return -1;
+ 
++    if (sep_pos < eq_pos) {
++        return -1;
++    }
++
+     len = sr->range.len;
+     sh = &sr->headers;
+ 
+@@ -476,10 +480,16 @@ static int mk_http_range_parse(struct mk_http_request *sr)
+     /* =yyy-xxx */
+     if ((eq_pos + 1 != sep_pos) && (len > sep_pos + 1)) {
+         buffer = mk_string_copy_substr(sr->range.data, eq_pos + 1, sep_pos);
++        if (!buffer) {
++            return -1;
++        }
+         sh->ranges[0] = (unsigned long) atol(buffer);
+         mk_mem_free(buffer);
+ 
+         buffer = mk_string_copy_substr(sr->range.data, sep_pos + 1, len);
++        if (!buffer) {
++            return -1;
++        }
+         sh->ranges[1] = (unsigned long) atol(buffer);
+         mk_mem_free(buffer);
+ 
+@@ -493,6 +503,9 @@ static int mk_http_range_parse(struct mk_http_request *sr)
+     /* =yyy- */
+     if ((eq_pos + 1 != sep_pos) && (len == sep_pos + 1)) {
+         buffer = mk_string_copy_substr(sr->range.data, eq_pos + 1, len);
++        if (!buffer) {
++            return -1;
++        }
+         sr->headers.ranges[0] = (unsigned long) atol(buffer);
+         mk_mem_free(buffer);
+ 
+@@ -522,7 +535,16 @@ static int mk_http_directory_redirect_check(struct mk_http_session *cs,
+         return 0;
+     }
+ 
++    if (!sr->host.data || sr->host.len <= 0) {
++        mk_http_error(MK_CLIENT_BAD_REQUEST, cs, sr, server);
++        return -1;
++    }
++
+     host = mk_ptr_to_buf(sr->host);
++    if (!host) {
++        mk_http_error(MK_CLIENT_BAD_REQUEST, cs, sr, server);
++        return -1;
++    }
+ 
+     /*
+      * Add ending slash to the location string
+@@ -588,6 +610,9 @@ static inline char *mk_http_index_lookup(mk_ptr_t *path_base,
+     }
+ 
+     off = path_base->len;
++    if ((size_t) off >= buf_size) {
++        return NULL;
++    }
+     memcpy(buf, path_base->data, off);
+ 
+     mk_list_foreach(head, server->index_files) {
+@@ -1138,15 +1163,27 @@ int mk_http_request_end(struct mk_http_session *cs, struct mk_server *server)
+     ret = mk_http_parser_more(&cs->parser, cs->body_length);
+     if (ret == MK_TRUE) {
+         /* Our pipeline request limit is the same that our keepalive limit */
++        if (cs->parser.i < 0 ||
++            (unsigned int) (cs->parser.i + 1) >= cs->body_length) {
++            goto shutdown;
++        }
++
+         cs->counter_connections++;
+         len = (cs->body_length - cs->parser.i) -1;
++        if (len <= 0) {
++            goto shutdown;
++        }
+         memmove(cs->body,
+                 cs->body + cs->parser.i + 1,
+                 len);
+         cs->body_length = len;
+ 
+         /* Prepare for next one */
+-        sr = mk_list_entry_first(&cs->request_list, struct mk_http_request, _head);
++        if (mk_list_is_empty(&cs->request_list) == 0) {
++            cs->close_now = MK_TRUE;
++            goto shutdown;
++        }
++        sr = &cs->sr_fixed;
+         mk_http_request_free(sr, server);
+         mk_http_request_init(cs, sr, server);
+         mk_http_parser_init(&cs->parser);
+@@ -1626,9 +1663,10 @@ int mk_http_sched_done(struct mk_sched_conn *conn,
+     struct mk_http_request *sr;
+ 
+     session = mk_http_session_get(conn);
+-    sr = mk_list_entry_first(&session->request_list,
+-                             struct mk_http_request, _head);
+-    mk_plugin_stage_run_40(session, sr, server);
++    if (mk_list_is_empty(&session->request_list) != 0) {
++        sr = &session->sr_fixed;
++        mk_plugin_stage_run_40(session, sr, server);
++    }
+ 
+     return mk_http_request_end(session, server);
+ }
diff --git a/meta-webserver/recipes-httpd/monkey/files/0002-server-scheduler-guard-protocol-close-callback.patch b/meta-webserver/recipes-httpd/monkey/files/0002-server-scheduler-guard-protocol-close-callback.patch
new file mode 100644
index 0000000000..c731db0919
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/files/0002-server-scheduler-guard-protocol-close-callback.patch
@@ -0,0 +1,51 @@
+From 82fb537e74e9b801d196b76efaf735ee50cd86c6 Mon Sep 17 00:00:00 2001
+From: Eduardo Silva <eduardo@chronosphere.io>
+Date: Thu, 9 Apr 2026 12:43:31 -0600
+Subject: [PATCH] server: scheduler: guard protocol close callback
+
+Avoid calling a null cb_close handler from the scheduler close
+and timeout paths.
+
+This fixes the HTTP/2 upgrade case where the protocol handler can be
+switched to mk_http2_handler even though that handler does not
+implement cb_close.
+
+Verified by rebuilding with cmake --build build.
+
+Signed-off-by: Eduardo Silva <eduardo@chronosphere.io>
+
+This patch is part of https://github.com/monkey/monkey/pull/434, 
+containing assorted CVE fixes.
+
+Upstream-Status: Backport [https://github.com/monkey/monkey/commit/fc1d68fb38044df08cb43c7d9af0f68714388efc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ mk_server/mk_scheduler.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/mk_server/mk_scheduler.c b/mk_server/mk_scheduler.c
+index a680d3cd..3cf0ba40 100644
+--- a/mk_server/mk_scheduler.c
++++ b/mk_server/mk_scheduler.c
+@@ -598,8 +598,10 @@ int mk_sched_check_timeouts(struct mk_sched_worker *sched,
+             MK_TRACE("Scheduler, closing fd %i due TIMEOUT",
+                      conn->event.fd);
+             MK_LT_SCHED(conn->event.fd, "TIMEOUT_CONN_PENDING");
+-            conn->protocol->cb_close(conn, sched, MK_SCHED_CONN_TIMEOUT,
+-                                     server);
++            if (conn->protocol->cb_close) {
++                conn->protocol->cb_close(conn, sched, MK_SCHED_CONN_TIMEOUT,
++                                         server);
++            }
+             mk_sched_drop_connection(conn, sched, server);
+         }
+     }
+@@ -749,7 +751,7 @@ int mk_sched_event_close(struct mk_sched_conn *conn,
+     MK_TRACE("[FD %i] Connection Handler, closed", conn->event.fd);
+     mk_event_del(sched->loop, &conn->event);
+ 
+-    if (type != MK_EP_SOCKET_DONE) {
++    if (type != MK_EP_SOCKET_DONE && conn->protocol->cb_close) {
+         conn->protocol->cb_close(conn, sched, type, server);
+     }
+     /*
diff --git a/meta-webserver/recipes-httpd/monkey/files/0003-server-parser-harden-boundary-checks.patch b/meta-webserver/recipes-httpd/monkey/files/0003-server-parser-harden-boundary-checks.patch
new file mode 100644
index 0000000000..1e56893c65
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/files/0003-server-parser-harden-boundary-checks.patch
@@ -0,0 +1,108 @@
+From b9f24a2968fa62de4a6ecf070fa0389ce10e7729 Mon Sep 17 00:00:00 2001
+From: Eduardo Silva <eduardo@chronosphere.io>
+Date: Thu, 9 Apr 2026 12:11:57 -0600
+Subject: [PATCH] server: parser: harden boundary checks
+
+Tighten parser and helper validation around explicit lengths and
+buffer boundaries.
+
+Require exact header literal matches, validate chunk length tokens,
+and guard helper routines that previously trusted inconsistent
+pointer or length state.
+
+Verified by rebuilding with cmake --build build and replaying the
+reported malformed request fixtures against build/bin/monkey.
+
+Signed-off-by: Eduardo Silva <eduardo@chronosphere.io>
+
+This patch is part of https://github.com/monkey/monkey/pull/434, 
+containing assorted CVE fixes.
+
+Upstream-Status: Backport [https://github.com/monkey/monkey/commit/ffe0d0ed1b074ea6f3965c37bb754e9f19130a82]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ include/monkey/mk_http_parser.h |  6 +++++-
+ mk_server/mk_http_parser.c      | 13 +++++++++++++
+ mk_server/mk_mimetype.c         |  7 ++++++-
+ mk_server/mk_user.c             |  2 +-
+ 4 files changed, 25 insertions(+), 3 deletions(-)
+
+diff --git a/include/monkey/mk_http_parser.h b/include/monkey/mk_http_parser.h
+index 9e3b365e..465ea0e4 100644
+--- a/include/monkey/mk_http_parser.h
++++ b/include/monkey/mk_http_parser.h
+@@ -389,7 +389,11 @@ int mk_http_parser_chunked_decode_buf(struct mk_http_parser *p,
+ 
+ static inline int mk_http_parser_more(struct mk_http_parser *p, int len)
+ {
+-    if (abs(len - p->i) - 1 > 0) {
++    if (len <= 0 || p->i < 0) {
++        return MK_FALSE;
++    }
++
++    if ((p->i + 1) < len) {
+         return MK_TRUE;
+     }
+ 
+diff --git a/mk_server/mk_http_parser.c b/mk_server/mk_http_parser.c
+index 9413528a..3c831f29 100644
+--- a/mk_server/mk_http_parser.c
++++ b/mk_server/mk_http_parser.c
+@@ -173,6 +173,16 @@ static inline void request_set(mk_ptr_t *ptr, struct mk_http_parser *p, char *bu
+ static inline int header_cmp(const char *expected, char *value, int len)
+ {
+     int i = 0;
++    size_t expected_len;
++
++    if (len < 0) {
++        return -1;
++    }
++
++    expected_len = strlen(expected);
++    if ((size_t) len != expected_len) {
++        return -1;
++    }
+ 
+     if (len >= 8) {
+         if (expected[0] != tolower(value[0])) return -1;
+@@ -535,6 +545,9 @@ parse_more:
+         (errno != 0)) {
+         return MK_HTTP_PARSER_ERROR;
+     }
++    if (ptr == tmp || *ptr != '\0') {
++        return MK_HTTP_PARSER_ERROR;
++    }
+ 
+     if (chunk_len < 0) {
+         return MK_HTTP_PARSER_ERROR;
+diff --git a/mk_server/mk_mimetype.c b/mk_server/mk_mimetype.c
+index b86b4ef1..5462ea5c 100644
+--- a/mk_server/mk_mimetype.c
++++ b/mk_server/mk_mimetype.c
+@@ -197,7 +197,12 @@ struct mk_mimetype *mk_mimetype_find(struct mk_server *server, mk_ptr_t *filenam
+ {
+     int j, len;
+ 
+-    j = len = filename->len;
++    if (!filename->data || filename->len <= 0) {
++        return NULL;
++    }
++
++    len = filename->len;
++    j = len - 1;
+ 
+     /* looking for extension */
+     while (j >= 0 && filename->data[j] != '.') {
+diff --git a/mk_server/mk_user.c b/mk_server/mk_user.c
+index 7200ff08..716331ac 100644
+--- a/mk_server/mk_user.c
++++ b/mk_server/mk_user.c
+@@ -46,7 +46,7 @@ int mk_user_init(struct mk_http_session *cs, struct mk_http_request *sr,
+     }
+ 
+     limit = mk_string_char_search(sr->uri_processed.data + offset, '/',
+-                                  sr->uri_processed.len);
++                                  sr->uri_processed.len - offset);
+ 
+     if (limit == -1) {
+         limit = (sr->uri_processed.len) - offset;
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.8.7.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.8.7.bb
index 01565de6ef..a9bea8f767 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.8.7.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.8.7.bb
@@ -11,7 +11,11 @@ SRC_URI = "git://github.com/monkey/monkey;branch=master;protocol=https;tag=v${PV
            file://0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch \
            file://0001-include-Fix-location-of-mk_core.h-etal.patch \
            file://monkey.service \
-           file://monkey.init"
+           file://monkey.init \
+           file://0001-server-http-fix-malformed-request-crash-paths.patch \
+           file://0002-server-scheduler-guard-protocol-close-callback.patch \
+           file://0003-server-parser-harden-boundary-checks.patch \
+           "
 
 SRCREV = "0fd3bbd657c6d6339315709ef068493c572b973c"
 

