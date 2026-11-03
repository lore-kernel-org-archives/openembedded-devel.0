Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5767.1793689477240814232
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 23:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=l0vgYc/R;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3708; q=dns/txt;
  s=iport01; t=1793689477; x=1794899077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KAw7/0vkf/JKo4DxUCelfS5hy/W2nzowLuSNBi2G83w=;
  b=l0vgYc/RhUuydlx6T9EFrTXOIwnk9+P6ytoTdUz7RRbTFg7VkOimIL8t
   PCGIs5o7GprBe4qI1okU/L9whzkUD0YirWC+YCSYSrBcooXfhZIWdBUWU
   ez2aDRGZRqv/X2kgWiYY54pCxFnSvXvbRfOFAGK9od+wLHtru7q/IhcCq
   RPV8W0wv2r4tGf+bMTklZw5Lwn59y6SN151f/2Zjgh98AzNM34SGD4P0c
   6tWbDf3oMNw8LpI4bSX+I2PIJMIuUTUsLkQ8+u+oKJqBpe08jbZq/Dtbs
   NENUdSz71AyQTl7V0o5+vebJZiad+qgE01ZSj1JhiTVBm3zbXWjUZv8uA
   A==;
X-CSE-ConnectionGUID: ESCFljASSESNCDRLXLj5YQ==
X-CSE-MsgGUID: cq9ZekoARASAManRsAWTEA==
X-IPAS-Result: =?us-ascii?q?A0BJAgDmhulq/5D/Ja1aHgEBCxIMggULghg/dWBDSQOVX?=
 =?us-ascii?q?GwDnh+Bfg8BAQEPRA0EAQGFBQKOHAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgipYAYJ0A?=
 =?us-ascii?q?xG7H4F5M4EBgykBPwJDUNszAQsUAQWBM4VAiCNdGAGEfScbG4FygRWDaYEFg?=
 =?us-ascii?q?VwCgScnhlgEgg0VgQyBWoMliXYCiBtIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGYLGgVhCAINDHQ5EDAeJC8FHCZAEBgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5INgwcHPVEBK4FNHkEOASOjI4IhoREKKIN3jCOVOhozqnALm?=
 =?us-ascii?q?H2OCpZRhGmBaDyBWXAVgyIJShkPji8KC4NgzlsmMgIJAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?ACBfgEB?=
IronPort-Data: A9a23:pFOs8qy9Cb23md8+H5V6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUFx
 mFJDWGOPPvZNDfxL99+Pou+8B5QupfSnYMwTlNk/1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctajhMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGwNFqMc+M9MOkx10
 9c0EhQ9ShLettvjldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW2bYGPJIDTGK25mG6Tv
 zP08mf+KyszD/W6wDy/6VuTusLmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:W5LMq643oXrJikfynQPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:xt71KWHKnDjiPYzrqmJKz2U6HsIMSUbw91H7D3WcOUJrFYysHAo=
X-Talos-MUID: 9a23:+qEg5AtBCMD9FOAUk82njygzBspr5I2UIXsktJwAgdKtChBdEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,192,1787011200"; 
   d="scan'208";a="535326415"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Nov 2026 07:04:30 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 02A28180003EB;
	Tue,  3 Nov 2026 07:04:30 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id A1451CBF202; Mon,  2 Nov 2026 23:04:29 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 2/3] nginx: fix CVE-2026-97629
Date: Mon,  2 Nov 2026 23:04:28 -0800
Message-Id: <20261103070429.1299769-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261103070429.1299769-1-hthakar@cisco.com>
References: <20261103070429.1299769-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 07:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131761
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/nginx/nginx/commit/fdedba031bf1ad6a80c61b1aec1418d1a87ae296
[2] https://ubuntu.com/security/CVE-2026-97629

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-97629.patch          | 45 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 47 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-97629.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-97629.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-97629.patch
new file mode 100644
index 0000000000..141e54bb0d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-97629.patch
@@ -0,0 +1,45 @@
+From fdedba031bf1ad6a80c61b1aec1418d1a87ae296 Mon Sep 17 00:00:00 2001
+From: Vadim Zhestikov <v.zhestikov@f5.com>
+Date: Wed, 22 Jul 2026 16:48:37 -0700
+Subject: [PATCH] SSL: synced all session ticket keys to the worker process
+
+The per-worker ticket key mirror is allocated with three slots
+(ngx_array_push_n(keys, 3)), matching the shared memory
+ticket_keys[3] array and the decrypt callback, which scans all
+keys->nelts slots by key name.  Key rotation, however, synced
+only two slots from shared memory, leaving the third slot's
+name, hmac_key, and aes_key uninitialized.
+
+A ticket whose key name matched the uninitialized slot (which
+holds unspecified pool memory, all zero in the best case) could
+therefore be HMAC-verified and decrypted with uninitialized key
+material, allowing a forged session.
+
+Sync all keys->nelts slots, as ngx_ssl_ticket_keys_cleanup()
+already assumes.
+
+Reported by PhiNode Labs.
+
+CVE: CVE-2026-97629
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/fdedba031bf1ad6a80c61b1aec1418d1a87ae296]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/event/ngx_event_openssl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/event/ngx_event_openssl.c b/src/event/ngx_event_openssl.c
+index 1653be0c34..bb6e04313f 100644
+--- a/src/event/ngx_event_openssl.c
++++ b/src/event/ngx_event_openssl.c
+@@ -5195,7 +5195,7 @@ ngx_ssl_rotate_ticket_keys(SSL_CTX *ssl_ctx, ngx_log_t *log)
+     /* sync keys to the worker process memory */
+ 
+     ngx_memcpy(keys->elts, cache->ticket_keys,
+-               2 * sizeof(ngx_ssl_ticket_key_t));
++               keys->nelts * sizeof(ngx_ssl_ticket_key_t));
+ 
+     ngx_shmtx_unlock(&shpool->mutex);
+ 
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index eaf069135a..1ee9d41562 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -16,6 +16,7 @@ SRC_URI:append = " \
     file://CVE-2026-42533_p5.patch \
     file://CVE-2026-56434.patch \
     file://CVE-2026-95101.patch \
+    file://CVE-2026-97629.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index bba4788d5e..77b6303a74 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -16,6 +16,7 @@ SRC_URI:append = " \
     file://CVE-2026-42533_p5.patch \
     file://CVE-2026-56434.patch \
     file://CVE-2026-95101.patch \
+    file://CVE-2026-97629.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

