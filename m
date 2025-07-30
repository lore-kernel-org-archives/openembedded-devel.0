Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD8CC87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 05:56:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.28571.1753854983032378624
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Jul 2025 22:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0306b936b1=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56U4UCNo1814031
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 05:56:22 GMT
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 487cdt821b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 05:56:21 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 29 Jul 2025 22:56:20 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 29 Jul 2025 22:56:19 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH] v4l-utils: Fix QA and build errors related to _TIME_BITS on 32-bit
Date: Wed, 30 Jul 2025 13:56:18 +0800
Message-ID: <20250730055618.1726608-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Kd7SsRYD c=1 sm=1 tr=0 ts=6889b405 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=xOd6jRPJAAAA:8 a=xq3W2uTSAAAA:8 a=upletLgijqk7BZy3osUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-GUID: ggluuc-Oe_Wq81Yj6pWnlg4SF91OH3ef
X-Proofpoint-ORIG-GUID: ggluuc-Oe_Wq81Yj6pWnlg4SF91OH3ef
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDAzOSBTYWx0ZWRfXzQxNAng5doO5
 S6kKWa50rUtJFW8669TCuB1+iseT1a3Hqc+p9xhwXm56DDyt/zd3OFp5aombFxqRCo0VKipvLqS
 XgnwNCkpPIjQvICBnIioD1/VMzaGs835CCmS4wro5VSdA7oSEC/05mYBfTcHDUy1Jj+rR0T7eHn
 Eg9m6Kn+QqkEUA5NFLhFFDb2vKbxXTjY2TK2eHIPQWs4PjjfgnBONheyNQfAcow1eXFYwejBLjF
 jZHE11+Bklf/pHt2xC57kVabYaf6nfzjvd59oCQ+s5+etQNQ0IVbecBde/mDMO2kmlb/YMeAIbn
 5FTIVw0wiyGzvVw9XxFfaCn5Q/y8RgzVAZzKJ6mmLDkN/phFWMTS04+/kYEQsIZexJox1skqUq4
 geg7ISzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507300029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 05:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118764

From: Jiaying Song <jiaying.song.cn@windriver.com>

* Remove GLIBC_64BIT_TIME_FLAGS="" to enable _TIME_BITS=64 by default,
  which avoids the following QA issue during builds on 32-bit systems:

  WARNING: lib32-v4l-utils-1.24.1+git-r0 do_package_qa: QA Issue: /usr/bin/cec-compliance uses 32-bit api 'time'

* Undefine _TIME_BITS to fix the build error:

  /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...on.build-fix-arm-_TIME_BITS-64-error.patch | 38 +++++++++++++++++++
 .../v4l2apps/v4l-utils_1.26.1.bb              |  5 +--
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
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
index eb38d97132..97271908b5 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
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
     git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.26 \
     file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch \
     file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
+    file://0003-meson.build-fix-arm-_TIME_BITS-64-error.patch \
 "
 
 SRCREV = "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
-- 
2.34.1


