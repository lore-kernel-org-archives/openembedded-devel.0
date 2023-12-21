Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEA7C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 03:46:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44561.1703130373442143937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 19:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JhlBcLpw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0719c1ae25=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BL2cjCQ032130
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 19:46:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=OXiVB
	lfxImlkkD9Ru+DhyCZmePx+jCNbxXujq17cUis=; b=JhlBcLpwK2/f2MxliLPyH
	BnmCXpUu7xVidPGW4eONEikjsuTZGUL0dCEQ5SbHorpeTaQDptZl9wjr58d0ezyj
	2n0SfSipXbp4orEzW2B0KiNZ+M+E728030CJvGQ2n2VIwQE6lBb8UncQ8AApYTT4
	nCTujm94AydGsD5xngQNR372Ak6GpjN/p/LPIiYQqMuF1mtS9LmnyNotfYmhLviK
	zWMZ6J3l7Lls59hI23k8N28iGTd3Ma2BvMe2NCMP+df6A5rGhgHxkmnPOmfJXi3h
	0VLWXD+ub7Sv6XcxWR179sr0DqjEsBAdIdTFRhmEfPzt77P6h1MNsGgSMDut3RM3
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1c9knafh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 19:46:12 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 19:46:17 -0800
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-webserver][mickledore][PATCH 1/1] nginx: fix CVE-2023-44487
Date: Thu, 21 Dec 2023 03:45:50 +0000
Message-ID: <20231221034550.1549704-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: WJC2_O1nk6WRkvxTov1FQeO-XyQHcQCT
X-Proofpoint-ORIG-GUID: WJC2_O1nk6WRkvxTov1FQeO-XyQHcQCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=941 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312210025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 03:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107697

From: Meenali Gupta <meenali.gupta@windriver.com>

The HTTP/2 protocol allows a denial of service (server resource consumption)
because request cancellation can reset many streams quickly,
as exploited in the wild in August through October 2023.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../nginx/files/CVE-2023-44487.patch          | 80 +++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch
new file mode 100644
index 0000000000..02db1503d2
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch
@@ -0,0 +1,80 @@
+From 95d09cafae12d4b314df32027b97e828ecf798de Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Tue, 10 Oct 2023 15:13:39 +0300
+Subject: [PATCH] nginx: HTTP/2: per-iteration stream handling limit.
+
+To ensure that attempts to flood servers with many streams are detected
+early, a limit of no more than 2 * max_concurrent_streams new streams per one
+event loop iteration was introduced.  This limit is applied even if
+max_concurrent_streams is not yet reached - for example, if corresponding
+streams are handled synchronously or reset.
+
+Further, refused streams are now limited to maximum of max_concurrent_streams
+and 100, similarly to priority_limit initial value, providing some tolerance
+to clients trying to open several streams at the connection start, yet
+low tolerance to flooding attempts.
+
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/6ceef192e7af1c507826ac38a2d43f08bf265fb9]
+CVE: CVE-2023-44487
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ src/http/v2/ngx_http_v2.c | 15 +++++++++++++++
+ src/http/v2/ngx_http_v2.h |  2 ++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/src/http/v2/ngx_http_v2.c b/src/http/v2/ngx_http_v2.c
+index ea3f27c..1116e56 100644
+--- a/src/http/v2/ngx_http_v2.c
++++ b/src/http/v2/ngx_http_v2.c
+@@ -361,6 +361,7 @@ ngx_http_v2_read_handler(ngx_event_t *rev)
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, c->log, 0, "http2 read handler");
+
+     h2c->blocked = 1;
++    h2c->new_streams = 0;
+
+     if (c->close) {
+         c->close = 0;
+@@ -1321,6 +1322,14 @@ ngx_http_v2_state_headers(ngx_http_v2_connection_t *h2c, u_char *pos,
+         goto rst_stream;
+     }
+
++    if (h2c->new_streams++ >= 2 * h2scf->concurrent_streams) {
++        ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
++                      "client sent too many streams at once");
++
++        status = NGX_HTTP_V2_REFUSED_STREAM;
++        goto rst_stream;
++    }
++
+     if (!h2c->settings_ack
+         && !(h2c->state.flags & NGX_HTTP_V2_END_STREAM_FLAG)
+         && h2scf->preread_size < NGX_HTTP_V2_DEFAULT_WINDOW)
+@@ -1386,6 +1395,12 @@ ngx_http_v2_state_headers(ngx_http_v2_connection_t *h2c, u_char *pos,
+
+ rst_stream:
+
++    if (h2c->refused_streams++ > ngx_max(h2scf->concurrent_streams, 100)) {
++        ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
++                      "client sent too many refused streams");
++        return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_NO_ERROR);
++    }
++
+     if (ngx_http_v2_send_rst_stream(h2c, h2c->state.sid, status) != NGX_OK) {
+         return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_INTERNAL_ERROR);
+     }
+diff --git a/src/http/v2/ngx_http_v2.h b/src/http/v2/ngx_http_v2.h
+index 4e25293..b9daf92 100644
+--- a/src/http/v2/ngx_http_v2.h
++++ b/src/http/v2/ngx_http_v2.h
+@@ -124,6 +124,8 @@ struct ngx_http_v2_connection_s {
+     ngx_uint_t                       processing;
+     ngx_uint_t                       frames;
+     ngx_uint_t                       idle;
++    ngx_uint_t                       new_streams;
++    ngx_uint_t                       refused_streams;
+     ngx_uint_t                       priority_limit;
+
+     ngx_uint_t                       pushing;
+--
+2.40.0
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 8078b7621a..72a7bb0c1c 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://nginx.service \
     file://nginx-fix-pidfile.patch \
     file://0001-configure-libxslt-conf.patch \
+    file://CVE-2023-44487.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
-- 
2.40.0


