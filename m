Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B6DD5E368
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 13:20:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.16485.1731158432919764180
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Nov 2024 05:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mAYGGKkl;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d5689eea8so1836616f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 05:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731158431; x=1731763231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5C3jdNgO0oYYkdSQqiONJrMmGUfU2rC1aWHJ7y0J5eo=;
        b=mAYGGKklmTjX7CXWq8z8VnWWMMun0THAiTd9ZydR/JdIZgqXTyvoFC5/xUYQtHzFlT
         9s0t5tYEgy+yXoBBJQueoy5kPg+vc+D7jWozQaPCuLwm+a8y0k/TV0dPi0buifNJqEHo
         PZ2Kh2BhQbnxayqsAZfMFZ9/KrFYFvaDqyVNqiWNi/SBFRVPjBG0Iz6nG2Bj7Ko1Wk0b
         dBtkzarZ30mBkJdewlkgwVtRYDdSVWq//NsMGqu/PTSXlPxj3FHUJjnfCrESBLBcxohv
         hE4i4U23ZjVBw8Qsi0l0uL+0NTs5MZhEsf1QGRLZ9x6eBX039pwgwQRPmxqmaDZDf+sS
         UXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731158431; x=1731763231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5C3jdNgO0oYYkdSQqiONJrMmGUfU2rC1aWHJ7y0J5eo=;
        b=sfecZVV8fGm36ISVsZEKvtldDr1ERdUmHjFcVoU5j7EvgPkGMFJhpQeWVpauW42kbF
         E6TDcrcJaZqDohlEQbu/NlUiLblt1UHbMjTaMl4jHWlyTcQYnYCBuhl9rB11pTrIPAeo
         ah6LFtJFrEQlczIqbzEVXxeJUeu3snFL/rxmUSZkWn7rawqDPdnbrOCgb3bnR8KCcz2B
         +jVLXHyQMsXAHTOG0bl4R7yVtwoPZLVwRyQBnYPAVn/GnHXlkZj306w/f/s0+FcJzhcI
         iRkFXv595ybKozWSh6cL7SkHIlUHWEMR9HcEad2/ZqH44mHJ6P9AU+JDyvXcxkDAbkaJ
         wmcA==
X-Gm-Message-State: AOJu0YzEuUXHUloOA3elLMmuW4jxgxikoDI3whzldOwjNfI8ST5m3nxY
	+DhggdduB1ZSuTnz03yM/UbJY3nPNvm/a7kvq0CjTafw9/py4dujP6596Q==
X-Google-Smtp-Source: AGHT+IE9f7/D6IXqfVsc/swgFTxYHeRb7ql6K30TCQ3phqrO9Xey/K5o50bi9/2tcDFAWLzqiAo39w==
X-Received: by 2002:a05:6000:4107:b0:381:f604:30c2 with SMTP id ffacd0b85a97d-381f6043253mr2837817f8f.35.1731158430793;
        Sat, 09 Nov 2024 05:20:30 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9978c6sm7676435f8f.50.2024.11.09.05.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 05:20:29 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-xmlschema: adding ptest
Date: Sat,  9 Nov 2024 14:20:09 +0100
Message-Id: <20241109132009.78919-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113770

Running them in qemu took about 6m.

A few tests are ignored with the -k option of pytest.
  * Because some input files where missing
  * Windows only tests (although with a skip in the pytest)
  * tests that needed input()

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../include/ptest-packagelists-meta-python.inc     |  1 +
 .../python/python3-xmlschema/run-ptest             |  9 +++++++++
 .../python/python3-xmlschema_3.4.2.bb              | 14 +++++++++++++-
 3 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-xmlschema/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ee8f957cc..72b4ef5ad 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -91,6 +91,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-wrapt \
     python3-wsproto \
     python3-xlrd \
+    python3-xmlschema \
     python3-xmltodict \
     python3-xxhash \
     python3-yarl \
diff --git a/meta-python/recipes-devtools/python/python3-xmlschema/run-ptest b/meta-python/recipes-devtools/python/python3-xmlschema/run-ptest
new file mode 100644
index 000000000..971b45be4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xmlschema/run-ptest
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+# List of test not to run at ptest
+#   SKIP: tests/test_locations.py:TestLocations.test_normalize_url_with_base_unc_path_on_windows # SKIP Run only on Windows systems
+#   FAIL: tests/test_package.py:TestPackaging.test_version
+#   FAIL: tests/test_package.py:TestPackaging.test_elementpath_requirement
+#   FAIL: tests/test_package.py:TestPackaging.test_forgotten_debug_statements
+
+pytest --automake -k 'not TestLocations and not TestPackaging'
diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
index b29862b1d..388f69c7c 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
@@ -5,11 +5,23 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
 SRC_URI[sha256sum] = "d35023ea504ea46127302d1297b046d023b96fec5fe4b4b690534ea85b5e9bf8"
 
-inherit pypi python_setuptools_build_meta
+SRC_URI:append = " file://run-ptest"
+
+inherit pypi python_setuptools_build_meta ptest
 
 RDEPENDS:${PN} += "\
     python3-elementpath \
     python3-modules \
 "
 
+RDEPENDS:${PN}-ptest += "\
+    python3-pytest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


