Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94620C531FC
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 14:36:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32377.1785162887393520298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 07:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=1JntCf3b;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 080771A1293
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 14:34:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0A6A601BE
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 14:34:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB92611C134D4;
	Mon, 27 Jul 2026 16:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785162880; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RHhE6SyzREdHayJJ2vbNO4y8YZCI2t9M8BPEfmB8wo0=;
	b=1JntCf3bZjLFlSgKCrjYEAAO3F8fVCmciZCUQc206tLCiIItNnB/j5Dg55Qvc1fWeOjdry
	4enIqB/JUoyZO7H2SnxUlu6/U6bWRmwOLIJh3cEfOLGsJP02fI1ey27Ppk/8jJ4Ff5XAQk
	V/IUbN+gSGuuFUOdgbciYVQdf2NzWgFvYqgwVztPFG0auqRSH65MjmO+oZDSPvSUSCjYik
	YfCUEvaN5IZbYNrXIRGrYo2HIO4s1ufShUtWWkHs22lqVtRrOpW2Z35MwLe9yWm8zTiuNy
	AtBkPF2fZcCOU38p+3y+MAitlY1FMCOZ1yggQsdVu4qIDW+KGAfxNBCN3DFQoQ==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	olivier.benjamin@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [meta-webserver][scarthgap][PATCH] nginx: backport fixes for CVE-2026-42533
Date: Mon, 27 Jul 2026 16:34:15 +0200
Message-ID: <20260727143415.1099244-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 14:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128462

The fixes are all part of v1.30.4, as explained in the release notes
[1].

I tested this with the configuration below:

BB_VERSION           =3D "2.8.1"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "fedora-39"
TARGET_SYS           =3D "x86_64-oe-linux"
MACHINE              =3D "qemux86-64"
DISTRO               =3D "nodistro"
DISTRO_VERSION       =3D "nodistro.0"
TUNE_FEATURES        =3D "m64 core2"
TARGET_FPU           =3D ""
meta                 =3D "scarthgap:3217490cc554069ae53aa54cf8ad7327ce85f=
a10"

For more details about the CVE: https://nvd.nist.gov/vuln/detail/CVE-2026=
-42533

[1] https://github.com/nginx/nginx/releases/tag/release-1.30.4

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-42533-1.patch | 126 ++++
 .../nginx/nginx-1.24.0/CVE-2026-42533-2.patch | 381 ++++++++++
 .../nginx/nginx-1.24.0/CVE-2026-42533-3.patch | 704 ++++++++++++++++++
 .../nginx/nginx-1.24.0/CVE-2026-42533-4.patch | 587 +++++++++++++++
 .../nginx/nginx-1.24.0/CVE-2026-42533-5.patch |  55 ++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   5 +
 6 files changed, 1858 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-42533-1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-42533-2.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-42533-3.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-42533-4.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-42533-5.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-425=
33-1.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-425=
33-1.patch
new file mode 100644
index 0000000000..1a068ab2b1
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-1.pa=
tch
@@ -0,0 +1,126 @@
+From 83c522aa1ee2e220bb0113314bd178d377fe5f32 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Fri, 19 Jun 2026 22:54:19 +0300
+Subject: [PATCH] Script: simplified copy capture codes.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Roman Arutyunyan <arut@nginx.com>
+Origin: <https://freenginx.org/hg/nginx/rev/0fd5e6155817>
+
+CVE: CVE-2026-42533
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/ea47fab=
f55e2bc9192ddc27f52486b4e58d5e007]
+Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.c=
osta@bootlin.com>
+---
+ src/http/ngx_http_script.c     | 22 ++++++++++++----------
+ src/stream/ngx_stream_script.c | 10 +++++++---
+ 2 files changed, 19 insertions(+), 13 deletions(-)
+
+diff --git a/src/http/ngx_http_script.c b/src/http/ngx_http_script.c
+index 8a28e23a6..6b33d01dd 100644
+--- a/src/http/ngx_http_script.c
++++ b/src/http/ngx_http_script.c
+@@ -1343,6 +1343,7 @@ ngx_http_script_copy_capture_len_code(ngx_http_scr=
ipt_engine_t *e)
+ {
+     int                                  *cap;
+     u_char                               *p;
++    size_t                                len;
+     ngx_uint_t                            n;
+     ngx_http_request_t                   *r;
+     ngx_http_script_copy_capture_code_t  *code;
+@@ -1358,17 +1359,17 @@ ngx_http_script_copy_capture_len_code(ngx_http_s=
cript_engine_t *e)
+     if (n < r->ncaptures) {
+=20
+         cap =3D r->captures;
++        len =3D cap[n + 1] - cap[n];
+=20
+         if ((e->is_args || e->quote)
+             && (e->request->quoted_uri || e->request->plus_in_uri))
+         {
+-            p =3D r->captures_data;
++            p =3D r->captures_data + cap[n];
++
++            return len + 2 * ngx_escape_uri(NULL, p, len, NGX_ESCAPE_AR=
GS);
+=20
+-            return cap[n + 1] - cap[n]
+-                   + 2 * ngx_escape_uri(NULL, &p[cap[n]], cap[n + 1] - =
cap[n],
+-                                        NGX_ESCAPE_ARGS);
+         } else {
+-            return cap[n + 1] - cap[n];
++            return len;
+         }
+     }
+=20
+@@ -1381,6 +1382,7 @@ ngx_http_script_copy_capture_code(ngx_http_script_=
engine_t *e)
+ {
+     int                                  *cap;
+     u_char                               *p, *pos;
++    size_t                                len;
+     ngx_uint_t                            n;
+     ngx_http_request_t                   *r;
+     ngx_http_script_copy_capture_code_t  *code;
+@@ -1398,16 +1400,16 @@ ngx_http_script_copy_capture_code(ngx_http_scrip=
t_engine_t *e)
+     if (n < r->ncaptures) {
+=20
+         cap =3D r->captures;
+-        p =3D r->captures_data;
++        len =3D cap[n + 1] - cap[n];
++        p =3D r->captures_data + cap[n];
+=20
+         if ((e->is_args || e->quote)
+             && (e->request->quoted_uri || e->request->plus_in_uri))
+         {
+-            e->pos =3D (u_char *) ngx_escape_uri(pos, &p[cap[n]],
+-                                               cap[n + 1] - cap[n],
+-                                               NGX_ESCAPE_ARGS);
++            e->pos =3D (u_char *) ngx_escape_uri(pos, p, len, NGX_ESCAP=
E_ARGS);
++
+         } else {
+-            e->pos =3D ngx_copy(pos, &p[cap[n]], cap[n + 1] - cap[n]);
++            e->pos =3D ngx_copy(pos, p, len);
+         }
+     }
+=20
+diff --git a/src/stream/ngx_stream_script.c b/src/stream/ngx_stream_scri=
pt.c
+index c447e152f..2cd8b08c7 100644
+--- a/src/stream/ngx_stream_script.c
++++ b/src/stream/ngx_stream_script.c
+@@ -894,6 +894,7 @@ size_t
+ ngx_stream_script_copy_capture_len_code(ngx_stream_script_engine_t *e)
+ {
+     int                                    *cap;
++    size_t                                  len;
+     ngx_uint_t                              n;
+     ngx_stream_session_t                   *s;
+     ngx_stream_script_copy_capture_code_t  *code;
+@@ -908,7 +909,8 @@ ngx_stream_script_copy_capture_len_code(ngx_stream_s=
cript_engine_t *e)
+=20
+     if (n < s->ncaptures) {
+         cap =3D s->captures;
+-        return cap[n + 1] - cap[n];
++        len =3D cap[n + 1] - cap[n];
++        return len;
+     }
+=20
+     return 0;
+@@ -920,6 +922,7 @@ ngx_stream_script_copy_capture_code(ngx_stream_scrip=
t_engine_t *e)
+ {
+     int                                    *cap;
+     u_char                                 *p, *pos;
++    size_t                                  len;
+     ngx_uint_t                              n;
+     ngx_stream_session_t                   *s;
+     ngx_stream_script_copy_capture_code_t  *code;
+@@ -936,8 +939,9 @@ ngx_stream_script_copy_capture_code(ngx_stream_scrip=
t_engine_t *e)
+=20
+     if (n < s->ncaptures) {
+         cap =3D s->captures;
+-        p =3D s->captures_data;
+-        e->pos =3D ngx_copy(pos, &p[cap[n]], cap[n + 1] - cap[n]);
++        len =3D cap[n + 1] - cap[n];
++        p =3D s->captures_data + cap[n];
++        e->pos =3D ngx_copy(pos, p, len);
+     }
+=20
+     ngx_log_debug2(NGX_LOG_DEBUG_STREAM, e->session->connection->log, 0=
,
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-425=
33-2.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-425=
33-2.patch
new file mode 100644
index 0000000000..e6f8ee5b24
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-2.pa=
tch
@@ -0,0 +1,381 @@
+From dc860b2f390bff85aec9c88485846d9429ee5208 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Fri, 19 Jun 2026 22:54:27 +0300
+Subject: [PATCH] Script: buffer overrun protection.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+With this change, all script copy operations now check if there is
+enough room in the buffer.  To do so, the script engine now provides the
+e->end pointer, which specifies expected buffer end, and each copy
+operation is checked against it with the ngx_http_script_check_length()
+function.
+
+The e->end pointer is optional and only checked when set, thus
+introducing no incompatible API changes.  All standard functions were
+updated to use it, notably ngx_http_complex_value(), ngx_http_script_run=
(),
+ngx_http_script_regex_start_code(), ngx_http_script_complex_value_code()=
.
+Direct script evaluation in the proxy, fastcgi, scgi, uwsgi, grpc proxy,
+index, and try_files modules will be updated by a separate patch.
+
+In particular, this catches issues as observed when evaluating variables
+with side effects, such as in the following configuration:
+
+    map $uri $map {
+        ~(?<capture>.*) $capture;
+    }
+
+    set $capture "";
+    set $temp "$capture $map";
+
+As well as when evaluating non-cacheable variables, where length of a
+variable might change between length and copy codes, such as in the
+following configuration:
+
+    map prefix:$capture $map_volatile {
+        volatile;
+        ~(?<capture>.*) $capture;
+    }
+
+    set $capture "";
+    set $temp "$map_volatile";
+
+Similar changes were made in the stream module.
+
+Signed-off-by: Roman Arutyunyan <arut@nginx.com>
+Origin: <https://freenginx.org/hg/nginx/rev/d172f506ab5f>
+
+CVE: CVE-2026-42533
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/7ac6789=
8bdfed2140a1bedcda252074cca11f494]
+Signed-off-by: Olivier Benjamin (Schneider Electric) <olivier.benjamin@b=
ootlin.com>
+Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.c=
osta@bootlin.com>
+---
+ src/http/ngx_http_script.c     | 63 ++++++++++++++++++++++++++++++++++
+ src/http/ngx_http_script.h     |  4 +++
+ src/stream/ngx_stream_script.c | 45 ++++++++++++++++++++++++
+ src/stream/ngx_stream_script.h |  5 +++
+ 4 files changed, 117 insertions(+)
+
+diff --git a/src/http/ngx_http_script.c b/src/http/ngx_http_script.c
+index 6b33d01dd..d3af4408d 100644
+--- a/src/http/ngx_http_script.c
++++ b/src/http/ngx_http_script.c
+@@ -92,12 +92,17 @@ ngx_http_complex_value(ngx_http_request_t *r, ngx_ht=
tp_complex_value_t *val,
+     e.ip =3D val->values;
+     e.pos =3D value->data;
+     e.buf =3D *value;
++    e.end =3D value->data + len;
+=20
+     while (*(uintptr_t *) e.ip) {
+         code =3D *(ngx_http_script_code_pt *) e.ip;
+         code((ngx_http_script_engine_t *) &e);
+     }
+=20
++    if (e.status) {
++        return NGX_ERROR;
++    }
++
+     *value =3D e.buf;
+=20
+     return NGX_OK;
+@@ -650,12 +655,17 @@ ngx_http_script_run(ngx_http_request_t *r, ngx_str=
_t *value,
+=20
+     e.ip =3D code_values;
+     e.pos =3D value->data;
++    e.end =3D value->data + len;
+=20
+     while (*(uintptr_t *) e.ip) {
+         code =3D *(ngx_http_script_code_pt *) e.ip;
+         code((ngx_http_script_engine_t *) &e);
+     }
+=20
++    if (e.status) {
++        return NULL;
++    }
++
+     return e.pos;
+ }
+=20
+@@ -805,6 +815,25 @@ ngx_http_script_add_code(ngx_array_t *codes, size_t=
 size, void *code)
+ }
+=20
+=20
++ngx_int_t
++ngx_http_script_check_length(ngx_http_script_engine_t *e, size_t len)
++{
++    if (e->end =3D=3D NULL) {
++        return NGX_OK;
++    }
++
++    if (e->end - e->pos < (ssize_t) len) {
++        ngx_log_error(NGX_LOG_ALERT, e->request->connection->log, 0,
++                      "no buffer space in script copy");
++        e->ip =3D ngx_http_script_exit;
++        e->status =3D NGX_HTTP_INTERNAL_SERVER_ERROR;
++        return NGX_ERROR;
++    }
++
++    return NGX_OK;
++}
++
++
+ static ngx_int_t
+ ngx_http_script_add_copy_code(ngx_http_script_compile_t *sc, ngx_str_t =
*value,
+     ngx_uint_t last)
+@@ -873,6 +902,11 @@ ngx_http_script_copy_code(ngx_http_script_engine_t =
*e)
+     p =3D e->pos;
+=20
+     if (!e->skip) {
++
++        if (ngx_http_script_check_length(e, code->len) !=3D NGX_OK) {
++            return;
++        }
++
+         e->pos =3D ngx_copy(p, e->ip + sizeof(ngx_http_script_copy_code=
_t),
+                           code->len);
+     }
+@@ -976,6 +1010,11 @@ ngx_http_script_copy_var_code(ngx_http_script_engi=
ne_t *e)
+         }
+=20
+         if (value && !value->not_found) {
++
++            if (ngx_http_script_check_length(e, value->len) !=3D NGX_OK=
) {
++                return;
++            }
++
+             p =3D e->pos;
+             e->pos =3D ngx_copy(p, value->data, value->len);
+=20
+@@ -1192,6 +1231,7 @@ ngx_http_script_regex_start_code(ngx_http_script_e=
ngine_t *e)
+     e->quote =3D code->redirect;
+=20
+     e->pos =3D e->buf.data;
++    e->end =3D e->buf.data + e->buf.len;
+=20
+     e->ip +=3D sizeof(ngx_http_script_regex_code_t);
+ }
+@@ -1229,6 +1269,11 @@ ngx_http_script_regex_end_code(ngx_http_script_en=
gine_t *e)
+         e->pos =3D dst;
+=20
+         if (code->add_args && r->args.len) {
++
++            if (ngx_http_script_check_length(e, r->args.len + 1) !=3D N=
GX_OK) {
++                return;
++            }
++
+             *e->pos++ =3D (u_char) (code->args ? '&' : '?');
+             e->pos =3D ngx_copy(e->pos, r->args.data, r->args.len);
+         }
+@@ -1262,6 +1307,11 @@ ngx_http_script_regex_end_code(ngx_http_script_en=
gine_t *e)
+         e->buf.len =3D e->args - e->buf.data;
+=20
+         if (code->add_args && r->args.len) {
++
++            if (ngx_http_script_check_length(e, r->args.len + 1) !=3D N=
GX_OK) {
++                return;
++            }
++
+             *e->pos++ =3D '&';
+             e->pos =3D ngx_copy(e->pos, r->args.data, r->args.len);
+         }
+@@ -1383,6 +1433,7 @@ ngx_http_script_copy_capture_code(ngx_http_script_=
engine_t *e)
+     int                                  *cap;
+     u_char                               *p, *pos;
+     size_t                                len;
++    uintptr_t                             escape;
+     ngx_uint_t                            n;
+     ngx_http_request_t                   *r;
+     ngx_http_script_copy_capture_code_t  *code;
+@@ -1406,9 +1457,20 @@ ngx_http_script_copy_capture_code(ngx_http_script=
_engine_t *e)
+         if ((e->is_args || e->quote)
+             && (e->request->quoted_uri || e->request->plus_in_uri))
+         {
++            escape =3D 2 * ngx_escape_uri(NULL, p, len, NGX_ESCAPE_ARGS=
);
++
++            if (ngx_http_script_check_length(e, len + escape) !=3D NGX_=
OK) {
++                return;
++            }
++
+             e->pos =3D (u_char *) ngx_escape_uri(pos, p, len, NGX_ESCAP=
E_ARGS);
+=20
+         } else {
++
++            if (ngx_http_script_check_length(e, len) !=3D NGX_OK) {
++                return;
++            }
++
+             e->pos =3D ngx_copy(pos, p, len);
+         }
+     }
+@@ -1792,6 +1854,7 @@ ngx_http_script_complex_value_code(ngx_http_script=
_engine_t *e)
+     }
+=20
+     e->pos =3D e->buf.data;
++    e->end =3D e->buf.data + len;
+=20
+     e->sp->len =3D e->buf.len;
+     e->sp->data =3D e->buf.data;
+diff --git a/src/http/ngx_http_script.h b/src/http/ngx_http_script.h
+index 43600383c..b086b266f 100644
+--- a/src/http/ngx_http_script.h
++++ b/src/http/ngx_http_script.h
+@@ -17,6 +17,7 @@
+ typedef struct {
+     u_char                     *ip;
+     u_char                     *pos;
++    u_char                     *end;
+     ngx_http_variable_value_t  *sp;
+=20
+     ngx_str_t                   buf;
+@@ -240,6 +241,9 @@ void *ngx_http_script_start_code(ngx_pool_t *pool, n=
gx_array_t **codes,
+     size_t size);
+ void *ngx_http_script_add_code(ngx_array_t *codes, size_t size, void *c=
ode);
+=20
++ngx_int_t ngx_http_script_check_length(ngx_http_script_engine_t *e,
++    size_t len);
++
+ size_t ngx_http_script_copy_len_code(ngx_http_script_engine_t *e);
+ void ngx_http_script_copy_code(ngx_http_script_engine_t *e);
+ size_t ngx_http_script_copy_var_len_code(ngx_http_script_engine_t *e);
+diff --git a/src/stream/ngx_stream_script.c b/src/stream/ngx_stream_scri=
pt.c
+index 2cd8b08c7..2e31102df 100644
+--- a/src/stream/ngx_stream_script.c
++++ b/src/stream/ngx_stream_script.c
+@@ -92,6 +92,7 @@ ngx_stream_complex_value(ngx_stream_session_t *s,
+=20
+     e.ip =3D val->values;
+     e.pos =3D value->data;
++    e.end =3D value->data + len;
+     e.buf =3D *value;
+=20
+     while (*(uintptr_t *) e.ip) {
+@@ -99,6 +100,10 @@ ngx_stream_complex_value(ngx_stream_session_t *s,
+         code((ngx_stream_script_engine_t *) &e);
+     }
+=20
++    if (e.status) {
++        return NGX_ERROR;
++    }
++
+     *value =3D e.buf;
+=20
+     return NGX_OK;
+@@ -526,12 +531,17 @@ ngx_stream_script_run(ngx_stream_session_t *s, ngx=
_str_t *value,
+=20
+     e.ip =3D code_values;
+     e.pos =3D value->data;
++    e.end =3D value->data + len;
+=20
+     while (*(uintptr_t *) e.ip) {
+         code =3D *(ngx_stream_script_code_pt *) e.ip;
+         code((ngx_stream_script_engine_t *) &e);
+     }
+=20
++    if (e.status) {
++        return NULL;
++    }
++
+     return e.pos;
+ }
+=20
+@@ -668,6 +678,25 @@ ngx_stream_script_add_code(ngx_array_t *codes, size=
_t size, void *code)
+ }
+=20
+=20
++ngx_int_t
++ngx_stream_script_check_length(ngx_stream_script_engine_t *e, size_t le=
n)
++{
++    if (e->end =3D=3D NULL) {
++        return NGX_OK;
++    }
++
++    if (e->end - e->pos < (ssize_t) len) {
++        ngx_log_error(NGX_LOG_ALERT, e->session->connection->log, 0,
++                      "no buffer space in script copy");
++        e->ip =3D ngx_stream_script_exit;
++        e->status =3D NGX_STREAM_INTERNAL_SERVER_ERROR;
++        return NGX_ERROR;
++    }
++
++    return NGX_OK;
++}
++
++
+ static ngx_int_t
+ ngx_stream_script_add_copy_code(ngx_stream_script_compile_t *sc,
+     ngx_str_t *value, ngx_uint_t last)
+@@ -737,6 +766,11 @@ ngx_stream_script_copy_code(ngx_stream_script_engin=
e_t *e)
+     p =3D e->pos;
+=20
+     if (!e->skip) {
++
++        if (ngx_stream_script_check_length(e, code->len) !=3D NGX_OK) {
++            return;
++        }
++
+         e->pos =3D ngx_copy(p, e->ip + sizeof(ngx_stream_script_copy_co=
de_t),
+                           code->len);
+     }
+@@ -841,6 +875,11 @@ ngx_stream_script_copy_var_code(ngx_stream_script_e=
ngine_t *e)
+         }
+=20
+         if (value && !value->not_found) {
++
++            if (ngx_stream_script_check_length(e, value->len) !=3D NGX_=
OK) {
++                return;
++            }
++
+             p =3D e->pos;
+             e->pos =3D ngx_copy(p, value->data, value->len);
+=20
+@@ -941,6 +980,11 @@ ngx_stream_script_copy_capture_code(ngx_stream_scri=
pt_engine_t *e)
+         cap =3D s->captures;
+         len =3D cap[n + 1] - cap[n];
+         p =3D s->captures_data + cap[n];
++
++        if (ngx_stream_script_check_length(e, len) !=3D NGX_OK) {
++            return;
++        }
++
+         e->pos =3D ngx_copy(pos, p, len);
+     }
+=20
+@@ -1013,6 +1057,7 @@ ngx_stream_script_full_name_code(ngx_stream_script=
_engine_t *e)
+         !=3D NGX_OK)
+     {
+         e->ip =3D ngx_stream_script_exit;
++        e->status =3D NGX_STREAM_INTERNAL_SERVER_ERROR;
+         return;
+     }
+=20
+diff --git a/src/stream/ngx_stream_script.h b/src/stream/ngx_stream_scri=
pt.h
+index d8f374047..dc6de9c72 100644
+--- a/src/stream/ngx_stream_script.h
++++ b/src/stream/ngx_stream_script.h
+@@ -17,6 +17,7 @@
+ typedef struct {
+     u_char                       *ip;
+     u_char                       *pos;
++    u_char                       *end;
+     ngx_stream_variable_value_t  *sp;
+=20
+     ngx_str_t                     buf;
+@@ -25,6 +26,7 @@ typedef struct {
+     unsigned                      flushed:1;
+     unsigned                      skip:1;
+=20
++    ngx_int_t                     status;
+     ngx_stream_session_t         *session;
+ } ngx_stream_script_engine_t;
+=20
+@@ -127,6 +129,9 @@ void ngx_stream_script_flush_no_cacheable_variables(=
ngx_stream_session_t *s,
+=20
+ void *ngx_stream_script_add_code(ngx_array_t *codes, size_t size, void =
*code);
+=20
++ngx_int_t ngx_stream_script_check_length(ngx_stream_script_engine_t *e,
++    size_t len);
++
+ size_t ngx_stream_script_copy_len_code(ngx_stream_script_engine_t *e);
+ void ngx_stream_script_copy_code(ngx_stream_script_engine_t *e);
+ size_t ngx_stream_script_copy_var_len_code(ngx_stream_script_engine_t *=
e);
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-425=
33-3.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-425=
33-3.patch
new file mode 100644
index 0000000000..7e9136c71a
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-3.pa=
tch
@@ -0,0 +1,704 @@
+From 90be2e777b6eeb9ea92f99330bb250b8f035317e Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Fri, 19 Jun 2026 22:55:38 +0300
+Subject: [PATCH] Access log: buffer overrun protection.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Similarly to generic script operations, access log script copy operation=
s
+now check if there is enough room in the buffer.
+
+Signed-off-by: Roman Arutyunyan <arut@nginx.com>
+Origin: <https://freenginx.org/hg/nginx/rev/ceff7ca7785a>
+
+CVE: CVE-2026-42533
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/78950bd=
cd443830bde00f6844dba3033c18862b1]
+Signed-off-by: Olivier Benjamin (Schneider Electric) <olivier.benjamin@b=
ootlin.com>
+Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.c=
osta@bootlin.com>
+---
+ src/http/modules/ngx_http_log_module.c | 185 ++++++++++++++++++++-----
+ src/stream/ngx_stream_log_module.c     | 101 +++++++++++---
+ 2 files changed, 235 insertions(+), 51 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_log_module.c b/src/http/modules/n=
gx_http_log_module.c
+index f7c4bd2f5..d282362ea 100644
+--- a/src/http/modules/ngx_http_log_module.c
++++ b/src/http/modules/ngx_http_log_module.c
+@@ -17,7 +17,7 @@
+ typedef struct ngx_http_log_op_s  ngx_http_log_op_t;
+=20
+ typedef u_char *(*ngx_http_log_op_run_pt) (ngx_http_request_t *r, u_cha=
r *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+=20
+ typedef size_t (*ngx_http_log_op_getlen_pt) (ngx_http_request_t *r,
+     uintptr_t data);
+@@ -112,39 +112,42 @@ static void ngx_http_log_flush(ngx_open_file_t *fi=
le, ngx_log_t *log);
+ static void ngx_http_log_flush_handler(ngx_event_t *ev);
+=20
+ static u_char *ngx_http_log_pipe(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_time(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_iso8601(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_msec(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_request_time(ngx_http_request_t *r, u_char =
*buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_status(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_bytes_sent(ngx_http_request_t *r, u_char *b=
uf,
+-    ngx_http_log_op_t *op);
+-static u_char *ngx_http_log_body_bytes_sent(ngx_http_request_t *r,
+-    u_char *buf, ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
++static u_char *ngx_http_log_body_bytes_sent(ngx_http_request_t *r, u_ch=
ar *buf,
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_request_length(ngx_http_request_t *r, u_cha=
r *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+=20
+ static ngx_int_t ngx_http_log_variable_compile(ngx_conf_t *cf,
+     ngx_http_log_op_t *op, ngx_str_t *value, ngx_uint_t escape);
+ static size_t ngx_http_log_variable_getlen(ngx_http_request_t *r,
+     uintptr_t data);
+ static u_char *ngx_http_log_variable(ngx_http_request_t *r, u_char *buf=
,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static uintptr_t ngx_http_log_escape(u_char *dst, u_char *src, size_t s=
ize);
+ static size_t ngx_http_log_json_variable_getlen(ngx_http_request_t *r,
+     uintptr_t data);
+ static u_char *ngx_http_log_json_variable(ngx_http_request_t *r, u_char=
 *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static size_t ngx_http_log_unescaped_variable_getlen(ngx_http_request_t=
 *r,
+     uintptr_t data);
+ static u_char *ngx_http_log_unescaped_variable(ngx_http_request_t *r,
+-    u_char *buf, ngx_http_log_op_t *op);
++    u_char *buf, u_char *end, ngx_http_log_op_t *op);
++
++static ngx_int_t ngx_http_log_check_length(ngx_http_request_t *r,
++    u_char *buf, u_char *end, size_t len);
+=20
+=20
+ static void *ngx_http_log_create_main_conf(ngx_conf_t *cf);
+@@ -253,7 +256,7 @@ static ngx_http_log_var_t  ngx_http_log_vars[] =3D {
+ static ngx_int_t
+ ngx_http_log_handler(ngx_http_request_t *r)
+ {
+-    u_char                   *line, *p;
++    u_char                   *line, *p, *end;
+     size_t                    len, size;
+     ssize_t                   n;
+     ngx_str_t                 val;
+@@ -309,6 +312,8 @@ ngx_http_log_handler(ngx_http_request_t *r)
+             }
+         }
+=20
++        len +=3D NGX_LINEFEED_SIZE;
++
+         if (log[l].syslog_peer) {
+=20
+             /* length of syslog's PRI and HEADER message parts */
+@@ -319,8 +324,6 @@ ngx_http_log_handler(ngx_http_request_t *r)
+             goto alloc_line;
+         }
+=20
+-        len +=3D NGX_LINEFEED_SIZE;
+-
+         buffer =3D log[l].file ? log[l].file->data : NULL;
+=20
+         if (buffer) {
+@@ -336,13 +339,18 @@ ngx_http_log_handler(ngx_http_request_t *r)
+             if (len <=3D (size_t) (buffer->last - buffer->pos)) {
+=20
+                 p =3D buffer->pos;
++                end =3D p + len - NGX_LINEFEED_SIZE;
+=20
+                 if (buffer->event && p =3D=3D buffer->start) {
+                     ngx_add_timer(buffer->event, buffer->flush);
+                 }
+=20
+-                for (i =3D 0; i < log[l].format->ops->nelts; i++) {
+-                    p =3D op[i].run(r, p, &op[i]);
++                for (i =3D 0; i < log[l].format->ops->nelts && p; i++) =
{
++                    p =3D op[i].run(r, p, end, &op[i]);
++                }
++
++                if (p =3D=3D NULL) {
++                    return NGX_ERROR;
+                 }
+=20
+                 ngx_linefeed(p);
+@@ -365,13 +373,18 @@ ngx_http_log_handler(ngx_http_request_t *r)
+         }
+=20
+         p =3D line;
++        end =3D line + len - NGX_LINEFEED_SIZE;
+=20
+         if (log[l].syslog_peer) {
+             p =3D ngx_syslog_add_header(log[l].syslog_peer, line);
+         }
+=20
+-        for (i =3D 0; i < log[l].format->ops->nelts; i++) {
+-            p =3D op[i].run(r, p, &op[i]);
++        for (i =3D 0; i < log[l].format->ops->nelts && p; i++) {
++            p =3D op[i].run(r, p, end, &op[i]);
++        }
++
++        if (p =3D=3D NULL) {
++            return NGX_ERROR;
+         }
+=20
+         if (log[l].syslog_peer) {
+@@ -770,7 +783,7 @@ ngx_http_log_flush_handler(ngx_event_t *ev)
+=20
+=20
+ static u_char *
+-ngx_http_log_copy_short(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_copy_short(ngx_http_request_t *r, u_char *buf, u_char *end=
,
+     ngx_http_log_op_t *op)
+ {
+     size_t     len;
+@@ -779,6 +792,10 @@ ngx_http_log_copy_short(ngx_http_request_t *r, u_ch=
ar *buf,
+     len =3D op->len;
+     data =3D op->data;
+=20
++    if (ngx_http_log_check_length(r, buf, end, len) !=3D NGX_OK) {
++        return NULL;
++    }
++
+     while (len--) {
+         *buf++ =3D (u_char) (data & 0xff);
+         data >>=3D 8;
+@@ -789,16 +806,25 @@ ngx_http_log_copy_short(ngx_http_request_t *r, u_c=
har *buf,
+=20
+=20
+ static u_char *
+-ngx_http_log_copy_long(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_copy_long(ngx_http_request_t *r, u_char *buf, u_char *end,
+     ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, op->len) !=3D NGX_OK) {
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, (u_char *) op->data, op->len);
+ }
+=20
+=20
+ static u_char *
+-ngx_http_log_pipe(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t=
 *op)
++ngx_http_log_pipe(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, 1) !=3D NGX_OK) {
++        return NULL;
++    }
++
+     if (r->pipeline) {
+         *buf =3D 'p';
+     } else {
+@@ -810,24 +836,43 @@ ngx_http_log_pipe(ngx_http_request_t *r, u_char *b=
uf, ngx_http_log_op_t *op)
+=20
+=20
+ static u_char *
+-ngx_http_log_time(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t=
 *op)
++ngx_http_log_time(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, ngx_cached_http_log_time=
.len)
++        !=3D NGX_OK)
++    {
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, ngx_cached_http_log_time.data,
+                       ngx_cached_http_log_time.len);
+ }
+=20
+ static u_char *
+-ngx_http_log_iso8601(ngx_http_request_t *r, u_char *buf, ngx_http_log_o=
p_t *op)
++ngx_http_log_iso8601(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, ngx_cached_http_log_iso8=
601.len)
++        !=3D NGX_OK)
++    {
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, ngx_cached_http_log_iso8601.data,
+                       ngx_cached_http_log_iso8601.len);
+ }
+=20
+ static u_char *
+-ngx_http_log_msec(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t=
 *op)
++ngx_http_log_msec(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
+     ngx_time_t  *tp;
+=20
++    if (ngx_http_log_check_length(r, buf, end, NGX_TIME_T_LEN + 4) !=3D=
 NGX_OK) {
++        return NULL;
++    }
++
+     tp =3D ngx_timeofday();
+=20
+     return ngx_sprintf(buf, "%T.%03M", tp->sec, tp->msec);
+@@ -835,12 +880,16 @@ ngx_http_log_msec(ngx_http_request_t *r, u_char *b=
uf, ngx_http_log_op_t *op)
+=20
+=20
+ static u_char *
+-ngx_http_log_request_time(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_request_time(ngx_http_request_t *r, u_char *buf, u_char *e=
nd,
+     ngx_http_log_op_t *op)
+ {
+     ngx_time_t      *tp;
+     ngx_msec_int_t   ms;
+=20
++    if (ngx_http_log_check_length(r, buf, end, NGX_TIME_T_LEN + 4) !=3D=
 NGX_OK) {
++        return NULL;
++    }
++
+     tp =3D ngx_timeofday();
+=20
+     ms =3D (ngx_msec_int_t)
+@@ -852,10 +901,15 @@ ngx_http_log_request_time(ngx_http_request_t *r, u=
_char *buf,
+=20
+=20
+ static u_char *
+-ngx_http_log_status(ngx_http_request_t *r, u_char *buf, ngx_http_log_op=
_t *op)
++ngx_http_log_status(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
+     ngx_uint_t  status;
+=20
++    if (ngx_http_log_check_length(r, buf, end, NGX_INT_T_LEN) !=3D NGX_=
OK) {
++        return NULL;
++    }
++
+     if (r->err_status) {
+         status =3D r->err_status;
+=20
+@@ -874,9 +928,13 @@ ngx_http_log_status(ngx_http_request_t *r, u_char *=
buf, ngx_http_log_op_t *op)
+=20
+=20
+ static u_char *
+-ngx_http_log_bytes_sent(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_bytes_sent(ngx_http_request_t *r, u_char *buf, u_char *end=
,
+     ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, NGX_OFF_T_LEN) !=3D NGX_=
OK) {
++        return NULL;
++    }
++
+     return ngx_sprintf(buf, "%O", r->connection->sent);
+ }
+=20
+@@ -887,11 +945,15 @@ ngx_http_log_bytes_sent(ngx_http_request_t *r, u_c=
har *buf,
+  */
+=20
+ static u_char *
+-ngx_http_log_body_bytes_sent(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_body_bytes_sent(ngx_http_request_t *r, u_char *buf, u_char=
 *end,
+     ngx_http_log_op_t *op)
+ {
+     off_t  length;
+=20
++    if (ngx_http_log_check_length(r, buf, end, NGX_OFF_T_LEN) !=3D NGX_=
OK) {
++        return NULL;
++    }
++
+     length =3D r->connection->sent - r->header_size;
+=20
+     if (length > 0) {
+@@ -905,9 +967,13 @@ ngx_http_log_body_bytes_sent(ngx_http_request_t *r,=
 u_char *buf,
+=20
+=20
+ static u_char *
+-ngx_http_log_request_length(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_request_length(ngx_http_request_t *r, u_char *buf, u_char =
*end,
+     ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, NGX_OFF_T_LEN) !=3D NGX_=
OK) {
++        return NULL;
++    }
++
+     return ngx_sprintf(buf, "%O", r->request_length);
+ }
+=20
+@@ -968,21 +1034,39 @@ ngx_http_log_variable_getlen(ngx_http_request_t *=
r, uintptr_t data)
+=20
+=20
+ static u_char *
+-ngx_http_log_variable(ngx_http_request_t *r, u_char *buf, ngx_http_log_=
op_t *op)
++ngx_http_log_variable(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
++    uintptr_t                   len;
+     ngx_http_variable_value_t  *value;
+=20
+     value =3D ngx_http_get_indexed_variable(r, op->data);
+=20
+     if (value =3D=3D NULL || value->not_found) {
++        if (ngx_http_log_check_length(r, buf, end, 1) !=3D NGX_OK) {
++            return NULL;
++        }
++
+         *buf =3D '-';
+         return buf + 1;
+     }
+=20
+     if (value->escape =3D=3D 0) {
++        if (ngx_http_log_check_length(r, buf, end, value->len) !=3D NGX=
_OK) {
++            return NULL;
++        }
++
+         return ngx_cpymem(buf, value->data, value->len);
+=20
+     } else {
++        len =3D ngx_http_log_escape(NULL, value->data, value->len);
++
++        if (ngx_http_log_check_length(r, buf, end, value->len + len * 3=
)
++            !=3D NGX_OK)
++        {
++            return NULL;
++        }
++
+         return (u_char *) ngx_http_log_escape(buf, value->data, value->=
len);
+     }
+ }
+@@ -1069,9 +1153,10 @@ ngx_http_log_json_variable_getlen(ngx_http_reques=
t_t *r, uintptr_t data)
+=20
+=20
+ static u_char *
+-ngx_http_log_json_variable(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_json_variable(ngx_http_request_t *r, u_char *buf, u_char *=
end,
+     ngx_http_log_op_t *op)
+ {
++    uintptr_t                   len;
+     ngx_http_variable_value_t  *value;
+=20
+     value =3D ngx_http_get_indexed_variable(r, op->data);
+@@ -1081,9 +1166,21 @@ ngx_http_log_json_variable(ngx_http_request_t *r,=
 u_char *buf,
+     }
+=20
+     if (value->escape =3D=3D 0) {
++        if (ngx_http_log_check_length(r, buf, end, value->len) !=3D NGX=
_OK) {
++            return NULL;
++        }
++
+         return ngx_cpymem(buf, value->data, value->len);
+=20
+     } else {
++        len =3D ngx_escape_json(NULL, value->data, value->len);
++
++        if (ngx_http_log_check_length(r, buf, end, value->len + len)
++            !=3D NGX_OK)
++        {
++            return NULL;
++        }
++
+         return (u_char *) ngx_escape_json(buf, value->data, value->len)=
;
+     }
+ }
+@@ -1108,7 +1205,7 @@ ngx_http_log_unescaped_variable_getlen(ngx_http_re=
quest_t *r, uintptr_t data)
+=20
+ static u_char *
+ ngx_http_log_unescaped_variable(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op)
++    u_char *end, ngx_http_log_op_t *op)
+ {
+     ngx_http_variable_value_t  *value;
+=20
+@@ -1118,10 +1215,28 @@ ngx_http_log_unescaped_variable(ngx_http_request=
_t *r, u_char *buf,
+         return buf;
+     }
+=20
++    if (ngx_http_log_check_length(r, buf, end, value->len) !=3D NGX_OK)=
 {
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, value->data, value->len);
+ }
+=20
+=20
++static ngx_int_t
++ngx_http_log_check_length(ngx_http_request_t *r, u_char *buf, u_char *e=
nd,
++    size_t len)
++{
++    if (end - buf < (ssize_t) len) {
++        ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                      "no buffer space in log script copy");
++        return NGX_ERROR;
++    }
++
++    return NGX_OK;
++}
++
++
+ static void *
+ ngx_http_log_create_main_conf(ngx_conf_t *cf)
+ {
+diff --git a/src/stream/ngx_stream_log_module.c b/src/stream/ngx_stream_=
log_module.c
+index 0ff7f4244..774bc7e93 100644
+--- a/src/stream/ngx_stream_log_module.c
++++ b/src/stream/ngx_stream_log_module.c
+@@ -17,7 +17,7 @@
+ typedef struct ngx_stream_log_op_s  ngx_stream_log_op_t;
+=20
+ typedef u_char *(*ngx_stream_log_op_run_pt) (ngx_stream_session_t *s,
+-    u_char *buf, ngx_stream_log_op_t *op);
++    u_char *buf, u_char *end, ngx_stream_log_op_t *op);
+=20
+ typedef size_t (*ngx_stream_log_op_getlen_pt) (ngx_stream_session_t *s,
+     uintptr_t data);
+@@ -115,16 +115,19 @@ static ngx_int_t ngx_stream_log_variable_compile(n=
gx_conf_t *cf,
+ static size_t ngx_stream_log_variable_getlen(ngx_stream_session_t *s,
+     uintptr_t data);
+ static u_char *ngx_stream_log_variable(ngx_stream_session_t *s, u_char =
*buf,
+-    ngx_stream_log_op_t *op);
++    u_char *end, ngx_stream_log_op_t *op);
+ static uintptr_t ngx_stream_log_escape(u_char *dst, u_char *src, size_t=
 size);
+ static size_t ngx_stream_log_json_variable_getlen(ngx_stream_session_t =
*s,
+     uintptr_t data);
+ static u_char *ngx_stream_log_json_variable(ngx_stream_session_t *s,
+-    u_char *buf, ngx_stream_log_op_t *op);
++    u_char *buf, u_char *end, ngx_stream_log_op_t *op);
+ static size_t ngx_stream_log_unescaped_variable_getlen(ngx_stream_sessi=
on_t *s,
+     uintptr_t data);
+ static u_char *ngx_stream_log_unescaped_variable(ngx_stream_session_t *=
s,
+-    u_char *buf, ngx_stream_log_op_t *op);
++    u_char *buf, u_char *end, ngx_stream_log_op_t *op);
++
++static ngx_int_t ngx_stream_log_check_length(ngx_stream_session_t *s,
++    u_char *buf, u_char *end, size_t len);
+=20
+=20
+ static void *ngx_stream_log_create_main_conf(ngx_conf_t *cf);
+@@ -200,7 +203,7 @@ ngx_module_t  ngx_stream_log_module =3D {
+ static ngx_int_t
+ ngx_stream_log_handler(ngx_stream_session_t *s)
+ {
+-    u_char                     *line, *p;
++    u_char                     *line, *p, *end;
+     size_t                      len, size;
+     ssize_t                     n;
+     ngx_str_t                   val;
+@@ -257,6 +260,8 @@ ngx_stream_log_handler(ngx_stream_session_t *s)
+             }
+         }
+=20
++        len +=3D NGX_LINEFEED_SIZE;
++
+         if (log[l].syslog_peer) {
+=20
+             /* length of syslog's PRI and HEADER message parts */
+@@ -267,8 +272,6 @@ ngx_stream_log_handler(ngx_stream_session_t *s)
+             goto alloc_line;
+         }
+=20
+-        len +=3D NGX_LINEFEED_SIZE;
+-
+         buffer =3D log[l].file ? log[l].file->data : NULL;
+=20
+         if (buffer) {
+@@ -284,13 +287,18 @@ ngx_stream_log_handler(ngx_stream_session_t *s)
+             if (len <=3D (size_t) (buffer->last - buffer->pos)) {
+=20
+                 p =3D buffer->pos;
++                end =3D p + len - NGX_LINEFEED_SIZE;
+=20
+                 if (buffer->event && p =3D=3D buffer->start) {
+                     ngx_add_timer(buffer->event, buffer->flush);
+                 }
+=20
+-                for (i =3D 0; i < log[l].format->ops->nelts; i++) {
+-                    p =3D op[i].run(s, p, &op[i]);
++                for (i =3D 0; i < log[l].format->ops->nelts && p; i++) =
{
++                    p =3D op[i].run(s, p, end, &op[i]);
++                }
++
++                if (p =3D=3D NULL) {
++                    return NGX_ERROR;
+                 }
+=20
+                 ngx_linefeed(p);
+@@ -313,13 +321,18 @@ ngx_stream_log_handler(ngx_stream_session_t *s)
+         }
+=20
+         p =3D line;
++        end =3D p + len - NGX_LINEFEED_SIZE;
+=20
+         if (log[l].syslog_peer) {
+             p =3D ngx_syslog_add_header(log[l].syslog_peer, line);
+         }
+=20
+-        for (i =3D 0; i < log[l].format->ops->nelts; i++) {
+-            p =3D op[i].run(s, p, &op[i]);
++        for (i =3D 0; i < log[l].format->ops->nelts && p; i++) {
++            p =3D op[i].run(s, p, end, &op[i]);
++        }
++
++        if (p =3D=3D NULL) {
++            return NGX_ERROR;
+         }
+=20
+         if (log[l].syslog_peer) {
+@@ -663,7 +676,7 @@ ngx_stream_log_flush_handler(ngx_event_t *ev)
+=20
+=20
+ static u_char *
+-ngx_stream_log_copy_short(ngx_stream_session_t *s, u_char *buf,
++ngx_stream_log_copy_short(ngx_stream_session_t *s, u_char *buf, u_char =
*end,
+     ngx_stream_log_op_t *op)
+ {
+     size_t     len;
+@@ -672,6 +685,10 @@ ngx_stream_log_copy_short(ngx_stream_session_t *s, =
u_char *buf,
+     len =3D op->len;
+     data =3D op->data;
+=20
++    if (ngx_stream_log_check_length(s, buf, end, len) !=3D NGX_OK) {
++        return NULL;
++    }
++
+     while (len--) {
+         *buf++ =3D (u_char) (data & 0xff);
+         data >>=3D 8;
+@@ -682,9 +699,13 @@ ngx_stream_log_copy_short(ngx_stream_session_t *s, =
u_char *buf,
+=20
+=20
+ static u_char *
+-ngx_stream_log_copy_long(ngx_stream_session_t *s, u_char *buf,
++ngx_stream_log_copy_long(ngx_stream_session_t *s, u_char *buf, u_char *=
end,
+     ngx_stream_log_op_t *op)
+ {
++    if (ngx_stream_log_check_length(s, buf, end, op->len) !=3D NGX_OK) =
{
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, (u_char *) op->data, op->len);
+ }
+=20
+@@ -745,22 +766,39 @@ ngx_stream_log_variable_getlen(ngx_stream_session_=
t *s, uintptr_t data)
+=20
+=20
+ static u_char *
+-ngx_stream_log_variable(ngx_stream_session_t *s, u_char *buf,
++ngx_stream_log_variable(ngx_stream_session_t *s, u_char *buf, u_char *e=
nd,
+     ngx_stream_log_op_t *op)
+ {
++    uintptr_t                     len;
+     ngx_stream_variable_value_t  *value;
+=20
+     value =3D ngx_stream_get_indexed_variable(s, op->data);
+=20
+     if (value =3D=3D NULL || value->not_found) {
++        if (ngx_stream_log_check_length(s, buf, end, 1) !=3D NGX_OK) {
++            return NULL;
++        }
++
+         *buf =3D '-';
+         return buf + 1;
+     }
+=20
+     if (value->escape =3D=3D 0) {
++        if (ngx_stream_log_check_length(s, buf, end, value->len) !=3D N=
GX_OK) {
++            return NULL;
++        }
++
+         return ngx_cpymem(buf, value->data, value->len);
+=20
+     } else {
++        len =3D ngx_stream_log_escape(NULL, value->data, value->len);
++
++        if (ngx_stream_log_check_length(s, buf, end, value->len + len *=
 3)
++            !=3D NGX_OK)
++        {
++            return NULL;
++        }
++
+         return (u_char *) ngx_stream_log_escape(buf, value->data, value=
->len);
+     }
+ }
+@@ -847,9 +885,10 @@ ngx_stream_log_json_variable_getlen(ngx_stream_sess=
ion_t *s, uintptr_t data)
+=20
+=20
+ static u_char *
+-ngx_stream_log_json_variable(ngx_stream_session_t *s, u_char *buf,
++ngx_stream_log_json_variable(ngx_stream_session_t *s, u_char *buf, u_ch=
ar *end,
+     ngx_stream_log_op_t *op)
+ {
++    uintptr_t                     len;
+     ngx_stream_variable_value_t  *value;
+=20
+     value =3D ngx_stream_get_indexed_variable(s, op->data);
+@@ -859,9 +898,21 @@ ngx_stream_log_json_variable(ngx_stream_session_t *=
s, u_char *buf,
+     }
+=20
+     if (value->escape =3D=3D 0) {
++        if (ngx_stream_log_check_length(s, buf, end, value->len) !=3D N=
GX_OK) {
++            return NULL;
++        }
++
+         return ngx_cpymem(buf, value->data, value->len);
+=20
+     } else {
++        len =3D ngx_escape_json(NULL, value->data, value->len);
++
++        if (ngx_stream_log_check_length(s, buf, end, value->len + len)
++            !=3D NGX_OK)
++        {
++            return NULL;
++        }
++
+         return (u_char *) ngx_escape_json(buf, value->data, value->len)=
;
+     }
+ }
+@@ -887,7 +938,7 @@ ngx_stream_log_unescaped_variable_getlen(ngx_stream_=
session_t *s,
+=20
+ static u_char *
+ ngx_stream_log_unescaped_variable(ngx_stream_session_t *s, u_char *buf,
+-                                  ngx_stream_log_op_t *op)
++    u_char *end, ngx_stream_log_op_t *op)
+ {
+     ngx_stream_variable_value_t  *value;
+=20
+@@ -897,10 +948,28 @@ ngx_stream_log_unescaped_variable(ngx_stream_sessi=
on_t *s, u_char *buf,
+         return buf;
+     }
+=20
++    if (ngx_stream_log_check_length(s, buf, end, value->len) !=3D NGX_O=
K) {
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, value->data, value->len);
+ }
+=20
+=20
++static ngx_int_t
++ngx_stream_log_check_length(ngx_stream_session_t *s, u_char *buf, u_cha=
r *end,
++    size_t len)
++{
++    if (end - buf < (ssize_t) len) {
++        ngx_log_error(NGX_LOG_ALERT, s->connection->log, 0,
++                      "no buffer space in log script copy");
++        return NGX_ERROR;
++    }
++
++    return NGX_OK;
++}
++
++
+ static void *
+ ngx_stream_log_create_main_conf(ngx_conf_t *cf)
+ {
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-425=
33-4.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-425=
33-4.patch
new file mode 100644
index 0000000000..502fe510db
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-4.pa=
tch
@@ -0,0 +1,587 @@
+From f44753caa8d69590e40ddeb1ffbc4750d47e0a79 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Fri, 19 Jun 2026 22:54:46 +0300
+Subject: [PATCH] Script: buffer overrun protection in direct script usag=
e.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Following the previous change, this change adds script overrun
+protection to direct script evaluation in the proxy, fastcgi, scgi,
+uwsgi, grpc proxy, index, and try_files modules.
+
+This change is a modified version of a patch by Maxim Dounin.  The
+modifications include ngx_http_proxy_v2_module and hardened size checks.
+
+Signed-off-by: Roman Arutyunyan <arut@nginx.com>
+Origin: <https://freenginx.org/hg/nginx/rev/7e4d7feb4c77>
+
+CVE: CVE-2026-42533
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/326b17b=
0038321c29252e79bf4c53d4773fcb8b5]
+
+[JM: nginx v1.24.0 does not provide ngx_http_proxy_v2_module.c, so I
+removed the corresponding hunk from the original commit]
+
+Signed-off-by: Olivier Benjamin (Schneider Electric) <olivier.benjamin@b=
ootlin.com>
+Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.c=
osta@bootlin.com>
+---
+ src/http/modules/ngx_http_fastcgi_module.c   | 26 ++++++++--
+ src/http/modules/ngx_http_grpc_module.c      | 52 ++++++++++++++++++--
+ src/http/modules/ngx_http_index_module.c     | 13 ++++-
+ src/http/modules/ngx_http_proxy_module.c     | 31 ++++++++++--
+ src/http/modules/ngx_http_scgi_module.c      | 27 +++++++++-
+ src/http/modules/ngx_http_try_files_module.c | 17 ++++++-
+ src/http/modules/ngx_http_uwsgi_module.c     | 30 ++++++++++-
+ 7 files changed, 180 insertions(+), 16 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_fastcgi_module.c b/src/http/modul=
es/ngx_http_fastcgi_module.c
+index 2d9a18f90..db406b5cd 100644
+--- a/src/http/modules/ngx_http_fastcgi_module.c
++++ b/src/http/modules/ngx_http_fastcgi_module.c
+@@ -836,8 +836,8 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *=
r)
+ {
+     off_t                         file_pos;
+     u_char                        ch, sep, *pos, *lowcase_key;
+-    size_t                        size, len, key_len, val_len, padding,
+-                                  allocated;
++    size_t                        size, len, params_len,
++                                  key_len, val_len, padding, allocated;
+     ngx_uint_t                    i, n, next, hash, skip_empty, header_=
params;
+     ngx_buf_t                    *b;
+     ngx_chain_t                  *cl, *body;
+@@ -852,6 +852,7 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *=
r)
+     ngx_http_script_len_code_pt   lcode;
+=20
+     len =3D 0;
++    params_len =3D 0;
+     header_params =3D 0;
+     ignored =3D NULL;
+=20
+@@ -891,8 +892,10 @@ ngx_http_fastcgi_create_request(ngx_http_request_t =
*r)
+                 continue;
+             }
+=20
+-            len +=3D 1 + key_len + ((val_len > 127) ? 4 : 1) + val_len;
++            params_len +=3D 1 + key_len + ((val_len > 127) ? 4 : 1) + v=
al_len;
+         }
++
++        len +=3D params_len;
+     }
+=20
+     if (flcf->upstream.pass_request_headers) {
+@@ -1048,6 +1051,7 @@ ngx_http_fastcgi_create_request(ngx_http_request_t=
 *r)
+=20
+         e.ip =3D params->values->elts;
+         e.pos =3D b->last;
++        e.end =3D b->last + params_len;
+         e.request =3D r;
+         e.flushed =3D 1;
+=20
+@@ -1080,6 +1084,12 @@ ngx_http_fastcgi_create_request(ngx_http_request_=
t *r)
+                 continue;
+             }
+=20
++            if (ngx_http_script_check_length(&e, 1 + ((val_len > 127) ?=
 4 : 1))
++                !=3D NGX_OK)
++            {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ =3D (u_char) key_len;
+=20
+             if (val_len > 127) {
+@@ -1098,12 +1108,22 @@ ngx_http_fastcgi_create_request(ngx_http_request=
_t *r)
+             }
+             e.ip +=3D sizeof(uintptr_t);
+=20
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
+             ngx_log_debug4(NGX_LOG_DEBUG_HTTP, r->connection->log, 0,
+                            "fastcgi param: \"%*s: %*s\"",
+                            key_len, e.pos - (key_len + val_len),
+                            val_len, e.pos - val_len);
+         }
+=20
++        if (e.pos !=3D e.end) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "fastcgi request length mismatch");
++            return NGX_ERROR;
++        }
++
+         b->last =3D e.pos;
+     }
+=20
+diff --git a/src/http/modules/ngx_http_grpc_module.c b/src/http/modules/=
ngx_http_grpc_module.c
+index f7473b11a..165fd5d38 100644
+--- a/src/http/modules/ngx_http_grpc_module.c
++++ b/src/http/modules/ngx_http_grpc_module.c
+@@ -708,8 +708,10 @@ ngx_http_grpc_eval(ngx_http_request_t *r, ngx_http_=
grpc_ctx_t *ctx,
+ static ngx_int_t
+ ngx_http_grpc_create_request(ngx_http_request_t *r)
+ {
+-    u_char                       *p, *tmp, *key_tmp, *val_tmp, *headers=
_frame;
+-    size_t                        len, tmp_len, key_len, val_len, uri_l=
en;
++    u_char                       *p, *tmp, *key_tmp, *val_tmp, *headers=
_frame,
++                                 *headers_end;
++    size_t                        len, headers_len, tmp_len,
++                                  key_len, val_len, uri_len;
+     uintptr_t                     escape;
+     ngx_buf_t                    *b;
+     ngx_uint_t                    i, next;
+@@ -733,6 +735,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+     len =3D sizeof(ngx_http_grpc_connection_start) - 1
+           + sizeof(ngx_http_grpc_frame_t);             /* headers frame=
 */
+=20
++    headers_len =3D 0;
++
+     /* :method header */
+=20
+     if (r->method =3D=3D NGX_HTTP_GET || r->method =3D=3D NGX_HTTP_POST=
) {
+@@ -829,8 +833,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+             return NGX_ERROR;
+         }
+=20
+-        len +=3D 1 + NGX_HTTP_V2_INT_OCTETS + key_len
+-                 + NGX_HTTP_V2_INT_OCTETS + val_len;
++        headers_len +=3D 1 + NGX_HTTP_V2_INT_OCTETS + key_len
++                         + NGX_HTTP_V2_INT_OCTETS + val_len;
+=20
+         if (tmp_len < key_len) {
+             tmp_len =3D key_len;
+@@ -841,6 +845,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+         }
+     }
+=20
++    len +=3D headers_len;
++
+     if (glcf->upstream.pass_request_headers) {
+         part =3D &r->headers_in.headers.part;
+         header =3D part->elts;
+@@ -1037,6 +1043,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r=
)
+=20
+     le.ip =3D glcf->headers.lengths->elts;
+=20
++    headers_end =3D b->last + headers_len;
++
+     while (*(uintptr_t *) le.ip) {
+=20
+         lcode =3D *(ngx_http_script_len_code_pt *) le.ip;
+@@ -1061,16 +1069,38 @@ ngx_http_grpc_create_request(ngx_http_request_t =
*r)
+             continue;
+         }
+=20
++        if (headers_end - b->last < 1) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in grpc create request");
++            return NGX_ERROR;
++        }
++
+         *b->last++ =3D 0;
+=20
+         e.pos =3D key_tmp;
++        e.end =3D key_tmp + tmp_len;
+=20
+         code =3D *(ngx_http_script_code_pt *) e.ip;
+         code((ngx_http_script_engine_t *) &e);
+=20
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        key_len =3D e.pos - key_tmp;
++
++        if (headers_end - b->last
++            < (ssize_t) (NGX_HTTP_V2_INT_OCTETS + key_len))
++        {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in grpc create request");
++            return NGX_ERROR;
++        }
++
+         b->last =3D ngx_http_v2_write_name(b->last, key_tmp, key_len, t=
mp);
+=20
+         e.pos =3D val_tmp;
++        e.end =3D val_tmp + tmp_len;
+=20
+         while (*(uintptr_t *) e.ip) {
+             code =3D *(ngx_http_script_code_pt *) e.ip;
+@@ -1078,6 +1108,20 @@ ngx_http_grpc_create_request(ngx_http_request_t *=
r)
+         }
+         e.ip +=3D sizeof(uintptr_t);
+=20
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        val_len =3D e.pos - val_tmp;
++
++        if (headers_end - b->last
++            < (ssize_t) (NGX_HTTP_V2_INT_OCTETS + val_len))
++        {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in grpc create request");
++            return NGX_ERROR;
++        }
++
+         b->last =3D ngx_http_v2_write_value(b->last, val_tmp, val_len, =
tmp);
+=20
+ #if (NGX_DEBUG)
+diff --git a/src/http/modules/ngx_http_index_module.c b/src/http/modules=
/ngx_http_index_module.c
+index 2ee1dd5a4..8f92ebe19 100644
+--- a/src/http/modules/ngx_http_index_module.c
++++ b/src/http/modules/ngx_http_index_module.c
+@@ -126,6 +126,7 @@ ngx_http_index_handler(ngx_http_request_t *r)
+     name =3D NULL;
+     /* suppress MSVC warning */
+     path.data =3D NULL;
++    e.status =3D 0;
+=20
+     index =3D ilcf->indices->elts;
+     for (i =3D 0; i < ilcf->indices->nelts; i++) {
+@@ -180,18 +181,28 @@ ngx_http_index_handler(ngx_http_request_t *r)
+         } else {
+             e.ip =3D index[i].values->elts;
+             e.pos =3D name;
++            e.end =3D name + allocated;
+=20
+             while (*(uintptr_t *) e.ip) {
+                 code =3D *(ngx_http_script_code_pt *) e.ip;
+                 code((ngx_http_script_engine_t *) &e);
+             }
+=20
++            if (e.status) {
++                return NGX_HTTP_INTERNAL_SERVER_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 1) !=3D NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             if (*name =3D=3D '/') {
+-                uri.len =3D len - 1;
++                uri.len =3D e.pos - name;
+                 uri.data =3D name;
+                 return ngx_http_internal_redirect(r, &uri, &r->args);
+             }
+=20
++            len =3D e.pos - name + 1;
+             path.len =3D e.pos - path.data;
+=20
+             *e.pos =3D '\0';
+diff --git a/src/http/modules/ngx_http_proxy_module.c b/src/http/modules=
/ngx_http_proxy_module.c
+index 19cbfa32b..67b0ed23d 100644
+--- a/src/http/modules/ngx_http_proxy_module.c
++++ b/src/http/modules/ngx_http_proxy_module.c
+@@ -1235,7 +1235,7 @@ ngx_http_proxy_create_key(ngx_http_request_t *r)
+ static ngx_int_t
+ ngx_http_proxy_create_request(ngx_http_request_t *r)
+ {
+-    size_t                        len, uri_len, loc_len, body_len,
++    size_t                        len, uri_len, loc_len, body_len, head=
ers_len,
+                                   key_len, val_len;
+     uintptr_t                     escape;
+     ngx_buf_t                    *b;
+@@ -1289,6 +1289,8 @@ ngx_http_proxy_create_request(ngx_http_request_t *=
r)
+     escape =3D 0;
+     loc_len =3D 0;
+     unparsed_uri =3D 0;
++    body_len =3D 0;
++    headers_len =3D 0;
+=20
+     if (plcf->proxy_lengths && ctx->vars.uri.len) {
+         uri_len =3D ctx->vars.uri.len;
+@@ -1327,7 +1329,6 @@ ngx_http_proxy_create_request(ngx_http_request_t *=
r)
+         le.ip =3D plcf->body_lengths->elts;
+         le.request =3D r;
+         le.flushed =3D 1;
+-        body_len =3D 0;
+=20
+         while (*(uintptr_t *) le.ip) {
+             lcode =3D *(ngx_http_script_len_code_pt *) le.ip;
+@@ -1363,9 +1364,11 @@ ngx_http_proxy_create_request(ngx_http_request_t =
*r)
+             continue;
+         }
+=20
+-        len +=3D key_len + sizeof(": ") - 1 + val_len + sizeof(CRLF) - =
1;
++        headers_len +=3D key_len + sizeof(": ") - 1 + val_len + sizeof(=
CRLF) - 1;
+     }
+=20
++    len +=3D headers_len;
++
+=20
+     if (plcf->upstream.pass_request_headers) {
+         part =3D &r->headers_in.headers.part;
+@@ -1457,6 +1460,7 @@ ngx_http_proxy_create_request(ngx_http_request_t *=
r)
+=20
+     e.ip =3D headers->values->elts;
+     e.pos =3D b->last;
++    e.end =3D b->last + headers_len;
+     e.request =3D r;
+     e.flushed =3D 1;
+=20
+@@ -1489,6 +1493,14 @@ ngx_http_proxy_create_request(ngx_http_request_t =
*r)
+         code =3D *(ngx_http_script_code_pt *) e.ip;
+         code((ngx_http_script_engine_t *) &e);
+=20
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        if (ngx_http_script_check_length(&e, 2) !=3D NGX_OK) {
++            return NGX_ERROR;
++        }
++
+         *e.pos++ =3D ':'; *e.pos++ =3D ' ';
+=20
+         while (*(uintptr_t *) e.ip) {
+@@ -1497,6 +1509,14 @@ ngx_http_proxy_create_request(ngx_http_request_t =
*r)
+         }
+         e.ip +=3D sizeof(uintptr_t);
+=20
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        if (ngx_http_script_check_length(&e, 2) !=3D NGX_OK) {
++            return NGX_ERROR;
++        }
++
+         *e.pos++ =3D CR; *e.pos++ =3D LF;
+     }
+=20
+@@ -1547,6 +1567,7 @@ ngx_http_proxy_create_request(ngx_http_request_t *=
r)
+     if (plcf->body_values) {
+         e.ip =3D plcf->body_values->elts;
+         e.pos =3D b->last;
++        e.end =3D b->last + body_len;
+         e.skip =3D 0;
+=20
+         while (*(uintptr_t *) e.ip) {
+@@ -1554,6 +1575,10 @@ ngx_http_proxy_create_request(ngx_http_request_t =
*r)
+             code((ngx_http_script_engine_t *) &e);
+         }
+=20
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
+         b->last =3D e.pos;
+     }
+=20
+diff --git a/src/http/modules/ngx_http_scgi_module.c b/src/http/modules/=
ngx_http_scgi_module.c
+index a04fd4781..90fe75c9d 100644
+--- a/src/http/modules/ngx_http_scgi_module.c
++++ b/src/http/modules/ngx_http_scgi_module.c
+@@ -634,7 +634,7 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+ {
+     off_t                         content_length_n;
+     u_char                        ch, sep, *key, *val, *lowcase_key;
+-    size_t                        len, key_len, val_len, allocated;
++    size_t                        len, params_len, key_len, val_len, al=
located;
+     ngx_buf_t                    *b;
+     ngx_str_t                     content_length;
+     ngx_uint_t                    i, n, hash, skip_empty, header_params=
;
+@@ -661,6 +661,7 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+=20
+     len =3D sizeof("CONTENT_LENGTH") + content_length.len + 1;
+=20
++    params_len =3D 0;
+     header_params =3D 0;
+     ignored =3D NULL;
+=20
+@@ -698,8 +699,10 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+=20
+-            len +=3D key_len + val_len + 1;
++            params_len +=3D key_len + val_len + 1;
+         }
++
++        len +=3D params_len;
+     }
+=20
+     if (scf->upstream.pass_request_headers) {
+@@ -814,6 +817,7 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+=20
+         e.ip =3D params->values->elts;
+         e.pos =3D b->last;
++        e.end =3D b->last + params_len;
+         e.request =3D r;
+         e.flushed =3D 1;
+=20
+@@ -852,6 +856,10 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+             code =3D *(ngx_http_script_code_pt *) e.ip;
+             code((ngx_http_script_engine_t *) &e);
+=20
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
+ #if (NGX_DEBUG)
+             val =3D e.pos;
+ #endif
+@@ -859,6 +867,15 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+                 code =3D *(ngx_http_script_code_pt *) e.ip;
+                 code((ngx_http_script_engine_t *) &e);
+             }
++
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 1) !=3D NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ =3D '\0';
+             e.ip +=3D sizeof(uintptr_t);
+=20
+@@ -866,6 +883,12 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+                            "scgi param: \"%s: %s\"", key, val);
+         }
+=20
++        if (e.pos !=3D e.end) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "scgi request length mismatch");
++            return NGX_ERROR;
++        }
++
+         b->last =3D e.pos;
+     }
+=20
+diff --git a/src/http/modules/ngx_http_try_files_module.c b/src/http/mod=
ules/ngx_http_try_files_module.c
+index ce783a24d..bbdab8598 100644
+--- a/src/http/modules/ngx_http_try_files_module.c
++++ b/src/http/modules/ngx_http_try_files_module.c
+@@ -78,7 +78,7 @@ ngx_module_t  ngx_http_try_files_module =3D {
+ static ngx_int_t
+ ngx_http_try_files_handler(ngx_http_request_t *r)
+ {
+-    size_t                          len, root, alias, reserve, allocate=
d;
++    size_t                          len, root, alias, reserve, allocate=
d, n;
+     u_char                         *p, *name;
+     ngx_str_t                       path, args;
+     ngx_uint_t                      test_dir;
+@@ -162,8 +162,15 @@ ngx_http_try_files_handler(ngx_http_request_t *r)
+             path.len =3D (name + tf->name.len - 1) - path.data;
+=20
+         } else {
++            n =3D allocated;
++
++            if (alias !=3D NGX_MAX_SIZE_T_VALUE) {
++                n +=3D (r->uri.len - alias);
++            }
++
+             e.ip =3D tf->values->elts;
+             e.pos =3D name;
++            e.end =3D name + n;
+             e.flushed =3D 1;
+=20
+             while (*(uintptr_t *) e.ip) {
+@@ -171,6 +178,14 @@ ngx_http_try_files_handler(ngx_http_request_t *r)
+                 code((ngx_http_script_engine_t *) &e);
+             }
+=20
++            if (e.status) {
++                return NGX_HTTP_INTERNAL_SERVER_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 1) !=3D NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             path.len =3D e.pos - path.data;
+=20
+             *e.pos =3D '\0';
+diff --git a/src/http/modules/ngx_http_uwsgi_module.c b/src/http/modules=
/ngx_http_uwsgi_module.c
+index 749254f29..61bccc87b 100644
+--- a/src/http/modules/ngx_http_uwsgi_module.c
++++ b/src/http/modules/ngx_http_uwsgi_module.c
+@@ -848,7 +848,7 @@ static ngx_int_t
+ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+ {
+     u_char                        ch, sep, *lowcase_key;
+-    size_t                        key_len, val_len, len, allocated;
++    size_t                        key_len, val_len, len, params_len, al=
located;
+     ngx_uint_t                    i, n, hash, skip_empty, header_params=
;
+     ngx_buf_t                    *b;
+     ngx_chain_t                  *cl, *body;
+@@ -861,6 +861,7 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+     ngx_http_script_len_code_pt   lcode;
+=20
+     len =3D 0;
++    params_len =3D 0;
+     header_params =3D 0;
+     ignored =3D NULL;
+=20
+@@ -898,8 +899,10 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r=
)
+                 continue;
+             }
+=20
+-            len +=3D 2 + key_len + 2 + val_len;
++            params_len +=3D 2 + key_len + 2 + val_len;
+         }
++
++        len +=3D params_len;
+     }
+=20
+     if (uwcf->upstream.pass_request_headers) {
+@@ -1031,6 +1034,7 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *=
r)
+=20
+         e.ip =3D params->values->elts;
+         e.pos =3D b->last;
++        e.end =3D b->last + params_len;
+         e.request =3D r;
+         e.flushed =3D 1;
+=20
+@@ -1063,12 +1067,24 @@ ngx_http_uwsgi_create_request(ngx_http_request_t=
 *r)
+                 continue;
+             }
+=20
++            if (ngx_http_script_check_length(&e, 2) !=3D NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ =3D (u_char) (key_len & 0xff);
+             *e.pos++ =3D (u_char) ((key_len >> 8) & 0xff);
+=20
+             code =3D *(ngx_http_script_code_pt *) e.ip;
+             code((ngx_http_script_engine_t *) &e);
+=20
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 2) !=3D NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ =3D (u_char) (val_len & 0xff);
+             *e.pos++ =3D (u_char) ((val_len >> 8) & 0xff);
+=20
+@@ -1077,6 +1093,10 @@ ngx_http_uwsgi_create_request(ngx_http_request_t =
*r)
+                 code((ngx_http_script_engine_t *) &e);
+             }
+=20
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
+             e.ip +=3D sizeof(uintptr_t);
+=20
+             ngx_log_debug4(NGX_LOG_DEBUG_HTTP, r->connection->log, 0,
+@@ -1085,6 +1105,12 @@ ngx_http_uwsgi_create_request(ngx_http_request_t =
*r)
+                            val_len, e.pos - val_len);
+         }
+=20
++        if (e.pos !=3D e.end) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "uwsgi request length mismatch");
++            return NGX_ERROR;
++        }
++
+         b->last =3D e.pos;
+     }
+=20
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-425=
33-5.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-425=
33-5.patch
new file mode 100644
index 0000000000..1fa0976e81
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-5.pa=
tch
@@ -0,0 +1,55 @@
+From 344f4e0104751d07e440bbe15c4fc728329dcfad Mon Sep 17 00:00:00 2001
+From: Pavel Pautov <p.pautov@f5.com>
+Date: Fri, 15 May 2026 00:48:50 -0700
+Subject: [PATCH] Fixed uninitialized memory read caused by stale regex
+ captures.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When ngx_http_regex_exec() reallocates r->captures array, it doesn't upd=
ate
+r->ncaptures value, if regex didn't match. So the next use of unnamed re=
gex
+capture triggers uninitialized read and potential buffer overrun.
+
+This config demonstrates the issue:
+    map test $my_map {
+        volatile;
+
+        ~mismatch(.*) 1; # reallocates r->captures in subrequests
+
+        default "";
+    }
+
+    server {
+        location ~(.*) { # sets r->ncaptures
+            slice 50;
+
+            # $1 will read from uninitialized memory in slice subrequest=
s
+            proxy_set_header Test $my_map$1;
+
+            proxy_set_header Range $slice_range;
+            proxy_pass http://backend;
+        }
+    }
+
+The issue was introduced by 746fba0d79c6.
+
+CVE: CVE-2026-42533
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/b99f804=
ad38a60ceb07bc429598d5b2c4e70e336]
+Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.c=
osta@bootlin.com>
+---
+ src/http/ngx_http_variables.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/http/ngx_http_variables.c b/src/http/ngx_http_variables=
.c
+index 16ffda3fe..47d78482b 100644
+--- a/src/http/ngx_http_variables.c
++++ b/src/http/ngx_http_variables.c
+@@ -2624,6 +2624,7 @@ ngx_http_regex_exec(ngx_http_request_t *r, ngx_htt=
p_regex_t *re, ngx_str_t *s)
+=20
+         if (r->captures =3D=3D NULL || r->realloc_captures) {
+             r->realloc_captures =3D 0;
++            r->ncaptures =3D 0;
+=20
+             r->captures =3D ngx_palloc(r->pool, len * sizeof(int));
+             if (r->captures =3D=3D NULL) {
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.24.0.bb
index f2216a5df4..f28a00df5b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -17,6 +17,11 @@ SRC_URI:append =3D " \
                   file://CVE-2026-9256.patch \
                   file://CVE-2026-48142.patch \
                   file://CVE-2026-42055.patch \
+                  file://CVE-2026-42533-1.patch \
+                  file://CVE-2026-42533-2.patch \
+                  file://CVE-2026-42533-3.patch \
+                  file://CVE-2026-42533-4.patch \
+                  file://CVE-2026-42533-5.patch \
 "
=20
 SRC_URI[sha256sum] =3D "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a=
940283e30ff2f55d"
--=20
2.47.0


