Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B442D5A6E1
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 04:38:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38524.1732595877344597049
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 20:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=106056d748=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ3s3rG003170
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 04:37:56 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618at68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 04:37:56 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 25 Nov 2024 20:37:53 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] php: upgrade 8.1.29 -> 8.1.30
Date: Tue, 26 Nov 2024 04:37:34 +0000
Message-ID: <20241126043734.522725-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 8IGKeIZoNnqIj_sYJ1oBuURlr7MNPT_E
X-Proofpoint-GUID: 8IGKeIZoNnqIj_sYJ1oBuURlr7MNPT_E
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674550a4 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VlfZXiiP6vEA:10 a=67BIL_jfAAAA:8 a=t7CeM3EgAAAA:8 a=OuRRoTO0h7BauGkyL3gA:9 a=zWsmoVtUA9YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_03,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260036
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 04:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114056

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2024-8925, CVE-2024-8926, CVE-2024-8927
and CVE-2024-9026

Changelog:
https://www.php.net/ChangeLog-8.php#8.1.30

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.29.bb => php_8.1.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.29.bb => php_8.1.30.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.29.bb b/meta-oe/recipes-devtools/php/php_8.1.30.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.29.bb
rename to meta-oe/recipes-devtools/php/php_8.1.30.bb
index ec86ce088..ee59322a5 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.29.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.30.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "87a60313263f2f533f180e719272ca5e47cd9884d4ec3c93720198eaffae0827"
+SRC_URI[sha256sum] = "cb1625e5ac49b91037477e3e7767bb0624343971aeb992f4791b618af571d23e"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.40.0


