Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BC3C87FC9
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 14:14:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.82175.1753712044464434405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Jul 2025 07:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0304c0fd72=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56SBKRFF2047474
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 14:14:03 GMT
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484m7xhpd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 14:14:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 28 Jul 2025 07:14:02 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 28 Jul 2025 07:14:01 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][walnascar][PATCH] v4l-utils: Fix QA and build errors related to _TIME_BITS on 32-bit
Date: Mon, 28 Jul 2025 22:14:01 +0800
Message-ID: <20250728141401.3522091-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEwNCBTYWx0ZWRfX9KtVfUoln7WS
 uYDbJxDdXX30TJZ97zDFbGVl3ZRZm4xIFQcRkSBUb8T6NwfaiuDFmoqzyXZ5SxiAZjx1p70tdXL
 3jP84v4ATIPH5zQ4Nk08+N3LsJaln5eQRPmTZtMoRm//V1l0Ktif1mgvtxssrlcFw3gE5vSRLpH
 PpxoAlp7/etnEgRxj2E+JDgkxwiVxckordk/6geSvYZ41iGQt5aXnSJtqW4gykDvV+mbcfO04BJ
 O9/YdOm+VvPB67RhCd846liD5/1wyl5JUZwIodMp2olfSZaax++/tS/puOnBTxMj8BS6/rqQZsj
 +y2BdYp+dN3qsf6e1rSXRkJricwOnNl2fjChNDy2hK28Ihi1biPwCSYlN0Mc9lF16TMTColxRlt
 o+PHTtEY
X-Proofpoint-ORIG-GUID: 9qSfcQKT_NTJE_xrE89p6DvEoFt5OT4j
X-Proofpoint-GUID: 9qSfcQKT_NTJE_xrE89p6DvEoFt5OT4j
X-Authority-Analysis: v=2.4 cv=Y9v4sgeN c=1 sm=1 tr=0 ts=688785ab cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=xOd6jRPJAAAA:8
 a=xq3W2uTSAAAA:8 a=A_nkakYrDCRTRnRcKUQA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507250208
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 14:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118746

From: Jiaying Song <jiaying.song.cn@windriver.com>

* Remove GLIBC_64BIT_TIME_FLAGS="" to enable _TIME_BITS=64 by default,
  which avoids the following QA issue during builds on 32-bit systems:

  WARNING: lib32-v4l-utils-1.24.1+git-r0 do_package_qa: QA Issue: /usr/bin/cec-compliance uses 32-bit api 'time'

* Undefine _TIME_BITS to fix the build error:

  /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...on.build-fix-arm-_TIME_BITS-64-error.patch | 38 +++++++++++++++++++
 .../v4l2apps/v4l-utils_1.28.1.bb              |  5 +--
 2 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
new file mode 100644
index 0000000000..f41dde0e16
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
@@ -0,0 +1,38 @@
+From 5aabd01e415374fc97eebe80d4635c3bae728f81 Mon Sep 17 00:00:00 2001
+From: Hans Verkuil <hverkuil@xs4all.nl>
+Date: Sat, 12 Apr 2025 12:30:13 +0200
+Subject: [PATCH] meson.build: fix arm _TIME_BITS=64 error
+
+Undefine _TIME_BITS to avoid this error on 32-bit arm:
+
+/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+
+Upstream-Status: Backport [https://github.com/gjasny/v4l-utils/commit/d517cfdcdc16533ab7e06e97c07ca089cf261aef]
+
+Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ meson.build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 269a9da7..31927cda 100644
+--- a/meson.build
++++ b/meson.build
+@@ -53,8 +53,12 @@ v4l2_wrapper_args = [
+     # As the library needs to provide both 32-bit and 64-bit versions
+     # of file operations, disable transparent large file support (fixes
+     # 'Error: symbol `open64/mmap64' is already defined' compile failure
+-    # otherwise)
++    # otherwise).
++    #
++    # Also disable _TIME_BITS=64 since this is allowed only with
++    # _FILE_OFFSET_BITS=64, which is now 32.
+     '-U_FILE_OFFSET_BITS',
++    '-U_TIME_BITS',
+     '-D_FILE_OFFSET_BITS=32',
+     '-D_LARGEFILE64_SOURCE',
+ ]
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
index afe217e1f3..5d21df04af 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
@@ -13,10 +13,6 @@ DEPENDS = "jpeg \
 DEPENDS:append:libc-musl = " argp-standalone"
 DEPENDS:append:class-target = " udev"
 LDFLAGS:append = " -pthread"
-# v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
-# both 32 and 64 bit file APIs.  But it does not handle the time side?
-# Needs further investigation
-GLIBC_64BIT_TIME_FLAGS = ""
 
 inherit meson gettext pkgconfig
 
@@ -29,6 +25,7 @@ SRC_URI = "\
     git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.28 \
     file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
     file://0002-media-ctl-Install-media-ctl-pkg-config-files.patch \
+    file://0003-meson.build-fix-arm-_TIME_BITS-64-error.patch \
 "
 
 SRCREV = "fc15e229d9d337e46d730f00647821adbbd58548"
-- 
2.34.1


