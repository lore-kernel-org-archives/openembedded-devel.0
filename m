Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E665EC4167B
	for <webhook@archiver.kernel.org>; Sun, 26 Nov 2023 23:55:13 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.100])
 by mx.groups.io with SMTP id smtpd.web11.78254.1701042904691735027
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Nov 2023 15:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=V7Z47Q4O;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.100, mailfrom: jasper@fancydomain.eu)
From: jasper@fancydomain.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1701042901;
	bh=yrkhyQF982XEu3rM+gX9/TznVnVSr2A1WtuRQxC6Tv8=;
	h=From:To:Cc:Subject;
	b=V7Z47Q4O2D3VstdqVwBB8z/6fnn6Sy8RQ54qOqh7CPqskH1cAzDfHBshjPQHsvv8H
	 JR6UuSs8S3vYno7jm1ibOeqfsvpQV9bYcry+Xh0bCszBdcC3/conMzRIGoKQUE6DVt
	 6+gmln5S4+6HymfbEDjrnZfxQL6whKK0Ges4S2kNyJsLvJo5U1KYtBbeLXisEDlzm0
	 BYh6yabpih6JwSe/vrrdYBwOX9SUNeBVy6eD3PFGkll/tCtPWW/Zd3qUMuZPOHtPvQ
	 XUHY85X/t3Y6pvDtUOBOu3xB7f6ivFr6Xm7MJxnHAQVuLkufN6ygxs5/p+K/xfvPbw
	 h05gHjXEOOFSQ==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-webserver][kirkstone][PATCH] nginx: Mitigate HTTP/2 Stream Resets Flood impact
Date: Mon, 27 Nov 2023 00:54:30 +0100
Message-ID: <20231126235430.18393-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 23:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107056

From: Jasper Orschulko <jasper@fancydomain.eu>

Reduces the impact of HTTP/2 Stream Reset flooding in the nginx product
(CVE-2023-44487).

See: https://www.nginx.com/blog/http-2-rapid-reset-attack-impacting-f5-ng=
inx-products/

This patch only reduces the impact and does not completely mitigate the C=
VE
in question, the latter being due to a design flaw in the HTTP/2 protocol
itself. For transparancy reasons I therefore opted to not mark the
CVE as resolved, so that integrators can decide for themselves, wheither =
to
enable HTTP/2 support or allow HTTP/1.1 connections only.

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 ...-per-iteration-stream-handling-limit.patch | 92 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.20.1.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.21.1.bb       |  2 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-=
per-iteration-stream-handling-limit.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-per-ite=
ration-stream-handling-limit.patch b/meta-webserver/recipes-httpd/nginx/f=
iles/0001-HTTP-2-per-iteration-stream-handling-limit.patch
new file mode 100644
index 000000000..7dd1e721c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/0001-HTTP-2-per-iteration-=
stream-handling-limit.patch
@@ -0,0 +1,92 @@
+From 2b9667f36551406169e3e2a6a774466ac70a83c0 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Tue, 10 Oct 2023 15:13:39 +0300
+Subject: [PATCH] HTTP/2: per-iteration stream handling limit.
+
+To ensure that attempts to flood servers with many streams are detected
+early, a limit of no more than 2 * max_concurrent_streams new streams pe=
r one
+event loop iteration was introduced.  This limit is applied even if
+max_concurrent_streams is not yet reached - for example, if correspondin=
g
+streams are handled synchronously or reset.
+
+Further, refused streams are now limited to maximum of max_concurrent_st=
reams
+and 100, similarly to priority_limit initial value, providing some toler=
ance
+to clients trying to open several streams at the connection start, yet
+low tolerance to flooding attempts.
+
+Upstream-Status: Backport
+[https://github.com/nginx/nginx/commit/6ceef192e7af1c507826ac38a2d43f08b=
f265fb9]
+
+Reduces the impact of HTTP/2 Stream Reset flooding in the nginx product
+(CVE-2023-44487).
+
+See: https://www.nginx.com/blog/http-2-rapid-reset-attack-impacting-f5-n=
ginx-products/
+
+This patch only reduces the impact and does not completely mitigate the =
CVE
+in question, the latter being due to a design flaw in the HTTP/2 protoco=
l
+itself. For transparancy reasons I therefore opted to not mark the
+CVE as resolved, so that integrators can decide for themselves, wheither=
 to
+enable HTTP/2 support or allow HTTP/1.1 connections only.
+
+Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
+---
+ src/http/v2/ngx_http_v2.c | 15 +++++++++++++++
+ src/http/v2/ngx_http_v2.h |  2 ++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/src/http/v2/ngx_http_v2.c b/src/http/v2/ngx_http_v2.c
+index 3611a2e50..291677aca 100644
+--- a/src/http/v2/ngx_http_v2.c
++++ b/src/http/v2/ngx_http_v2.c
+@@ -361,6 +361,7 @@ ngx_http_v2_read_handler(ngx_event_t *rev)
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, c->log, 0, "http2 read handler")=
;
+=20
+     h2c->blocked =3D 1;
++    h2c->new_streams =3D 0;
+=20
+     if (c->close) {
+         c->close =3D 0;
+@@ -1320,6 +1321,14 @@ ngx_http_v2_state_headers(ngx_http_v2_connection_=
t *h2c, u_char *pos,
+         goto rst_stream;
+     }
+=20
++    if (h2c->new_streams++ >=3D 2 * h2scf->concurrent_streams) {
++        ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
++                      "client sent too many streams at once");
++
++        status =3D NGX_HTTP_V2_REFUSED_STREAM;
++        goto rst_stream;
++    }
++
+     if (!h2c->settings_ack
+         && !(h2c->state.flags & NGX_HTTP_V2_END_STREAM_FLAG)
+         && h2scf->preread_size < NGX_HTTP_V2_DEFAULT_WINDOW)
+@@ -1385,6 +1394,12 @@ ngx_http_v2_state_headers(ngx_http_v2_connection_=
t *h2c, u_char *pos,
+=20
+ rst_stream:
+=20
++    if (h2c->refused_streams++ > ngx_max(h2scf->concurrent_streams, 100=
)) {
++        ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
++                      "client sent too many refused streams");
++        return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_NO_ERROR);
++    }
++
+     if (ngx_http_v2_send_rst_stream(h2c, h2c->state.sid, status) !=3D N=
GX_OK) {
+         return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_INTERNAL_E=
RROR);
+     }
+diff --git a/src/http/v2/ngx_http_v2.h b/src/http/v2/ngx_http_v2.h
+index 349229711..6a7aaa62c 100644
+--- a/src/http/v2/ngx_http_v2.h
++++ b/src/http/v2/ngx_http_v2.h
+@@ -125,6 +125,8 @@ struct ngx_http_v2_connection_s {
+     ngx_uint_t                       processing;
+     ngx_uint_t                       frames;
+     ngx_uint_t                       idle;
++    ngx_uint_t                       new_streams;
++    ngx_uint_t                       refused_streams;
+     ngx_uint_t                       priority_limit;
+=20
+     ngx_uint_t                       pushing;
+--=20
+2.42.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.20.1.bb
index 09a1b4559..8bed04d6d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
@@ -2,6 +2,7 @@ require nginx.inc
=20
 SRC_URI +=3D "file://CVE-2021-3618.patch \
             file://CVE-2022-41741-CVE-2022-41742.patch \
+            file://0001-HTTP-2-per-iteration-stream-handling-limit.patch=
 \
            "
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D206629dc7c7b3e87acb31162363ae=
505"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.21.1.bb
index b69fd7dab..73b5c93c9 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
@@ -1,5 +1,7 @@
 require nginx.inc
=20
+SRC_URI +=3D "file://0001-HTTP-2-per-iteration-stream-handling-limit.pat=
ch"
+
 # 1.20.x branch is the current stable branch, the recommended default
 # 1.21.x is the current mainline branches containing all new features
 DEFAULT_PREFERENCE =3D "-1"
--=20
2.42.1


