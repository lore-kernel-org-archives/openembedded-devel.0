Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE60C7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:24:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10227.1684938252462337202
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 07:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fm/1fPjG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=45087f15ec=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OCAUkK021395
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 14:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=hnD+VQrLT/IjXo7c9ITdYCGVe8vGJmt++oL7x7RrY4Y=;
 b=fm/1fPjGOSyv9fqZYEy+Sn6Kkp9P9FiUzX9bmvRUEqAqSyZIfAP3maAB498egGCaMJhz
 XdgETnwY3+7IQ14BroQKIwyeoXGhA28eSVgZZ6HE4T39Tb+H3r5gpIAwl7uvi7LDUHRw
 TzKOXhK4e5zQQHPMm6B2/fT8CGycGYRUMp2cF2bKMq9kaRrAPzryLUs6wDjpHd7DQsjn
 26i3iHoJPA+iHgzvgRC72jlnUSPXCk56Ia5uWkXzMjF5me14CaPCK3ibpXJT2SQwmTce
 trTQFunzaOIb9nB86MncVFeDcIK4LBcwShdsiW+RRA5oAPXfQxzwe8fnC4ETOu3+s+Zm bg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpn67m1jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 14:24:11 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 07:24:08 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-oe][kirkstone][PATCH 1/1] opencv: fix for CVE-2023-2618
Date: Wed, 24 May 2023 14:23:46 +0000
Message-ID: <20230524142346.2976149-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: oUb7qJIOQ85Qfk_hb1BHJJdJ1CHJ-bTG
X-Proofpoint-ORIG-GUID: oUb7qJIOQ85Qfk_hb1BHJJdJ1CHJ-bTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_09,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 14:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102780

From: Narpat Mali <narpat.mali@windriver.com>

A vulnerability, which was classified as problematic, has been found
in OpenCV wechat_qrcode Module up to 4.7.0. Affected by this issue is
the function DecodedBitStreamParser::decodeHanziSegment of the file
qrcode/decoder/decoded_bit_stream_parser.cpp. The manipulation leads
to memory leak. The attack may be launched remotely. The name of the
patch is 2b62ff6181163eea029ed1cab11363b4996e9cd6. It is recommended
to apply a patch to fix this issue. The identifier of this vulnerability
is VDB-228548.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../opencv/opencv/CVE-2023-2618.patch         | 32 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.5.5.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch
new file mode 100644
index 0000000000..4cd3003e3c
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch
@@ -0,0 +1,32 @@
+From 2b62ff6181163eea029ed1cab11363b4996e9cd6 Mon Sep 17 00:00:00 2001
+From: Nano <nanoapezlk@gmail.com>
+Date: Thu, 27 Apr 2023 17:38:35 +0800
+Subject: [PATCH] fix(wechat_qrcode): fixed memory leaks
+
+CVE: CVE-2023-2618
+
+Upstream-Status: Backport [https://github.com/opencv/opencv_contrib/pull/3484/commits/2b62ff6181163eea029ed1cab11363b4996e9cd6]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ .../src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp   | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp b/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
+index b3a0a69c..f02435d5 100644
+--- a/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
++++ b/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
+@@ -127,7 +127,10 @@ void DecodedBitStreamParser::decodeHanziSegment(Ref<BitSource> bits_, string& re
+     while (count > 0) {
+         // Each 13 bits encodes a 2-byte character
+         int twoBytes = bits.readBits(13, err_handler);
+-        if (err_handler.ErrCode()) return;
++        if (err_handler.ErrCode()) {
++            delete[] buffer;
++            return;
++        }
+         int assembledTwoBytes = ((twoBytes / 0x060) << 8) | (twoBytes % 0x060);
+         if (assembledTwoBytes < 0x003BF) {
+             // In the 0xA1A1 to 0xAAFE range
+--
+2.40.0
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
index e4fb676f7e..f98fec72b1 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
@@ -52,6 +52,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0001-core-vsx-update-vec_absd-workaround-condition.patch \
+           file://CVE-2023-2618.patch;patchdir=../contrib \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
 
-- 
2.35.5


