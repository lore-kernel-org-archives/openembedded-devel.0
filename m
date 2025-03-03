Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC9FC282C5
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 08:25:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.48892.1740990299782164008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Mar 2025 00:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51571b8f6e=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5234GfgT005240
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Mar 2025 00:24:59 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4542mqhe5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 00:24:59 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 3 Mar 2025 00:24:58 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 3 Mar 2025 00:24:57 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][meta-webserver][PATCH] nginx: fix CVE-2025-23419
Date: Mon, 3 Mar 2025 16:24:56 +0800
Message-ID: <20250303082456.2027212-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=F6qtdrhN c=1 sm=1 tr=0 ts=67c5675b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=9bLDTSi9AAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=L4EWI0dvAAAA:8 a=QIhr-27iAAAA:8
 a=A1X0JdhQAAAA:8 a=MiapE9bPtLE7ltoY1RgA:9 a=F_6uwoolVa4A:10 a=FdTzh2GWekK77mhwV6Dw:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-ORIG-GUID: i2QBvHx5qGZp2mVMu4PFMiEbRRV0faV_
X-Proofpoint-GUID: i2QBvHx5qGZp2mVMu4PFMiEbRRV0faV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_03,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503030063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 08:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115723

From: Changqing Li <changqing.li@windriver.com>

CVE-2025-23419:
When multiple server blocks are configured to share the same IP address
and port, an attacker can use session resumption to bypass client
certificate authentication requirements on these servers. This
vulnerability arises when TLS Session Tickets
https://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_session_ticket_key
are used and/or the SSL session cache
https://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_session_cache
are used in the default server and the default server is performing
client certificate authentication.   Note: Software versions which have
reached End of Technical Support (EoTS) are not evaluated.

Refer:
https://nvd.nist.gov/vuln/detail/CVE-2025-23419

This partially cherry picked from commit
13935cf9fdc3c8d8278c70716417d3b71c36140e, the original patch had 2
parts. One fixed problem in `http/ngx_http_request` module and the
second fixed problem in `stream/ngx_stream_ssl_module` module.  The fix
for `stream/ngx_stream_ssl_module can't be aplied because, the 'stream
virtual servers' funcionality was added later in this commit:
https://github.com/nginx/nginx/commit/d21675228a0ba8d4331e05c60660228a5d3326de.
Therefore only `http/ngx_http_request` part was backported.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../nginx/files/CVE-2025-23419.patch          | 87 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  3 +-
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch
new file mode 100644
index 0000000000..e42664f11a
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2025-23419.patch
@@ -0,0 +1,87 @@
+From bc23d3cdf98e855a5409d3584a241d4d773ab306 Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Wed, 22 Jan 2025 18:55:44 +0400
+Subject: [PATCH] SNI: added restriction for TLSv1.3 cross-SNI session
+ resumption.
+
+In OpenSSL, session resumption always happens in the default SSL context,
+prior to invoking the SNI callback.  Further, unlike in TLSv1.2 and older
+protocols, SSL_get_servername() returns values received in the resumption
+handshake, which may be different from the value in the initial handshake.
+Notably, this makes the restriction added in b720f650b insufficient for
+sessions resumed with different SNI server name.
+
+Considering the example from b720f650b, previously, a client was able to
+request example.org by presenting a certificate for example.org, then to
+resume and request example.com.
+
+The fix is to reject handshakes resumed with a different server name, if
+verification of client certificates is enabled in a corresponding server
+configuration.
+
+CVE: CVE-2025-23419
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/13935cf9fdc3c8d8278c70716417d3b71c36140e]
+
+This patch is partially cherry picked from commit
+13935cf9fdc3c8d8278c70716417d3b71c36140e, the original patch had 2
+parts. One fixed problem in `http/ngx_http_request` module and the 
+second fixed problem in `stream/ngx_stream_ssl_module` module.  The fix 
+for `stream/ngx_stream_ssl_module can't be aplied because, the 'stream
+virtual servers' funcionality was added later in this commit:
+https://github.com/nginx/nginx/commit/d21675228a0ba8d4331e05c60660228a5d3326de.
+Therefore only `http/ngx_http_request` part was backported.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ src/http/ngx_http_request.c | 27 +++++++++++++++++++++++++--
+ 1 file changed, 25 insertions(+), 2 deletions(-)
+
+diff --git a/src/http/ngx_http_request.c b/src/http/ngx_http_request.c
+index 5e0340b..514c021 100644
+--- a/src/http/ngx_http_request.c
++++ b/src/http/ngx_http_request.c
+@@ -907,6 +907,31 @@ ngx_http_ssl_servername(ngx_ssl_conn_t *ssl_conn, int *ad, void *arg)
+         goto done;
+     }
+ 
++    sscf = ngx_http_get_module_srv_conf(cscf->ctx, ngx_http_ssl_module);
++
++#if (defined TLS1_3_VERSION                                                   \
++     && !defined LIBRESSL_VERSION_NUMBER && !defined OPENSSL_IS_BORINGSSL)
++
++    /*
++     * SSL_SESSION_get0_hostname() is only available in OpenSSL 1.1.1+,
++     * but servername being negotiated in every TLSv1.3 handshake
++     * is only returned in OpenSSL 1.1.1+ as well
++     */
++
++    if (sscf->verify) {
++        const char  *hostname;
++
++        hostname = SSL_SESSION_get0_hostname(SSL_get0_session(ssl_conn));
++
++        if (hostname != NULL && ngx_strcmp(hostname, servername) != 0) {
++            c->ssl->handshake_rejected = 1;
++            *ad = SSL_AD_ACCESS_DENIED;
++            return SSL_TLSEXT_ERR_ALERT_FATAL;
++        }
++    }
++
++#endif
++
+     hc->ssl_servername = ngx_palloc(c->pool, sizeof(ngx_str_t));
+     if (hc->ssl_servername == NULL) {
+         goto error;
+@@ -920,8 +945,6 @@ ngx_http_ssl_servername(ngx_ssl_conn_t *ssl_conn, int *ad, void *arg)
+ 
+     ngx_set_connection_log(c, clcf->error_log);
+ 
+-    sscf = ngx_http_get_module_srv_conf(hc->conf_ctx, ngx_http_ssl_module);
+-
+     c->ssl->buffer_size = sscf->buffer_size;
+ 
+     if (sscf->ssl.ctx) {
+-- 
+2.34.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index e5666f6fe6..ed18b6471d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -2,7 +2,8 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
-SRC_URI:append = " file://CVE-2023-44487.patch"
+SRC_URI:append = " file://CVE-2023-44487.patch \
+                   file://CVE-2025-23419.patch"
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
 
-- 
2.34.1


