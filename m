Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A443C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 00:04:34 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.100])
 by mx.groups.io with SMTP id smtpd.web10.81810.1701043468285207312
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Nov 2023 16:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=Um0tOWN9;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.100, mailfrom: jasper@fancydomain.eu)
From: jasper@fancydomain.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1701043465;
	bh=ENRMhcdbq8/UotzZ03ooFw43VfRRsXARAadgfOim4nk=;
	h=From:To:Cc:Subject;
	b=Um0tOWN95l9zbKcvo74Ii9i8I9fIe3WRaRH5vUxch4TShZN9PR/ByuNHPm8gux31S
	 QCcM+ll2CZ91WqT4lqZwNv1DCF4kekHv1kzN1IVYAzovyoMHG+bY96N4pGDqtCIer4
	 qMXAvrDxePIVtGaGe5cBdQhN29D392qTR57UZ3DxZ6cSgy9jhO5TWuni+F82c5mBu3
	 xLYyuZg7CyWsuKloWob9Tq2X4iuXA5RcuvRSKKlHzy6fCTV737YSh2qjXXACwfCElD
	 sq3DuTEVZxeDt5DX9n1+vhCx8BNjR8MKa5/iHaFgry0+qQ/+FqOedPeSAyoQGiHn5v
	 nV2YoSnWu4BKw==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-webserver][dunfell][PATCH] nginx: Mitigate HTTP/2 Stream Resets Flood impact
Date: Mon, 27 Nov 2023 01:04:17 +0100
Message-ID: <20231127000417.21555-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 00:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107057

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
 .../recipes-httpd/nginx/nginx_1.16.1.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.17.8.bb       |  2 +
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
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.16.1.bb
index 07e9f6ddb..39cfd3a67 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
@@ -7,4 +7,5 @@ SRC_URI[sha256sum] =3D "f11c2a6dd1d3515736f0324857957db2d=
e98be862461b5a542a3ac6188
=20
 SRC_URI +=3D "file://CVE-2019-20372.patch \
             file://CVE-2022-41741-CVE-2022-41742.patch \
+            file://0001-HTTP-2-per-iteration-stream-handling-limit.patch=
 \
            "
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.17.8.bb
index 3d2a5edd2..9fd6d7342 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.17.8.bb
@@ -8,3 +8,5 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D52e384aaac868b=
755b93ad5535e2d075"
=20
 SRC_URI[md5sum] =3D "29cd861a13aae69a058cbabaae86177b"
 SRC_URI[sha256sum] =3D "97d23ecf6d5150b30e284b40e8a6f7e3bb5be6b601e373a4=
d013768d5a25965b"
+
+SRC_URI +=3D "file://0001-HTTP-2-per-iteration-stream-handling-limit.pat=
ch"
--=20
2.42.1


