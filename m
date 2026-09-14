Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D4CC88E6A
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 09:28:01 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16321.1789378075541267807
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 02:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fxf4AOTn;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49e6deb520eso22959295e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378074; x=1789982874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAIot3eV75aI7dCSHYTcXmDiZ+xeIghQsuUY0WMWxtQ=;
        b=fxf4AOTny2Bw93eBlgY48mtROnWnsmwTIWFc57AFHVGr9sOxrP6LdIOLUgCN3J0R88
         JonmHJhY+2ExHC71n14Ddgruxl7phhc9Q+jyNRZn0XHrVrTgeSFJ0rSJ2B6MLYORf95S
         94bC3w14k5bSf75VbVsSPUTtPdYy35DdWRwNP5vOGpirK+uacZwHdSLK0DmLbw0ZKBWh
         HH0K3fWyRX5Yelr9xLqyK/9CDXN0V6TmT6rEZnkbcOUc6aefxEJRe4o7CPPbvHYMKC1Q
         l8AoojBPD7dpWFrz3qoTcOefjbJuO8a/C+igov2IP1zfZF+BRmvTSft5M+DUnVyUASTc
         LiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378074; x=1789982874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAIot3eV75aI7dCSHYTcXmDiZ+xeIghQsuUY0WMWxtQ=;
        b=WU3UuGOD9b+0fE3SAI03Oa7gWJ2k5CgzefoQ3Z7jRwyM4iW6vpsK2XJgWKFbXk7yvL
         iveUTX+/cWUgzTsq1G2NYcJErVG/wUNuGBfT4g7lTvTddelvwESsOuICr7uTGdyq3Lx4
         uqFuRUywq2uyNLmUrD+pEHreNZ/w5brvyI2F9rFTKIbATlZGqO3kcMe4D6TzYQ3aUona
         IGRbo5nUH+AcHh/mFVQwVFvuRwlrFhtjZ+cM++wusnJPYffClZCipwBTyCEO9PYFk2NS
         9xLmT+N+gRV1QI5YIzUaktdtttLfyTcCMpY7Djz13fIwQZqCaQXdnWbZ4iG71xPux1OQ
         YInQ==
X-Gm-Message-State: AFuF++luTAzSQFh2Ba6ypNERRnDxjPEaOYo+3Zyse0LomHNafn3xj+Xi
	0U+BzJfHhwadAPrO2upC+iOYW0U6Rt6IvLXDLoE8JHkT5oxj3T2dIhw6a8J3+RjN
X-Gm-Gg: AYBFou3/eqbxGxAv/wocF+bX+prTpo/7fQR6xJsWAqjXY9y4Ntb45xnTnQX/z7s8ECU
	38T68ZnSyP8vobWbpsrPuvRhq6rv0RJuF4n5n8DnKnG28NC0kxukOvWeouDC/Q/uzQcIC9apBpp
	/VuyfICuJsU2Kuv02l1Ex0TM63FUZfRGXzbMztbWzcqOP4aU043V/IM4UUzVzakOQ5SnWGrp6eH
	6EUtAIEqN3c2mPSwpuj/SdiJOk5OeOcCa+p2DVqHoAr0R2jiG7Q2VkmVbCKN10TB0M8BBhPmJBb
	12wQLrzTEM8Zn9PprjGJQ6J8WS5n30Lot+SEiGFWMCThhOGEk3OqHdb8/HnkJAc3xGj1gyS1pXY
	hQ9VPw3vwPywfNil5mRxJGmOLJ8d8xLzyIKssjoot5mXycyGj6ZHNPoYhpXyvlwhL2YwCAwL4KO
	3NTK2r+VaCezMDziy1NXzEY1HJT+E1cpNdZTdq+xbcG9WC4vEZWGHOrx716uQIGPk59vOBA/o/S
	WNx55n/iVm/UhCnFt7pUVbLkqyPSn9wZyQG0g+nfZWjkRw4TgylW2fZHoiaoCYkOc8McSFxOBh/
	3hL35mDomUTnbeIIRePO7dzJSX6B2rZX0Wv++blhKLiw
X-Received: by 2002:a05:600c:4e4a:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49e7a65c908mr20615745e9.6.1789378073338;
        Mon, 14 Sep 2026 02:27:53 -0700 (PDT)
Received: from localhost.localdomain (2a02-1812-512-2c00-7d69-2c97-3436-ad5f.ip6.access.telenet.be. [2a02:1812:512:2c00:7d69:2c97:3436:ad5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71adc2ecsm175521085e9.4.2026.09.14.02.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:27:52 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: tfggeelen@gmail.com,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-construct: new recipe version 2.10.70
Date: Mon, 14 Sep 2026 11:27:45 +0200
Message-ID: <20260914092745.20027-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 09:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130020

Recipe taken from meta-homeassistant of Tom Geelen.

Added ptests.  But removed the tests with binary data (e.g. .so file).
Those tests gave to much issues with QA rules of Yocto/Openembedded.

Moved from pypi to github to have all test code.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 ...ile-to-enable-pytest-8.x.y-to-find-t.patch | 25 ++++++++++++
 ...002-pytest.ini-disable-the-benchmark.patch | 26 ++++++++++++
 .../python3-construct_2.10.70.bb              | 40 +++++++++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-construct/python3-construct/0001-add-pytest.ini-file-to-enable-pytest-8.x.y-to-find-t.patch
 create mode 100644 meta-python/recipes-devtools/python3-construct/python3-construct/0002-pytest.ini-disable-the-benchmark.patch
 create mode 100644 meta-python/recipes-devtools/python3-construct/python3-construct_2.10.70.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index e4eae4ef43..9b3a535e55 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -19,6 +19,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-cachetools \
     python3-cbor2 \
     python3-configobj \
+    python3-construct \
     python3-pyconnman \
     python3-click \
     python3-dasbus \
diff --git a/meta-python/recipes-devtools/python3-construct/python3-construct/0001-add-pytest.ini-file-to-enable-pytest-8.x.y-to-find-t.patch b/meta-python/recipes-devtools/python3-construct/python3-construct/0001-add-pytest.ini-file-to-enable-pytest-8.x.y-to-find-t.patch
new file mode 100644
index 0000000000..3e9e73bd45
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-construct/python3-construct/0001-add-pytest.ini-file-to-enable-pytest-8.x.y-to-find-t.patch
@@ -0,0 +1,25 @@
+From b8d0ba87f629cc6065a2d06cedc5e850407c45de Mon Sep 17 00:00:00 2001
+From: Franz Haas <franz.dominik.haas@gmail.com>
+Date: Tue, 17 Sep 2024 11:23:28 +0200
+Subject: [PATCH 1/1] - add pytest.ini file to enable pytest 8.x.y to find the
+ tests
+
+Upstream-Status: Backport [https://github.com/construct/construct/commit/b8d0ba87f629cc6065a2d06cedc5e850407c45de]
+
+---
+ pytest.ini | 3 +++
+ 1 file changed, 3 insertions(+)
+ create mode 100644 pytest.ini
+
+diff --git a/pytest.ini b/pytest.ini
+new file mode 100644
+index 0000000..f5a52af
+--- /dev/null
++++ b/pytest.ini
+@@ -0,0 +1,3 @@
++[pytest]
++pythonpath = .
++
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python3-construct/python3-construct/0002-pytest.ini-disable-the-benchmark.patch b/meta-python/recipes-devtools/python3-construct/python3-construct/0002-pytest.ini-disable-the-benchmark.patch
new file mode 100644
index 0000000000..bc89546c82
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-construct/python3-construct/0002-pytest.ini-disable-the-benchmark.patch
@@ -0,0 +1,26 @@
+From 7acb7aa51db762a723d85b81262ca14614dbeac0 Mon Sep 17 00:00:00 2001
+From: Jan Vermaete <jan.vermaete@gmail.com>
+Date: Mon, 14 Sep 2026 10:24:51 +0200
+Subject: [PATCH 2/2] pytest.ini: disable the benchmark
+
+Benchmark is also disabled in the github workflow of the project
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
+---
+ pytest.ini | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pytest.ini b/pytest.ini
+index f5a52af..4b1b4b6 100644
+--- a/pytest.ini
++++ b/pytest.ini
+@@ -1,3 +1,3 @@
+ [pytest]
+ pythonpath = .
+-
++addopts = --benchmark-disable
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python3-construct/python3-construct_2.10.70.bb b/meta-python/recipes-devtools/python3-construct/python3-construct_2.10.70.bb
new file mode 100644
index 0000000000..681c43122a
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-construct/python3-construct_2.10.70.bb
@@ -0,0 +1,40 @@
+SUMMARY = "A powerful declarative symmetric parser/builder for binary data"
+HOMEPAGE = "http://construct.readthedocs.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=202b39559c1c79fe4715ce81e9e0ac02"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+SRC_URI = "\
+    git://github.com/construct/construct.git;protocol=https;branch=master \
+    file://0001-add-pytest.ini-file-to-enable-pytest-8.x.y-to-find-t.patch \
+    file://0002-pytest.ini-disable-the-benchmark.patch \
+"
+
+PV = "1.0+git"
+SRCREV = "c25a47172d4bde392b7ad188175b07b319d3dea4"
+
+inherit setuptools3 ptest-python-pytest
+
+PACKAGECONFIG ?= "extras"
+PACKAGECONFIG[extras] = ",,,python3-arrow python3-cloudpickle python3-cryptography python3-lz4 python3-numpy python3-ruamel-yaml"
+
+RDEPENDS:${PN} += "\
+    python3-compression \
+    python3-core \
+    python3-crypt \
+    python3-cryptography \
+    python3-debugger \
+    python3-misc \
+    python3-pickle \
+"
+
+RDEPENDS:${PN}-ptest += "python3-pytest-benchmark"
+
+do_install_ptest:append() {
+    # *.so files gives issues with QA of Yocto/OpenEmbedded
+    rm -rf ${D}${PTEST_PATH}/tests/deprecated_gallery
+    rm -rf ${D}${PTEST_PATH}/tests/gallery
+
+    install -d ${D}${PTEST_PATH}
+    install -m 0644 ${S}/pytest.ini ${D}${PTEST_PATH}
+}
-- 
2.47.3


