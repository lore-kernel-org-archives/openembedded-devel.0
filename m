Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36731.1795587333534595485
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=b9j0lHng;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3483; q=dns/txt;
  s=iport01; t=1795587333; x=1796796933;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=DUPC6EpyUIlFWyoQiQXQwDYagIqoZHf9unnU5V1fYeE=;
  b=b9j0lHngkXXlerUKjVQdk0MdIl74OfGOUKc+861XUq/As5FfHVnU4nNW
   tVfjAlwrR05xn6q6mQJccQB85jKjLLAPKtnEDK0wMGnjEE7tYKP+nTcLJ
   1GcoOJ//ZdwEQQYR10qbtrXG71ixGQzO8ZoaWxkzZKqEFa/5RlZtI2jmP
   UBxG0jP7DPGUs4+UgTUig2hwPGdrNYFAiWq/99G2fcC13maT1RL1BgwVT
   yKPupLhM3BynEIKCGU6i1P24dZ5QtZsQ1qCOpq15GayzSjfojdqUy31TS
   X+ioOIol6jARhTXhjgqRAOF5JA5OdzwWAZqAZZU8AqnMnV7aDXuBHSFqR
   g==;
X-CSE-ConnectionGUID: uumOIq89RqmkWe7wQqFk1Q==
X-CSE-MsgGUID: EafKCbqrQfC4RGpmqp+xLw==
X-IPAS-Result: =?us-ascii?q?A0BIAgBQewZr/9FK/pBaHgEBCxIMggULgld1YENJA5Qng?=
 =?us-ascii?q?TVsA54pgX4PAQEBD0QNBAEBhQUCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgnQDE?=
 =?us-ascii?q?bligXkzgQGDKQE/AkNQ2zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVg2qBBYFcA?=
 =?us-ascii?q?oFIhl4EgiKBDIFUjRMCgUmIUkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjO?=
 =?us-ascii?q?xeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZD?=
 =?us-ascii?q?gIpBhYhCzQYDUgRLDcVGQQ+bgeUE4MZAj1RASuBRSZBBS0IpTuhEQoog3mMJ?=
 =?us-ascii?q?JU6GjOEBIFXkkOSVAuYfY4KlhQ9hGqBaDyBWXAVgyIJShkPji8KC4NghUHJG?=
 =?us-ascii?q?iYyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:3/3VoKp/6hE1UVA0DrE6FiBt+L9eBmJMZBIvgKrLsJaIsI4StFCzt
 garIBmEa6mPZmb9eYh2OY2290NVv5Tcy9JnGVFr/Hg2QXwV8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8sj/zgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8k435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vtqBEZv7
 KxJEikIbS+O2P2P2Zy4E9A506zPLOGzVG8eknht13TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA9GYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9JITUH5QNxBrwS
 mTu0m33IToQLcamxxHZyF20g/bX3jPfR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QyXj66R6AGDCy1cHnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:GCtp166AyriunBGVkgPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:F4ywuW6hCRoOCr1xydss6VMRPeE8Iizn1XLTHELnFl9wZr7McArF
X-Talos-MUID: 9a23:VtujwQt2dmJnlEU1bs2nqThsF+xi+r6XBmtRq7oevtCcdjxUJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60629024"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:15:31 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 4107E180001B9
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:31 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id EBF8BCBF203; Tue, 24 Nov 2026 22:15:29 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][wrynose][PATCH 04/10] nginx: fix CVE-2026-120967
Date: Tue, 24 Nov 2026 22:15:23 -0800
Message-Id: <20261125061529.2721522-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125061529.2721522-1-hthakar@cisco.com>
References: <20261125061529.2721522-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132989
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream nginx stable backport for
CVE-2026-120967. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/nginx/nginx/commit/77f90f1c0cbf79145e5667b7e171f8766ccb6765
[2] https://ubuntu.com/security/CVE-2026-120967

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-120967.patch         | 42 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 44 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-120967.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-120967.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-120967.patch
new file mode 100644
index 0000000000..805db495bf
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-120967.patch
@@ -0,0 +1,42 @@
+From 77f90f1c0cbf79145e5667b7e171f8766ccb6765 Mon Sep 17 00:00:00 2001
+From: Vadim Zhestikov <v.zhestikov@f5.com>
+Date: Wed, 14 Oct 2026 10:48:06 -0700
+Subject: [PATCH] Stream: client SSL certificates were not checked with SNI
+
+If the SSL handshake completed in the first call of
+ngx_stream_ssl_handler(), the client certificate was verified using the
+configuration of the default server, rather than the virtual server
+selected by SNI during the handshake.
+
+The problem appeared in d21675228 (1.25.5).  It is similar to the one
+fixed in 620c9a4c4.
+
+The fix is to re-read the server configuration before verifying the
+client certificate.
+
+Reported by CERT.PL.
+
+CVE: CVE-2026-120967
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/77f90f1c0cbf79145e5667b7e171f8766ccb6765]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/stream/ngx_stream_ssl_module.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/stream/ngx_stream_ssl_module.c b/src/stream/ngx_stream_ssl_module.c
+index 85a74ce..2d6ada9 100644
+--- a/src/stream/ngx_stream_ssl_module.c
++++ b/src/stream/ngx_stream_ssl_module.c
+@@ -432,6 +432,8 @@ ngx_stream_ssl_handler(ngx_stream_session_t *s)
+         }
+     }
+ 
++    sscf = ngx_stream_get_module_srv_conf(s, ngx_stream_ssl_module);
++
+     if (sscf->verify) {
+         rc = SSL_get_verify_result(c->ssl->connection);
+ 
+-- 
+2.35.6
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 717e651e13..d6a30764ab 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -22,6 +22,7 @@ SRC_URI:append = " \
     file://CVE-2026-123633.patch \
     file://CVE-2026-123640_p1.patch \
     file://CVE-2026-123640_p2.patch \
+    file://CVE-2026-120967.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index d0766e4d20..d38199ba49 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -22,6 +22,7 @@ SRC_URI:append = " \
     file://CVE-2026-123633.patch \
     file://CVE-2026-123640_p1.patch \
     file://CVE-2026-123640_p2.patch \
+    file://CVE-2026-120967.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

