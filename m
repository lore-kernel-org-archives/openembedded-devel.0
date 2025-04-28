Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FEBC36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 07:10:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.42331.1745824169644619702
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 00:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62139e711a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S4FLF3008429
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:09:29 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1akr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:09:28 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 28 Apr 2025 00:09:27 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 28 Apr 2025 00:09:26 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [walnascar][PATCH 4/6] libuser: correct the package version
Date: Mon, 28 Apr 2025 15:09:20 +0800
Message-ID: <20250428070922.3944580-5-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428070922.3944580-1-changqing.li@windriver.com>
References: <20250428070922.3944580-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680f29a8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=lViJMyulAAAA:8 a=XEQRnViFAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=oMCc9RdpAGuaAqeP18oA:9
 a=oAvoXAQRkUwA:10 a=6b1rEjNPiTsA:10 a=gb9IC-u5QvZuJU0a8fSk:22 a=1XHicvQM08eBGpD5cucn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KR8hTnizr2eLJ20V_yZnC8Q6DVNBsDkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA1OCBTYWx0ZWRfX9xQP+tB411Nz 6wMSVPviDpAIOHg3OX4NJ+5CmTE07dxnzmd9sutU5UvqgmR8aTTnDyxidAdQGR+4AXgTWxib6Cv JgusWYBy1kpNgmeF3m0vjNwRB8YmcJPziFNdw8EFn4qUvYtMzuC0HY21PE1tWVMW1tICYBmWDb4
 qIBfLz4kpdPI/xiV0dwS22YkVD4VTecGC+9Uiz7kyetuT3htb2Ksll69uhNGeFHLleRjkOjuqTH rgCIZSB5fGZoFpldWTCw0FKQlo5YbYAmH5RWJeFmg50ZZ6OIjEm49xVr8PGclEJ5jAteZOzMAJj e4+Br9oqkwq7e6/yn87MN1wKWjrl2Adm/IcstnKcM1p/7qow9lHsRTSFpDDr1Qf4PwlbjY28fhh
 WSwrJ1GFo2/lPYS88oYeGdVj5nwiPBpc5SBA4iMrfSqrmjhaJGM/AVxHT7zgH3H7q8p4iyma
X-Proofpoint-GUID: KR8hTnizr2eLJ20V_yZnC8Q6DVNBsDkY
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117186

From: Changqing Li <changqing.li@windriver.com>

correct the package version in configure.ac

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


