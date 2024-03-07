Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD0FC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 05:51:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16856.1709790699046090871
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 21:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TxVT7i5I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3796958646=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4274orH7003926
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Mar 2024 21:51:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=3bhOH
	cCIuMD7YK6Dw8AhTkwRvYA9ckS0q9Gmx5CWgac=; b=TxVT7i5IN0XKDbJ0coKyW
	49e08ssQqUL/nrMHP63AwJmRYMM6m1/R4z6QyKjsKpfuML/TxwqzxkZnrSXZ1rS/
	npZB4pncIx25lZ/pefUm7tCdcXP0XKm2AwVWivIVJKagtBQoakFI9iy6gSO3+KSB
	A0OCow4VbR6x0wsGRqV2H5MNzYDZwSbWX64gJj2G4MvELg1yEbrLPcbWk8mDc0oO
	n4VzfQ83RN1ZAOKoNN50xyBLRt1dPulOLS0ca/bftXdUrTPkBQgtoybp9CmZ6XCj
	8t11yIewHZ39X1lfZYtkv8mQReBIlBwOkPV0vSkTMuolsy2FXRBn0g6ESDglNI9k
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm4fkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 21:51:38 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 21:51:37 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 21:51:37 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] nss: Upgrade 3.74 -> 3.98
Date: Thu, 7 Mar 2024 13:51:36 +0800
Message-ID: <20240307055136.2344175-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FOz-NbIaAfqj7XyuEYcoalKxQWz6seJs
X-Proofpoint-GUID: FOz-NbIaAfqj7XyuEYcoalKxQWz6seJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_02,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 05:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109190

From: Mingli Yu <mingli.yu@windriver.com>

* Remove one backported patch and rebase two patches to the new version.

* License update:
  Copyright year updated to 2023

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...validation-date-for-PayPalEE-test-ce.patch | 64 -------------------
 ...figure-option-to-disable-ARM-HW-cryp.patch | 14 ++--
 ...0001-nss-fix-support-cross-compiling.patch | 14 ++--
 .../nss/{nss_3.74.bb => nss_3.98.bb}          |  5 +-
 4 files changed, 16 insertions(+), 81 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch
 rename meta-oe/recipes-support/nss/{nss_3.74.bb => nss_3.98.bb} (97%)

diff --git a/meta-oe/recipes-support/nss/nss/0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch b/meta-oe/recipes-support/nss/nss/0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch
deleted file mode 100644
index d905bf10e..000000000
--- a/meta-oe/recipes-support/nss/nss/0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 1109c1b8259ad840ac1688d533f76ca268c67b6b Mon Sep 17 00:00:00 2001
-From: "John M. Schanck" <jschanck@mozilla.com>
-Date: Sat, 5 Feb 2022 11:12:43 +0000
-Subject: [PATCH] Bug 1750624 - Pin validation date for PayPalEE test cert.
- r=nss-reviewers,bbeurdouche,rrelyea
-
-Differential Revision: https://phabricator.services.mozilla.com/D136289
-
---HG--
-extra : moz-landing-system : lando
-
-Upstream-Status: Backport
-
----
- tests/chains/chains.sh               | 6 +++++-
- tests/chains/scenarios/realcerts.cfg | 1 +
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/tests/chains/chains.sh b/tests/chains/chains.sh
-index 32c7ef54c..e13ae52f9 100755
---- a/nss/tests/chains/chains.sh
-+++ b/nss/tests/chains/chains.sh
-@@ -917,7 +917,7 @@ verify_cert()
-     done
- 
-     VFY_OPTS_TNAME="${DB_OPT} ${ENGINE} ${TRUST_AND_DB_OPT} ${REV_OPTS} ${FETCH_OPT} ${USAGE_OPT} ${POLICY_OPT} ${TRUST_OPT}"
--    VFY_OPTS_ALL="${DB_OPT} ${ENGINE} -vv ${TRUST_AND_DB_OPT} ${REV_OPTS} ${FETCH_OPT} ${USAGE_OPT} ${POLICY_OPT} ${VFY_CERTS} ${TRUST_OPT}"
-+    VFY_OPTS_ALL="${DB_OPT} ${ENGINE} -vv ${VFY_TIME_OPT} ${TRUST_AND_DB_OPT} ${REV_OPTS} ${FETCH_OPT} ${USAGE_OPT} ${POLICY_OPT} ${VFY_CERTS} ${TRUST_OPT}"
- 
-     TESTNAME="Verifying certificate(s) ${VFY_LIST} with flags ${VFY_OPTS_TNAME}"
-     echo "${SCRIPTNAME}: ${TESTNAME}"
-@@ -1118,6 +1118,7 @@ parse_config()
-             ;;
-         "verify")
-             VERIFY="${VALUE}"
-+            VFY_TIME_OPT=
-             TRUST=
-             TRUST_AND_DB=
-             POLICY=
-@@ -1126,6 +1127,9 @@ parse_config()
-             REV_OPTS=
-             USAGE_OPT=
-             ;;
-+        "at_time")
-+            VFY_TIME_OPT="-b ${VALUE}"
-+            ;;
-         "cert")
-             VERIFY="${VERIFY} ${VALUE}"
-             ;;
-diff --git a/tests/chains/scenarios/realcerts.cfg b/tests/chains/scenarios/realcerts.cfg
-index 305443fc3..f8b0fc452 100644
---- a/nss/tests/chains/scenarios/realcerts.cfg
-+++ b/nss/tests/chains/scenarios/realcerts.cfg
-@@ -22,6 +22,7 @@ verify TestUser51:x
- 
- verify PayPalEE:x
-   policy OID.2.16.840.1.114412.2.1 
-+  at_time 2201010000Z
-   result pass
- 
- verify BrAirWaysBadSig:x
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index 72ee1ee00..b7f1b01a1 100644
--- a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -1,4 +1,4 @@
-From 9937e89c22eb2f2db9a936e7bc4442857b4192f5 Mon Sep 17 00:00:00 2001
+From 7c8f367faf8848a43a414079189e10270d6c0fcc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 18 Dec 2019 12:29:50 +0100
 Subject: [PATCH] freebl: add a configure option to disable ARM HW crypto
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index b38889f..4616aac 100644
+index 7ee8736..f9b4925 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
-@@ -139,6 +139,8 @@ endif
+@@ -142,6 +142,8 @@ endif
          endif
      endif
  endif
@@ -27,16 +27,16 @@ index b38889f..4616aac 100644
  ifeq ($(CPU_ARCH),aarch64)
      ifdef CC_IS_CLANG
          DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-@@ -180,6 +182,7 @@ endif
+@@ -183,6 +185,7 @@ endif
          endif
      endif
  endif
 +endif
  
- ifeq ($(OS_TARGET),OSF1)
-     DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
+ ifeq (OS2,$(OS_TARGET))
+     ASFILES  = mpi_x86_os2.s
 diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
-index ac461b4..04cb180 100644
+index 2dae724..9ee7fc8 100644
 --- a/nss/lib/freebl/gcm.c
 +++ b/nss/lib/freebl/gcm.c
 @@ -18,6 +18,7 @@
diff --git a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
index 950fae667..2385fd3b9 100644
--- a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 919fc5d674fae99fe21ba1351d98b75e466f425f Mon Sep 17 00:00:00 2001
+From 46ab1ca6e6fb8e1196e0665a54506dff370f8f2a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 22 Feb 2017 11:36:11 +0200
 Subject: [PATCH] nss: fix support cross compiling
@@ -10,15 +10,15 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- nss/coreconf/arch.mk    | 2 +-
+ nss/coreconf/arch.mk    | 4 ++--
  nss/lib/freebl/Makefile | 6 ++++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
+ 2 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
-index 2012d18..78fca62 100644
+index 17e9fae..bc4180a 100644
 --- a/nss/coreconf/arch.mk
 +++ b/nss/coreconf/arch.mk
-@@ -26,11 +26,11 @@ OS_ARCH := $(subst /,_,$(shell uname -s)
+@@ -26,11 +26,11 @@ OS_ARCH := $(subst /,_,$(shell uname -s))
  # Attempt to differentiate between sparc and x86 Solaris
  #
  
@@ -31,9 +31,9 @@ index 2012d18..78fca62 100644
 +    OS_RELEASE ?= $(shell uname -r)
  endif
  
- #
+ 
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index 0b8c6f4..b38889f 100644
+index eeee90a..7ee8736 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -36,6 +36,12 @@ ifdef USE_64
diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.98.bb
similarity index 97%
rename from meta-oe/recipes-support/nss/nss_3.74.bb
rename to meta-oe/recipes-support/nss/nss_3.98.bb
index ea5abe07f..01501362e 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -16,7 +16,7 @@ LICENSE = "(MPL-2.0 & MIT) | (MPL-2.0 & GPL-2.0-or-later & MIT) | (MPL-2.0 & LGP
 LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132 \
-                    file://nss/lib/freebl/verified/Hacl_Poly1305_256.c;beginline=1;endline=22;md5=d4096c1e4421ee56e9e0f441a8161f78"
+                    file://nss/lib/freebl/verified/Hacl_Poly1305_256.c;beginline=1;endline=22;md5=cc22f07b95d28d56baeb757df46ee7c8"
 
 VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
 
@@ -32,9 +32,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://system-pkcs11.txt \
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
-           file://0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch \
            "
-SRC_URI[sha256sum] = "88928811f9f40f87d42e2eaccdf6e454562e51486067f2ddbe90aa47ea6cd056"
+SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.25.1


