Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E34C5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 16:37:50 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.104023.1709570264074009728
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 08:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RAU3hWA9;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so3527061a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 08:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709570262; x=1710175062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/OwCDFYFe9YI5GOQsIe1f7+hqMYGOvU4j/SYLzkG3o=;
        b=RAU3hWA9xMsewzE6FO4rOBeHxWzfbQHryWgDJyE2k9iyhV3WB6fV5AilpfwRDDQfIE
         pb5iM156oAD76ga26ZK47AHPRx8p59FdnJyq1ev4tsh6QESVfM+4cBDRxmZ1DhsBPwIf
         5QxbH13G2uVruIkICSvlw8ff0U9Seq6w/bZERkkl2oIhCDgiNwswABa9gCWQLsWE4Di2
         BfKjnZQkOr52sEJjga/UjdAGqHGqON2N4ZiN/i1M58/AXiJaUCrrzykisvc4mt2qO90j
         y7qhJS4o6Gbe2zi+wjucgso0UcGRA3paQg5SPe6HDkNSG9CTu+zTjwqAulCRvG9gHBkD
         pHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709570262; x=1710175062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/OwCDFYFe9YI5GOQsIe1f7+hqMYGOvU4j/SYLzkG3o=;
        b=QzQC2tjwq+ffQQYfia6QjIu/N3gcTdm/F9uR8VNxp00hP3tIfZDe/VxNYgCIHVyyn2
         BB4bGZ0H53PacmLi6NT65ISXOqmEXi1ndfXhsQswpoalkYohVr1NZ/IfPcVMQf0nHN3D
         FHrGRs4Bcv7COT2A2oLRnG3UPI7KqQYguECaI0hJtMzoYZlSinxZusyNLjM6Xv7JspbD
         TX5wsrK48iGdX9r2nRJa4Sn/DC8qGkDZfo2BFDgfSERQrqqSkmdRweiM+UgkdXyEdKGV
         GGPJi7q7d86C1RuVMworBAbCoi6Etu1PLm4CWdG/b/TaqeJ9Mp0tA75BEXAWkpx4kHJv
         WTzg==
X-Gm-Message-State: AOJu0YzBapkFGS+KwHGmS5OnxYHeW5u3IDL7E1ShsRT3OZlyj76lkBqR
	hkbSS3geSmF3IG0TCt0V2HReeKPu9KpFnOgYRElK7MVCUOHcfRYuJF9TCuny9pg=
X-Google-Smtp-Source: AGHT+IGIrymY4Selhb7AliLWViDadXg9dE/pXLyTaWQZ07S5AuWYjhDZFXYpqglnabbQMG1K6GMZ3Q==
X-Received: by 2002:a50:c88c:0:b0:565:f90c:1263 with SMTP id d12-20020a50c88c000000b00565f90c1263mr6009142edh.9.1709570261947;
        Mon, 04 Mar 2024 08:37:41 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id q22-20020aa7da96000000b005669ce3f761sm4815231eds.59.2024.03.04.08.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 08:37:41 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-wrapt: add ptest
Date: Mon,  4 Mar 2024 19:37:20 +0300
Message-Id: <20240304163720.2349338-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 16:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109101

* Tested on qemux86_64 and qemuarm64
* Add ptest into PTESTS_FAST_META_PYTHON

Ptest result:

qemux86-64:

Testsuite summary
TOTAL: 438
PASS: 438
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 17
END: /usr/lib/python3-wrapt/ptest
2024-03-04T16:09
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 438
PASS: 438
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 17
END: /usr/lib/python3-wrapt/ptest
2024-03-04T16:18
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../include/ptest-packagelists-meta-python.inc   |  1 +
 .../python/python3-wrapt/run-ptest               |  3 +++
 .../python/python3-wrapt_1.16.0.bb               | 16 +++++++++++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-wrapt/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 0e6fea4ce..3b19152f4 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -66,6 +66,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-u-msgpack-python \
     python3-unidiff \
     python3-uritemplate \
+    python3-wrapt \
     python3-xlrd \
     python3-xmltodict \
     python3-xxhash \
diff --git a/meta-python/recipes-devtools/python/python3-wrapt/run-ptest b/meta-python/recipes-devtools/python/python3-wrapt/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wrapt/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
index 84c052844..056323cd3 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.16.0.bb
@@ -6,7 +6,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dc34cbad60bc961452eb7ade801d25f7"
 
 SRC_URI[sha256sum] = "5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06b1899d"
 
-inherit pypi setuptools3 
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	python3-pytest \
+	python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 RDEPENDS:${PN}:class-target += "\
     python3-stringold \
-- 
2.25.1


