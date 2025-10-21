Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB8ACCD1A5
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 10:22:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7890.1761042156358255371
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 03:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZnLYd7K9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2389149868=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59L9dSQX2638941
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 03:22:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=RiBDQl2TMxBB9FlfyRCZ
	lA/kSAHLGtJgqQC958cavpE=; b=ZnLYd7K9hG8xOFdurLsNnx3L7e/Ubn/2wiMD
	Y0ocZZJJNK6B5mzXbGTlRUzfqav0DzXrvLnPkIDbJzwoBEfn8ShjBash+n1kchmd
	g0yhGXPGW10cHiu/Rz1hVUyeAD8G9KBq+MRIl24kEIY5Okt5a109HN5sMuwNMwVb
	IDSe3IfNZALAwByK3uazFASTB0SCVbAhqUlyDoMGFHKv1TZrPJuAXHsPe7aeJbkT
	eyKqDPyIwoVIU9XrKcOY7kXbu5TkDKPt6PycLfjxoM1POb5iK1p+32AYg69780wa
	1/vnSt5njbL/dtwECzlRhY6mw28gZ9CpZlO+P3R/jWHR692i0Q==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49vadj2m4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 03:22:35 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 21 Oct 2025 03:22:35 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 21 Oct 2025 03:22:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] poppler: fix racing build issue
Date: Tue, 21 Oct 2025 18:22:33 +0800
Message-ID: <20251021102233.706528-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gHnjGa2rdld70RREtSgDAccWqLfpt4tT
X-Authority-Analysis: v=2.4 cv=K+4v3iWI c=1 sm=1 tr=0 ts=68f75eeb cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Ud-fGmwBAAAA:8 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=1RYnrb_XOU5N2zFwRhgA:9 a=H0_BfbLtyfsadj6IJfz3:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDA4MSBTYWx0ZWRfX4HxtJo664pT0
 5TH2wH2kclGd2eKcqtUAIkhcN5LeBFjWJ42DchRx2CN2E+CH+Q89SV4WlFMts5nUyTtTp+lWvW6
 t12bqfSQr6eUhqewcihXy+wsToH4XILK4fHZHJaXAHs8rrsBbIQ2f9DwCNqjXL+EU9LloV9Zywh
 BVvjeM6Q8cZnyHfJzYLkJSoQB/B8CmIMCL4livOxS7qa67cHyX0cKSDFumLela0K2fa3SzC8dY9
 cKD4HE57RXQaAm2IuN9iz79uiagjQ+EJ+67aQB1g8GvUmB1z5GeABPl52p3hl6d24en82tgm3+e
 h0d7RD+xbdQFsTmWUrZQiEHg39an8qbq98mIv/M3+RR1G1Wa0UO6H2cWw2+Y1DADnJQ9V1shm+f
 URuwsdQzaV90kGwSPNv/n9fo5mRR+w==
X-Proofpoint-GUID: gHnjGa2rdld70RREtSgDAccWqLfpt4tT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510210081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 10:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120834

There is a racing issue in world build while multilib enabled:

...log.do_install...
CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
  file INSTALL cannot find
  "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/po/ca/pdfsig.gmo":
  No such file or directory.
Call Stack (most recent call first):
  utils/po/cmake_install.cmake:47 (include)
  utils/cmake_install.cmake:243 (include)
  cmake_install.cmake:229 (include)
...log.do_install...

It seems gettext_process_po_files has racing issue [1], but
not sure, and the catalan translation of pdfsig is not vital
for poppler. So revert upstream commit "pdfsig: Catalan translation"
to workaround

[1] https://public.kitware.com/Bug/view.php?id=14904

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-workaround-build-racing.patch        | 43 +++++++++++++++++++
 .../poppler/poppler_25.08.0.bb                |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-workaround-build-racing.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-workaround-build-racing.patch b/meta-oe/recipes-support/poppler/poppler/0001-workaround-build-racing.patch
new file mode 100644
index 0000000000..fdf4f7ff70
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0001-workaround-build-racing.patch
@@ -0,0 +1,43 @@
+From 83ad73024c69d41fda302f39acf50c381684890e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 21 Oct 2025 02:39:36 -0700
+Subject: [PATCH] workaround build racing
+
+There is a racing issue in world build while multilib enabled:
+
+...log.do_install...
+CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
+  file INSTALL cannot find
+  "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/po/ca/pdfsig.gmo":
+  No such file or directory.
+Call Stack (most recent call first):
+  utils/po/cmake_install.cmake:47 (include)
+  utils/cmake_install.cmake:243 (include)
+  cmake_install.cmake:229 (include)
+...log.do_install...
+
+Revert "pdfsig: Catalan translation" to workaround
+
+This reverts commit 99f5416d9bfb6a34bbc5cbcb368e258b98fd3f08.
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ utils/po/ca/CMakeLists.txt | 4 ----
+ 1 file changed, 4 deletions(-)
+ delete mode 100644 utils/po/ca/CMakeLists.txt
+
+diff --git a/utils/po/ca/CMakeLists.txt b/utils/po/ca/CMakeLists.txt
+deleted file mode 100644
+index 3225131c..00000000
+--- a/utils/po/ca/CMakeLists.txt
++++ /dev/null
+@@ -1,4 +0,0 @@
+-get_filename_component(_lang ${CMAKE_CURRENT_SOURCE_DIR} NAME)
+-gettext_process_po_files(${_lang} ALL INSTALL_DESTINATION ${CMAKE_INSTALL_LOCALEDIR} PO_FILES
+-  pdfsig.po
+-)
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb b/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
index 45f94b0ae7..3b0b4b0e99 100644
--- a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
+           file://0001-workaround-build-racing.patch \
            "
 SRC_URI[sha256sum] = "425ed4d4515a093bdcdbbaac6876f20617451edc710df6a4fd6c45dd67eb418d"
 
-- 
2.34.1


