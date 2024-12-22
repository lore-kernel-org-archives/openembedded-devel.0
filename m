Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA76BE7718D
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 08:16:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21524.1734855377847050225
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Dec 2024 00:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208694af22=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BM7LDJD005518;
	Sun, 22 Dec 2024 08:16:16 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43njw0rxmk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 22 Dec 2024 08:16:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 22 Dec 2024 00:16:15 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 22 Dec 2024 00:16:14 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/4] Update p7zip to 7zip
Date: Sun, 22 Dec 2024 16:16:10 +0800
Message-ID: <20241222081612.239474-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241222081612.239474-1-hongxu.jia@windriver.com>
References: <20241222081612.239474-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Yc5H5xRf c=1 sm=1 tr=0 ts=6767cad0 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=5Ayg2Ohv2b7I1Z2Q0e8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Jx95QNpMPTdt_OPIZpAF92ZT-jdV22LM
X-Proofpoint-GUID: Jx95QNpMPTdt_OPIZpAF92ZT-jdV22LM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-22_03,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412220073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Dec 2024 08:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114459

Due to commit [Use 7zip 2409 to replace p7zip 16.02] applied,
update affected recipes

(cherry picked from commit 751cc692ee13f0e7ba7a82d73dd4c987da3d578d)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb | 4 ++--
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-rarfile_4.2.bb    | 2 +-
 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index e9b0c97e9..72d29e571 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
-DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools p7zip libselinux googletest"
+DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools 7zip libselinux googletest"
 
 SRCREV_core = "abfd66fafcbb691d7860df059f1df1c9b1ef29da"
 
@@ -166,7 +166,7 @@ do_install() {
 
 PACKAGES =+ "${PN}-fstools ${PN}-adbd"
 
-RDEPENDS:${BPN} = "${BPN}-conf p7zip"
+RDEPENDS:${BPN} = "${BPN}-conf 7zip"
 
 FILES:${PN}-adbd = "\
     ${bindir}/adbd \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 71f74287c..7af2af905 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -374,7 +374,7 @@ RDEPENDS:packagegroup-meta-oe-extended ="\
     nana \
     nicstat \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "openwsman", "", d)} \
-    p7zip \
+    7zip \
     isomd5sum \
     jpnevulator \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-datetime polkit-group-rule-network polkit", "", d)} \
diff --git a/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb b/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
index 41cff4bfc..6f3012d1e 100644
--- a/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
@@ -13,7 +13,7 @@ inherit pypi
 PYPI_PACKAGE="rarfile"
 
 RDEPENDS:${PN} += "\
-    p7zip \
+    7zip \
     python3-core \
     python3-datetime \
     python3-crypt \
diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
index abb5c14e6..4822f0cad 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
@@ -30,4 +30,4 @@ do_configure:prepend() {
 
 FILES:${PN} += "${libdir}/thunar-archive-plugin"
 
-RRECOMMENDS:${PN} = "lzop zip tar bzip2 unzip xz p7zip"
+RRECOMMENDS:${PN} = "lzop zip tar bzip2 unzip xz 7zip"
-- 
2.34.1


