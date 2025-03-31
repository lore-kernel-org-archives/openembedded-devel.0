Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50868C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:46:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.47977.1743414396062206899
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6185d269ee=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6HtPQ009184
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:46:35 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8sx2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:46:35 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 31 Mar 2025 02:46:34 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 31 Mar 2025 02:46:33 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2 1/3] minizip-ng: Add new recipe
Date: Mon, 31 Mar 2025 17:46:30 +0800
Message-ID: <20250331094632.2373216-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: C19IJ1wGAxVS-6WKv1JteTpvPh0wd8qo
X-Proofpoint-ORIG-GUID: C19IJ1wGAxVS-6WKv1JteTpvPh0wd8qo
X-Authority-Analysis: v=2.4 cv=RNizH5i+ c=1 sm=1 tr=0 ts=67ea647b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=I6YT6gub8Ag393kadaQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=955
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116428

From: Mingli Yu <mingli.yu@windriver.com>

minizip-ng is a zip manipulation library written in C that is supported
on Windows, macOS, and Linux.

minizip-ng has new features and bug fixes compared to the original library
minizip [1] which had not been maintained for a long period of time.

[1] https://github.com/madler/zlib/tree/master/contrib/minizip

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../minizip-ng/minizip-ng_4.0.8.bb            | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb

diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
new file mode 100644
index 0000000000..90882a1e58
--- /dev/null
+++ b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Zlib manipulation Library"
+DESCRIPTION = "minizip-ng is a zip manipulation library written in C that is supported \
+on Windows, macOS, and Linux."
+HOMEPAGE = "https://github.com/zlib-ng/minizip-ng"
+SECTION = "libs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=36964f044224efeedd694983c34e716f"
+
+SRC_URI = "git://github.com/zlib-ng/minizip-ng.git;protocol=https;branch=master"
+
+SRCREV = "55db144e03027b43263e5ebcb599bf0878ba58de"
+
+S = "${WORKDIR}/git"
+
+RCONFLICTS:${PN} += "minizip"
+
+DEPENDS = "xz openssl bzip2"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE = "-DMZ_FORCE_FETCH_LIBS=OFF \
+                 -DBUILD_SHARED_LIBS=ON \
+"
+
+PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG[zlib] = "-DMZ_ZLIB=ON,-DMZ_ZLIB=OFF, zlib"
+PACKAGECONFIG[zlib-ng] = "-DMZ_ZLIB=ON,-DMZ_ZLIB=OFF, zlib-ng"
+
+
+do_install:append () {
+    # remove absolute paths
+    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/minizip/minizip.cmake
+}
+
-- 
2.34.1


