Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69355C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:02:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4461.1743588157918009588
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6187dfc01b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5329Piuf019254
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Apr 2025 10:02:37 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtd4rmxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 10:02:36 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 2 Apr 2025 03:02:35 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 2 Apr 2025 03:02:35 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pydot: Upgrade 2.0.0 -> 3.0.4
Date: Wed, 2 Apr 2025 18:02:34 +0800
Message-ID: <20250402100234.1414487-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PCN6o-Q_hyktpGbYweEKqZKD_Eq7EDUb
X-Proofpoint-ORIG-GUID: PCN6o-Q_hyktpGbYweEKqZKD_Eq7EDUb
X-Authority-Analysis: v=2.4 cv=famty1QF c=1 sm=1 tr=0 ts=67ed0b3c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=z12feIRt8hgo77maEiUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 10:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116516

From: Mingli Yu <mingli.yu@windriver.com>

Switch to use python_setuptools_build_meta after the commit [1]
introduced in the new version.

Changelog:
  https://github.com/pydot/pydot/blob/main/ChangeLog

[1] https://github.com/pydot/pydot/commit/d1627c95cb56cd93dbd4d3259cf580a8264a3d62

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python3-pydot/python3-pydot_2.0.0.bb              | 11 -----------
 .../python3-pydot/python3-pydot_3.0.4.bb              | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python3-pydot/python3-pydot_2.0.0.bb
 create mode 100644 meta-python/recipes-extended/python3-pydot/python3-pydot_3.0.4.bb

diff --git a/meta-python/recipes-extended/python3-pydot/python3-pydot_2.0.0.bb b/meta-python/recipes-extended/python3-pydot/python3-pydot_2.0.0.bb
deleted file mode 100644
index f0a6abd733..0000000000
--- a/meta-python/recipes-extended/python3-pydot/python3-pydot_2.0.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "pydot is is an interface to Graphviz."
-HOMEPAGE = "https://github.com/pydot/pydot"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3f6fa041dfcc7ff7747cfceaa34a3180"
-
-SRC_URI[sha256sum] = "60246af215123fa062f21cd791be67dda23a6f280df09f68919e637a1e4f3235"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} = "graphviz python3-pyparsing"
diff --git a/meta-python/recipes-extended/python3-pydot/python3-pydot_3.0.4.bb b/meta-python/recipes-extended/python3-pydot/python3-pydot_3.0.4.bb
new file mode 100644
index 0000000000..960592f714
--- /dev/null
+++ b/meta-python/recipes-extended/python3-pydot/python3-pydot_3.0.4.bb
@@ -0,0 +1,11 @@
+SUMMARY = "pydot is is an interface to Graphviz."
+HOMEPAGE = "https://github.com/pydot/pydot"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663"
+
+SRC_URI[sha256sum] = "3ce88b2558f3808b0376f22bfa6c263909e1c3981e2a7b629b65b451eee4a25d"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} = "graphviz python3-pyparsing"
-- 
2.34.1


