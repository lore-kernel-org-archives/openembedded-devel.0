Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057BE104BEAC
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 10:04:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17620.1773223435848101419
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 03:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B8Gb0WVV;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439af00d33cso11121402f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 03:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773223434; x=1773828234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RhUP4iOdGmQz1BxZndADn9zweIORnOzI69tR0sLiGpk=;
        b=B8Gb0WVVEiQzkWAGTBNeG0D/GcL013Zu3IFnyzDuKslpveNoTgrogenMw/I72QN6xN
         pQOXF7d7wwRAWuQWD2eA1oe7sBJUKDH+f3oRJ+i6n02nHodlQ9PP4Lln8/twRkSam++1
         VF/rHtn5UuJrqy2WY9pBwJ7bUBwYrqE4TTe2zlTJDNaE5mMDZuTlFWKYoMppDGm8oHx5
         r/ay5IFitzDdMfUL/gb0b7rZIY6YXbJvyT6bbUtErdixYwxy+RV/2o0/u4UKnoe5ujtH
         a7ciIXOVLTfOZr5xKMv4eVywg4ZVL9SfAloWgX1q9uktigSa3Mf8VaWU/F7gOzFkHTYa
         N9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773223434; x=1773828234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhUP4iOdGmQz1BxZndADn9zweIORnOzI69tR0sLiGpk=;
        b=ly/+Zi1W41kPhYj3eBP9/tICZDbdEJqod0NnNEMJffJMcPpN9bKlLDuuqVxJTiFKko
         NuIlNjFvlpVeUA0fQZfyhNkqAzqr+viUX4JBQXL93RdvY+7fWxXLJfh/cwVZK6hi7OLr
         Y9re7nyOh3qgVZR0AJ/iVnpAhbYbioPgUQx9ZQ7lSI7ouZcUEfnyn2Ol27IM6bF4o+v7
         80R7S7/b9QYUGvB2BNcxvisro7fY7K4Av+o3zO42LgAO4Rsjc6Bv7dGaaJHtyBfwMWAt
         4GUvKH9W8VgKVMvUuy+gh26v7S9GHEyK09MmYl9j/1qNqNGiK9Jh7tDvVGJJAlwDRUOp
         w/9Q==
X-Gm-Message-State: AOJu0YyAULnW2Pp7PB0/X0pPHlPb+97LsYcG8nRVqQ+id/g2V/8jqWUm
	MBZUYT3Ili/s9aMy/CbnrfWN5kURTSlBI3B41f+l0HM52Ubel65IjmczhGSgQQ==
X-Gm-Gg: ATEYQzxphb8q5f2WW8qHtI1/EHsj/PdfZHnkBYE39XwE/sX3RyRvTREjfdfFCnnjpQJ
	CfRRIGzaPvcniv7J9WgUhUxl+7KtJqNTufP74tNHibwwH+jkSneHxbIpfSrK2WNiPaOM/TLhVw4
	H3nCgOt6cnXVttxcrvKYUmn1eAp9PYa19NYUe+RWGtyDbSm/fBLb9VI3o2MiLMRZYqNPoRwnPP+
	Zq2sLso/vtO8qR6UICn/T/6qdytEfdIx9e1wYfuk+mRAKWh9myu2PG0p0V8KHWY3TtGc3Xoeu6r
	4h//s6wvF8mrQhmfVne5O91S/zhV7iko3Ay9Uq5nth/VxzRFTc6E4vWSfa9yTpAaH8fuc2FPsHZ
	VIRCY32bIsJHQgdO04l8tZOgsadWIWwO8RDU/twxbq4yLnN6VTCIeanqruTNTd5GHMjdKwjK9q1
	CMV2rsLYcj1KsCMWDY2+au
X-Received: by 2002:a05:6000:178b:b0:439:bce5:6519 with SMTP id ffacd0b85a97d-439f821df09mr3654616f8f.39.1773223433702;
        Wed, 11 Mar 2026 03:03:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f82067a2sm4575816f8f.28.2026.03.11.03.03.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:03:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/3] exiv2: patch CVE-2026-25884
Date: Wed, 11 Mar 2026 11:03:50 +0100
Message-ID: <20260311100352.1638062-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 10:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125078

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25884

Backport the commits referenced by the NVD advisory.

One of the patches contain some binary data (for test data),
which needs to be applied with git PATCHTOOL.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2026-25884-1.patch        | 69 +++++++++++++++++++
 .../exiv2/exiv2/CVE-2026-25884-2.patch        | 25 +++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |  4 ++
 3 files changed, 98 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch
new file mode 100644
index 0000000000..aab8094b0c
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch
@@ -0,0 +1,69 @@
+From 847f79c7054865ad25c83b4131dc01c4d674f67b Mon Sep 17 00:00:00 2001
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
+index eb7f7cef2..09a218e18 100644
+--- a/tests/regression_tests/test_regression_allfiles.py
++++ b/tests/regression_tests/test_regression_allfiles.py
+@@ -120,6 +120,7 @@ def get_valid_files(data_dir):
+         "issue_ghsa_mxw9_qx4c_6m8v_poc.jp2",
+         "issue_ghsa_hrw9_ggg3_3r4r_poc.jpg",
+         "issue_ghsa_g9xm_7538_mq8w_poc.mov",
++        "issue_ghsa_9mxq_4j5g_5wrp.crw",
+         "pocIssue283.jpg",
+         "poc_1522.jp2",
+         "xmpsdk.xmp",
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch
new file mode 100644
index 0000000000..58c8513e02
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch
@@ -0,0 +1,25 @@
+From 99bf2cea56832cc6f72a5006fe6bac6b15a49889 Mon Sep 17 00:00:00 2001
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
+index 68b56971f..8aa151672 100644
+--- a/src/crwimage_int.cpp
++++ b/src/crwimage_int.cpp
+@@ -642,7 +642,7 @@ const CrwMapping* CrwMap::crwMapping(uint16_t crwDir, uint16_t crwTagId) {
+ 
+ void CrwMap::decode0x0805(const CiffComponent& ciffComponent, const CrwMapping* /*pCrwMapping*/, Image& image,
+                           ByteOrder /*byteOrder*/) {
+-  std::string s(reinterpret_cast<const char*>(ciffComponent.pData()));
++  auto s = std::string(reinterpret_cast<const char*>(ciffComponent.pData()), ciffComponent.size());
+   image.setComment(s);
+ }  // CrwMap::decode0x0805
+ 
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
index db32398b4f..cea5455354 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -8,8 +8,12 @@ SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x \
            file://0001-Revert-fix-copy-constructors.patch \
            file://0001-CVE-2025-54080-fix.patch \
            file://0001-Add-new-method-appendIccProfile-to-fix-quadratic-per.patch \
+           file://CVE-2026-25884-1.patch \
+           file://CVE-2026-25884-2.patch \
            "
 SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"
 
+PATCHTOOL = "git"
+
 inherit cmake gettext

