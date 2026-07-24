Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64AFC531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 18:56:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23152.1784910632052198616
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2026 09:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=jC4dlvG4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C753C4E40F33
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 16:30:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87B7460395
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 16:30:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49A2F11C128C4;
	Fri, 24 Jul 2026 18:30:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784910628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=LIiX0/cm5R1xmneEux1p7fnvY3y2nVwwY+nVUgZBd8s=;
	b=jC4dlvG43zjo3dt8e/avNt3ln1AThV5n5QasmL24Tgqy7EkoIPKJVwb6r8WcHa64tduZQO
	SpBRCrY6VBuduDmkcAguyWXM8JXKZzYQXEG89lljSKh7bRB45ZMqNgOugAHBPUKh+bh4JO
	+H7fTU+1XCTiu1Gwf6BaTBhI7eKKkffHlafu1x5tayRqSzPU8sC9LN2EGmewuQeKfmoAjB
	Mmx0jNLGQ613Bwr7XqMIFZI3UWTD7KJ3qinGj3r6caGUz6iWAka1+wXVj/ByF3IRDhkf7m
	Zd96vCb9mvCouHpzuYh6KgtWY56a1qiCJujgHIp86T+wyqTAskBMy9++I0uQZg==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [meta-webserver][scarthgap][PATCH] nginx: backport fix for CVE-2026-42533
Date: Fri, 24 Jul 2026 18:30:17 +0200
Message-ID: <20260724163017.3655415-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 18:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128442

This fix was made available with v1.30.4 [1] version of nginx:

https://github.com/nginx/nginx/commit/b99f804ad38a60ceb07bc429598d5b2c4e7=
0e336

and the CVE is further described here: https://nvd.nist.gov/vuln/detail/C=
VE-2026-42533

[1]: https://github.com/nginx/nginx/releases/tag/release-1.30.4

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../nginx/files/CVE-2026-42533.patch          | 52 +++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-425=
33.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533.patc=
h b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533.patch
new file mode 100644
index 0000000000..c0beb91e3d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533.patch
@@ -0,0 +1,52 @@
+From 49c1c89136d3b1a0f6c1c2d645a7ceaf78efbf70 Mon Sep 17 00:00:00 2001
+From: Pavel Pautov <p.pautov@f5.com>
+Date: Fri, 15 May 2026 00:48:50 -0700
+Subject: [PATCH] Fixed uninitialized memory read caused by stale regex
+ captures.
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
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserve=
r/recipes-httpd/nginx/nginx.inc
index e392ed107c..ad0712c96b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -29,6 +29,7 @@ SRC_URI =3D " \
     file://CVE-2025-23419.patch \
     file://CVE-2026-1642.patch \
     file://CVE-2026-27784.patch \
+    file://CVE-2026-42533.patch \
 "
=20
 inherit siteinfo update-rc.d useradd systemd
--=20
2.47.0


