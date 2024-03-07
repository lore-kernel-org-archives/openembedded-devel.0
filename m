Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E92C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 13:03:00 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.22593.1709816576109434076
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 05:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lY8qeiHr;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so1269964a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 05:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709816574; x=1710421374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZuIZ617w4/u+0/p8SZxzBFn56paZBxPcmM2Wfs2DLk=;
        b=lY8qeiHr39SQg6ld/ksNgYkzpC2b85tzzE0t/SDXLspvk7BkVEPNLD1CLZj0CTn1Pj
         9bikFQptyzHG8aVO3dcNiCj4gWMWGjjDpzw+2FebyhmErdENuQ9SnD7erGSQZqLZhdsz
         UatY+uHBVHwFCKNPR4Oxecyq0tJ6zeBtHAgSvguqc1SyPJ2zOYiSUYz4QmOFepaaKqOI
         0ryJqCp85Te45BgaURR4KBanBg3egYSexOepJgo1Adwaq3bXbx2QVetyI4JCf7QVZWo7
         CKWjuaA8A8DgzhaYnpio87Tu3jzrKtzXtWm+FcJcogpDnT3zZbuyf9Bk7bVT7XfHH/Du
         gm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709816574; x=1710421374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZuIZ617w4/u+0/p8SZxzBFn56paZBxPcmM2Wfs2DLk=;
        b=Cz4dWzH8dVkdyOxDjKreBU7b1wnZdg8GzqGHoF/omEmD1ntSV+zB1P5IkOu8dZC+05
         lzlY8boUmo2x1KTg7+gHwjf6OmzKjEsvN8OrJV7NqjvaGjxj25Ca6/CR8Ttz8dPtj5VJ
         hcEoef6doAizqs8PCFNipWV/JGEzOriY7LW8h6/Nx1bqIYgm0rcV8nHeYeX8I86PAwZ4
         p8frTB98j7+8xQqXE+tXdhUmeulAdd5Tynk0uCMUAVz5ELvCGeZ9m2RhNfQl1OsVgGjl
         iIxZPWyvOayd3dutfJj0XuGqc6ddjhZ5PjNm8+cna+cBO4IDmYNXha0i5Dk7B11TnYkD
         RMkQ==
X-Gm-Message-State: AOJu0Yxv159ZqWlYZOXdp8c88KBC02FXA8dOImH+w9qx3FuI23EGV8BT
	Who7UuM30yhCttodj9Q3XbuV9ehZVPW9V3N3J72dKFlpwl9N63pSFeJ04asTWWM=
X-Google-Smtp-Source: AGHT+IEXgZWTHAT0M8leKHCvjf+BvcCqT2oSE1pZj/v0q8QEiJ0fmMb6jtwRK/goqmLtLzg94HbklQ==
X-Received: by 2002:a17:906:3508:b0:a44:d042:887b with SMTP id r8-20020a170906350800b00a44d042887bmr9369067eja.8.1709816573709;
        Thu, 07 Mar 2024 05:02:53 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id bx18-20020a170906a1d200b00a44f07e55d2sm5707739ejb.41.2024.03.07.05.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 05:02:53 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-traitlets: add ptest and update runtime dependencies
Date: Thu,  7 Mar 2024 16:01:43 +0300
Message-Id: <20240307130143.185290-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 13:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109195

* Upstream provides a pyproject.toml and updated runtime dependencies accordingly to it.

* Ptest tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_SLOW_META_PYTHON

Ptest result:
==============
qemux86-64:

Testsuite summary
TOTAL: 567
PASS: 567
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 48
END: /usr/lib/python3-traitlets/ptest
2024-03-07T12:37
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 567
PASS: 567
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 41
END: /usr/lib/python3-traitlets/ptest
2024-03-07T12:41
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-traitlets/run-ptest        |  3 +++
 .../python/python3-traitlets_5.14.1.bb        | 23 +++++++++++++++----
 3 files changed, 22 insertions(+), 5 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-traitlets/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 5d9eb0fa1..d3096039b 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -78,6 +78,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-arrow \
     python3-lz4 \
     python3-marshmallow \
+    python3-traitlets \
     python3-yappi \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-traitlets/run-ptest b/meta-python/recipes-devtools/python/python3-traitlets/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-traitlets/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb
index e650906aa..3a6542785 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb
@@ -1,13 +1,26 @@
 SUMMARY = "Traitlets Python config system"
-HOMEPAGE = "http://ipython.org"
+HOMEPAGE = "https://github.com/ipython/traitlets"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13bed0ee6f46a6f6dbf1f9f9572f250a"
 
 SRC_URI[sha256sum] = "8585105b371a04b8316a43d5ce29c098575c2e477850b62b848b964f1444527e"
 
-inherit pypi python_hatchling
+inherit pypi python_hatchling ptest
 
-RDEPENDS:${PN} = "\
-    python3-ipython-genutils \
-    python3-decorator \
+SRC_URI += " \
+        file://run-ptest \
 "
+
+RDEPENDS:${PN}-ptest += " \
+        python3-argcomplete \
+        bash \
+        python3-mypy \
+        python3-pytest \
+        python3-pytest-mock \
+        python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


