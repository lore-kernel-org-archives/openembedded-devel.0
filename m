Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765D1D0C60F
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 13:32:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12088.1729863170561293124
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Oct 2024 06:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0028b16677=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAhMjb014880
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 13:32:49 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c3r786yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 13:32:49 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 06:32:48 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 06:32:47 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][scarthgap][PATCH 1/1] mbedtls: upgrade 3.6.1 -> 3.6.2
Date: Fri, 25 Oct 2024 13:32:42 +0000
Message-ID: <20241025133242.523927-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=b8Tg4cGx c=1 sm=1 tr=0 ts=671b9e01 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=JBbWWo_dQDwA:10 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=dwsXLWY68qBxEHdWnWAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HeZ3lQkGgRB6WYs-inayH0xIT0x6x6jb
X-Proofpoint-ORIG-GUID: HeZ3lQkGgRB6WYs-inayH0xIT0x6x6jb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_12,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 clxscore=1011 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410250105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 13:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113226

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.2

Security Fix:
CVE-2024-49195

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../mbedtls/{mbedtls_3.6.1.bb => mbedtls_3.6.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.1.bb => mbedtls_3.6.2.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
index 29c96f19a..63c0bbfaa 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
@@ -27,7 +27,7 @@ SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3
 	git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=https;branch=main;destsuffix=git/framework;name=framework \
 	file://run-ptest"
 
-SRCREV = "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
+SRCREV = "107ea89daaefb9867ea9121002fbbdf926780e98"
 SRCREV_framework = "94599c0e3b5036e086446a51a3f79640f70f22f6"
 SRCREV_FORMAT .= "_framework"
 
-- 
2.40.0


