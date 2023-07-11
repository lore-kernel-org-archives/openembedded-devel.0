Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B5AEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 13:39:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.562.1689082763810467315
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 06:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=khtyaITf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6556157c56=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36BBjehn010128
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 13:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=EIm+nOmB2JNhd+v6iY
	qxRVPNnbwNusoJcaSdUylqe2c=; b=khtyaITfwLwr62R/fqjPHrm+0k588N0nyG
	kLAIBCeJfc39WV5rhMcYK8+FsrqzK6bRE1qXW34Y2AHewKyB6uoHVgerm1QOgyHe
	RREbNY4IrkMRcN7dWYvA9b1FVoGhgCI+ywZRVgJ+M+QTpFNY6rMN3LJkE/od6HyJ
	FrYIdAKnvbscOmWc0+tXgOCY3ge+vJKSb6gdUph7SXa/f/nAsaQ8sbzXWre17O73
	BGj+5YZG3y7h1yNAWWGxk+1B7z0CvZINbYEgTVktO9/fRIXYCtlCvROlsek7/nOm
	RVgoZJprmp9gy1XZjAzpUsVcYlGOmJbN6FFJJ/e7tMYfrwXxzHRQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rpw0wjk4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 13:39:22 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 06:39:20 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] nodejs: upgrade 16.19.1 -> 16.20.1
Date: Tue, 11 Jul 2023 13:39:05 +0000
Message-ID: <20230711133905.1168340-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: TmtYi9RFWB_UqNJavTOhTIktTm8kqVTQ
X-Proofpoint-GUID: TmtYi9RFWB_UqNJavTOhTIktTm8kqVTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_07,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307110122
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36BBjehn010128
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 13:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103728

Drop the gcc13.patch as it has been merged in 16.20.1
    56cbc7fdda deps: V8: cherry-pick c2792e58035f

The list of the CVEs are fixed in this relase:

    CVE-2023-30581
    CVE-2023-30585
    CVE-2023-30588
    CVE-2023-30589
    CVE-2023-30590

https://nodejs.org/en/blog/release/v16.20.0
https://nodejs.org/en/blog/release/v16.20.1

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                              |  0
 ....19.bb =3D> nodejs-oe-cache-native_16.20.bb} |  0
 .../nodejs/nodejs/gcc13.patch                 | 75 -------------------
 .../{nodejs_16.19.1.bb =3D> nodejs_16.20.1.bb}  |  3 +-
 4 files changed, 1 insertion(+), 77 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.19 =3D> nodej=
s-oe-cache-16.20}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.19.bb =
=3D> nodejs-oe-cache-native_16.20.bb} (100%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_16.19.1.bb =3D> nodejs_16=
.20.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.19/oe-npm=
-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.20/oe-npm-cac=
he
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.19/oe-npm-=
cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.20/oe-npm-ca=
che
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.19=
.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.20.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.19.=
bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.20.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch b/meta-oe=
/recipes-devtools/nodejs/nodejs/gcc13.patch
deleted file mode 100644
index bff349739..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 576aed71db7b40c90b44c623580629792a606928 Mon Sep 17 00:00:00 2001
-From: Jiawen Geng <technicalcute@gmail.com>
-Date: Fri, 14 Oct 2022 09:54:33 +0800
-Subject: [PATCH] deps: V8: cherry-pick c2792e58035f
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Original commit message:
-
-    [base] Fix build with gcc-13
-
-    See https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes.
-
-    Also see Gentoo Linux bug report: https://bugs.gentoo.org/865981
-
-    Change-Id: I421f396b02ba37e12ee70048ee33e034f8113566
-    Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/3934=
140
-    Reviewed-by: Clemens Backes <clemensb@chromium.org>
-    Reviewed-by: Simon Z=C3=BCnd <szuend@chromium.org>
-    Commit-Queue: Clemens Backes <clemensb@chromium.org>
-    Cr-Commit-Position: refs/heads/main@{#83587}
-
-Refs: https://github.com/v8/v8/commit/c2792e58035fcbaa16d0cb70998852fbeb=
5df4cc
-PR-URL: https://github.com/nodejs/node/pull/44961
-Fixes: https://github.com/nodejs/node/issues/43642
-Reviewed-By: Micha=C3=ABl Zasso <targos@protonmail.com>
-Reviewed-By: Richard Lau <rlau@redhat.com>
-Reviewed-By: Luigi Pinca <luigipinca@gmail.com>
-Reviewed-By: Colin Ihrig <cjihrig@gmail.com>
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/0be1c57=
28173ea9ac42843058e26b6268568acf0]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- deps/v8/AUTHORS                               | 1 +
- deps/v8/src/base/logging.h                    | 1 +
- deps/v8/src/inspector/v8-string-conversions.h | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/deps/v8/AUTHORS b/deps/v8/AUTHORS
-index 35c49a01..736d3df9 100644
---- a/deps/v8/AUTHORS
-+++ b/deps/v8/AUTHORS
-@@ -236,6 +236,7 @@ Vlad Burlik <vladbph@gmail.com>
- Vladimir Krivosheev <develar@gmail.com>
- Vladimir Shutoff <vovan@shutoff.ru>
- Wael Almattar <waelsy123@gmail.com>
-+WANG Xuerui <git@xen0n.name>
- Wei Wu <lazyparser@gmail.com>
- Wenlu Wang <kingwenlu@gmail.com>
- Wenyu Zhao <wenyu.zhao@anu.edu.au>
-diff --git a/deps/v8/src/base/logging.h b/deps/v8/src/base/logging.h
-index 08db24a9..38be165f 100644
---- a/deps/v8/src/base/logging.h
-+++ b/deps/v8/src/base/logging.h
-@@ -5,6 +5,7 @@
- #ifndef V8_BASE_LOGGING_H_
- #define V8_BASE_LOGGING_H_
-=20
-+#include <cstdint>
- #include <cstring>
- #include <sstream>
- #include <string>
-diff --git a/deps/v8/src/inspector/v8-string-conversions.h b/deps/v8/src=
/inspector/v8-string-conversions.h
-index c1d69c18..eb33c681 100644
---- a/deps/v8/src/inspector/v8-string-conversions.h
-+++ b/deps/v8/src/inspector/v8-string-conversions.h
-@@ -5,6 +5,7 @@
- #ifndef V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
- #define V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
-=20
-+#include <cstdint>
- #include <string>
-=20
- // Conversion routines between UT8 and UTF16, used by string-16.{h,cc}.=
 You may
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_16.20.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_16.20.1.bb
index dfc4af3df..fe59854d5 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.1.bb
@@ -26,7 +26,6 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch \
-           file://gcc13.patch \
            "
 SRC_URI:append:class-target =3D " \
            file://0001-Using-native-binaries.patch \
@@ -37,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 =3D " \
 SRC_URI:append:toolchain-clang:powerpc64le =3D " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] =3D "17fb716406198125b30c94dd3d1756207b297705626afe16=
d8dc479a65a1d8b5"
+SRC_URI[sha256sum] =3D "83e03381e271f1a5619188e7aea9d85d9b7e12f5be2a28ce=
b78d7249ed22b7f1"
=20
 S =3D "${WORKDIR}/node-v${PV}"
=20
--=20
2.40.0


