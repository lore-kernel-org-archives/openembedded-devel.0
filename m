Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3335AE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 08:48:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.125819.1734598081810627108
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 00:48:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=208319dcd1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ7oOha015742
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 00:48:01 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h6685c7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 00:48:01 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Dec 2024 00:48:00 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Dec 2024 00:48:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/3] Update p7zip to 7zip
Date: Thu, 19 Dec 2024 16:47:57 +0800
Message-ID: <20241219084758.3809790-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219084758.3809790-1-hongxu.jia@windriver.com>
References: <20241219084758.3809790-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: C9yNHXnuZcYNWmHdF6zsSpnfa2_GZ9An
X-Authority-Analysis: v=2.4 cv=K5XYHzWI c=1 sm=1 tr=0 ts=6763ddc1 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=ybSwKhoZCyFeAVVXRqUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: C9yNHXnuZcYNWmHdF6zsSpnfa2_GZ9An
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_03,2024-12-18_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 08:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114381

Due to commit [Use 7zip 2409 to replace p7zip 16.02] applied,
update affected recipes

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb | 4 ++--
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-rarfile_4.2.bb    | 2 +-
 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index d2680b457..ee665bb15 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
-DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools p7zip libselinux googletest"
+DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools 7zip libselinux googletest"
 
 SRCREV_core = "abfd66fafcbb691d7860df059f1df1c9b1ef29da"
 
@@ -168,7 +168,7 @@ do_install() {
 
 PACKAGES =+ "${PN}-fstools ${PN}-adbd"
 
-RDEPENDS:${BPN} = "${BPN}-conf p7zip"
+RDEPENDS:${BPN} = "${BPN}-conf 7zip"
 
 FILES:${PN}-adbd = "\
     ${bindir}/adbd \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index cffd2d687..4065eae52 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -385,7 +385,7 @@ RDEPENDS:packagegroup-meta-oe-extended = "\
     nicstat \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "openwsman", "", d)} \
     ostree \
-    p7zip \
+    7zip \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pam-plugin-ldapdb pam-ssh-agent-auth", "", d)} \
     pegtl \
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


