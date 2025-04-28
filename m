Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDF7C369D9
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 07:10:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.42343.1745824168194604326
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 00:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62139e711a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S0uCaK030750
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:09:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1akqy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:09:27 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 28 Apr 2025 00:09:26 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 28 Apr 2025 00:09:25 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [walnascar][PATCH 3/6] version-check.conf: mute bridge-utils version mismatch warning
Date: Mon, 28 Apr 2025 15:09:19 +0800
Message-ID: <20250428070922.3944580-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428070922.3944580-1-changqing.li@windriver.com>
References: <20250428070922.3944580-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680f29a7 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=10jXTBzrRSFXKBWK1TwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: mExqDOQYr-bBVhElaG52LjAIQHUQ8i9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA1OCBTYWx0ZWRfX9JZlL5KMn7Y1 F/E4Tjaxju9T8L8ZPPN0ukQ4jVfQ35PEfGBSTr+4oqFbeX7XhURZNNhVBYzndRqAwlo3x9ppzMX soPLE1SvhxQCGw0K41DrWEBwc774azfCTFF9reqASckmi45J73pzVimm6hYcmS9yN6PHgHc1eQk
 s6HcnOgu1nBQe5hRCgVBKpiLSc7Za4EqcOPU4vz2m6RvLUWhlCR/8ImlYwohAURg1ulMANWKTaL G8pfbgDBYIuFTinxEGgo8qRR/SbaoWIvnQwuJ5PACN7ZxXENPaUtnFJAMQaM2Ws8+VhUGa1k8Ou OzXkDirGzizak3no3rlGKdEoRbFmOf+ui+/jm/G+oByIWJGI/d47M090VRzlLrQKmX2fK22gt29
 zmiyFEfQMJEHB3gFyZUGWQw8wnQwKoH8dgnLp32C5cHdUs/Y/ISVc8jiC6kVl7Q0dB8473q7
X-Proofpoint-GUID: mExqDOQYr-bBVhElaG52LjAIQHUQ8i9_
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117185

From: Changqing Li <changqing.li@windriver.com>

Runtime version of brctl is 1.7.1, but the configure.ac set version as
1.7 (AC_INIT([bridge-utils],[1.7])). And refer [1], this utility is
DEPRECATED, only critical bug fixes only, so it is nearly not possible
to correct from upstream, so mute this warning since it has no critical
influence.

[1] https://git.kernel.org/pub/scm/network/bridge/bridge-utils.git/commit/?h=main&id=ab8a2cc330253321be7bc69dea88bfaa3d48415e

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/version-check.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index 130f2f6058..ecc8802565 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -21,3 +21,4 @@ CHECK_VERSION_PV:pn-can-utils = "%"
 CHECK_VERSION_PV:pn-luajit = "${PV}.%"
 CHECK_VERSION_PV:pn-sg3-utils = "%"
 CHECK_VERSION_PV:pn-netperf = "2.7.%"
+CHECK_VERSION_PV:pn-bridge-utils = "1.7%"
-- 
2.34.1


