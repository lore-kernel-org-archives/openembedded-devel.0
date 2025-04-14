Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E890C369B7
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 08:27:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45059.1744619245281991217
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 01:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61995c6f5e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E6Hvue015006
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 08:27:24 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1htrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 08:27:24 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 14 Apr 2025 01:27:23 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 14 Apr 2025 01:27:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 5/6] libuser: correct the package version
Date: Mon, 14 Apr 2025 16:27:16 +0800
Message-ID: <20250414082717.2827252-5-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414082717.2827252-1-changqing.li@windriver.com>
References: <20250414082717.2827252-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: K26qhPAqD_QZND4wHkcy6RI4ao5NOER4
X-Proofpoint-GUID: K26qhPAqD_QZND4wHkcy6RI4ao5NOER4
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fcc6ec cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=lViJMyulAAAA:8 a=XEQRnViFAAAA:8 a=t7CeM3EgAAAA:8 a=oMCc9RdpAGuaAqeP18oA:9 a=oAvoXAQRkUwA:10
 a=6b1rEjNPiTsA:10 a=gb9IC-u5QvZuJU0a8fSk:22 a=1XHicvQM08eBGpD5cucn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 08:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116849

From: Changqing Li <changqing.li@windriver.com>

correct the package version in configure.ac

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-configure.ac-update-version-to-0.64.patch | 25 +++++++++++++++++++
 .../recipes-support/libuser/libuser_0.64.bb   |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libuser/libuser/0001-configure.ac-update-version-to-0.64.patch

diff --git a/meta-gnome/recipes-support/libuser/libuser/0001-configure.ac-update-version-to-0.64.patch b/meta-gnome/recipes-support/libuser/libuser/0001-configure.ac-update-version-to-0.64.patch
new file mode 100644
index 0000000000..950312f031
--- /dev/null
+++ b/meta-gnome/recipes-support/libuser/libuser/0001-configure.ac-update-version-to-0.64.patch
@@ -0,0 +1,25 @@
+From 206cfdff171e5ce0df02e635ba0d331a7dc5d992 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 14 Apr 2025 14:48:08 +0800
+Subject: [PATCH] configure.ac: update version to 0.64
+
+Upstream-Status: Submitted [http://pagure.io/libuser/issue/74]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 51508b7..68c6e50 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,4 +1,4 @@
+-AC_INIT([libuser], [0.62], [https://pagure.io/libuser], ,
++AC_INIT([libuser], [0.64], [https://pagure.io/libuser], ,
+         [https://pagure.io/libuser])
+ AC_PREREQ([2.63b])
+ AC_CONFIG_HEADERS(config.h)
+-- 
+2.34.1
+
diff --git a/meta-gnome/recipes-support/libuser/libuser_0.64.bb b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
index 6d3bce8a1c..27cbb43486 100644
--- a/meta-gnome/recipes-support/libuser/libuser_0.64.bb
+++ b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://releases.pagure.org/libuser/libuser-${PV}.tar.gz \
            file://0001-docs-Disable-building.patch \
            file://0002-remove-unused-execinfo.h.patch \
            file://gtkdoc.patch \
+           file://0001-configure.ac-update-version-to-0.64.patch \
            "
 
 SRC_URI[sha256sum] = "ea6094c72cb9e60a42fb53509dc98d124a340f1c9222783b503208adc16a0a8f"
-- 
2.34.1


