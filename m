Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDB9F30287
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 20:41:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36516.1773607263220946871
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 13:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g4tTMHYX;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso23303305e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773607262; x=1774212062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KyHtUwLnBGFbK70poOzpBLLA7DZymBShkNP9EFwpXbs=;
        b=g4tTMHYXxn0AVrchiddzYFQiA2+ho/9giIOg9icjQSmfQHTg4snLSIkRwH2iCT06jw
         1gruHNs5zY6RXhIO4MtwkWDn2nNSXYxFp950no1WUQ8EmGi/X9MRuA4pNH031nW+aG9q
         HE0pGhETFj5P5mxu2dU8zGu/LSlbVFu4JMStxh60aSy8QXaHlioYQJKgx+axfDvXM+bI
         eHn5nvhNQg9eqWoFb90BI5Jq54FycMR2bCnWseA95aUlbjJdoxxO4BoEPlpr5H2HD3t/
         Fv6T8agDiCXikkHE1yzPCixGv9jHRHbfVp+KkfqYk9z1bQ/Gp4pdvtC1t2DYJLrYKYEc
         RF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773607262; x=1774212062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyHtUwLnBGFbK70poOzpBLLA7DZymBShkNP9EFwpXbs=;
        b=PRC8vBjpcN56XxAEtxgKfMgJYGehS4kkO3ei9VL+c7s0sGY9n6tIXXiXLg5tUHrCyO
         +xdoySSth319bIgonBUUEKEcXWtec6NnNShrdWUM1Qd2knMXFxTB4qtA6+KSuwQlGf15
         YYcBmSnE3qa2GBeT4RggUm8kdUxGkCIyGtgYg5lZdUR8bS2wK7bVKjtGwhaeAbeXL55Z
         oukWiZjK23y23F88N+EioZllOW/u1aEr6pQhXFboAdf5GHtXrdvaWDUYUVH1l0c/p1i/
         jE6YLuIb2f9zlQCb9cWdS2Q+5yAega4wKoUecoiIPR/SkPNxxc9F3o8URJjvwn0zTghi
         OOKQ==
X-Gm-Message-State: AOJu0YyNT7DKh2OE0Zhk7EzMWPRDnCl7qcDv1xrnlIMqtTpAR7Jhgkx2
	mcu2ZvO/JJ9dtndrZO1VzUEs1nNS2pX+UrYoLkagsUH/GEb7ZnMnOklWCh0JWQ==
X-Gm-Gg: ATEYQzyZFUUbGO3C04YvLi/s2N05iWzILiMcqxs4aXwXvpAX14JGyR11eYhYXrSmr0K
	ittlZP3NEfa/HzYRIbMvhcbW+XKnuCZd5JHspxCiLvFc29eYjbpJuD+bBudKF/g3mVfanfkiyyp
	Mhx+jkgFeH6Y5RGjQFY6Oe/1MZsRVirjKpjdnL/P4XLIvvdJGUBC43futuUM3QGGsMuYlR2qNTg
	H3m2cMOTFVSq3dkyiyH7VXR1qgXwWCgBk1O8efEYjvM5nqjRnqyCV/pjx5rK3p01dIkEo/oXSHS
	HjR4G38kVqO5UjMzZ0rAzaJUjNuqttB8XEJqsHWEkXsI/Kay5Cl2VU3jdi4N4I5yq/dR8/jhTJu
	UiSNCE8HLViKgJSGcYloQuYDsXEKg96bMnxLpIYWttjSR95Qprlu6keZv1hPDTV5+lKz6AuRIRQ
	SF6aHk6wB3rBGNUNJm1g3C
X-Received: by 2002:a05:600c:4fc6:b0:485:3fc8:de9c with SMTP id 5b1f17b1804b1-485566d520cmr165917625e9.12.1773607261283;
        Sun, 15 Mar 2026 13:41:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm478325115e9.12.2026.03.15.13.41.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:41:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-cassandra-driver: upgrade 3.29.2 -> 3.29.3
Date: Sun, 15 Mar 2026 21:41:00 +0100
Message-ID: <20260315204100.489903-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 20:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125246

Also, add a patch to be able to build with Setuptools 82.
This patch is oe-specific, but upstream has already merged[1] a
patch that should make it compatible with the latest Setuptools.
It however seems to require multiple patches to apply clean. The
patch in this change is expected to be a short term workaround until
the next version is released.

Changelog:

Features
- Upgraded cython to 3.0.x
- Add support for DSE 6.9.x and HCD releases to CI
- Add execute_concurrent_async and expose execute_concurrent_* in Session

Bug Fixes
- Update geomet to align with requirements.txt
- Connection failure to SNI endpoint when first host is unavailable
- Maintain compatibility with CPython 3.13

Others
- Remove duplicated condition in primary key check
- Remove Python 3.8 which reached EOL on Oct 2024, update cryptography lib to 42
- Remove obsolete urllib2 from ez_setup.py
- Remove stale dependency on sure
- Removed 2.7 Cpython defines

[1]: https://github.com/apache/cassandra-python-driver/pull/1268
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...fying-the-availability-of-setuptools.patch | 34 +++++++++++++++++++
 ....bb => python3-cassandra-driver_3.29.3.bb} |  7 ++--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-cassandra-driver/0001-skip-verifying-the-availability-of-setuptools.patch
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.29.2.bb => python3-cassandra-driver_3.29.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver/0001-skip-verifying-the-availability-of-setuptools.patch b/meta-python/recipes-devtools/python/python3-cassandra-driver/0001-skip-verifying-the-availability-of-setuptools.patch
new file mode 100644
index 0000000000..b58fd04752
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver/0001-skip-verifying-the-availability-of-setuptools.patch
@@ -0,0 +1,34 @@
+From ebee090ac020c5a4e4194788fc2f53d7a4e30b40 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 15 Mar 2026 21:28:07 +0100
+Subject: [PATCH] skip verifying the availability of setuptools
+
+The setup script checks is setuptools is available (with the correct minimum
+version), using setuptool's pkg_resouces modules. Setuptools has dropped
+this module in version 82, making this import fail.
+
+This patch skips the availability check of Setuptools, it is expected to be
+always available from oe-core - the patch itself is oe-specific.
+
+Upstream has already prepared a solution to rework their setup script to
+work with the latest Setuptools, however that patch builds on several other
+patches.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ ez_setup.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ez_setup.py b/ez_setup.py
+index 76e7105..c668e5d 100644
+--- a/ez_setup.py
++++ b/ez_setup.py
+@@ -107,6 +107,7 @@ def _do_download(version, download_base, to_dir, download_delay):
+ 
+ def use_setuptools(version=DEFAULT_VERSION, download_base=DEFAULT_URL,
+                    to_dir=os.curdir, download_delay=15):
++    return
+     # making sure we use the absolute path
+     to_dir = os.path.abspath(to_dir)
+     was_imported = 'pkg_resources' in sys.modules or \
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.2.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.2.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.3.bb
index f60167d309..6ab86300f5 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.3.bb
@@ -8,9 +8,12 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[sha256sum] = "c4310a7d0457f51a63fb019d8ef501588c491141362b53097fbc62fa06559b7c"
+SRC_URI += "file://0001-skip-verifying-the-availability-of-setuptools.patch"
+SRC_URI[sha256sum] = "ff6b82ee4533f6fd4474d833e693b44b984f58337173ee98ed76bce08721a636"
 
-inherit pypi setuptools3
+PYPI_PACKAGE = "cassandra_driver"
+
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
     python3-cython \

