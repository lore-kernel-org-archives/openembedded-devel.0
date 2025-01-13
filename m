Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3A9C02184
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:16:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.21084.1736785006883472866
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 08:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3108cece01=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBNTnX023278
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 08:16:46 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1php62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 08:16:46 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 13 Jan 2025 08:16:44 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-webserver][scarthgap][PATCH 1/1] nginx: upgrade 1.25.3 -> 1.25.4
Date: Mon, 13 Jan 2025 16:16:22 +0000
Message-ID: <20250113161622.942663-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=67853c6e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HXCqcy9q75gA:10 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=9bLDTSi9AAAA:8 a=t7CeM3EgAAAA:8 a=iSN79Ydmgtbt2V3N2b4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jgyClOks5VEK_OkuFAJrK6TXG3r2F1UN
X-Proofpoint-ORIG-GUID: jgyClOks5VEK_OkuFAJrK6TXG3r2F1UN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501130134
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 16:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114837

From: Divya Chellam <divya.chellam@windriver.com>

Changelog:
===========
https://nginx.org/en/CHANGES

*) Security: when using HTTP/3 a segmentation fault might occur in a
worker process while processing a specially crafted QUIC session
(CVE-2024-24989, CVE-2024-24990).

*) Bugfix: connections with pending AIO operations might be closed
prematurely during graceful shutdown of old worker processes.

*) Bugfix: socket leak alerts no longer logged when fast shutdown was
requested after graceful shutdown of old worker processes.

*) Bugfix: a socket descriptor error, a socket leak, or a segmentation
fault in a worker process (for SSL proxying) might occur if AIO was
used in a subrequest.

*) Bugfix: a segmentation fault might occur in a worker process if SSL
proxying was used along with the "image_filter" directive and errors
with code 415 were redirected with the "error_page" directive.

*) Bugfixes and improvements in HTTP/3.

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../recipes-httpd/nginx/{nginx_1.25.3.bb => nginx_1.25.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.3.bb => nginx_1.25.4.bb} (74%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb
similarity index 74%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb
index d0371dd3c..1cd036bb4 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d"
 
-SRC_URI[sha256sum] = "64c5b975ca287939e828303fa857d22f142b251f17808dfe41733512d9cded86"
+SRC_URI[sha256sum] = "c8b288cd8a25628a167a874261069302f3cd7548"
 
-- 
2.40.0


