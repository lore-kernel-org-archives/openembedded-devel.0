Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E83C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 01:32:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12874.1739928767907911352
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Feb 2025 17:32:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=414591ae1a=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IMpbZa018350
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Feb 2025 17:32:47 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00k8ch9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Feb 2025 17:32:47 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 18 Feb 2025 17:32:46 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 18 Feb 2025 17:32:46 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/2] python3-cairocffi: add new recipe
Date: Wed, 19 Feb 2025 09:32:44 +0800
Message-ID: <20250219013245.282061-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=N67TF39B c=1 sm=1 tr=0 ts=67b534bf cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=fmUar3uysI0xPiVQHggA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PEeLr2NICLx_D-OmyirO3a1sisq91K4l
X-Proofpoint-GUID: PEeLr2NICLx_D-OmyirO3a1sisq91K4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_01,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Feb 2025 01:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115521

From: Changqing Li <changqing.li@windriver.com>

python3-wxgtk4 RDEPENDS cairocffi, so add this new recipe for it

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../python3-cairocffi/python3-cairocffi_1.7.1.bb     | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-cairocffi/python3-cairocffi_1.7.1.bb

diff --git a/meta-python/recipes-devtools/python3-cairocffi/python3-cairocffi_1.7.1.bb b/meta-python/recipes-devtools/python3-cairocffi/python3-cairocffi_1.7.1.bb
new file mode 100644
index 0000000000..141c014924
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-cairocffi/python3-cairocffi_1.7.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "cairocffi is a CFFI-based drop-in replacement for Pycairo, a set of Python bindings and object-oriented API for cairo."
+HOMEPAGE = "https://github.com/Kozea/cairocffi"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e7c7639c2f7e3d6103414416614bfaac"
+
+SRC_URI[sha256sum] = "2e48ee864884ec4a3a34bfa8c9ab9999f688286eb714a15a43ec9d068c36557b"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} = "\
+    python3-cffi \
+"
-- 
2.34.1


