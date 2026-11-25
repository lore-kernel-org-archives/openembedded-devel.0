Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36766.1795587333829871889
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gLGJft7c;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3442; q=dns/txt;
  s=iport01; t=1795587335; x=1796796935;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=CWYQyvCNHoatrKWxZQXYu+MqleCG5eFpKEx2K8I2Jk0=;
  b=gLGJft7c3OlsKdJSrOsHtdeTVqRKcqwwgOn8RkvcURusoHKQgMHG65Xf
   H24tyweRbYgtLIeylP4C1XO5/OnEqUTA+Tp7vb9q3PvQ3w4WTaFlPLcFs
   qEldBYbWORaVM6aoi8DnlM/TYJHd9RGlj/tuTGqXh+zp48yFhubXnRTr3
   3AJqU6MS3gyBrc+7/PUQXijExwZjGJRznBMD6ijuApXX9M7Q9HVtFpvEV
   RVL1BMRl2zFcKbO5/ZxIpXusoZCCqOId1zdUS9qRZ75+5tbhsfXTiMQsN
   boBQstV5Az3DOZVi80eJ4pqNLZVF7QoIkcwSa/sSBe0L9N3tmsTtB1lqG
   Q==;
X-CSE-ConnectionGUID: 6shtqeBCRGGJ0MOS1CMS8Q==
X-CSE-MsgGUID: N/ZSNQLOSmuBm5lRXZ+4Pw==
X-IPAS-Result: =?us-ascii?q?A0BIAgBaegZr/9BK/pBaglmCV3VgQ0kDlCeBNWwDnimBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMyARgBPRwDAQIvKyMIGYMCAYJ0AxG5XoIsgQGDK?=
 =?us-ascii?q?QE/AkNQ2zMBCxQBgTiFQoglXRgBhH4nGxuBcoR/gQWBXAKIJgSCIoEMgVSNE?=
 =?us-ascii?q?wKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESg?=
 =?us-ascii?q?QNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJ?=
 =?us-ascii?q?j8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOAikGFiELNBgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5QTgxQHPVEBKgGBa0GjVIIhoREKKIN5jCSVOhozqnILmH2OCpZRh?=
 =?us-ascii?q?GqBaDyBWXAVgyIJShkPji8KC4NgzlsmMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:eFFUa6lMaumGrDlBYwgVPdTo5gzVJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbDTiGaKzca2CncttybNmx8UhT65OAzIJkSAdr+380RltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfnb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdMD+vpuDEtlz
 9M3CmgoSSvarMeNkIvuH4GAhux7RCXqFIoSoDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUUfUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FboCEJIHSHJU9ckCwg
 CX0xELAJjYhMcG1zGeByEKexbP3gnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:0Jf77qr0LcxCjImJfiqCjucaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:XdSU6m/Y0bexMX7JN5CVvxAPGtw8f1f29lj/ARedLl0wY5iuGWbFrQ==
X-Talos-MUID: 9a23:ucaHtgT2HcgruJweRXTKwwNZEv5MxJ+rFWoIzJE8i/vHaRRvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62965018"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:15:33 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id C544218000265
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:32 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 0C0F0CBEFAB; Tue, 24 Nov 2026 22:15:30 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][wrynose][PATCH 10/10] nginx: fix CVE-2026-125283
Date: Tue, 24 Nov 2026 22:15:29 -0800
Message-Id: <20261125061529.2721522-10-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125061529.2721522-1-hthakar@cisco.com>
References: <20261125061529.2721522-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132994
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream nginx stable backport for
CVE-2026-125283. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/nginx/nginx/commit/b99b6b528b64e93354b5c3453e45701e70c461a8
[2] https://ubuntu.com/security/CVE-2026-125283

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-125283.patch         | 35 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 37 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-125283.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-125283.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-125283.patch
new file mode 100644
index 0000000000..206425dab1
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-125283.patch
@@ -0,0 +1,35 @@
+From b99b6b528b64e93354b5c3453e45701e70c461a8 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Thu, 5 Nov 2026 18:50:48 +0400
+Subject: [PATCH] Try files: fix uri formating in case of script underwrite
+
+Previously, if try_files was used with alias, and the script produced
+a string smaller than the predicted size, then an integer underflow
+could happen which resulted in buffer overrun.
+
+Fix is to recalculate the length after running the script.
+
+A similar length recalculation exists in ngx_http_index_module.
+It was added by 25f920eca when fixing script overruns.
+
+Reported by Marc Luchian & Liviu-Alexandru Bud.
+
+CVE: CVE-2026-125283
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/b99b6b528b64e93354b5c3453e45701e70c461a8]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/modules/ngx_http_try_files_module.c | 1 +
+ 1 file changed, 1 insertion(+)
+diff --git a/src/http/modules/ngx_http_try_files_module.c b/src/http/modules/ngx_http_try_files_module.c
+index bbdab85984..9092602857 100644
+--- a/src/http/modules/ngx_http_try_files_module.c
++++ b/src/http/modules/ngx_http_try_files_module.c
+@@ -186,6 +186,7 @@ ngx_http_try_files_handler(ngx_http_request_t *r)
+                 return NGX_ERROR;
+             }
+ 
++            len = e.pos - name + 1;
+             path.len = e.pos - path.data;
+ 
+             *e.pos = '\0';
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 761c0edfd0..055b2aba3e 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -34,6 +34,7 @@ SRC_URI:append = " \
     file://CVE-2026-113425_p3.patch \
     file://CVE-2026-113425_p4.patch \
     file://CVE-2026-121810.patch \
+    file://CVE-2026-125283.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index e030fb3ec8..fb2172fc66 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -34,6 +34,7 @@ SRC_URI:append = " \
     file://CVE-2026-113425_p3.patch \
     file://CVE-2026-113425_p4.patch \
     file://CVE-2026-121810.patch \
+    file://CVE-2026-125283.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

