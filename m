Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B9FC71155
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 06:55:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4061.1749797703576623532
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jun 2025 23:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D59MVn007724
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:55:02 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd96gc2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:55:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 23:55:01 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 23:55:01 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][meta-oe][PATCH 18/18] libsoup-2.4: update patch 0001-CVE-2025-32911.patch
Date: Fri, 13 Jun 2025 14:54:41 +0800
Message-ID: <20250613065441.3121844-19-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613065441.3121844-1-changqing.li@windriver.com>
References: <20250613065441.3121844-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684bcb46 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=dh6BuYzfZ955n3HdoDEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA1MCBTYWx0ZWRfXwE2n3xhwwWZP ScmVy4db/rHx4P0naQifu4IU3iDSRTA6GSqzBGt042Sac5G39s0RLP+dARtlwSkgHZELbGXSl3T V7/eTJELWjnKblH+ovOev74kTz+CkOcw/TofYslG72AyoVSdZ4SOfPPLbRib4X6ZROIoktdVFSK
 H47hJJtZVDzlrhtLAnRHwR0aSmY5rROqUgN3EHkyUtf1p0NeiQoCbYIhzgYvEa3U5z6Ko741CRC dl+BTjnjUiDh5ZpfwVEs8SFb/VZpWl7Zy/cgAz7Wp4yP1pAlsCgw5T7nWdaPRkjOSj93wKRFaRD nlkcgnvBOjzwzoUVgZnr/Ne76546/7ji9sLRoRhEcqrC37lS3nhaeSMpTONNL5bVkFZxOtlmJEm
 gOhfTVhII9VN/jWaEDjSxhIv/ty9ML5hoAmqH0HcpgGshaFFOY2Ekb8U+LM7XdV3dEqx3Wdc
X-Proofpoint-ORIG-GUID: vRKxsiu8DNDf0krh88HBoochDUf0Vc_t
X-Proofpoint-GUID: vRKxsiu8DNDf0krh88HBoochDUf0Vc_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=965
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506130050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117908

From: Changqing Li <changqing.li@windriver.com>

CVE-2025-32913 also fixed in this patch

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/435

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/0001-CVE-2025-32911.patch               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
index 9ef0643837..d75594bb4f 100644
--- a/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
+++ b/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
@@ -3,7 +3,7 @@ From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 30 Apr 2025 14:59:55 +0800
 Subject: [PATCH] CVE-2025-32911
 
-CVE: CVE-2025-32911
+CVE: CVE-2025-32911 CVE-2025-32913
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-- 
2.34.1


