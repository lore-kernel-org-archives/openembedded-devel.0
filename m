Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE716C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 10:05:48 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web11.10178.1716977139148138817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 03:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=d0YHAyJO;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: jasper@fancydomain.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1716977135;
	bh=K/u57nBJQQH2XPU1HWdLDDotV5SY7+MuQ66gJAlqVCQ=;
	h=From:To:Cc:Subject;
	b=d0YHAyJO0vPvj+LKA8KrX70Tkcox2dEZVGL3LzjM/l9wZafreNS7qGx2MopAxbxRA
	 CQ7TpMYncSAKc4OkH01I8G2FLs+ulVxXB9ND75l3RDbPiHCIqITnttfqeKhMJLb/1B
	 EpmtKfzozdexWfPn0YyZQ9kZBQbuwYhTwNgLrRGj0cc6HgCksE537qxHExEEO+XtMj
	 C57YRaKPxHutCWZAJ/FVRTlNbwYpnVKPapOhu+X5TzmzHBPDy3DT9I1YjCQEBU5D1R
	 JQsxEiljHBbpd6xkMwy3juweKfbhF/EiPexsgD+lBEhrqCJRD2/XoDTi4e6G5xbfiX
	 PUxVRMkX2lwiA==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-webserver][kirkstone][PATCH] nginx: Remove obsolete patch
Date: Wed, 29 May 2024 12:05:04 +0200
Message-ID: <20240529100504.8257-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 10:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110612

From: Jasper Orschulko <jasper@fancydomain.eu>

With the inclusion of commit 85102dd2dff41945997b983f7c2bfc954dd3bc47
the same patch was introduced again, thus this copy can be deleted
(which accidently was never used, since I originally forgot to add it to
the SRC_URI, whoops).

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 ...-per-iteration-stream-handling-limit.patch | 92 -------------------
 1 file changed, 92 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-=
per-iteration-stream-handling-limit.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-per-ite=
ration-stream-handling-limit.patch b/meta-webserver/recipes-httpd/nginx/f=
iles/0001-HTTP-2-per-iteration-stream-handling-limit.patch
deleted file mode 100644
index 7dd1e721c..000000000
--- a/meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-per-iteration-=
stream-handling-limit.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 2b9667f36551406169e3e2a6a774466ac70a83c0 Mon Sep 17 00:00:00 2001
-From: Maxim Dounin <mdounin@mdounin.ru>
-Date: Tue, 10 Oct 2023 15:13:39 +0300
-Subject: [PATCH] HTTP/2: per-iteration stream handling limit.
-
-To ensure that attempts to flood servers with many streams are detected
-early, a limit of no more than 2 * max_concurrent_streams new streams pe=
r one
-event loop iteration was introduced.  This limit is applied even if
-max_concurrent_streams is not yet reached - for example, if correspondin=
g
-streams are handled synchronously or reset.
-
-Further, refused streams are now limited to maximum of max_concurrent_st=
reams
-and 100, similarly to priority_limit initial value, providing some toler=
ance
-to clients trying to open several streams at the connection start, yet
-low tolerance to flooding attempts.
-
-Upstream-Status: Backport
-[https://github.com/nginx/nginx/commit/6ceef192e7af1c507826ac38a2d43f08b=
f265fb9]
-
-Reduces the impact of HTTP/2 Stream Reset flooding in the nginx product
-(CVE-2023-44487).
-
-See: https://www.nginx.com/blog/http-2-rapid-reset-attack-impacting-f5-n=
ginx-products/
-
-This patch only reduces the impact and does not completely mitigate the =
CVE
-in question, the latter being due to a design flaw in the HTTP/2 protoco=
l
-itself. For transparancy reasons I therefore opted to not mark the
-CVE as resolved, so that integrators can decide for themselves, wheither=
 to
-enable HTTP/2 support or allow HTTP/1.1 connections only.
-
-Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
----
- src/http/v2/ngx_http_v2.c | 15 +++++++++++++++
- src/http/v2/ngx_http_v2.h |  2 ++
- 2 files changed, 17 insertions(+)
-
-diff --git a/src/http/v2/ngx_http_v2.c b/src/http/v2/ngx_http_v2.c
-index 3611a2e50..291677aca 100644
---- a/src/http/v2/ngx_http_v2.c
-+++ b/src/http/v2/ngx_http_v2.c
-@@ -361,6 +361,7 @@ ngx_http_v2_read_handler(ngx_event_t *rev)
-     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, c->log, 0, "http2 read handler")=
;
-=20
-     h2c->blocked =3D 1;
-+    h2c->new_streams =3D 0;
-=20
-     if (c->close) {
-         c->close =3D 0;
-@@ -1320,6 +1321,14 @@ ngx_http_v2_state_headers(ngx_http_v2_connection_=
t *h2c, u_char *pos,
-         goto rst_stream;
-     }
-=20
-+    if (h2c->new_streams++ >=3D 2 * h2scf->concurrent_streams) {
-+        ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
-+                      "client sent too many streams at once");
-+
-+        status =3D NGX_HTTP_V2_REFUSED_STREAM;
-+        goto rst_stream;
-+    }
-+
-     if (!h2c->settings_ack
-         && !(h2c->state.flags & NGX_HTTP_V2_END_STREAM_FLAG)
-         && h2scf->preread_size < NGX_HTTP_V2_DEFAULT_WINDOW)
-@@ -1385,6 +1394,12 @@ ngx_http_v2_state_headers(ngx_http_v2_connection_=
t *h2c, u_char *pos,
-=20
- rst_stream:
-=20
-+    if (h2c->refused_streams++ > ngx_max(h2scf->concurrent_streams, 100=
)) {
-+        ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
-+                      "client sent too many refused streams");
-+        return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_NO_ERROR);
-+    }
-+
-     if (ngx_http_v2_send_rst_stream(h2c, h2c->state.sid, status) !=3D N=
GX_OK) {
-         return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_INTERNAL_E=
RROR);
-     }
-diff --git a/src/http/v2/ngx_http_v2.h b/src/http/v2/ngx_http_v2.h
-index 349229711..6a7aaa62c 100644
---- a/src/http/v2/ngx_http_v2.h
-+++ b/src/http/v2/ngx_http_v2.h
-@@ -125,6 +125,8 @@ struct ngx_http_v2_connection_s {
-     ngx_uint_t                       processing;
-     ngx_uint_t                       frames;
-     ngx_uint_t                       idle;
-+    ngx_uint_t                       new_streams;
-+    ngx_uint_t                       refused_streams;
-     ngx_uint_t                       priority_limit;
-=20
-     ngx_uint_t                       pushing;
---=20
-2.42.1
-
--=20
2.45.0


