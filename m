Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36766.1795587333829871889
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Xl/4jvZR;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4012; q=dns/txt;
  s=iport01; t=1795587334; x=1796796934;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1OVf4jnpcISk9Fn8Jsf2BM7/Qy2VbdyWUPf7kVGs8W4=;
  b=Xl/4jvZR01HxU1Hay1Y7YdiH+4V/Tsk+yznbSUmUsY07n5VR0nXc/bvW
   24601Ofud0jTuN5EL1B+ci/iBQR2Ci56rkoLzMV2NzLMi6jbLkjsG/N7O
   qmtbjCxmQEKyeNLxZPZeOh0jPE7wgLDUgYwwG0GKWwIH63dhxTaYs45l8
   EuyaX5sSRtbDZFcTyIQsiBYpeJFljAxu4vvuqKeiVdkmTyj2CjyW9Zt+x
   K2uUZvu67vei9aZtdnjF7TNrOZbaTPT8cmwFYqb6XK2U0DDyZPWcp3elg
   er/FXutixib69cjpPLqbW6CNgnPozdEavDObUFfiy6hRmMoNSs+CpeZco
   Q==;
X-CSE-ConnectionGUID: w53wQDs0S5+Nm699VsFdvw==
X-CSE-MsgGUID: z7x1ENqWTvymZkYxeEPGSQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgBaegZr/9VK/pBaglmCGD91YENJA5QngTVsA54pF?=
 =?us-ascii?q?IFqDwEBAQ9EDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYJ0AxG5XoF5M?=
 =?us-ascii?q?4EBgykBPwJDUNszAQsUAYE4hUKIJV0YAYR+JxsbgXKEf4EFgVwCgUeGXwSCI?=
 =?us-ascii?q?oEMgVSNEwKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFg?=
 =?us-ascii?q?RyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOAikGFiELN?=
 =?us-ascii?q?BgNSBEsNxUZBD5uB5QTgxsOL0cKARMXAYFrQQaTC5Jkn1OBPgoog3mMJJU6G?=
 =?us-ascii?q?jOEBJQaklQLmH2OCpZRhGqBaDyBWXAVgyIJShkPjisECguBFAECgknOWyYyA?=
 =?us-ascii?q?gkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:QF4u364KSSYZIwmCmyQKdAxRtGzGchMFZxGqfqrLsTDasY5as4F+v
 jYdWmvXafuCMGP2etp/Ydzgph8H7cKGmoNkSVZvqy01Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOsPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eItBD5d9bGjl1q
 L8+LW5cPy6Yqe6o3+fuIgVsrpxLwMjDNY4F/3UlxjbDALN/G9bIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaOkYn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCzaouLJ4TTGq25mG6K+
 XKf0kLgPS0EJdmtyguV/1+UqdT2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:yGK256BNkgD4RfjlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:ojl44WED5pLKyg8XqmJ4qRULI+w+KkaAj1HVfR7pN31HRKOKHAo=
X-Talos-MUID: 9a23:4IDpjAkvxaAMkK3uWVKRdnpwa9cxzoK3N3wTgJA0uPiUOAFIFAyk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62965017"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:15:31 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 47D3518000359
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:31 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id E3470CBF201; Tue, 24 Nov 2026 22:15:29 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][wrynose][PATCH 02/10] nginx: fix CVE-2026-123633
Date: Tue, 24 Nov 2026 22:15:21 -0800
Message-Id: <20261125061529.2721522-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125061529.2721522-1-hthakar@cisco.com>
References: <20261125061529.2721522-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132990
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream nginx stable backport for
CVE-2026-123633. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/nginx/nginx/commit/0c87dd1db413e440a4e3ef7ee8acc518509e8809
[2] https://ubuntu.com/security/CVE-2026-123633

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-123633.patch         | 49 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 51 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-123633.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123633.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123633.patch
new file mode 100644
index 0000000000..c84c7acae5
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123633.patch
@@ -0,0 +1,49 @@
+From 0c87dd1db413e440a4e3ef7ee8acc518509e8809 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Thu, 17 Sep 2026 16:10:11 +0400
+Subject: [PATCH] HTTP/2: reset reusable connection status on stream creation
+
+Previously, an HTTP/2 connection could be reusable while having streams.
+This could result in an attempt to drain the connection while processing
+one if its streams, for example when connecting to an upstream.  After
+recognizing that the connection has streams, an attempt to send the
+GOAWAY frame was made.  On send failure, the connection was immediately
+closed and its pool released.  This triggered a use-after-free up the
+stack.
+
+Having an HTTP/2 connection with streams registered as reusable became
+possible after 76672e650.  A connection with no streams and a partial
+frame read from client was registered as reusable to avoid DoS attacks.
+So if a client sends only the first HEADERS frame byte, the connection
+becomes reusable.  Later, when the remaining HEADERS bytes are received
+and a new stream is created, the reusable status is not reset until the
+connection becomes idle.
+
+Fix is to mark the connection non-reusable upon stream creation.
+
+Reported by Albert @ Vexera AI.
+
+CVE: CVE-2026-123633
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/0c87dd1db413e440a4e3ef7ee8acc518509e8809]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/v2/ngx_http_v2.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/http/v2/ngx_http_v2.c b/src/http/v2/ngx_http_v2.c
+index b2eef36..0db2b1d 100644
+--- a/src/http/v2/ngx_http_v2.c
++++ b/src/http/v2/ngx_http_v2.c
+@@ -3097,6 +3097,8 @@ ngx_http_v2_create_stream(ngx_http_v2_connection_t *h2c)
+ 
+     h2c->processing++;
+ 
++    ngx_reusable_connection(h2c->connection, 0);
++
+     h2c->priority_limit += h2scf->concurrent_streams;
+ 
+     if (h2c->connection->read->timer_set) {
+-- 
+2.35.6
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 3b14e18d4b..d7a4ac0820 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -19,6 +19,7 @@ SRC_URI:append = " \
     file://CVE-2026-97629.patch \
     file://CVE-2026-15176.patch \
     file://CVE-2026-97205.patch \
+    file://CVE-2026-123633.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 317981a6fa..59a395f670 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -19,6 +19,7 @@ SRC_URI:append = " \
     file://CVE-2026-97629.patch \
     file://CVE-2026-15176.patch \
     file://CVE-2026-97205.patch \
+    file://CVE-2026-123633.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

