Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CCEC25B78
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 02:07:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3983.1716948425167997657
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 19:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=68793fadca=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T1eSGj012033
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 02:07:04 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5knda-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 02:07:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 19:07:02 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 19:07:02 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2] python3-dasbus: Add new recipe
Date: Wed, 29 May 2024 10:07:01 +0800
Message-ID: <20240529020701.2475609-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <17D39E8F83C96086.24533@lists.openembedded.org>
References: <17D39E8F83C96086.24533@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4pPPyiHlKABDjM-SOzgo7dIfJPKW1SBG
X-Proofpoint-GUID: 4pPPyiHlKABDjM-SOzgo7dIfJPKW1SBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 02:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110600

From: Mingli Yu <mingli.yu@windriver.com>

Dasbus is a DBus library written in Python 3, based on GLib
and inspired by pydbus.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-devtools/python/python3-dasbus_1.7.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dasbus_1.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
new file mode 100644
index 0000000000..3efa961713
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Dasbus is a DBus library written in Python 3, based on GLib and inspired by pydbus."
+HOMEPAGE = "https://dasbus.readthedocs.io"
+SECTION = "devel"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
+
+SRC_URI = "git://github.com/dasbus-project/dasbus.git;protocol=https;branch=master \
+"
+SRCREV = "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS:${PN} = "python3-pygobject"
-- 
2.25.1


