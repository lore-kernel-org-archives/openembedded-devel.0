Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC8EC44506
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 21:28:35 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.406.1783718909957912609
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2026 14:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=F11oib/8;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso1305834f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 14:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783718908; x=1784323708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7hija9H5lgNrh0L/3PWHnZ9YmA42A00MA2/Dhw3+3w=;
        b=F11oib/82N2AZjZXvqCu2oaqLbO/AGhLmUJwSHBpGy6T341IBeGwK9FluxgQkgZBZs
         9iUilszoKiVZKtzuskpQXnOqu/JYDbCtalliTEdWzO79IrWYzHKgkwIqlPPpwzuVgIdH
         dCE/YLoTb22xXuFfLybbe0wSMv9VJDd9PRd7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718908; x=1784323708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7hija9H5lgNrh0L/3PWHnZ9YmA42A00MA2/Dhw3+3w=;
        b=JwsQdAZV+T2K8tkW6dGpbWVAcvIEEo6HhgFQftOgN9fUiMXZaJM9bpyoB/fNMidBXM
         d5aAg7iEwGrDOgBfJMYQypOzKQsGVgmkdiqLGSsQ5W/wcGmK+YcGZPa6WQIP2YfxdnzJ
         x9RrFtKBiFkQFSsmlRFpNhPXC+ZKKjO427ui+cuJUlUlp3hvXV/occer9QyKtaOj+A/7
         +0EQP1fvCYr9Du9iLhAzqqcIQKe35Sb6W0leXOnAyOcvmAQ8+6Zxd2AOfV1YH01rDP7A
         zg4Sbt/Vy6IRoZi0D1bcEVsq+2m3NUTgUTApw5jFW112Zzo2S1Xn7BGMzRTsaRGjCeU2
         91hA==
X-Gm-Message-State: AOJu0YyNiuQs/BVWF/PW7XRetGbmgrPf4Mlm69R4QT5tSJpHcFGRUWb1
	SP3u7Ow1yNEbDkHgT+qUqUyteaRyck+XlFoavCNesVZnM2SJrQWrb/bGXPD6xdXa5Z/GU0UxSSo
	Q6lVr
X-Gm-Gg: AfdE7cmwMUwuEJ44sNqMeg/yWC91Yd92GdgmSSDMIObBoVrE49trOsazdIKFTTjmXkK
	e3PS7RJUbFSPw6bZEB+32YlxqOu8Ir0w5WIR/TEkSVljGRHEOib3hATpMmw7x6Z8XUkJdre6OWO
	piGFh0DxrDIiAl/IgU+pBHoHEyVeTGHZt7tPiEpgr+i8j/ikhSEyJcpep5rII0S3Ndz4VPX7BkF
	5zcfkl08mnu1Lvlmt4RqgzxA1pHtKoy69CbqUTlVTN9uwo6CdC9vndoH4oj46doF4wQwqHQ5FeG
	E7BQqJP65RTVEGhsd+/SezOfKzX1eiXgwnCnimU8by2Vv+z702MtKsnd+J4sZRHlL3D/HM7BzuG
	WbfRLvVuSkp6qWl0aCCjP4iT1sdRDRW3oPzWY5GQw5hqT6uPWiGAbIH7ezbJEG3fjDOyd+B+GSl
	geCTelEHQxSHjVIyeO/rrro7kYhIWkWRB89GL3rt7xxbNpfsph+eePejFWp/xmaPa0z7EBkY21u
	NxcdCGdpoVth+e8kefaS6a7ioGUsU9HqNSkBr32OefX7WHjBZT6
X-Received: by 2002:a5d:5d0c:0:b0:473:987f:c0ec with SMTP id ffacd0b85a97d-47f2dce7e1amr376493f8f.36.1783718908176;
        Fri, 10 Jul 2026 14:28:28 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm17629103f8f.16.2026.07.10.14.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:28:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-rarfile: Enable tests
Date: Sat, 11 Jul 2026 00:28:22 +0300
Message-ID: <20260710212823.1567516-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 21:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128131

Inherit ptest, include tests for rarfile and run the relevant
test cases.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-rarfile/run-ptest          | 13 ++++++++++++
 .../python/python3-rarfile_4.3.bb             | 21 ++++++++++++++++---
 2 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-rarfile/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-rarfile/run-ptest b/meta-python/recipes-devtools/python/python3-rarfile/run-ptest
new file mode 100644
index 0000000000..7cc4a1b1ae
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rarfile/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+pytest --automake \
+    --deselect "test/test_api.py::test_not_rar" \
+    --deselect "test/test_extract.py::test_readonly[test/files/rar3-readonly-unix.rar]" \
+    --deselect "test/test_extract.py::test_readonly[test/files/rar3-readonly-win.rar]" \
+    --deselect "test/test_extract.py::test_readonly[test/files/rar5-readonly-unix.rar]" \
+    --deselect "test/test_extract.py::test_readonly[test/files/rar5-readonly-win.rar]" \
+    --deselect "test/test_reading.py::test_reading[test/files/rar15-comment-lock.rar]" \
+    --deselect "test/test_reading.py::test_reading[test/files/rar15-comment.rar]" \
+    --deselect "test/test_reading.py::test_reading[test/files/rar202-comment-nopsw.rar]" \
+    --deselect "test/test_reading.py::test_reading[test/files/rar202-comment-psw.rar]" \
+    --deselect "test/test_tool.py::test_unrar_tool"
diff --git a/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb b/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
index f051e63b62..9fce84bc56 100644
--- a/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1916695551f7eec48dfd97db9467b831"
 
 inherit setuptools3
 
-SRC_URI[sha256sum] = "0d8b5a7ffb9f8e9a7b002f2398905e4420c0cb373e799b48e48f418db9c8816a"
+SRC_URI += "file://run-ptest"
 
-inherit pypi
+SRC_URI[sha256sum] = "0d8b5a7ffb9f8e9a7b002f2398905e4420c0cb373e799b48e48f418db9c8816a"
 
-PYPI_PACKAGE = "rarfile"
+inherit pypi ptest
 
 RDEPENDS:${PN} += "\
     7zip \
@@ -20,4 +20,19 @@ RDEPENDS:${PN} += "\
     python3-io \
 "
 
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-core \
+    python3-datetime \
+    python3-crypt \
+    python3-compression \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


