Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5668.1793689471004380858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 23:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Q3NfQKVE;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4468; q=dns/txt;
  s=iport01; t=1793689471; x=1794899071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JKS0l8XYcd2T3Y//GgVZk9YrAI8vYY8Xk4Y0WyXF54Y=;
  b=Q3NfQKVE1lloyjv5adbFxXJDEHk4ADXQEBu/49fi8PBf8xPLRmBInvai
   iFSOearoxFbd6/KrZqeWhuody8/QPNSHN5JZa8zeS5bQLfUeFkq9IoeVK
   fDLd8O38s93uBs0y3EnFSowJqxsVFo1z+INq56atubFUVPAHicnL9A5de
   1EBqjNBtcpZTMD8IlsxM7qYCfS40ncwiUrgaqvK2KHIkQOlWApChrEXD+
   gEcZ222/9qd74CbP5IcA3NM1QIjMRy+jM0bI2HguMN74yEusyk9V+B5T6
   79OzXuPCN9ypFDRMWjNPQIIL3MLxXqPODmcEqmm0uNiWw2NkwRVqNcpIW
   g==;
X-CSE-ConnectionGUID: B+9bGAUDR0S6poJIqNAubQ==
X-CSE-MsgGUID: MupZ4RE5Q2eL9s9wg+ruqg==
X-IPAS-Result: =?us-ascii?q?A0AaAACJhulq/4v/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJA4xviG1sA54fgX4PAQEBD0QNBAEBhQUCjhwCJjQJDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtE?=
 =?us-ascii?q?BwDAQIvKyMIGYMCAYJ0AxG7HYF5M4EBgykBPwJDUNszAQsUAQWBMwGFP4gjX?=
 =?us-ascii?q?RgBhH0nGxuBcoR+gQWBXAKBJ4Z/BIIigQyBWo0bAogbSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAA?=
 =?us-ascii?q?gFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxmCxoFYQgCDQx0ORAwH?=
 =?us-ascii?q?iQvBRwmQBAYDUgRLDcVGQQ+bgeSDYMHBz1RASoBFXAbS0EHpW+hEQoog3eMI?=
 =?us-ascii?q?5U6GjOqcAuYfY4KlWkYUIRpgWg8gVlwFYMiCUoZD44rBAoLg2DOWyYyAgkDL?=
 =?us-ascii?q?wEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:+QorG6ywSVsp5vw1S0V6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUAn
 TBNXWCHaavfYTT1L9okOoy29BtX7J/Sz9VqTQQ9rlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctajhMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGt1bIc309tbOzl1q
 +QfChEUSDmejdvjldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OWxa4eIIofbHq25mG69u
 3r0o17UXyhAOfjO0mua/TG2m/bAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:P4ftCasEPDOSJ8MYfP49/Bw57skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:oLx3aG39G4KtD5ilxTOtI7xfMIN0eFL08Vvqe3TmEWFLaaSzYEKawfYx
X-Talos-MUID: 9a23:lyaPbQaOFKm3QuBTkiL0tm1YGZpRuamKWVtcjppFodSdOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,192,1787011200"; 
   d="scan'208";a="543550393"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Nov 2026 07:04:30 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id F3E0F18000207;
	Tue,  3 Nov 2026 07:04:29 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9D89FCBF201; Mon,  2 Nov 2026 23:04:29 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 1/3] nginx: fix CVE-2026-95101
Date: Mon,  2 Nov 2026 23:04:27 -0800
Message-Id: <20261103070429.1299769-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261103070429.1299769-1-hthakar@cisco.com>
References: <20261103070429.1299769-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 07:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131760
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/nginx/nginx/commit/90b30edffea4f427608c36e3849643b6f9841bc4
[2] https://ubuntu.com/security/CVE-2026-95101

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-95101.patch          | 68 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 70 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-95101.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-95101.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-95101.patch
new file mode 100644
index 0000000000..c70150c114
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-95101.patch
@@ -0,0 +1,68 @@
+From 90b30edffea4f427608c36e3849643b6f9841bc4 Mon Sep 17 00:00:00 2001
+From: Vadim Zhestikov <v.zhestikov@f5.com>
+Date: Wed, 22 Jul 2026 17:48:55 -0700
+Subject: [PATCH] HTTP/3: kept the skipped frame length separate from data
+ length
+
+ngx_http_v3_parse_data() stored the remaining length of a skipped
+(unknown) frame in st->length -- the same field the request body
+filter uses for the number of DATA payload bytes to pass on as
+request body.  When an unknown frame was split across parser
+invocations, the skip was interrupted with st->length holding the
+skip remainder; on the next buffer the body filter, which calls
+the parser only while st->length == 0, treated that remainder as
+request body.
+
+When proxying, this could result in sending unframed bytes, potentially
+allowing for bypass of client_max_body_size, which is enforced only on
+the DATA path, or an injection.
+
+The fix is to keep unknown frame payload in a separate st->skip counter.
+
+Reported by Hansol Lee of GOTROOT.
+
+CVE: CVE-2026-95101
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/90b30edffea4f427608c36e3849643b6f9841bc4]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/v3/ngx_http_v3_parse.c | 4 +++-
+ src/http/v3/ngx_http_v3_parse.h | 1 +
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/http/v3/ngx_http_v3_parse.c b/src/http/v3/ngx_http_v3_parse.c
+index bcbf0dbe12..ffaade8429 100644
+--- a/src/http/v3/ngx_http_v3_parse.c
++++ b/src/http/v3/ngx_http_v3_parse.c
+@@ -1837,6 +1837,8 @@ ngx_http_v3_parse_data(ngx_connection_t *c, ngx_http_v3_parse_data_t *st,
+                            st->type, st->length);
+ 
+             if (st->type != NGX_HTTP_V3_FRAME_DATA && st->length > 0) {
++                st->skip = st->length;
++                st->length = 0;
+                 st->state = sw_skip;
+                 break;
+             }
+@@ -1846,7 +1848,7 @@ ngx_http_v3_parse_data(ngx_connection_t *c, ngx_http_v3_parse_data_t *st,
+ 
+         case sw_skip:
+ 
+-            rc = ngx_http_v3_parse_skip(b, &st->length);
++            rc = ngx_http_v3_parse_skip(b, &st->skip);
+             if (rc != NGX_DONE) {
+                 return rc;
+             }
+diff --git a/src/http/v3/ngx_http_v3_parse.h b/src/http/v3/ngx_http_v3_parse.h
+index ba004db5df..e161cecf7b 100644
+--- a/src/http/v3/ngx_http_v3_parse.h
++++ b/src/http/v3/ngx_http_v3_parse.h
+@@ -121,6 +121,7 @@ typedef struct {
+     ngx_uint_t                      state;
+     ngx_uint_t                      type;
+     ngx_uint_t                      length;
++    ngx_uint_t                      skip;
+     ngx_http_v3_parse_varlen_int_t  vlint;
+ } ngx_http_v3_parse_data_t;
+ 
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index d087ae8804..eaf069135a 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -15,6 +15,7 @@ SRC_URI:append = " \
     file://CVE-2026-42533_p4.patch \
     file://CVE-2026-42533_p5.patch \
     file://CVE-2026-56434.patch \
+    file://CVE-2026-95101.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 3b57994069..bba4788d5e 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -15,6 +15,7 @@ SRC_URI:append = " \
     file://CVE-2026-42533_p4.patch \
     file://CVE-2026-42533_p5.patch \
     file://CVE-2026-56434.patch \
+    file://CVE-2026-95101.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

