Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36734.1795587335213063486
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cNJXYwtB;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5496; q=dns/txt;
  s=iport01; t=1795587336; x=1796796936;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1qHxZeoR+aNBGng5eYd4RxPtspW/dvF8tNXV4vXPQJg=;
  b=cNJXYwtBaGIB2lpypztsdfPApaZSSLRm5Y8jCyJgO9+G8mRrC5Tlxewj
   mTgqIjcI6k2wbUI8C6oNiGO+XsgwfontBIJwvT3oyH3bQIq3JChxAtAwT
   /Y4hAhoFPGboG1IpOmVqMP6ueHz7NCqyXPnXGJ9kmKjcMntEG5dBQQFkH
   pDA2qTyks4GL6ZnJVWg0+EP4/Gjmr5uTlNyylXemVOGW9D6u/l+8TN6Lk
   87Z7jDrvyD5Io6ClbtPVJNvvC8mCXLmHbR6SszGY9pUJX72orVciLfApV
   9DdadDc7t4bcCeXmzFRMvqjoq+usKF+1IKNjCDDONf8AMGYXujWeJjjg8
   g==;
X-CSE-ConnectionGUID: 9bx44S76RH2TSQrQe6Y4FA==
X-CSE-MsgGUID: LQwJK2+YRtaPf2Y5wFKfZw==
X-IPAS-Result: =?us-ascii?q?A0BJAgB5fAZr/9VK/pBaglmCV3VgQ0kDlCeBNWwDnikUg?=
 =?us-ascii?q?WoPAQEBD0QNBAEBhQUCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAhYZKyMIGYMCAYJ0AxG5YoF5M?=
 =?us-ascii?q?4EBgykBPwJDUNszAQsUAYE4hUKIJV0YAYR+JxsbgXKEf4EFgVwCgRkfZ4YHB?=
 =?us-ascii?q?IIigQyBVI0TAoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbB?=
 =?us-ascii?q?gWBHIEegRKBA12BKyheIYEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJjwbCoEMJx0eGQ4CKQYWI?=
 =?us-ascii?q?Qs0GA1IESw3FRkEPm4HlBODGz1RASoBCYFiQSUXDZMnkgWBNZ9cCiiDeYwkl?=
 =?us-ascii?q?ToaM4VbpRcLmH2OCpYBDkKEaoFoPIFZcBWDIglKGQ+OLgEKC4NggmTLdyYyA?=
 =?us-ascii?q?gkDLwEBBwIHDgMLgWiQAQEmB4FPAQE?=
IronPort-Data: A9a23:lyz+ca/tP3VUqfYp7aRUDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2IWWmGBOarYMGPwc9FwYNm19E9SvpGDy9UxTQdoqH9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lnN51Ept0oX1tur
 8AjESo0Y06y28yflefTpulE3qzPLeHiMZlavjRryivUSK98B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZOHWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oa3YYSKJoLWLSlTtmKhu
 UDlpSfIOA0TDNLF+Gea3FGitPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRulzfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:u5y6WKAXxZ3Yu0PlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:y7NODmCZPByjw5f6E3ht5BJIIZ97SF2H8EzpOXa1V1c1ZpTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Agm8MOg5DjavnvOizwEkYEQLoxoxM2ruMKxpOoK8?=
 =?us-ascii?q?asvGKbx0tJBm+ggaoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="62967464"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:15:33 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id CB7E618000359
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:32 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 020DDCBF234; Tue, 24 Nov 2026 22:15:30 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][wrynose][PATCH 07/10] nginx: fix CVE-2026-123007
Date: Tue, 24 Nov 2026 22:15:26 -0800
Message-Id: <20261125061529.2721522-7-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125061529.2721522-1-hthakar@cisco.com>
References: <20261125061529.2721522-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132996
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream nginx stable backport for
CVE-2026-123007. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/nginx/nginx/commit/b89c4100bf6762a45e4a6463eaf4b70368277c94
[2] https://ubuntu.com/security/CVE-2026-123007

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-123007.patch         | 90 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 92 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-123007.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123007.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123007.patch
new file mode 100644
index 0000000000..5cc4c83b21
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123007.patch
@@ -0,0 +1,90 @@
+From b89c4100bf6762a45e4a6463eaf4b70368277c94 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Thu, 29 Oct 2026 21:37:05 +0400
+Subject: [PATCH] HTTP/2: account for queued frames when validating
+ WINDOW_UPDATE
+
+When a stream is terminated, its unsent payload length is refunded back
+to the connection flow control.  Previously, this could increase the
+flow control beyond NGX_HTTP_V2_MAX_WINDOW, if it was increased by the
+client after the stream frames were queued and before the stream was
+terminated.  This eventually resulted in broken buffer size control in
+ngx_http_v2_send_chain() followed by memory corruption and a possible
+segmentation fault.
+
+The fix is to account for the queued frames when validating a client
+WINDOW_UPDATE.  From the client's point of view, the queued frames
+still belong to the flow control window.
+
+Reported by Xint.io.
+
+CVE: CVE-2026-123007
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/b89c4100bf6762a45e4a6463eaf4b70368277c94]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/v2/ngx_http_v2.c               | 4 ++--
+ src/http/v2/ngx_http_v2.h               | 1 +
+ src/http/v2/ngx_http_v2_filter_module.c | 3 +++
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/http/v2/ngx_http_v2.c b/src/http/v2/ngx_http_v2.c
+index e0e7ef379b..e5d93733f0 100644
+--- a/src/http/v2/ngx_http_v2.c
++++ b/src/http/v2/ngx_http_v2.c
+@@ -2484,13 +2484,13 @@ ngx_http_v2_state_window_update(ngx_http_v2_connection_t *h2c, u_char *pos,
+         return ngx_http_v2_state_complete(h2c, pos, end);
+     }
+ 
+-    if (window > NGX_HTTP_V2_MAX_WINDOW - h2c->send_window) {
++    if (window > NGX_HTTP_V2_MAX_WINDOW - h2c->send_window - h2c->send_queued) {
+         ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
+                       "client violated connection flow control: "
+                       "received WINDOW_UPDATE frame "
+                       "with window increment %uz "
+                       "not allowed for window %uz",
+-                      window, h2c->send_window);
++                      window, h2c->send_window + h2c->send_queued);
+ 
+         return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_FLOW_CTRL_ERROR);
+     }
+diff --git a/src/http/v2/ngx_http_v2.h b/src/http/v2/ngx_http_v2.h
+index beb77a5c1d..0c8066e665 100644
+--- a/src/http/v2/ngx_http_v2.h
++++ b/src/http/v2/ngx_http_v2.h
+@@ -137,6 +137,7 @@ struct ngx_http_v2_connection_s {
+     ngx_uint_t                       priority_limit;
+ 
+     size_t                           send_window;
++    size_t                           send_queued;
+     size_t                           recv_window;
+     size_t                           init_window;
+ 
+diff --git a/src/http/v2/ngx_http_v2_filter_module.c b/src/http/v2/ngx_http_v2_filter_module.c
+index 6b73b1e687..fe235fbd89 100644
+--- a/src/http/v2/ngx_http_v2_filter_module.c
++++ b/src/http/v2/ngx_http_v2_filter_module.c
+@@ -1224,6 +1224,7 @@ ngx_http_v2_send_chain(ngx_connection_t *fc, ngx_chain_t *in, off_t limit)
+             ngx_http_v2_queue_frame(h2c, frame);
+ 
+             h2c->send_window -= frame_size;
++            h2c->send_queued += frame_size;
+ 
+             stream->send_window -= frame_size;
+             stream->queued++;
+@@ -1619,6 +1620,7 @@ ngx_http_v2_data_frame_handler(ngx_http_v2_connection_t *h2c,
+     stream->request->header_size += NGX_HTTP_V2_FRAME_HEADER_SIZE;
+ 
+     h2c->payload_bytes += frame->length;
++    h2c->send_queued -= frame->length;
+ 
+     ngx_http_v2_handle_frame(stream, frame);
+ 
+@@ -1753,6 +1755,7 @@ ngx_http_v2_filter_cleanup(void *data)
+     }
+ 
+     h2c->send_window += window;
++    h2c->send_queued -= window;
+ }
+ 
+ 
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 3df753313c..a7b628d6b3 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -27,6 +27,7 @@ SRC_URI:append = " \
     file://CVE-2026-118899_p2.patch \
     file://CVE-2026-123634-dependent.patch \
     file://CVE-2026-123634.patch \
+    file://CVE-2026-123007.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 36c9e25072..a2d09a7a78 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -27,6 +27,7 @@ SRC_URI:append = " \
     file://CVE-2026-118899_p2.patch \
     file://CVE-2026-123634-dependent.patch \
     file://CVE-2026-123634.patch \
+    file://CVE-2026-123007.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

