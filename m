Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BBEF4368E
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 10:57:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39807.1776413762563789214
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=niV3d8cA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8567a08d2d=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H4nnQt817117
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 07:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=RrQ6cF5nD4Y5K+B3cIjn
	EvDgbYdepNWIm8U04bA1GSw=; b=niV3d8cAslzadEdBlaDaL+XQzR/Ok5qdIl+W
	qrKqNx+HtKr1OqkAc6SjQMdWjxu1MeUnEC/zTX5SwJhVWrfvJV5tFsZsYH64BZCP
	ecmTudg6BtH7LUSgMVsKepkRXiUUm1pKdAU36rYSM7cO5CrthgSqS2HewQrBffRh
	qfJC6VwAX7FUyoYnEpCovOy6wGBXvnwOYbE2ew6uHQ9TQPjkOHqpIRuOoY9Vv0fb
	TokgzyRsEvtT8VeidkuViiOoKlseiPYZ2ZPonVPWUVG5xrdz1B1FcvpzgCDj/Zr3
	aTOby4ebQzu95Y9lSTS01wWGeptWbt4M/8ewwV1sQDCKFfu0Lw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh877mt7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 07:54:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 17 Apr 2026 00:54:26 -0700
Received: from pek-lpggp2.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 17 Apr 2026 00:54:26 -0700
From: <haiqing.bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <haiqing.bai@windriver.com>
Subject: [oe][meta-networking][PATCH] drbd-utils: upgrade 9.30.0 -> 9.34.0
Date: Fri, 17 Apr 2026 15:54:24 +0800
Message-ID: <20260417075425.1290677-1-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: fUy_Q-zDoE1wagcBS3Z20eGIhyBSmg67
X-Authority-Analysis: v=2.4 cv=ZtHd7d7G c=1 sm=1 tr=0 ts=69e1e736 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=57SyGIRnAAAA:8
 a=llHmbnzomCU5aENerkwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fUy_Q-zDoE1wagcBS3Z20eGIhyBSmg67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3NyBTYWx0ZWRfX+Ds93UVyd/ro
 FEb8DqyUphInmxo6OTPUc3sdBb/YWhTXEfORC8dijCwrOXgqc3PMrOGXxmam+wE9nb2OoKYQkiJ
 Fi5g9nZKRn/sZtuUyWdv8vDWwYAcW2GvI1wM8vjV7YJ6//uJlwAvEstHUQ3SRltexsoF2Yg/+tO
 WAbkhIfcGdHZFPbJ7ViC37fCXS/bquGB5rZmEH9XKA337/8kJJFhs5TdIWOCQ78SkO8ijZXZlzw
 3OLpkhpwwH+0mmhUfH4w8hsZ5nm/QWwAxY0YV3FGCc6vE1+x7jZKCCqJtFIIVDVOO+swQoI5I2N
 gQoeaBwmTJNcNE99/YXKwNKk8nDO4NgdpJrmiU1obdr9NsRnMWbs+bhe/GVk1WJnF3akSdBqu8L
 JsCXrboBpx1jAgj+ButoSBwCL84SVM0Qy4MiLx9mgoAh2C1dsF8ujCcyW/PwaO8Ws/+5Plul8D3
 3OyU75/gNxLRkYE73eA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170077
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 10:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126433

From: Haiqing Bai <haiqing.bai@windriver.com>

Changes:
- Drop 0001-Fix-build-with-gcc-15.patch (merged upstream).
- Add 0001-fix-the-hardcoded-legacy-helper-path.patch: replace the
  hardcoded "/lib/drbd" path in add_lib_drbd_to_path() with the
  build-configured DRBD_LEGACY_LIB_DIR derived from LIBDIR
- Remove sed fixup for the now-absent ocf.ra@.service.
- Install new upstream 50-drbd.preset into systemd system-preset

Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
---
 .../0001-Fix-build-with-gcc-15.patch          | 34 ------------
 ...fix-the-hardcoded-legacy-helper-path.patch | 53 +++++++++++++++++++
 ...d-utils_9.30.0.bb => drbd-utils_9.34.0.bb} | 11 ++--
 3 files changed, 60 insertions(+), 38 deletions(-)
 delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-Fix-build-with-gcc-15.patch
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.30.0.bb => drbd-utils_9.34.0.bb} (88%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-Fix-build-with-gcc-15.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-Fix-build-with-gcc-15.patch
deleted file mode 100644
index 00105fb844..0000000000
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-Fix-build-with-gcc-15.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b42265af87d9efcc9aac91b3a3da3df5c5c66e29 Mon Sep 17 00:00:00 2001
-From: Nguyen Dat Tho <tho3.nguyen@lge.com>
-Date: Wed, 9 Apr 2025 17:33:25 +0900
-Subject: [PATCH] Fix build with gcc-15
-
-To fix the following error:
-In file included from string_matching.cpp:1:
-./string_matching.h:10:18: error: 'uint16_t' does not name a type
-   10 |     extern const uint16_t   PATTERN_LIMIT;
-      |                  ^~~~~~~~
-./string_matching.h:7:1: note: 'uint16_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
-
-Upstream-Status: Submitted [https://github.com/LINBIT/drbd-utils/pull/50]
-
-Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
----
- user/drbdmon/string_matching.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/user/drbdmon/string_matching.h b/user/drbdmon/string_matching.h
-index 9b3918fe..b783ba48 100644
---- a/user/drbdmon/string_matching.h
-+++ b/user/drbdmon/string_matching.h
-@@ -4,6 +4,7 @@
- #include <string>
- #include <memory>
- #include <stdexcept>
-+#include <cstdint>
- 
- namespace string_matching
- {
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch
new file mode 100644
index 0000000000..3d7c95b4a8
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-fix-the-hardcoded-legacy-helper-path.patch
@@ -0,0 +1,53 @@
+From 301e64db17466316ac34a28e30867cc7853777b5 Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Thu, 16 Apr 2026 10:00:19 +0000
+Subject: [PATCH] Fix the hardcoded legacy helper path
+
+Fix the below issue:
+"~# drbdadm --version
+execvp() failed to exec drbdadm-84: No such file or directory"
+
+The legacy helper path was hardcoded to "/lib/drbd", which does not exist
+on systems where LIBDIR is configured to a different location (e.g.
+/usr/lib). This caused drbdadm to fail when attempting to exec drbdadm-84.
+Use the build-configured DRBD_LEGACY_LIB_DIR (derived from LIBDIR) instead
+of the hardcoded path, so the legacy helper lookup respects the actual
+install prefix.
+
+Upstream-Status: Pending
+
+Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
+---
+ user/v9/Makefile.in       | 1 +
+ user/v9/drbdtool_common.c | 3 +--
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/user/v9/Makefile.in b/user/v9/Makefile.in
+index fa12f79..980c67c 100644
+--- a/user/v9/Makefile.in
++++ b/user/v9/Makefile.in
+@@ -70,6 +70,7 @@ CFLAGS += -DKEYUTILS
+ endif
+ ifeq ($(WITH_84_SUPPORT),yes)
+ CFLAGS += -DWITH_84_SUPPORT
++CFLAGS += -DDRBD_LEGACY_LIB_DIR=\"$(LIBDIR)\"
+ endif
+ CFLAGS += $(EXTRA_CFLAGS)
+ 
+diff --git a/user/v9/drbdtool_common.c b/user/v9/drbdtool_common.c
+index d07d054..ea95a16 100644
+--- a/user/v9/drbdtool_common.c
++++ b/user/v9/drbdtool_common.c
+@@ -332,8 +332,7 @@ void add_component_to_path(const char *path)
+ 
+ void add_lib_drbd_to_path(void)
+ {
+-		/* TODO: if exec-prefix != "/" ? */
+-	add_component_to_path("/lib/drbd");
++	add_component_to_path(DRBD_LEGACY_LIB_DIR);
+ }
+ 
+ /* from linux/crypto/crc32.c */
+-- 
+2.53.0
+
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.34.0.bb
similarity index 88%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.34.0.bb
index 4c520e8c78..abc406b5e0 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.30.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.34.0.bb
@@ -11,10 +11,10 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=master;prot
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/drbd-headers;branch=master;protocol=https \
            file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
-           file://0001-Fix-build-with-gcc-15.patch \
+           file://0001-fix-the-hardcoded-legacy-helper-path.patch \
            "
-SRCREV_drbd-utils = "36ea199f38b543b2da92219109c2832e122e5bf9"
-SRCREV_drbd-headers = "94f4472513f351efba5788f783feba6ac6efe9fc"
+SRCREV_drbd-utils = "7fe34d56a7264cfc92fc5270471827bb3f7773e6"
+SRCREV_drbd-headers = "8ab631bfa8eb606e53c86f50b9f2d6f51d0f9ca5"
 
 SRCREV_FORMAT = "drbd-utils_drbd-headers"
 
@@ -56,7 +56,9 @@ do_install:append() {
     sed -i -e 's#@nonarch_libdir@#${nonarch_libdir}#g' ${D}${systemd_unitdir}/system/drbd-wait-promotable@.service
     sed -i -e 's#@nonarch_libdir@#${nonarch_libdir}#g' ${D}${systemd_unitdir}/system/drbd.service
     sed -i -e 's#@nonarch_libdir@#${nonarch_libdir}#g' ${D}${systemd_unitdir}/system/drbd@.service
-    sed -i -e 's#@nonarch_libdir@#${nonarch_libdir}#g' ${D}${systemd_unitdir}/system/ocf.ra@.service
+
+    install -D -m 0644 ${D}/50-drbd.preset ${D}${systemd_unitdir}/system-preset/50-drbd.preset
+    rm -f ${D}/50-drbd.preset
 }
 
 RDEPENDS:${PN} += "bash perl-module-getopt-long perl-module-exporter perl-module-constant perl-module-overloading perl-module-exporter-heavy"
@@ -69,6 +71,7 @@ FILES:${PN} += "${nonarch_base_libdir}/drbd \
                 ${nonarch_libdir}/tmpfiles.d \
                 ${nonarch_libdir}/drbdscripts/* \
                 ${systemd_unitdir}/system/* \
+                ${systemd_unitdir}/system-preset/50-drbd.preset \
 "
 FILES:${PN}-dbg += "${nonarch_base_libdir}/drbd/.debug"
 
-- 
2.43.0


