Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D080C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 15:21:56 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38319.1790522512367710975
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 08:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yph3COlZ;
 spf=pass (domain: gmail.com, ip: 74.125.225.141, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso16308795e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 08:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790522511; x=1791127311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4bC3qxY4uYZOQroEQVsxXprKyfoDDOIbGGbzi7O4bM=;
        b=Yph3COlZppjXXCGM3lZsQc2i5o8OGv/9LZ2OdxPeU3i8LeCMsMovfPDAegvzzSbPh8
         6NzEzGZIpVuLpKc456pHQsorbQTR3ljn21Qe95OErX65CcJ8Hcsrii6CBXDdbmrwLn6W
         jjGeRwWlOXFJ3lBHJst6OKrFQT5B8+WOrQTKUry68CEK5t459YYxTt6M0qwXqJxA3C7N
         BR8B0ZWlvaMQJRVa7yN8/lmruHSrKgo+ln0DQBeAeimgW7+8uoBL3kMFYXKsw2XkjgT7
         tNOQfgO0k5BcgmW9Q9x2wIJ5l0tTZ1Mv8R4qltJfZ+xER31XNhHdMMhs7VvhO2CkcRNk
         WxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790522511; x=1791127311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4bC3qxY4uYZOQroEQVsxXprKyfoDDOIbGGbzi7O4bM=;
        b=z4D5VJs0Ypmh6YYqvymr6mHJNOnLwh2ZSP4BBBZYEFBShiRWbS2A1hdzFcZLbHlN2u
         CbPZFTIZnEVumJkn+5ujxCl3dMDYMaCKrKkRPvEQ4wM4Svdt/3LLWlL4v+itTspT3FZM
         5wBubZgKK7Sdl1pBEuEEaRP519Ou+M+EjqAGLUfPaVbEGQEfHhInzS9XviTYdnIWPR4P
         Pro0rVNKpDNFYr7QLxs5WhkuYtjhXCCvSpysztSEUF8sXM4ksl7eD9Gr1xb8mwaw6yF0
         UQ5dr133qwtnpn0KaL524PVIRSvPtft7YxzGfjjyPoh1bCoGZl99iggtsx/It7weGUjm
         Y2LQ==
X-Gm-Message-State: AFuF++me8Na6BynFpvxxdqo48MfvBNqAhckpbKujwEEXRKXyuxxLu8Nq
	zvxx/g9/j7ycyz34j6tbI5mRGzXrSTGjHNRePE31m5841cCLYADkkuwv4UxfGcfElME=
X-Gm-Gg: AYBFou2+uKFsCMmVd/lsAhhGdRCipm4K1gknRZ0hnsgGJk4txNnRBEpLt+LE4Ounug3
	yxTFUIQG/y9GI+HhFigv53goLax55jW+UyqkFlxCVY9slkOCE9D4ctbg0Hge8KpEayION2Fs3Sb
	LSmWd3hfmUTdkTBr0MSNidIc0hETVTlitxjz5bHbav7JSO4mUehByU9NzVTT54PQpeDgO2R8ljz
	7+6Da/PfzRE5bjbV9XIF97opszZP/9FYfS+9tTUV01YV867crrXehgA6AHeuduMzN3t67JHyQXC
	k3AWdQGIQAn0GVDuCdwAjcICFsarnOKy0As2ifPpcF7AfJl/63j3XIc1wIqZc3ltp+Vml4oRve5
	3+ENxggqk0HeNBmuStUmgj5BLcJMkVKR7YiyZ3Vk75pMcXoa+u/TXFF62zqtIwxnG9ZNofgdQqo
	rIFWXBY875evMQ1cDwDqWp2hs910zCWIPe7GevZ3gs8XR1s36DgSrpNslP3TyO/+zkPYiookn2K
	Pq0Gx5HhixonRdJW+VWDeGGzjv/RT4m+IvS7pMeAUyJ8Xykvta0xjQWHEW4RfcsWL/ZOEUOE9FP
	FS5Qa/AhLWjI1A24WULMbS8P5OIPrOVJsnLDJVER3w==
X-Received: by 2002:a05:600d:8643:10b0:49f:bb8a:b4ce with SMTP id 5b1f17b1804b1-49fe67bc26fmr137675785e9.28.1790522510423;
        Sun, 27 Sep 2026 08:21:50 -0700 (PDT)
Received: from localhost.localdomain (2a02-1812-512-2c00-f34f-4d73-f8e3-4ad.ip6.access.telenet.be. [2a02:1812:512:2c00:f34f:4d73:f8e3:4ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018e6dcbsm61540035e9.6.2026.09.27.08.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:21:49 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: tfggeelen@gmail.com,
	ankur.tyagi85@gmail.com,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH v2] python3-construct: new recipe version 2.10.70
Date: Sun, 27 Sep 2026 17:21:39 +0200
Message-ID: <20260927152139.580621-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 15:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130371

Recipe taken from meta-homeassistant of Tom Geelen.

Added ptests.  But removed the tests with binary data (e.g. .so file).
Those tests gave to much issues with QA rules of Yocto/Openembedded.

Moved from pypi to github to have all test code.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 ...ile-to-enable-pytest-8.x.y-to-find-t.patch | 25 ++++++++++++
 ...002-pytest.ini-disable-the-benchmark.patch | 26 +++++++++++++
 .../python3-construct_2.10.70.bb              | 39 +++++++++++++++++++
 4 files changed, 91 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-construct/python3-construct/0001-add-pytest.ini-file-to-enable-pytest-8.x.y-to-find-t.patch
 create mode 100644 meta-python/recipes-devtools/python3-construct/python3-construct/0002-pytest.ini-disable-the-benchmark.patch
 create mode 100644 meta-python/recipes-devtools/python3-construct/python3-construct_2.10.70.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 3605026ff3..4435556b2c 100644
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
index 0000000000..3364dd31a0
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-construct/python3-construct_2.10.70.bb
@@ -0,0 +1,39 @@
+SUMMARY = "A powerful declarative symmetric parser/builder for binary data"
+HOMEPAGE = "http://construct.readthedocs.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=202b39559c1c79fe4715ce81e9e0ac02"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+SRC_URI = "\
+    git://github.com/construct/construct.git;protocol=https;branch=master;tag=v${PV} \
+    file://0001-add-pytest.ini-file-to-enable-pytest-8.x.y-to-find-t.patch \
+    file://0002-pytest.ini-disable-the-benchmark.patch \
+"
+
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


