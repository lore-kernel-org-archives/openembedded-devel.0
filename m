Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF23CE7B09
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 12:58:20 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17349.1763125091141916791
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 04:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hWgTCW1G;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso3447210a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 04:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763125089; x=1763729889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HLEa4kp6lGNguB+DbgIsaZ/3rOWa67wntooTv11Pl60=;
        b=hWgTCW1Ga0uqgyeV9cAqavg0y9DhWbY/PSSCuESfOqo0EmaQ0q1Ju2voXwE+RnGw0s
         XYwO8kDb6SlmYRYxBxbty1gENOFh8hZdgtJhmhet5HoHM6skgTGMp29cUTaxENcKzC3F
         sBL/KryIHF3pOlKHLC5e/wtSfwUdkS2dMXpSBu2VSsQGMF8j0Xo0VRUgXJ5+9CNIw4tt
         ESFGPxZiGZlArW1Kkgp3p7149M9xuJpsb+3tBTu6UAMwNlZ1WwknFdOvvWBffyTZJvt2
         phsf80Z8xHYBrNrlsHjp4kN9K1snpu1sS48DJV1qG50/LBzHbgmU3cIu7B6T+aqUsPvb
         D8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763125089; x=1763729889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLEa4kp6lGNguB+DbgIsaZ/3rOWa67wntooTv11Pl60=;
        b=hgYN0Z1RvWABHWtOB93buUaAD1avkSbKDtnTNnaxyDoPYqXkOpIw2pvj6Ca38FV9Xu
         Yqchn8Aqd9SGTVwIqQQ9ItZno+CSCJhTNzTQppf9nOZmGnqopuZTKaP/xWdJiomhVtev
         vEUMInj0tjDOsgpyOnMULw5X8MApw1MucXnC4ZnuJNjwvQ7GMuZ/qcfuyou/8buWKlHQ
         aXvCL6/4yp6ISd/DTmyxFD+oSazpo65OF7fJzEtJr3dwgeKoOUbuC1rTTUb3zsvbr42R
         E9O1b4xVVHW5OF8z2Cnz2cTGPhuRxzBnZ0Vwiu/Vv8pUw46lKKNMlY02eBeC8kEnSHi/
         bQ7A==
X-Gm-Message-State: AOJu0YzTm2pFXdDcu1fUBcRySNBqQXVoV+QaNtdix8v53FFaOySB3b66
	qQHRKIhVrAUaXgvvxcuXPd9MtaBt5NAb7hALG/LftbbdCZwLDQVOeFjyc3sKkw==
X-Gm-Gg: ASbGnctLcrBc5w4BHXBWcoIW69lrfNN6AXcIm9wcrw0xuR6+vFgIYp5jkQVXOXBybAf
	mC/H96t9AO8LCONb+IbRJS9mVZqX1w77PVROC+IcyV3GMITaucEcLZfngajloQyAVL40gnxoDEf
	icZVUoa6V5Qd+8u3AHuFVZf1AE95NfDSrYr4HhsbLlK7FS9HtE5FkrSHYkgQ6NePF+IvHwlPA2E
	YmmRzFMLgbAM3gClzBO9GSJNEaXoze7Tn4PZ8zj3Gg7X8ywHDv/0bIJpUG+FftH/O1GTkpOIurr
	B7w8Kr1eRhGqAOeQUEE3YohfW/HUh8Rg6l7sQJcD+Mu1Rd5dC06+qbMF4K8BYZl2ZJx3G9dkXyr
	hqnjk7X42uoOcH/RMx8YGLB9F1aGiJiYnz+jalMXwq+MCveVkXP3vYi5sRysKiTl50fbKiXsR6W
	1KNno8IHE6NNLjxw==
X-Google-Smtp-Source: AGHT+IHLGHsqWQ63RW2OIQj3x8ccVB3x4D9gTlBfZmggQ61hhCBK6GN+Ej2+LY3jVc/qZOCDcPOz+g==
X-Received: by 2002:a05:6402:51ce:b0:640:c69b:8ecd with SMTP id 4fb4d7f45d1cf-64350e9fc14mr2552156a12.25.1763125089253;
        Fri, 14 Nov 2025 04:58:09 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f8767sm3684747a12.9.2025.11.14.04.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:58:08 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCHv2 1/2] python3-checksec-py, python3-pylddwrap, python3-icontract: add recipes
Date: Fri, 14 Nov 2025 13:58:04 +0100
Message-ID: <20251114125804.1781071-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 12:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121709

From: Martin Jansa <martin.jansa@gmail.com>

they were sent for meta-security long time ago in 2021:
https://lists.yoctoproject.org/g/yocto/message/54470
but never merged there, now there are lief, docopt, rich, asttokens
already in meta-python and checksec-py depends on lief version, e.g.
https://github.com/Wenzel/checksec.py/commit/976d530867756d1393189708aa98308b07b1f3b2
is needed to fixcompatibility with newer lief currently in meta-python

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: add COMPATIBLE_HOST restriction in checksec-py as reported by khem

 ...1-main-Add-option-to-ignore-symlinks.patch | 81 +++++++++++++++++++
 .../python/python3-checksec-py_0.7.5.bb       | 27 +++++++
 .../python/python3-icontract_2.6.6.bb         | 14 ++++
 .../python/python3-pylddwrap_1.2.2.bb         | 26 ++++++
 4 files changed, 148 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-checksec-py/0001-main-Add-option-to-ignore-symlinks.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-checksec-py_0.7.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-icontract_2.6.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-checksec-py/0001-main-Add-option-to-ignore-symlinks.patch b/meta-python/recipes-devtools/python/python3-checksec-py/0001-main-Add-option-to-ignore-symlinks.patch
new file mode 100644
index 0000000000..3a99ba33e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-checksec-py/0001-main-Add-option-to-ignore-symlinks.patch
@@ -0,0 +1,81 @@
+From b540967b87394d855c26375ac5a9a7265f265053 Mon Sep 17 00:00:00 2001
+From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
+Date: Fri, 2 Jul 2021 14:42:25 +0200
+Subject: [PATCH] main: Add option to ignore symlinks
+
+When analyzing a complete rootfs (which might not be the rootfs of the
+analyzing system) symlinks within that rootfs might be broken. In
+particular absolute symlinks. However, if by chance such a symlink
+currently points to a valid binary in your system, this binary pointed
+to is analyzed. This commit adds the possibility to ignore symlinks to
+files (symlinks to dirs are already ignored by default). This allows to
+solve the issue described above, and if the whole rootfs is analyzed
+there shouldn't be a loss of information (because all the binaries will
+be analyzed anyway). Additionally, this also saves some time when
+performing the analysis.
+
+Upstream-Status: Submitted [https://github.com/Wenzel/checksec.py/pull/106]
+---
+ checksec/__main__.py | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/checksec/__main__.py b/checksec/__main__.py
+index a14862f..931d850 100644
+--- a/checksec/__main__.py
++++ b/checksec/__main__.py
+@@ -8,6 +8,7 @@ Options:
+     -w WORKERS --workers=WORKERS    Specify the number of process pool workers [default: 4]
+     -j --json                       Display results as JSON
+     -s LIBC --set-libc=LIBC         Specify LIBC library to use to check for fortify scores (ELF)
++    -i --ignore-symlinks            Ignore symlinks to files
+     -d --debug                      Enable debug output
+     -h --help                       Display this message
+ """
+@@ -27,18 +28,18 @@ from .pe import PEChecksecData, PESecurity, is_pe
+ from .utils import lief_set_logging
+ 
+ 
+-def walk_filepath_list(filepath_list: List[Path], recursive: bool = False) -> Iterator[Path]:
++def walk_filepath_list(filepath_list: List[Path], recursive: bool = False, ignore_symlinks: bool = False) -> Iterator[Path]:
+     for path in filepath_list:
+         if path.is_dir() and not path.is_symlink():
+             try:
+                 if recursive:
+                     for f in os.scandir(path):
+-                        yield from walk_filepath_list([Path(f)], recursive)
++                        yield from walk_filepath_list([Path(f)], recursive, ignore_symlinks)
+                 else:
+                     yield from (Path(f) for f in os.scandir(path))
+             except OSError:
+                 continue
+-        elif path.is_file():
++        elif path.is_file() and (not ignore_symlinks or not path.is_symlink()):
+             yield path
+ 
+ 
+@@ -75,6 +76,7 @@ def main(args):
+     json = args["--json"]
+     recursive = args["--recursive"]
+     libc_path = args["--set-libc"]
++    ignore_symlinks = args["--ignore-symlinks"]
+ 
+     # logging
+     formatter = "%(asctime)s %(levelname)s:%(name)s:%(message)s"
+@@ -110,7 +112,7 @@ def main(args):
+             # we need to consume the iterator once to get the total
+             # for the progress bar
+             check_output.enumerating_tasks_start()
+-            count = sum(1 for i in walk_filepath_list(filepath_list, recursive))
++            count = sum(1 for i in walk_filepath_list(filepath_list, recursive, ignore_symlinks))
+             check_output.enumerating_tasks_stop(count)
+             with ProcessPoolExecutor(
+                 max_workers=workers, initializer=worker_initializer, initargs=(libc_path,)
+@@ -119,7 +121,7 @@ def main(args):
+                     check_output.processing_tasks_start()
+                     future_to_checksec = {
+                         pool.submit(checksec_file, filepath): filepath
+-                        for filepath in walk_filepath_list(filepath_list, recursive)
++                        for filepath in walk_filepath_list(filepath_list, recursive, ignore_symlinks)
+                     }
+                     for future in as_completed(future_to_checksec):
+                         filepath = future_to_checksec[future]
diff --git a/meta-python/recipes-devtools/python/python3-checksec-py_0.7.5.bb b/meta-python/recipes-devtools/python/python3-checksec-py_0.7.5.bb
new file mode 100644
index 0000000000..8d8e54e227
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-checksec-py_0.7.5.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Recipe to embedded the Python PiP Package checksec_py"
+HOMEPAGE = "https://pypi.org/project/checksec_py"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+PR = "r0"
+
+inherit pypi python_poetry_core
+PYPI_PACKAGE = "checksec_py"
+SRC_URI[sha256sum] = "892854f95d17a76d8f45a5c0cc597b9f1bebced3fffb9c7205d0baaf5eace886"
+
+SRC_URI += " \
+    file://0001-main-Add-option-to-ignore-symlinks.patch \
+"
+
+RDEPENDS:${PN} += " \
+    python3-docopt \
+    python3-lief \
+    python3-pylddwrap \
+    python3-rich \
+"
+
+# python3-lief is not available for x86:
+# https://github.com/lief-project/LIEF/commit/3def579f75965aa19c021d840a759bce2afc0a31#r152197203
+COMPATIBLE_HOST:x86 = "null"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-icontract_2.6.6.bb b/meta-python/recipes-devtools/python/python3-icontract_2.6.6.bb
new file mode 100644
index 0000000000..5075a1a6a1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-icontract_2.6.6.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Recipe to embedded the Python PiP Package icontract"
+HOMEPAGE = "https://pypi.org/project/icontract"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1d4a9b1f6b84bedf7a38843931e0dd57"
+
+PR = "r0"
+
+inherit pypi setuptools3
+PYPI_PACKAGE = "icontract"
+SRC_URI[sha256sum] = "c1fd55c7709ef18a2ee64313fe863be2668b53060828fcca3525051160c92691"
+
+RDEPENDS:${PN} += "python3-asttokens"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb b/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb
new file mode 100644
index 0000000000..045ccb9f1e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pylddwrap_1.2.2.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Recipe to embedded the Python PiP Package pylddwrap"
+HOMEPAGE = "https://pypi.org/project/pylddwrap"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=48fd6c978d39a38b3a04f45a1456d0fa"
+
+inherit pypi setuptools3
+PYPI_PACKAGE = "pylddwrap"
+SRC_URI[sha256sum] = "a70437fea7bca647c0e98161e1006ef49970267999c571b499760f1c43c6ba10"
+
+PR = "r0"
+
+RDEPENDS:${PN} += "python3-icontract"
+
+BBCLASSEXTEND = "native"
+
+do_install:append() {
+    # similarly to https://gitlab.com/akuster/meta-security/-/commit/0fd8e0f8cae612010bafecbff77ed9bb6f647a2d#4e154e295e639fd6c298ca644c75291eb99e0a57_0_16
+    # but delete it from prefix and delete requirements.txt as well.
+    # ERROR: QA Issue: python3-pylddwrap: Files/directories were installed but not shipped in any package:
+    # /usr/README.rst
+    # /usr/requirements.txt
+    # /usr/LICENSE
+    # Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
+    # python3-pylddwrap: 3 installed and not shipped files. [installed-vs-shipped]
+    rm -f ${D}${prefix}/README.rst ${D}${prefix}/requirements.txt ${D}${prefix}/LICENSE
+}

