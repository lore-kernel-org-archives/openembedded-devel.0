Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE16C369A1
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 12:10:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6946.1744200593150483965
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 05:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6194f9973c=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539BvQgr010700
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Apr 2025 12:09:52 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8ncpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 12:09:52 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 9 Apr 2025 05:09:49 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][scarthgap][PATCH 1/1] openvpn: upgrade 2.6.12 -> 2.6.14
Date: Wed, 9 Apr 2025 12:09:26 +0000
Message-ID: <20250409120926.3645279-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ejuCHd0N5TDvoRgWLeGeNlj1_ozastGw
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f66390 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=JBbWWo_dQDwA:10 a=HCiNrPZc1L8A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=9dNbsytUAAAA:8 a=uDo-SIiEAAAA:8
 a=t7CeM3EgAAAA:8 a=CfmGdABNzVdpvb7Fs8UA:9 a=gPpeecpFUKP6j8iU7U-x:22 a=Rkhf4GTZPwEC63LfVcCP:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ejuCHd0N5TDvoRgWLeGeNlj1_ozastGw
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_04,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504090072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 12:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116738

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-2704

Changelog:
==========
https://github.com/OpenVPN/openvpn/releases

For full details, refer to:
https://github.com/OpenVPN/openvpn/compare/v2.6.12...v2.6.14

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../openvpn/{openvpn_2.6.12.bb => openvpn_2.6.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.12.bb => openvpn_2.6.14.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
index af237280ea..5361709f0c 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "1c610fddeb686e34f1367c347e027e418e07523a10f4d8ce4a2c2af2f61a1929"
+SRC_URI[sha256sum] = "9eb6a6618352f9e7b771a9d38ae1631b5edfeed6d40233e243e602ddf2195e7a"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.40.0


