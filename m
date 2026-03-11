Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CC8104951F
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:42:45 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17294.1773222158443328538
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=exyOkEhd;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439f5abc829so1288201f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 02:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773222157; x=1773826957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTY/b0AezdoB3RXeL2eMkUvZeS2kYoBND4BVKiP0/OE=;
        b=exyOkEhdEBlf1+YSDKRiU+3Kd+cVtIlzgW4941ZVjp3it9pNVyhhKyC9gDTZuC2Tnz
         KXS1+rGzGGHmy5ZrLJieWrRn4P9reZRNs1mNvrghFOapf0kfmaI8PLBpGz0ap2rCNYtX
         FliUDZBgGs3qWoiJQsMcf7MwNa3SMvewEYuEL8aLA1xbg8GASfJ6YJL87VJWdbzvUhfO
         us8ssmBkmJHpOz2HW0dIRwUdC8nWQridUS7ryAbrGDzj+hzqP2sD1zwIUvToYoawMWb4
         cdRRIHXRNJHHLvtYz7vRw6ZPKP1qQugr1+qR5beyIr/pcQ9d6m5ZwV7jg6uq6muKRekO
         CuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222157; x=1773826957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTY/b0AezdoB3RXeL2eMkUvZeS2kYoBND4BVKiP0/OE=;
        b=fHrtA7D2oHZwzqOkeTqBadFPUlmtvOFhIMUT1gLoz1SkSGtLPJ3gHXqZbKLK/vbSmz
         tydAnnjqQM9v8zeVEPTv+bkHYFaRwubar9r5gJ+aiy4eqP44p0SESYt0ms+btuFPai+M
         wIEPp7teihOcSxvL/e9Rsvg02DuGM/t32O0J7aLBvgBfcesWvR4eN8CUe+7Hk2GzMZM5
         1N0sawPAPCD7md4mcsUB0iO48b+warzmkaemcJlcwpfoBLlqS9on5L+K4d3aQa0z9Lhn
         scBF90PgDdwEIJ2xt2oyX1TklDZWDBsX8Kg7e2l4EkM2/y/vLLsW/ACwd3iG3FM2kaKb
         9kag==
X-Gm-Message-State: AOJu0YwGYEybDJ7T8OGRUmMnD+B6QzCeleOTN8PAromw+ZKeHddAdSuE
	ssWJXi3sTBAv3lsDLqUljUpOH/DCbTwzxEtZd8uRRqf31CzzkTw8KHNnN2lqeg==
X-Gm-Gg: ATEYQzzcu7yumIC7D8rJ7MYVoNs+QGj9nldmReJlOBiTCmRyT05Zl1gMARtHDq3FyIC
	bm2N2FG1a/2f6+1+0XpXjgdoJrPyUgDMf8s3iEEQqsPWRTOdkJmJqT2QUQT0BVlTuy0jMoJPqf1
	wosabnSkF53Orv3Uxox7hvR5KYHfivBuKjT/uDSzz5n/ryjt2E2zoM4McVN74kxYcWXsP1JnzwZ
	XdnH/bxpeb/JzZWJCsWNzHxTeaLV4c/JOByu7IKNxJ0wi1gXq3r4DK+HjJ57AJ2tn9nqVSsJu8t
	rB7Yd/zMsW0773FZJL1SSOZ6NPb1uE845A498PUX/9zE7Vsb8XWBr41mm9JpCvhUL8ighEvEWfF
	qBFyAKx5eASmATz86NrVrsvN0b/y7YqNVk8icGQ/B8Pm3YAjKRLFUT4U/z1sYfdQthUMfsNnzOc
	MW6G8dJfbR9WFdkXgizVuf
X-Received: by 2002:a05:6000:2509:b0:436:369f:39f5 with SMTP id ffacd0b85a97d-439f8423e9cmr3722626f8f.43.1773222156573;
        Wed, 11 Mar 2026 02:42:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f8104515sm5130633f8f.0.2026.03.11.02.42.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:42:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 1/3] exiv2: patch CVE-2026-25884
Date: Wed, 11 Mar 2026 10:42:33 +0100
Message-ID: <20260311094235.1616493-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 09:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125075

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25884

Backport the commits referenced by the NVD advisory.

One of the patches contain some binary data (for test data),
which needs to be applied with git PATCHTOOL..

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2026-25884-1.patch        | 69 +++++++++++++++++++
 .../exiv2/exiv2/CVE-2026-25884-2.patch        | 25 +++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb |  7 +-
 3 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch
new file mode 100644
index 0000000000..a2b41adcef
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch
@@ -0,0 +1,69 @@
+From 237f63c2abcd6c346bf5d27044ab76f5388bb4e8 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Sat, 7 Feb 2026 22:50:46 +0000
+Subject: [PATCH] Regression test for
+ https://github.com/Exiv2/exiv2/security/advisories/GHSA-9mxq-4j5g-5wrp
+
+CVE: CVE-2026-25884
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/191138fef73f331de1311e735d8e6359a36fa786]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ test/data/issue_ghsa_9mxq_4j5g_5wrp.crw       | Bin 0 -> 74 bytes
+ .../github/test_issue_ghsa_9mxq_4j5g_5wrp.py  |  24 ++++++++++++++++++
+ .../test_regression_allfiles.py               |   1 +
+ 3 files changed, 25 insertions(+)
+ create mode 100644 test/data/issue_ghsa_9mxq_4j5g_5wrp.crw
+ create mode 100644 tests/bugfixes/github/test_issue_ghsa_9mxq_4j5g_5wrp.py
+
+diff --git a/test/data/issue_ghsa_9mxq_4j5g_5wrp.crw b/test/data/issue_ghsa_9mxq_4j5g_5wrp.crw
+new file mode 100644
+index 0000000000000000000000000000000000000000..816af2663b3ec93d0d4de4755a02b5d0f5d09640
+GIT binary patch
+literal 74
+zcmebDRA69W@NjhuaCUYH`mcZv7#X+>WPvJpfmnfwK>?&13|Kip6i5oF1;hjZi0B7h
+
+literal 0
+HcmV?d00001
+
+diff --git a/tests/bugfixes/github/test_issue_ghsa_9mxq_4j5g_5wrp.py b/tests/bugfixes/github/test_issue_ghsa_9mxq_4j5g_5wrp.py
+new file mode 100644
+index 000000000..199328f25
+--- /dev/null
++++ b/tests/bugfixes/github/test_issue_ghsa_9mxq_4j5g_5wrp.py
+@@ -0,0 +1,24 @@
++# -*- coding: utf-8 -*-
++
++from system_tests import CaseMeta, CopyTmpFiles, path
++
++
++class CrwMap_decode0x0805_OutOfBoundsRead(metaclass=CaseMeta):
++    """
++    Regression test for the bug described in:
++    https://github.com/Exiv2/exiv2/security/advisories/GHSA-9mxq-4j5g-5wrp
++    """
++
++    url = "https://github.com/Exiv2/exiv2/security/advisories/GHSA-9mxq-4j5g-5wrp"
++
++    filename = path("$data_path/issue_ghsa_9mxq_4j5g_5wrp.crw")
++    commands = ["$exiv2 $filename"]
++    stdout = ["""File name       : $filename
++File size       : 74 Bytes
++MIME type       : image/x-canon-crw
++Image size      : 0 x 0
++"""
++]
++    stderr   = ["""$filename: No Exif data found in the file
++"""]
++    retval = [253]
+diff --git a/tests/regression_tests/test_regression_allfiles.py b/tests/regression_tests/test_regression_allfiles.py
+index d1bec2ed3..87caa9798 100644
+--- a/tests/regression_tests/test_regression_allfiles.py
++++ b/tests/regression_tests/test_regression_allfiles.py
+@@ -122,6 +122,7 @@ def get_valid_files(data_dir):
+         "issue_ghsa_g9xm_7538_mq8w_poc.mov",
+         "issue_ghsa_38h4_fx85_qcx7_poc.tiff",
+         "issue_ghsa_496f_x7cq_cq39_poc.jpg",
++        "issue_ghsa_9mxq_4j5g_5wrp.crw",
+         "pocIssue283.jpg",
+         "poc_1522.jp2",
+         "xmpsdk.xmp",
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch
new file mode 100644
index 0000000000..b461e09c71
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch
@@ -0,0 +1,25 @@
+From 5c5ab83247997396b8a7de8e4425a1a04db01c14 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Sat, 31 Jan 2026 15:31:55 +0000
+Subject: [PATCH] Fix out-of-bounds read.
+
+CVE: CVE-2026-25884
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/5b8f1f4d92b8f27a5a80e0c3d3eb9dce7620d9f1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/crwimage_int.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/crwimage_int.cpp b/src/crwimage_int.cpp
+index 9e2c1c6a4..1d2378a61 100644
+--- a/src/crwimage_int.cpp
++++ b/src/crwimage_int.cpp
+@@ -646,7 +646,7 @@ const CrwMapping* CrwMap::crwMapping(uint16_t crwDir, uint16_t crwTagId) {
+ 
+ void CrwMap::decode0x0805(const CiffComponent& ciffComponent, const CrwMapping* /*pCrwMapping*/, Image& image,
+                           ByteOrder /*byteOrder*/) {
+-  std::string s(reinterpret_cast<const char*>(ciffComponent.pData()));
++  auto s = std::string(reinterpret_cast<const char*>(ciffComponent.pData()), ciffComponent.size());
+   image.setComment(s);
+ }  // CrwMap::decode0x0805
+ 
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
index e1f57ae8c7..45d88e2a3d 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb
@@ -4,7 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
 DEPENDS = "zlib expat brotli libinih"
 
-SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x;tag=v${PV}"
+SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x;tag=v${PV} \
+           file://CVE-2026-25884-1.patch \
+           file://CVE-2026-25884-2.patch \
+           "
 SRCREV = "afcb7a8ba84a7de36d2f1ee7689394e078697956"
 
+PATCHTOOL = "git"
+
 inherit cmake gettext

