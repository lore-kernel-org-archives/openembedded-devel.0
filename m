Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6DBC02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 13:04:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8363.1739019831795289461
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Feb 2025 05:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4134b2c382=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518Ce1Xa020468
	for <openembedded-devel@lists.openembedded.org>; Sat, 8 Feb 2025 13:03:51 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44nx88rakt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 08 Feb 2025 13:03:50 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sat, 8 Feb 2025 05:03:49 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sat, 8 Feb 2025 05:03:48 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] net-snmp: correct typo on RDEPENDS
Date: Sat, 8 Feb 2025 21:03:48 +0800
Message-ID: <20250208130348.1451762-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: P-foXcWshfIX8QkfF4o4q6cRnaw8NGfn
X-Authority-Analysis: v=2.4 cv=VZANPEp9 c=1 sm=1 tr=0 ts=67a75636 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=tlFIOqNmLYePjUy9mksA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: P-foXcWshfIX8QkfF4o4q6cRnaw8NGfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_05,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=894 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502080108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Feb 2025 13:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115308

Move `append' to the behind of RDEPENDS:${PN}-libs

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 61a2a3d1a8..d4945e482d 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -273,7 +273,7 @@ RDEPENDS:${PN}-libs += "${PN}-lib-netsnmp \
                         ${PN}-lib-helpers \
                         ${PN}-lib-mibs \
 "
-RDEPENDS:append:${PN}-libs:class-target = " libpci"
+RDEPENDS:${PN}-libs:append:class-target = " libpci"
 RDEPENDS:${PN}-ptest += "perl \
                          perl-module-test \
                          perl-module-file-basename \
-- 
2.34.1


