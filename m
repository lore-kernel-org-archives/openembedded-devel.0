Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8ABF4BB79
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 19:04:55 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28133.1771959894815195812
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 11:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e+I1TsUC;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43767807cf3so4401656f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959893; x=1772564693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7PVdWh9ClLetwwvRiheqNWweN9sgftOpRe1Q9Vg3zug=;
        b=e+I1TsUCwaWSwqDYpIuBtFCoLzgbgPfyXuCpb6duLYF/M1F7Dk9BKCBxfgrnF/tl3m
         arM3BAANdy4MiqnYPxUh/bQLe83mvGL7Jt/9U6HhYswQihUCWfm6iI1aZrl60JQ/FpFA
         3Z7deRdbjIWPgF+JpSPB1qnUHd1zD3XaJr7HESCSDb1YVWJleo14nArgbFUFZQ3Cz/YS
         mv9PCec815Ym0vPyNvQvvyCD06+lHla/UZ4VAIFG5vUNLWyO3GuKo37ijAVbxHdfhzFm
         tyIa4ckJyZ7qCHG4ux2jsGAZ/fbSnai0nbuwvwCah29xS78S49d70byhb5YCxmg5zKtK
         GiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959893; x=1772564693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PVdWh9ClLetwwvRiheqNWweN9sgftOpRe1Q9Vg3zug=;
        b=oquOT7ys78kruiBqVXEUdwBCtG8cDEsKeDRn/jWmPCGe0gob3AibVUJ67neqPIR0oi
         egiTzJeYaf2Jbu6n36QenEMDyntq2Q3bfBWH8INOlzEVG0fJ+jBVgxo+CiAP44yNoiIp
         Jh/4OXsiYSXwLPcirrblStpDwv+/8BTtOhw7+bgLmR3cbDfL1/57AludLQ4ZLu9dmkeH
         b5xb/AHAuT3acxqqv4C5LVGVq+FMvXumwpCpzPFaxDcdYW9YJg5Cxy0vgRT42tdkNR9D
         HoqFpYYNqrSLbQC2FGqHz3kypU7P62N4QxTW/vW54XC7BTpBMeciPtqZOyeWdpmEQR9D
         +dVg==
X-Gm-Message-State: AOJu0Yz8s4kPQLobbVr5PHO/OdK2Qb+FPStOZeia8BulpuNiQnP8KMhx
	oIhJFiyuoIToPuhAFyZCQfjVQhOORtD2mqV1E0xApTiHrh6jKOeQFoZ0pmFcEA==
X-Gm-Gg: ATEYQzxVdZtB6WFXEFyM9e9P+9KZyvbagP3BSUTMgVypgf1LaczFBa5ASjycHHpXTkj
	YHwjwsnXGnGHdRugyjjncILK5Hxv3BTmkSiPpMzptnF5IWGdzb+21heeK7EiJp2C7OWvdWfZZEe
	x5iq2ZnaWfxsgaA8USkmoY+polysOMSbXGz3C6Sf70YwEdFSjP3qY8baIC5fMhIt6lSgdzLyXL3
	B87Ni0geFwQZH+AkQwXPuqw57woUL+rE2UheaNOMv7tW+pZA7oZWQBWk8tV98umqgQdQx84z+hz
	nI3LzKdKrn7AmTH1UurpIHBt+cDttxMdcs5ui97s7KlVKKWgEflLAmBurD9WkFpPiMyJj5CxWrb
	oXG0HY3p1mQ9+YE2+isbSWVJGSHXKvdXmrVZFDFTuX9bcOBRq69HZ5KJzJG6UZdxj11Fm+04eY3
	XDLC1Ia8a4SZxap3JRCI/5ockTTHGq9+Y=
X-Received: by 2002:a05:6000:2411:b0:439:872f:b49f with SMTP id ffacd0b85a97d-439872fb5f7mr5936776f8f.3.1771959892905;
        Tue, 24 Feb 2026 11:04:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm29394920f8f.17.2026.02.24.11.04.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:04:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][whinlatter][PATCH 1/8] nginx: patch CVE-2026-1642
Date: Tue, 24 Feb 2026 20:04:44 +0100
Message-ID: <20260224190451.1596179-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 19:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124589

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-1642

Note: this is only for v1.29.1.
v1.28.x recipe contains this fix already.

Pick the commit that was identified by the reporter on the oss-sec
mailing list[1]

[1]: https://www.openwall.com/lists/oss-security/2026/02/05/1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nginx/files/CVE-2026-1642.patch           | 46 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.29.1.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
new file mode 100644
index 0000000000..0f20d1c157
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
@@ -0,0 +1,46 @@
+From 12bb8081dcfdecc38fbff9283f8d8c66dc3d29ae Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Thu, 29 Jan 2026 13:27:32 +0400
+Subject: [PATCH] Upstream: detect premature plain text response from SSL
+ backend.
+
+When connecting to a backend, the connection write event is triggered
+first in most cases.  However if a response arrives quickly enough, both
+read and write events can be triggered together within the same event loop
+iteration.  In this case the read event handler is called first and the
+write event handler is called after it.
+
+SSL initialization for backend connections happens only in the write event
+handler since SSL handshake starts with sending Client Hello.  Previously,
+if a backend sent a quick plain text response, it could be parsed by the
+read event handler prior to starting SSL handshake on the connection.
+The change adds protection against parsing such responses on SSL-enabled
+connections.
+
+CVE: CVE-2026-1642
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/a59f5f099a89dc8eaebd48077292313f9f7e33e3]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/http/ngx_http_upstream.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/http/ngx_http_upstream.c b/src/http/ngx_http_upstream.c
+index de0f92a..69dda96 100644
+--- a/src/http/ngx_http_upstream.c
++++ b/src/http/ngx_http_upstream.c
+@@ -2507,6 +2507,15 @@ ngx_http_upstream_process_header(ngx_http_request_t *r, ngx_http_upstream_t *u)
+             return;
+         }
+ 
++#if (NGX_HTTP_SSL)
++        if (u->ssl && c->ssl == NULL) {
++            ngx_log_error(NGX_LOG_ERR, c->log, 0,
++                          "upstream prematurely sent response");
++            ngx_http_upstream_next(r, u, NGX_HTTP_UPSTREAM_FT_ERROR);
++            return;
++        }
++#endif
++
+         u->state->bytes_received += n;
+ 
+         u->buffer.last += n;
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb
index c08c8539c4..0282388817 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb
@@ -8,3 +8,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 
 SRC_URI[sha256sum] = "c589f7e7ed801ddbd904afbf3de26ae24eb0cce27c7717a2e94df7fb12d6ad27"
 
+SRC_URI += "file://CVE-2026-1642.patch"

