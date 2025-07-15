Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD171C83F21
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 09:19:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4165.1752571172320253427
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 02:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9291930779=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56F3PkcE2967510
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 09:19:31 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdva0b2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 09:19:31 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 15 Jul 2025 02:19:30 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 15 Jul 2025 02:19:28 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe][meta-python][walnascar][PATCH 1/1] python3-tornado: upgrade 6.4.2 -> 6.5
Date: Tue, 15 Jul 2025 14:49:21 +0530
Message-ID: <20250715091922.1129980-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=68761d23 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=d3C6cGn1eRoA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=3gC6es9CAAAA:8
 a=t7CeM3EgAAAA:8 a=Qgmd89Ub5eVFJ3o4XMoA:9 a=xP6Dwlo2m8u-hmdSfxCq:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: UPtjL1gLqFdYpFwp8CxBLxWg5lly-hiz
X-Proofpoint-ORIG-GUID: UPtjL1gLqFdYpFwp8CxBLxWg5lly-hiz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfX36dAjAWoY3yI
 FrG69bnRUL+O9qabiFhb1ZBocz6tLCzaVJwZI4tAc1ZJWQPhxQRRYGxtlsBR1i8z5l+y5uvYZff
 7u5CPkRjuPB5WUZE1oWyQjr4cxyIrjyHQodnP/TlGdGgRl7yd7WPknKDNB3eacFd8fE6Etybxm4
 ieeZH5X2FF8gYp6H9cxfnTVG9UJ0HGwHOGgXmK2vz1jcqQb6niWqD6LEVrD0e0stCOmzr0UChm4
 TpsLKIxo9efrXRh8DpTb3x2H+j/bCScYnEz0Lrp8pGC7u86HPkmy6VGwVO2le6BgvmCbfpPSvsW
 plp2SJLGVAibp1NM77QupeTttJl+yF1psERq1T1NfSaPGb3z17/6X/L4otXtPRZ68CmTfaAOfR+
 MGHp2+M5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 09:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118554

Changelog:
https://github.com/tornadoweb/tornado/releases/tag/v6.5.0

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../python/{python3-tornado_6.4.2.bb => python3-tornado_6.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.4.2.bb => python3-tornado_6.5.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.bb
index b223a11381..65a1778457 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "92bad5b4746e9879fd7bf1eb21dce4e3fc5128d71601f80005afa39237ad620b"
+SRC_URI[sha256sum] = "c70c0a26d5b2d85440e4debd14a8d0b463a0cf35d92d3af05f5f1ffa8675c826"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.40.0


