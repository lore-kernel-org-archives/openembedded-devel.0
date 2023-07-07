Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEEAEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 09:13:18 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.8463.1688721190688204477
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jul 2023 02:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=psrHL+Tn;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3128fcd58f3so1644827f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 02:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688721189; x=1691313189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T8CmftodZ/Lb/B04jtuWZgJ37WJMlHtL6emx5+D8zFA=;
        b=psrHL+Tnr5gJa+L9Ha075Uv7q2d+ZMrYkjkydxtat9bXavt5+0fS8jET3YZhgxbL/H
         7JzXMTRHXKxvBdx/qCyjJw4CU5AhK5wstYDK4u97Oakhn9DcvL/iC/SdBWuCBsRKiIOg
         O0KZ+PA4kP8+0c+//jWWCb1SOfu8sHJos97d7T852i/x4RYH4/8oky18jo1+lEXL5Lpm
         9BVtAcafMeBcPS7wCxNWPQHHewj0y3a8F4ZAviYEz2lHg7xOYu2B3K8C1o0GNboX7YTt
         vt5xT9bW5+hkT9sblVIxhBBJFjRNQ9yCJRw2RK/rfD9O8cCRmgMToEXeW2Mr9MGwGLAJ
         pE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688721189; x=1691313189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8CmftodZ/Lb/B04jtuWZgJ37WJMlHtL6emx5+D8zFA=;
        b=KKydMNXLn1TSeLsh+Oftr3SvIT1ywq3ZdQJHqMDT0R12Ma7S0wAycp50SlghGba2Hs
         lNBAtmvW76jcY8ENshu2AavzfQASajzefVUd0MNFPPSQ5hMa8CS48cfw76v6fQuhlECf
         bFmX2Aayx+UF9IijvIth7ST0jeJv8ecL1cA53kMHjcmJKepNn+9VRDHX+ZSgxKoVrWBz
         d1QVuy0Bi2o8o7Rw68bHXlsrIMqb3UOoAg1yjijcrR6O+w/+cfd/9KDnavUAmTK3NBde
         AZxUGrL8uJJxIvCtMGCP/bDPccaxT4J03fuJ7zFBegWn94KeZ2kJG7PEWErkfo6QqxUR
         ckYw==
X-Gm-Message-State: ABy/qLa15wRvm7cLOLdaqe7+vyrW1a/e2CU/KupdW2ZV8F1uetSzQoOr
	IOdO+onk/PQpjCIsGyZNYg8xLzDDt7A=
X-Google-Smtp-Source: APBJJlEd/pPRGnylex+A6KTI397qMmg+OxfLb11/MfCK3Ko+s9SarT9TdLYF4wSeYg03+hx0MZzWnA==
X-Received: by 2002:adf:cf0b:0:b0:314:39d0:26f6 with SMTP id o11-20020adfcf0b000000b0031439d026f6mr3372093wrj.18.1688721188656;
        Fri, 07 Jul 2023 02:13:08 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d5007000000b00313fd294d6csm3992566wrt.7.2023.07.07.02.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 02:13:08 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] opencv: 4.8.0
Date: Fri,  7 Jul 2023 11:13:01 +0200
Message-ID: <20230707091301.676885-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 09:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103711

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../opencv/opencv/CVE-2023-2617.patch         | 88 -------------------
 .../{opencv_4.7.0.bb => opencv_4.8.0.bb}      |  9 +-
 2 files changed, 4 insertions(+), 93 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.7.0.bb => opencv_4.8.0.bb} (97%)

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch
deleted file mode 100644
index 92c096e29..000000000
--- a/meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-commit ccc277247ac1a7aef0a90353edcdec35fbc5903c
-Author: Nano <nanoapezlk@gmail.com>
-Date:   Wed Apr 26 15:09:52 2023 +0800
-
-    fix(wechat_qrcode): Init nBytes after the count value is determined (#3480)
-
-    * fix(wechat_qrcode): Initialize nBytes after the count value is determined
-
-    * fix(wechat_qrcode): Incorrect count data repair
-
-    * chore: format expr
-
-    * fix(wechat_qrcode): Avoid null pointer exception
-
-    * fix(wechat_qrcode): return when bytes_ is empty
-
-    * test(wechat_qrcode): add test case
-
-    ---------
-
-    Co-authored-by: GZTime <Time.GZ@outlook.com>
-
-CVE: CVE-2023-2617
-
-Upstream-Status: Backport [https://github.com/opencv/opencv_contrib/commit/ccc277247ac1a7aef0a90353edcdec35fbc5903c]
-
-Signed-off-by: Soumya <soumya.sambu@windriver.com>
----
-
-diff --git a/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp b/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
-index 05de793c..b3a0a69c 100644
---- a/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
-+++ b/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
-@@ -65,7 +65,8 @@ void DecodedBitStreamParser::append(std::string& result, string const& in,
-
- void DecodedBitStreamParser::append(std::string& result, const char* bufIn, size_t nIn,
-                                     ErrorHandler& err_handler) {
--    if (err_handler.ErrCode()) return;
-+    // avoid null pointer exception
-+    if (err_handler.ErrCode() || bufIn == nullptr) return;
- #ifndef NO_ICONV_INSIDE
-     if (nIn == 0) {
-         return;
-@@ -190,16 +191,20 @@ void DecodedBitStreamParser::decodeByteSegment(Ref<BitSource> bits_, string& res
-                                                CharacterSetECI* currentCharacterSetECI,
-                                                ArrayRef<ArrayRef<char> >& byteSegments,
-                                                ErrorHandler& err_handler) {
--    int nBytes = count;
-     BitSource& bits(*bits_);
-     // Don't crash trying to read more bits than we have available.
-     int available = bits.available();
-     // try to repair count data if count data is invalid
-     if (count * 8 > available) {
--        count = (available + 7 / 8);
-+        count = (available + 7) / 8;
-     }
-+    size_t nBytes = count;
-+
-+    ArrayRef<char> bytes_(nBytes);
-+    // issue https://github.com/opencv/opencv_contrib/issues/3478
-+    if (bytes_->empty())
-+        return;
-
--    ArrayRef<char> bytes_(count);
-     char* readBytes = &(*bytes_)[0];
-     for (int i = 0; i < count; i++) {
-         //    readBytes[i] = (char) bits.readBits(8);
-diff --git a/modules/wechat_qrcode/test/test_qrcode.cpp b/modules/wechat_qrcode/test/test_qrcode.cpp
-index d59932b8..ec2559b0 100644
---- a/modules/wechat_qrcode/test/test_qrcode.cpp
-+++ b/modules/wechat_qrcode/test/test_qrcode.cpp
-@@ -455,5 +455,16 @@ TEST_P(Objdetect_QRCode_Easy_Multi, regression) {
- std::string qrcode_model_path[] = {"", "dnn/wechat_2021-01"};
- INSTANTIATE_TEST_CASE_P(/**/, Objdetect_QRCode_Easy_Multi, testing::ValuesIn(qrcode_model_path));
-
-+TEST(Objdetect_QRCode_bug, issue_3478) {
-+    auto detector = wechat_qrcode::WeChatQRCode();
-+    std::string image_path = findDataFile("qrcode/issue_3478.png");
-+    Mat src = imread(image_path, IMREAD_GRAYSCALE);
-+    ASSERT_FALSE(src.empty()) << "Can't read image: " << image_path;
-+    std::vector<std::string> outs = detector.detectAndDecode(src);
-+    ASSERT_EQ(1, (int) outs.size());
-+    ASSERT_EQ(16, (int) outs[0].size());
-+    ASSERT_EQ("KFCVW50         ", outs[0]);
-+}
-+
- }  // namespace
- }  // namespace opencv_test
diff --git a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb b/meta-oe/recipes-support/opencv/opencv_4.8.0.bb
similarity index 97%
rename from meta-oe/recipes-support/opencv/opencv_4.7.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.8.0.bb
index a1fbaaa09..9564bbbe9 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.8.0.bb
@@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "725e440d278aca07d35a5e8963ef990572b07316"
-SRCREV_contrib = "e247b680a6bd396f110274b6c214406a93171350"
+SRCREV_opencv = "f9a59f2592993d3dcc080e495f4f5e02dd8ec7ef"
+SRCREV_contrib = "f10c84d48b0714f2b408c9e5cccfac1277c8e6cc"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
@@ -19,8 +19,8 @@ SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
 
 
 SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg"
-SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol=https \
-           git://github.com/opencv/opencv_contrib.git;destsuffix=git/contrib;name=contrib;branch=master;protocol=https \
+SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=https \
+           git://github.com/opencv/opencv_contrib.git;destsuffix=git/contrib;name=contrib;branch=4.x;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=git/boostdesc;name=boostdesc;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=git/vgg;name=vgg;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=git/face;name=face;protocol=https \
@@ -31,7 +31,6 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
-           file://CVE-2023-2617.patch;patchdir=contrib \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
-- 
2.41.0


