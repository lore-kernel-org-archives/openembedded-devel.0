Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03841C001DB
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 20:24:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4697.1691094258764542311
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 13:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S593PP7C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75795fa799=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 373Gxoie014771;
	Thu, 3 Aug 2023 20:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=9biAP
	tKzelEpoLyQOW32OYJAawXwD6sW4HFrEMgNAlQ=; b=S593PP7CqYnJiCzHSKIIt
	EOQEJLaFAximl6DWeEq0qoC2stmU1TUiCp44LM45wkUUVTT1IrrkJ2i/bZtSqUFz
	0Ohy7c4o884NOqbpTPTb7Kr5IMVlVG84vhjTL6X05e4y8vwrszbiRwhEymIr4WGL
	PGmNxZTMm5M3sZZKs4Es3uRWxk7tDOGCBQaMmqV3uDzPlEb1nrtqtE2tOgtPVqQS
	Uq3TBlQDWcS+sNROvuSnxGhvkmr0bqC8W8O1GxUBHQGCKvx5CZBL1dtjQ5m98bKr
	OtssGONY21c7n/tX1kBkaBNEBJJn5O6mPQyk5GB+VhiZOQsYSQELJjRHcYFLiMO7
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx596r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 03 Aug 2023 20:24:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 13:24:16 -0700
Received: from vme.wrs.com (172.25.44.3) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 3 Aug 2023 13:24:15 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [kirkstone][meta-oe][PATCH] lmsensors: do not pull in unneeded perl modules for run-time dependencies
Date: Thu, 3 Aug 2023 16:24:15 -0400
Message-ID: <20230803202415.243990-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vtw6pTOk3yNAXBybAb6oLDfF109Iyv9e
X-Proofpoint-ORIG-GUID: vtw6pTOk3yNAXBybAb6oLDfF109Iyv9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_22,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=846 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308030182
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 20:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104224

From: Beniamin Sandu <beniaminsandu@gmail.com>

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index f821cdaf4..aba5ab587 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -151,12 +151,13 @@ RRECOMMENDS:${PN}-fancontrol = "lmsensors-config-fancontrol"
 # sensors-detect script files
 FILES:${PN}-sensorsdetect = "${sbindir}/sensors-detect"
 FILES:${PN}-sensorsdetect-doc = "${mandir}/man8/sensors-detect.8"
-RDEPENDS:${PN}-sensorsdetect = "${PN}-sensors perl perl-modules"
+RDEPENDS:${PN}-sensorsdetect = "${PN}-sensors perl perl-module-fcntl perl-module-file-basename \
+	perl-module-strict perl-module-constant"
 
 # sensors-conf-convert script files
 FILES:${PN}-sensorsconfconvert = "${bindir}/sensors-conf-convert"
 FILES:${PN}-sensorsconfconvert-doc = "${mandir}/man8/sensors-conf-convert.8"
-RDEPENDS:${PN}-sensorsconfconvert = "${PN}-sensors perl perl-modules"
+RDEPENDS:${PN}-sensorsconfconvert = "${PN}-sensors perl perl-module-strict perl-module-vars"
 
 # pwmconfig script files
 FILES:${PN}-pwmconfig = "${sbindir}/pwmconfig"
-- 
2.34.1


