Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD07C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 08:19:15 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.32830.1741594753204144110
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 01:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eWDSFfOC;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3037668f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 01:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741594752; x=1742199552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=52nAyUidObv+JqG1sZPMOLBhJgsDzwL6KOhzLkIi55E=;
        b=eWDSFfOC0BoPd7Tb3Kfo89e9StE/g8/XP4y35R+nVWX7y6seDzq8sUlBcDke//gaqv
         s6PNFHk0IDWCSccuDbt5jA6QGcghXFN2ww8TIXaWWFCggSzy/Jp8yzHAJtUtJuTgksxo
         pTtNsMFxudJlXjXKV5SmYZlNOEsb7rSWpvWuX2+L1FStgIoxndLw8l1XhBbB9Prxv0t2
         KgQVeasKQ1CNW24lzcyN5JvSkQG65On3t+w9qRL0yM7jmc27pWNSqo9MDdx/8DNTa5hX
         5AqO+7lrQSjQ9JsBRNVq5klcsdtAAJzJs/OKJWe328dRqYAXEtH6QhJ1JEAJWhumaNBm
         YLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741594752; x=1742199552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52nAyUidObv+JqG1sZPMOLBhJgsDzwL6KOhzLkIi55E=;
        b=lFxqIBY1yLCzAksgEyoKUuw7J+eF6DoIjYUAc13tb9A9B7+KXPF9TDEqeWBBORDkyR
         1chMLqt9Ntf819p99Ht496Qx4O4nE2kxycwAgV18duTPrtn6g2ZEAEJwrIm3JzuOsgwb
         ay6Ascd65Dpf5PbKKkVjiq+GZfSqy2AVoRAAOOyoMmjd7y9Sja2sOXQj3f4J6lmdDDKJ
         9WsBiwASu0O035yyCigCgekkw4Sa5drXUxSbGlb1RQGvHu1SA/1KxuXqaYz7+APwd5Xy
         +PCAetQYsa2ocPukOtH9rNBebRNmjGl/vBNeDqOrMBOxThrHHkvXXv+kf1QRtuSafBn9
         RDvw==
X-Gm-Message-State: AOJu0YwJL90oMBQHAMpn0ZKCZjPMuLdcJ+RQ33DYUI6hoDfc4e3fjHzZ
	8t/fzHLyflbaKfimFPrFtwK0RpaYyD7j7q3wOzyLqdpIDDcE24JRx6T/3g==
X-Gm-Gg: ASbGncu1U+S6/7TCZ7jcVKbgENQdu4jW/2OMN8+fcUPVxXs458LzdxYFIpSlfv0O19a
	1Jgdtx9Q0JoQTtorwE0cpwEAw7KAI6AgOusqCPhuYTexOIQp4X0cj0eD99WFZq2doeKojBe14vw
	b2FN8l/0Q8pvRXicw4R77ordO0JlTFBZ8MMBdmO0kMRERWsGWYP7fjJcw1t/Twllcdn7fxWIvrJ
	ilPF5CpjTCAeuA1W142PMzlID4PbXM1QT4XyhiyEcN9SnRdB9IbkhqijMwCVychwTGgJ7ngVpxw
	sEVBilg+1lExwtJBEW9tu4tCv9RErQf4C2TDHkCI5TLkxixhrCDD4fzoAEiA
X-Google-Smtp-Source: AGHT+IFcZFW0IlfnxbfyuPG5EntmMZYqhCV4UlvkxAVY6yBF4T3XkPth+EcLYLklARFk5sbFUdLUXQ==
X-Received: by 2002:a05:6000:4106:b0:391:47d8:de2d with SMTP id ffacd0b85a97d-39147d8e011mr2334728f8f.23.1741594751314;
        Mon, 10 Mar 2025 01:19:11 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01cd62sm13839212f8f.46.2025.03.10.01.19.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 01:19:10 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-pandas: compile against target version of numpy
Date: Mon, 10 Mar 2025 09:19:10 +0100
Message-ID: <20250310081910.3106973-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 08:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115823

python3-numpy headers are required by pandas to compile successfully.
By default, this recipe used python3-numpy-native for compilation,
which usually works. However in case the bitness of the build-host
differs from the target, then problems arise.

For example when compiling for 32-bit ARM on a x86-64 machine, the following
error appears when trying to import the module:

ValueError: Buffer dtype mismatch, expected 'const int64_t' but got 'long long'

When running a diff on all numpy headers across native and target,
only one header differs, _numpyconfig.h, in a significant way.
This header defines the sizes of different datatypes used by numpy,
and these sizes strongly depend on the arch bitness.

This change switches from python3-numpy-native dependency to python3-numpy to
ensure that the correct headers are used. Beside this also patch the meson script,
so it accepts an option (numpy_inc_dir) to specify the location of these headers,
since it is not able to query them from the class-target module

The PYTHONPATH variable is extended with the target's RECIPE_SYSROOT, because
numpy is specified as a dependency in meson, and it needs to find the module
to continue successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...fy-numpy-header-path-as-meson-option.patch | 52 +++++++++++++++++++
 .../python/python3-pandas_2.2.2.bb            |  9 +++-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pandas/0001-specify-numpy-header-path-as-meson-option.patch

diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-specify-numpy-header-path-as-meson-option.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-specify-numpy-header-path-as-meson-option.patch
new file mode 100644
index 0000000000..039f116ff1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pandas/0001-specify-numpy-header-path-as-meson-option.patch
@@ -0,0 +1,52 @@
+From 46b3c3ee68f271acbc178260939ca8423f9244a5 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 9 Mar 2025 19:57:26 +0100
+Subject: [PATCH] specify numpy header path as meson option
+
+In case pandas is compiled against the class-target version of numpy, it is
+not possible to import the module, due to target-compiled binary files - 
+it just fails with an error. However this also means that meson isn't
+able to query the include folder location, so the compilation fails.
+
+To avoid this, the new "numpy_inc_dir" meson option allows specifying the
+location of the required headers.
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.options      | 1 +
+ pandas/meson.build | 6 +++---
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+ create mode 100644 meson.options
+
+diff --git a/meson.options b/meson.options
+new file mode 100644
+index 0000000000..3d3a18d145
+--- /dev/null
++++ b/meson.options
+@@ -0,0 +1 @@
++option('numpy_inc_dir', type : 'string', description : 'The absolute path to the numpy headers')
+diff --git a/pandas/meson.build b/pandas/meson.build
+index 435103a954..32ad04bd8e 100644
+--- a/pandas/meson.build
++++ b/pandas/meson.build
+@@ -3,17 +3,17 @@ incdir_numpy = run_command(py,
+     '-c',
+     '''
+ import os
+-import numpy as np
+ try:
+     # Check if include directory is inside the pandas dir
+     # e.g. a venv created inside the pandas dir
+     # If so, convert it to a relative path
+-    incdir = os.path.relpath(np.get_include())
++    incdir = os.path.relpath(os.getenv('NUMPY_INC_DIR'))
+ except Exception:
+-    incdir = np.get_include()
++    incdir = os.getenv('NUMPY_INC_DIR')
+ print(incdir)
+      '''
+   ],
++  env: {'NUMPY_INC_DIR': get_option('numpy_inc_dir')},
+   check: true
+ ).stdout().strip()
+ 
diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
index c12a237653..5676d98cd0 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
@@ -11,12 +11,14 @@ SRC_URI += " \
             file://0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch \
             "
 
+SRC_URI:append:class-target = " file://0001-specify-numpy-header-path-as-meson-option.patch "
+
 SRC_URI[sha256sum] = "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9c6c43093218de28b54"
 
 inherit pkgconfig pypi python_mesonpy cython
 
 DEPENDS += " \
-    python3-numpy-native \
+    python3-numpy \
     python3-versioneer-native \
 "
 
@@ -30,3 +32,8 @@ RDEPENDS:${PN} += " \
     python3-pytz \
     python3-profile \
 "
+
+PYTHONPATH:prepend:class-target = "${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}:"
+export PYTHONPATH
+
+EXTRA_OEMESON:append:class-target = " -Dnumpy_inc_dir=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/_core/include "

