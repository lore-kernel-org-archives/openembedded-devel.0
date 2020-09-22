Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.980.1600750058779821967
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 21:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HhXjmJYv;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id y14so868667pgf.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2020 21:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yv6YgEBN1OoakY2ulMyuoYQaptpeDYGExUbXgOAfCos=;
        b=HhXjmJYvENUbLPYP8Ovx7Z+tehvnNKwBoXTClRbK1TXp4NLcUZLDTAdfZDT+X4JdCt
         od/LqyK6lfnsL4sCUF5YTHWqhRZT32pzhhjmWRw6WgDzQykldtxzQ3uD+r2CKNHKbg0a
         wouiik8AWD3qw+4Y/c9BlnES9KXuVIARRbQJ4OZZSLS409ui0M+wgq/TfUkviBOIhHNj
         b8OmaLMWN/eZjGdhU+enzeyw2UcwzG/HNp/LgWB0qSj85uuKrclMszm6foosy8ctNNTd
         XuIU34+fYpqrEqpyKlzYX56u2vGoEiZ+jVyRzGXk0UfaZDroU31AX/cWbJYrA2XKzmcI
         fHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yv6YgEBN1OoakY2ulMyuoYQaptpeDYGExUbXgOAfCos=;
        b=erM6BBARdOjVyAQJX+6JnD27l+CWJiTEQlzDFtiLNWggPaMoGwrXkGVvT6TU6WXfrB
         gildtMpoD4iy5cMDf+YF92kMCkV+iR2B8DDdV7WrmBwUa296Lkbci9aR2NYMZJZS3E5m
         NIiYvxm/KsEaIPamPzMdg7nhxChtFBTwvBW4S0noEmDcd48qrQ34jSWFFT+Q9DvRzqlP
         y4HlK9prz+5j36YNaUWPoth2juG4F/M9AP12Jnsg29bUmGQZEqt4Fo6bowaVu0NzF8je
         HCAbQ3E92YrTf+zVpWG6crLV8+s2umXqRlBcgSLyN/23qtlAiI5SbrQYw1Q+d7fGFaZ/
         Xg+g==
X-Gm-Message-State: AOAM532ffFkAB5/sKP6IsDoTSADgH5tccTHdN4T2NZpCMWLX/xOVSXxD
	wbxmPmo7NIA+kI63FOsnFQNY+470QKU=
X-Google-Smtp-Source: ABdhPJxP/ZPktCsQKH0ZEMTYkpzSyG3Pwp12HznDvI+cdIffsEt5ZRUPtW/wT67zJYXzF4qX8YmE/A==
X-Received: by 2002:a65:49c5:: with SMTP id t5mr2106563pgs.279.1600750058009;
        Mon, 21 Sep 2020 21:47:38 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:8176:7362:ce41:2f0c])
        by smtp.gmail.com with ESMTPSA id y13sm13563533pfr.141.2020.09.21.21.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 21:47:37 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-markupsafe: bbappend for ptest
Date: Mon, 21 Sep 2020 21:47:25 -0700
Message-Id: <20200922044727.18107-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

The main recipe has moved to oe-core, but with ptest
disabled. Here we simply conditionally inherit ptest
to enable it in meta-python.

Remove the original recipe and the python3-markupsafe/
directory.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-markupsafe/run-ptest       |  3 ---
 .../python/python3-markupsafe_1.%.bbappend    |  2 ++
 .../python/python3-markupsafe_1.1.1.bb        | 27 -------------------
 3 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-markupsafe_1.%.bbappend
 delete mode 100644 meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest b/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
deleted file mode 100644
index 5cec7116968..00000000000
--- a/meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest
diff --git a/meta-python/recipes-devtools/python/python3-markupsafe_1.%.bbappend b/meta-python/recipes-devtools/python/python3-markupsafe_1.%.bbappend
new file mode 100644
index 00000000000..91814e6cde9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-markupsafe_1.%.bbappend
@@ -0,0 +1,2 @@
+# Main recipe was moved to oe-core, but with ptest disabled
+inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
diff --git a/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb b/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
deleted file mode 100644
index 7de57cbd636..00000000000
--- a/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
-HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
-
-SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
-SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
-
-PYPI_PACKAGE = "MarkupSafe"
-inherit pypi ptest setuptools3
-
-RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.25.0

