Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74A7C021A4
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 05:26:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45065.1739769999834394598
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Feb 2025 21:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=414386c018=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H51F2o012767
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 05:26:39 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tg51hn04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 05:26:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 16 Feb 2025 21:26:37 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 16 Feb 2025 21:26:36 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH 1/2] nginx: upgrade 1.26.2 to 1.26.3
Date: Mon, 17 Feb 2025 13:26:34 +0800
Message-ID: <20250217052635.2557382-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=T4B2T+KQ c=1 sm=1 tr=0 ts=67b2c88e cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=9bLDTSi9AAAA:8 a=t7CeM3EgAAAA:8 a=oPh7IJYHrtGQQRNRCg4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: j7ron9M2eUHClTo9H29Qq8aqlo1PUXzR
X-Proofpoint-ORIG-GUID: j7ron9M2eUHClTo9H29Qq8aqlo1PUXzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_02,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502170045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 05:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115505

From: Changqing Li <changqing.li@windriver.com>

Solves:
* CVE-2025-23419

CHANGES:
https://nginx.org/en/CHANGES-1.26

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-httpd/nginx/{nginx_1.26.2.bb => nginx_1.26.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.26.2.bb => nginx_1.26.3.bb} (51%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.26.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
similarity index 51%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.26.2.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
index a279a3cf9b..7eab7ecdf5 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.26.2.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
@@ -2,5 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
 
-SRC_URI[sha256sum] = "627fe086209bba80a2853a0add9d958d7ebbdffa1a8467a5784c9a6b4f03d738"
+SRC_URI[sha256sum] = "69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa"
 
-- 
2.34.1


