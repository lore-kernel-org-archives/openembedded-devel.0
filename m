Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12A3C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 10:20:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9611.1741256450922285982
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 02:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51601af165=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5265TwCL005736
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Mar 2025 10:20:50 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456ct89vjx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 10:20:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 6 Mar 2025 02:20:49 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 6 Mar 2025 02:20:48 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/2] python3-crypt-r: replacement of module crypt
Date: Thu, 6 Mar 2025 18:20:35 +0800
Message-ID: <20250306102035.1552646-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306102035.1552646-1-kai.kang@windriver.com>
References: <20250306102035.1552646-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gooJ7zLuiTHVWwSrgkKWjT0a-3ZhUexE
X-Proofpoint-ORIG-GUID: gooJ7zLuiTHVWwSrgkKWjT0a-3ZhUexE
X-Authority-Analysis: v=2.4 cv=D4W9KuRj c=1 sm=1 tr=0 ts=67c97702 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=gcoJWPrLrSxpFbBvA_QA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503060077
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 10:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115767

From: Kai Kang <kai.kang@windriver.com>

Since module crypt has been removed from python 3.13, add a renamed copy
of it that other packages may require it, such as python3-anaconda.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-devtools/python/python3-crypt-r_3.13.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb b/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
new file mode 100644
index 0000000000..8710b59a95
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-crypt-r_3.13.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A renamed copy of the crypt module as it was present in Python 3.12 before it was removed."
+HOMEPAGE = "https://github.com/fedora-python/crypt_r"
+LICENSE = "Python-2.0.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
+
+SRC_URI = "git://github.com/fedora-python/crypt_r.git;branch=main;protocol=https"
+SRCREV = "b20e21d9f24d6fa17a6781bbc9f272ce38246eef"
+
+S = "${UNPACKDIR}/git"
+
+inherit python_setuptools_build_meta
-- 
2.34.1


