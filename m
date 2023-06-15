Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E92EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 16:03:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22769.1686845016949939986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 09:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZxyKIJBS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55303241db=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FAc56W002401
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 16:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=FS/cqB6AV97RWQluK/+3l9MGw5r6o2iB5u1wlB4c3+4=;
 b=ZxyKIJBSjBws7mMqMH7xy1jWfrX8kOo6B5ni9+KJJMNaoHL6oIWmYBmlRATpjHnrx1aT
 uieVED4qJtCkAzP8yPPkFGaALADM7+jlAp0/6sC1IHnT1xOWA80VQedWplUjYm1WoELv
 fN66B9Un+Dhq0xxvGI/xiL+d1D5Vbr2YEv3NNRhEbDI3gVeEzTUmdSxp2h4JXuwpFJE0
 ZprBnrp5Sehw5eJbGkl3XnvIa0/U6wA56202IIF/TrzOCiLuQ4s42Hgg6ffUADl7U35T
 d4B0SjHQ3uaZ98rUVDhSixxUghljaye1ypV+u5HmbUnd9QUmpY7Rp9WEVXIYAw2//gjD 6A== 
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed055dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 16:03:35 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 09:03:34 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 09:03:32 -0700
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, Soumya <soumya.sambu@windriver.com>
Subject: [meta-oe][PATCH 1/1] opencv: Fix for CVE-2023-2617
Date: Thu, 15 Jun 2023 16:03:28 +0000
Message-ID: <20230615160328.154041-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XWf5KCyLWuLRjtJIjPYIu3GoUPqfF4t-
X-Proofpoint-ORIG-GUID: XWf5KCyLWuLRjtJIjPYIu3GoUPqfF4t-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_12,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150141
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 16:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103314

A vulnerability classified as problematic was found in OpenCV
wechat_qrcode Module up to 4.7.0. Affected by this vulnerability
is the function DecodedBitStreamParser::decodeByteSegment of the
file qrcode/decoder/decoded_bit_stream_parser.cpp. The manipulation
leads to null pointer dereference. The attack can be launched
remotely. The exploit has been disclosed to the public and may
be used. It is recommended to apply a patch to fix this issue.
The associated identifier of this vulnerability is VDB-228547.

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../opencv/opencv/CVE-2023-2617.patch         | 88 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.7.0.bb    |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch
new file mode 100644
index 000000000..92c096e29
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch
@@ -0,0 +1,88 @@
+commit ccc277247ac1a7aef0a90353edcdec35fbc5903c
+Author: Nano <nanoapezlk@gmail.com>
+Date:   Wed Apr 26 15:09:52 2023 +0800
+
+    fix(wechat_qrcode): Init nBytes after the count value is determined (#3480)
+
+    * fix(wechat_qrcode): Initialize nBytes after the count value is determined
+
+    * fix(wechat_qrcode): Incorrect count data repair
+
+    * chore: format expr
+
+    * fix(wechat_qrcode): Avoid null pointer exception
+
+    * fix(wechat_qrcode): return when bytes_ is empty
+
+    * test(wechat_qrcode): add test case
+
+    ---------
+
+    Co-authored-by: GZTime <Time.GZ@outlook.com>
+
+CVE: CVE-2023-2617
+
+Upstream-Status: Backport [https://github.com/opencv/opencv_contrib/commit/ccc277247ac1a7aef0a90353edcdec35fbc5903c]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+
+diff --git a/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp b/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
+index 05de793c..b3a0a69c 100644
+--- a/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
++++ b/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
+@@ -65,7 +65,8 @@ void DecodedBitStreamParser::append(std::string& result, string const& in,
+
+ void DecodedBitStreamParser::append(std::string& result, const char* bufIn, size_t nIn,
+                                     ErrorHandler& err_handler) {
+-    if (err_handler.ErrCode()) return;
++    // avoid null pointer exception
++    if (err_handler.ErrCode() || bufIn == nullptr) return;
+ #ifndef NO_ICONV_INSIDE
+     if (nIn == 0) {
+         return;
+@@ -190,16 +191,20 @@ void DecodedBitStreamParser::decodeByteSegment(Ref<BitSource> bits_, string& res
+                                                CharacterSetECI* currentCharacterSetECI,
+                                                ArrayRef<ArrayRef<char> >& byteSegments,
+                                                ErrorHandler& err_handler) {
+-    int nBytes = count;
+     BitSource& bits(*bits_);
+     // Don't crash trying to read more bits than we have available.
+     int available = bits.available();
+     // try to repair count data if count data is invalid
+     if (count * 8 > available) {
+-        count = (available + 7 / 8);
++        count = (available + 7) / 8;
+     }
++    size_t nBytes = count;
++
++    ArrayRef<char> bytes_(nBytes);
++    // issue https://github.com/opencv/opencv_contrib/issues/3478
++    if (bytes_->empty())
++        return;
+
+-    ArrayRef<char> bytes_(count);
+     char* readBytes = &(*bytes_)[0];
+     for (int i = 0; i < count; i++) {
+         //    readBytes[i] = (char) bits.readBits(8);
+diff --git a/modules/wechat_qrcode/test/test_qrcode.cpp b/modules/wechat_qrcode/test/test_qrcode.cpp
+index d59932b8..ec2559b0 100644
+--- a/modules/wechat_qrcode/test/test_qrcode.cpp
++++ b/modules/wechat_qrcode/test/test_qrcode.cpp
+@@ -455,5 +455,16 @@ TEST_P(Objdetect_QRCode_Easy_Multi, regression) {
+ std::string qrcode_model_path[] = {"", "dnn/wechat_2021-01"};
+ INSTANTIATE_TEST_CASE_P(/**/, Objdetect_QRCode_Easy_Multi, testing::ValuesIn(qrcode_model_path));
+
++TEST(Objdetect_QRCode_bug, issue_3478) {
++    auto detector = wechat_qrcode::WeChatQRCode();
++    std::string image_path = findDataFile("qrcode/issue_3478.png");
++    Mat src = imread(image_path, IMREAD_GRAYSCALE);
++    ASSERT_FALSE(src.empty()) << "Can't read image: " << image_path;
++    std::vector<std::string> outs = detector.detectAndDecode(src);
++    ASSERT_EQ(1, (int) outs.size());
++    ASSERT_EQ(16, (int) outs[0].size());
++    ASSERT_EQ("KFCVW50         ", outs[0]);
++}
++
+ }  // namespace
+ }  // namespace opencv_test
diff --git a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
index 361b00430..d02fd34ae 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
+           file://CVE-2023-2617.patch;patchdir=contrib \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
-- 
2.40.0


