Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5493AC36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:45:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2552.1743579944954535105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6187dfc01b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53269YGZ010857
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Apr 2025 00:45:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtc9rfhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 00:45:44 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 2 Apr 2025 00:45:43 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 2 Apr 2025 00:45:43 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v3 1/3] minizip-ng: Add new recipe
Date: Wed, 2 Apr 2025 15:45:40 +0800
Message-ID: <20250402074542.2842980-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2g-Q7mfcEQ6fDGFe4YfDCI-sKEp8YEH3
X-Authority-Analysis: v=2.4 cv=Tb2WtQQh c=1 sm=1 tr=0 ts=67eceb28 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=tRVMadOLXIa04o2Br9gA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2g-Q7mfcEQ6fDGFe4YfDCI-sKEp8YEH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 07:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116509

From: Mingli Yu <mingli.yu@windriver.com>

minizip-ng is a zip manipulation library written in C that is supported
on Windows, macOS, and Linux.

minizip-ng has new features and bug fixes compared to the original library
minizip [1] which had not been maintained for a long period of time.

[1] https://github.com/madler/zlib/tree/master/contrib/minizip

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...0001-crypt.h-Remove-register-keyword.patch | 35 ++++++++++++++++++
 .../minizip-ng/minizip-ng_4.0.8.bb            | 36 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch
 create mode 100644 meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb

diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch b/meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch
new file mode 100644
index 0000000000..c471b098d4
--- /dev/null
+++ b/meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch
@@ -0,0 +1,35 @@
+From 469beab0747549599959a30188deb3b27df3a346 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 2 Apr 2025 11:19:54 +0800
+Subject: [PATCH] crypt.h: Remove register keyword
+
+Fixes:
+ | In file included from /buildarea/tmp/work/core2-64-poky-linux/minizip-ng/4.0.8/git/test/test_compat.cc:17:
+ | /buildarea/tmp/work/core2-64-poky-linux/minizip-ng/4.0.8/git/compat/crypt.h:62:9: error: ISO C++17 does not allow 'register' storage class specifier [-Wregister]
+ |    62 |         register int keyshift = (int)((*(pkeys + 1)) >> 24);
+ |       |         ^~~~~~~~
+ | 1 error generated.
+
+Upstream-Status: Submitted [https://github.com/zlib-ng/minizip-ng/pull/853]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ compat/crypt.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/compat/crypt.h b/compat/crypt.h
+index 41c6454..ccdd83a 100644
+--- a/compat/crypt.h
++++ b/compat/crypt.h
+@@ -59,7 +59,7 @@ static int update_keys(unsigned long *pkeys, const z_crc_t *pcrc_32_tab, int c)
+     (*(pkeys + 1)) += (*(pkeys + 0)) & 0xff;
+     (*(pkeys + 1)) = (*(pkeys + 1)) * 134775813L + 1;
+     {
+-        register int keyshift = (int)((*(pkeys + 1)) >> 24);
++        int keyshift = (int)((*(pkeys + 1)) >> 24);
+         (*(pkeys + 2)) = CRC32((*(pkeys + 2)), keyshift);
+     }
+     return c;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
new file mode 100644
index 0000000000..14363d2278
--- /dev/null
+++ b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Zlib manipulation Library"
+DESCRIPTION = "minizip-ng is a zip manipulation library written in C that is supported \
+on Windows, macOS, and Linux."
+HOMEPAGE = "https://github.com/zlib-ng/minizip-ng"
+SECTION = "libs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=36964f044224efeedd694983c34e716f"
+
+SRC_URI = "git://github.com/zlib-ng/minizip-ng.git;protocol=https;branch=master \
+           file://0001-crypt.h-Remove-register-keyword.patch \
+"
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


