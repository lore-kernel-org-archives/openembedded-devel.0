Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DFBC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 09:37:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9359.1715852232197702960
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 May 2024 02:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5866f41437=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G6MieM005766
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 02:37:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y286fv43g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 02:37:11 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 16 May 2024 02:37:11 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 02:37:10 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][meta-python][PATCH] python3-grpcio: fix do_compile failure for qemuppc64/qemuppc
Date: Thu, 16 May 2024 17:37:09 +0800
Message-ID: <20240516093709.2613717-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lsKfI_QXm95WGDBCSWvFhZWqF63tAeUl
X-Proofpoint-GUID: lsKfI_QXm95WGDBCSWvFhZWqF63tAeUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_05,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405160068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 09:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110414

From: Changqing Li <changqing.li@windriver.com>

define proper macro for ppc/ppc64 to fix compile error

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ....h-define-proper-macro-for-ppc-ppc64.patch | 37 +++++++++++++++++++
 .../python/python3-grpcio_1.62.2.bb           |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
new file mode 100644
index 000000000..0b512b1d0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-proper-macro-for-ppc-ppc64.patch
@@ -0,0 +1,37 @@
+From b3bca013007a4a66703573d243e433f22e1e6684 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 15 May 2024 16:55:09 +0800
+Subject: [PATCH] target.h: define proper macro for ppc/ppc64
+
+Fix error:
+third_party/boringssl-with-bazel/src/include/openssl/target.h:74:2: error: #error "Unknown target CPU"
+third_party/boringssl-with-bazel/src/include/openssl/bn.h:172:2: error: #error "Must define either OPENSSL_32_BIT or OPENSSL_64_BIT"
+third_party/boringssl-with-bazel/src/include/openssl/bn.h:230:44: error: 'BN_ULONG' has not been declared
+
+BN_ULONG will be defined after set proper OPENSSL_32_BIT or OPENSSL_64_BIT
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ third_party/boringssl-with-bazel/src/include/openssl/target.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/third_party/boringssl-with-bazel/src/include/openssl/target.h b/third_party/boringssl-with-bazel/src/include/openssl/target.h
+index 29b1dc6..d779813 100644
+--- a/third_party/boringssl-with-bazel/src/include/openssl/target.h
++++ b/third_party/boringssl-with-bazel/src/include/openssl/target.h
+@@ -54,6 +54,10 @@
+ #define OPENSSL_32_BIT
+ #elif defined(__myriad2__)
+ #define OPENSSL_32_BIT
++#elif defined(__PPC64__)
++#define OPENSSL_64_BIT
++#elif defined(__PPC__)
++#define OPENSSL_32_BIT
+ #else
+ // The list above enumerates the platforms that BoringSSL supports. For these
+ // platforms we keep a reasonable bar of not breaking them: automated test
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
index 3cee8ab10..47f3b2ea2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
            file://0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch;patchdir=third_party/boringssl-with-bazel/src/ \
+           file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
            "
 SRC_URI[sha256sum] = "c77618071d96b7a8be2c10701a98537823b9c65ba256c0b9067e0594cdbd954d"
 
-- 
2.25.1


