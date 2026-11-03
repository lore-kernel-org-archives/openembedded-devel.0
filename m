Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7741.1793700628478167479
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:10:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Hvg+IhZ7;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5C20AC8F456
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Nov 2026 10:11:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA6606046C
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Nov 2026 10:10:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 384F810328C5E;
	Tue,  3 Nov 2026 11:10:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793700625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Zlml6ElC4W2vlUvqk9SYsdnMWj4vxKE8yM2cM6/dy04=;
	b=Hvg+IhZ7X5XMjlHKLfYf/FoFtHP5R0ZjnySE8yjnaQ4T0ymhu0Xyp3eqong0RJBQjDJno9
	uuGHhi6ZV/UU4jwaGWXqDP2lwGISauS0ENS2V1sBr76UKkgdzRx9QP7Jn1SoVWpWxcGUce
	7W1U+3j6rlxZZbYFKisVVc9EgeGc2xsNOj8TvXkllwq4QeGb2qeI9xh49V2qN7H6xnsxi3
	N4C7cZUS03yYO8s0wmBeMEmKDxBAf7bJxSyjt8Ond1JemzRG4rGP5YkFhA7mD0Nr8IB7JW
	9WAC0cYH8XLHqo2nlyyU1rRQspCVRVIS0iS0ptxfW2kFI9wtcOUYQx+F4s3vMQ==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa=20=28Schneider=20Electric=29?= <joaomarcos.costa@bootlin.com>
Subject: [meta-webserver][scarthgap][PATCH] meta-webserver: nginx: fix CVE-2026-15176
Date: Tue,  3 Nov 2026 11:10:02 +0100
Message-ID: <20261103101002.791759-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131763

From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>

This commit comes from between versions 1.30.5 and 1.30.6 of nginx, and
fixes buffer overflow vulnerability [1] when using alias with rewrite.

There is no direct mention to the CVE in the original commit message or t=
itle,
so one needs to look each commit between the two versions to find one tha=
t fixes
the root cause (i.e. buffer overflow with aliases).

[1] https://lists.openembedded.org/g/openembedded-devel/message/131009

Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-15176.patch   | 52 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-15176.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-151=
76.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-15176=
.patch
new file mode 100644
index 0000000000..9165604318
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-15176.patc=
h
@@ -0,0 +1,52 @@
+From 52732d739d5b1c406064e255a467ed160369508a Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Fri, 10 Jul 2026 20:10:12 +0400
+Subject: [PATCH] Avoid post-rewrite URI to path mapping with alias
+
+Previously, after a "rewrite" had changed the URI, and before a new
+location was chosen, the new URI might not match the current location
+prefix.  This becomes a problem when the location uses "alias", which
+is why normally such inconsistency is detected by checking the
+r->valid_location flag.  Meanwhile this flag only handles the
+inconsistency when using the "break" directive or parameter.  However
+in absence of those, there's still an inconsistency window from URI
+change up until the end of the current set of rewrite directives.
+URI to path mapping within this window might result in a buffer
+overflow if location's prefix was longer than the rewritten URI.
+
+The following example resulted in a buffer overflow with the request
+"/foo/1":
+
+location /foo/ {
+    alias /bar/;
+    rewrite ^/foo/.*$ /x;
+    return 200 $request_filename;
+}
+
+Alternatively, $request_filename might be used in access log format,
+"set", "if", "add_header", etc.
+
+The fix is to reject URI mapping in ngx_http_map_uri_to_path() if the
+r->uri_changed flag is set.
+
+CVE: CVE-2026-15176
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/ce1da78=
900b07e72f37a25f55e6606220ac45902]
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+
+---
+ src/http/ngx_http_core_module.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/http/ngx_http_core_module.c b/src/http/ngx_http_core_mo=
dule.c
+index b1872bcdd..22e1c69f4 100644
+--- a/src/http/ngx_http_core_module.c
++++ b/src/http/ngx_http_core_module.c
+@@ -1891,7 +1891,7 @@ ngx_http_map_uri_to_path(ngx_http_request_t *r, ng=
x_str_t *path,
+=20
+     alias =3D clcf->alias;
+=20
+-    if (alias && !r->valid_location) {
++    if (alias && (!r->valid_location || r->uri_changed)) {
+         ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
+                       "\"alias\" cannot be used in location \"%V\" "
+                       "where URI was rewritten", &clcf->name);
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.24.0.bb
index b5707d83eb..8dab9f3326 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -25,6 +25,7 @@ SRC_URI:append =3D " \
                   file://CVE-2026-42533-3.patch \
                   file://CVE-2026-42533-4.patch \
                   file://CVE-2026-42533-5.patch \
+                  file://CVE-2026-15176.patch \
 "
=20
 SRC_URI[sha256sum] =3D "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a=
940283e30ff2f55d"
--=20
2.55.0

