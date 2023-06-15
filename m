Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B76EB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 09:24:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13631.1686818921908703426
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 01:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sf5oSVVH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55303241db=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F8QhUZ015442
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 01:48:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=X9JbY9kDyA+tMxtX/KilhazfbO0ezb/GL/Cjxi1TF1M=;
 b=sf5oSVVHp9T+uWUlDP/40yGTLR1MqRLP6qIGdA2g5qlBWCJ3mpl8UWITmsUZ48bfxtCN
 t/Xonr+7MbTbiWDblGClSMzWQ5ntRmETsaUhMHjVF9OFWhqMJjnJiOoGQMEeL4I93Ac9
 +7HgFgzdy8uIFYTAN1/9c9XPltYFClq2P5IBaSksyaLg0BUek7OxvUz0UXIhHL6Jz0dh
 P2YYdisLQYCaVI9tL7d/aS/Miymkk6FkOXrY0aL9cJKxyUlQOI9/Axq0Qka41vmbCqqn
 m5NlVZTUEfRLLS2+jTrQzGPjIpvnZpIAIKNpqLjnYlRVnKHKK6Hv3/D7zRXpRjNnnL56 Fw== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphmera-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 01:48:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 01:48:39 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 01:48:38 -0700
From: "Soumya" <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, Soumya <soumya.sambu@windriver.com>
Subject: [meta-oe][kirkstone][PATCH 1/1] opencv: Fix for CVE-2023-2617
Date: Thu, 15 Jun 2023 08:48:34 +0000
Message-ID: <20230615084834.69827-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: YGTZQqDPvLLbbkLIkqqiYxJrt9l878eR
X-Proofpoint-GUID: YGTZQqDPvLLbbkLIkqqiYxJrt9l878eR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_05,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150074
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 09:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103292

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
 .../recipes-support/opencv/opencv_4.5.5.bb    |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch
new file mode 100644
index 0000000000..e5eafd4790
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
+@@ -289,5 +289,16 @@ TEST_P(Objdetect_QRCode_Multi, regression) {
+ INSTANTIATE_TEST_CASE_P(/**/, Objdetect_QRCode_Curved, testing::ValuesIn(qrcode_images_curved));
+ // INSTANTIATE_TEST_CASE_P(/**/, Objdetect_QRCode_Multi, testing::ValuesIn(qrcode_images_multiple));
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
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
index e4fb676f7e..3af92ffb23 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
@@ -52,6 +52,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0001-core-vsx-update-vec_absd-workaround-condition.patch \
+           file://CVE-2023-2617.patch;patchdir=../contrib \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
 
-- 
2.40.0


