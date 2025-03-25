Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D03C36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 19:00:30 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.3976.1742929223346836746
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 12:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gPOlwToi;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6fee63b9139so1360517b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742929222; x=1743534022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yg+3dVk2yVWfeFgbxxi6D6v8dwuIIqjo+jm1LTS9KoM=;
        b=gPOlwToiPvjnAH4J8TuIUkY5VQEASmXVUAHnfuMZIIUtU421uTun33zCB+QucwqDE2
         enK8KYuQ/BMSc5UKr2BY+KKfMGeTdP0L8WsqAWqaqHRrkfcX37hpxwVKs/hT2EoMTsCB
         kGeU02bmO7ug8GD6zB1YdI7nLcdbf79CtbrtddNpz9k7lxBgii+HUuTJAyBf5T8JmYp8
         Aj03EqsMHEs98LqH78cs/EV2YfulE85MjgIqf8SYLc7oKJUq5JMguv+L2QwGG/hMgShl
         gejKohVv9PzI4myRjjyu7sOpFA2yDlT2BMVIOVnSsQsxWsIiYLEC3WLz7y6qiwJDFFTf
         X/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742929222; x=1743534022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg+3dVk2yVWfeFgbxxi6D6v8dwuIIqjo+jm1LTS9KoM=;
        b=IMRioRaKHpFWyvPuXDiCUCPGFw2lOBydFrE56BV3SyxRKiQQWBYID5hDAFNvIuo71N
         gMkcFXjT/AsSji6oOuQ6kFXN/6aUYRi/oPT55hZgL2w13UjGfXGOi9mNVQWulJJfAj4x
         NZu8UgdDXF0YK1PpgpFpygLBkmQ/73m7xaGvdnwdQ9cf/ZReQKnD3VtfLYPMOamgdBUy
         S4OI+as0A9yxFOc1JMYrcCJuYy1lMJsOKOu3DL7GI8H+2XYBp9zn9q8bTI3vWU2aOSkX
         YPXTQwFp4a4lda4WtSB7JFzPgJjYgfntWaUiJdjWtsg2W+JdXd999wVVFqSNVaWgvpRa
         gP1A==
X-Gm-Message-State: AOJu0Yx1PASMRRpsDi+OcEvKw6UU+uN8T5JE2yD66n3on1iiipxQUoXB
	1OddyVHhYlKIhCOzoIpY/8E6jn6IScFSFSqgtcINlVY4MCjPmkH0f0of2bpc
X-Gm-Gg: ASbGnctpFTvoW+znPBUq7Bd5HRSfJqURRS9IkYtEMoqUr1/2sra+9OA9C+BCH/bBbhd
	3RGCq7Wbx+QB0MfIcgbdrqCL1E6Wd2sJRcp0Z8eVSiCbtSpY0kJhiDb7NcVXdUqOPFkiUPpKCJG
	5RoKpzfAVO4RTeE3y5cfEmjT27sg3zk1xLmeQNzGSwtgr6/rSt9x9Hflu4Uw6AWBwYOMH0isIuK
	xZXx82f5PKQ3/2j42CET1qDXAIKxaomKkOxWmIrnrbEU34eMrAz/hG5+Wt1jQV6VE+uVFz9gTEO
	ceQSeGfCN8wvS4wsPZlOk5L3xT6G4+mWhAjI6ZSH4+tTsnWgvw==
X-Google-Smtp-Source: AGHT+IEUYFZNrsdoBu9U5AaRxy5MzwXwaogQzUPTbhbWWhPV5KnvDvLgE5mA51vO+gw/Qo1bAicorQ==
X-Received: by 2002:a05:690c:8d02:b0:6fd:33a1:f4b with SMTP id 00721157ae682-7020fd4fc2fmr15745077b3.4.1742929221359;
        Tue, 25 Mar 2025 12:00:21 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-700ba76bd01sm21551277b3.40.2025.03.25.12.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 12:00:20 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH] Use https:// in HOMEPAGE variable instead of http://
Date: Tue, 25 Mar 2025 14:59:59 -0400
Message-ID: <20250325185959.20242-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 19:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116282

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb | 2 +-
 meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-cerberus_1.3.7.bb   | 2 +-
 .../recipes-devtools/python/python3-contextlib2_21.6.0.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-django.inc          | 2 +-
 meta-python/recipes-devtools/python/python3-dnspython_2.7.0.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-eventlet_0.39.1.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-gevent_24.11.1.bb   | 2 +-
 .../recipes-devtools/python/python3-grpcio-channelz_1.71.0.bb   | 2 +-
 .../recipes-devtools/python/python3-grpcio-reflection_1.71.0.bb | 2 +-
 .../recipes-devtools/python/python3-grpcio-tools_1.71.0.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-grpcio_1.71.0.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-humanize_4.12.1.bb  | 2 +-
 .../recipes-devtools/python/python3-ipython-genutils_0.2.0.bb   | 2 +-
 .../recipes-devtools/python/python3-itsdangerous_2.2.0.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-libusb1_3.3.0.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb | 2 +-
 meta-python/recipes-devtools/python/python3-openpyxl_3.1.5.bb   | 2 +-
 .../recipes-devtools/python/python3-ordered-set_4.1.0.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-progress_1.6.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb | 2 +-
 meta-python/recipes-devtools/python/python3-py_1.11.0.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-pymongo_4.11.3.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-redis_5.2.1.bb      | 2 +-
 .../recipes-devtools/python/python3-requests-file_2.1.0.bb      | 2 +-
 .../recipes-devtools/python/python3-requests-ftp_0.3.1.bb       | 2 +-
 .../recipes-devtools/python/python3-robotframework_7.2.2.bb     | 2 +-
 .../recipes-devtools/python/python3-simplejson_3.20.1.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-spidev_3.6.bb       | 2 +-
 .../recipes-devtools/python/python3-sqlalchemy_2.0.39.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-tox_4.24.2.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb       | 2 +-
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb     | 2 +-
 .../recipes-extended/python-blivet/python3-blivet_3.9.2.bb      | 2 +-
 .../recipes-extended/python-pyephem/python3-pyephem_4.2.bb      | 2 +-
 .../python-pykickstart/python3-pykickstart_3.48.bb              | 2 +-
 meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb     | 2 +-
 meta-python/recipes-networking/python/python3-ldap_3.4.4.bb     | 2 +-
 57 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
index b2b4695d23..cf2b7fa15e 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Telepathy IM framework - Python package"
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
+HOMEPAGE = "https://telepathy.freedesktop.org/wiki/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/utils.py;beginline=1;endline=17;md5=9a07d1a9791a7429a14e7b25c6c86822"
diff --git a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
index 6b740e6f8b..a3185a9c66 100644
--- a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Draws ASCII trees."
-HOMEPAGE = "http://github.com/mbr/asciitree"
+HOMEPAGE = "https://github.com/mbr/asciitree"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a985ccb0df374f2a8cab75010bf8db73"
 
diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.7.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.7.bb
index 83a06c6f57..7ace68bbdf 100644
--- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Lightweight, extensible schema and data validation tool for Python dictionaries."
-HOMEPAGE = "http://docs.python-cerberus.org/"
+HOMEPAGE = "https://docs.python-cerberus.org/"
 SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb"
diff --git a/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb b/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
index 5a54c696f4..9d32cbba2c 100644
--- a/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Backports and enhancements for the contextlib module"
-HOMEPAGE = "http://contextlib2.readthedocs.org/"
+HOMEPAGE = "https://contextlib2.readthedocs.org/"
 SECTION = "devel/python"
 LICENSE = "PSF-2.0 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d2b6be100f1002194122ec9bfee7b8b4"
diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
index d7d4b22fbd..ab24870a2a 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Convex optimization package"
-HOMEPAGE = "http://cvxopt.org"
+HOMEPAGE = "https://cvxopt.org"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=66ec4f8e53d3e733a8c26d5ca3830fba"
 
diff --git a/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb b/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
index 574083b61f..fd7507193e 100644
--- a/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cycler_0.12.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Composable style cycles"
-HOMEPAGE = "http://github.com/matplotlib/cycler"
+HOMEPAGE = "https://github.com/matplotlib/cycler"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7713fe42cd766b15c710e19392bfa811"
 
diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
index 09b06553df..440a62352d 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.6.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Disk Cache -- Disk and file backed persistent cache."
-HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
+HOMEPAGE = "https://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c60ef82f0f40155453f6d5f2c94b6e8e"
 
diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/meta-python/recipes-devtools/python/python3-django.inc
index 6ff9192cac..cde32be477 100644
--- a/meta-python/recipes-devtools/python/python3-django.inc
+++ b/meta-python/recipes-devtools/python/python3-django.inc
@@ -1,5 +1,5 @@
 SUMMARY = "A high-level Python Web framework"
-HOMEPAGE = "http://www.djangoproject.com/"
+HOMEPAGE = "https://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.7.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.7.0.bb
index e9ca31c3ac..9c1d4b39f2 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.7.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "DNS toolkit for Python"
-HOMEPAGE = "http://www.dnspython.org/"
+HOMEPAGE = "https://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.39.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.39.1.bb
index 08080ec2ad..6286727ebe 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.39.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.39.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Highly concurrent networking library"
-HOMEPAGE = "http://pypi.python.org/pypi/eventlet"
+HOMEPAGE = "https://pypi.python.org/pypi/eventlet"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
diff --git a/meta-python/recipes-devtools/python/python3-gevent_24.11.1.bb b/meta-python/recipes-devtools/python/python3-gevent_24.11.1.bb
index 1a96892fb5..1b88ba6fe8 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_24.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_24.11.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A coroutine-based Python networking library"
 DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
 a high-level synchronous API on top of the libevent event loop."
-HOMEPAGE = "http://www.gevent.org"
+HOMEPAGE = "https://www.gevent.org"
 LICENSE = "MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65"
 DEPENDS += "python3-greenlet-native python3-greenlet libev libuv python3-cffi-native"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.71.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.71.0.bb
index a103867ab0..d1c694b4cb 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.71.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.71.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Google gRPC channelz"
-HOMEPAGE = "http://www.grpc.io/"
+HOMEPAGE = "https://www.grpc.io/"
 SECTION = "devel/python"
 
 LICENSE = "Apache-2.0"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.71.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.71.0.bb
index 308e1e0430..5453cd204e 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.71.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.71.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Google gRPC reflection"
-HOMEPAGE = "http://www.grpc.io/"
+HOMEPAGE = "https://www.grpc.io/"
 SECTION = "devel/python"
 
 LICENSE = "Apache-2.0"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.71.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.71.0.bb
index 7448ff55b2..59fd54cba1 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.71.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.71.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Google gRPC tools"
-HOMEPAGE = "http://www.grpc.io/"
+HOMEPAGE = "https://www.grpc.io/"
 SECTION = "devel/python"
 
 LICENSE = "Apache-2.0"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.71.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.71.0.bb
index da677dc1ab..793fcf0ced 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.71.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.71.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Google gRPC"
-HOMEPAGE = "http://www.grpc.io/"
+HOMEPAGE = "https://www.grpc.io/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0 & MIT & BSD-2-Clause"
 LIC_FILES_CHKSUM = " \
diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.12.1.bb b/meta-python/recipes-devtools/python/python3-humanize_4.12.1.bb
index 334f788747..ef2a5dabcd 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.12.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Python humanize utilities"
-HOMEPAGE = "http://github.com/jmoiron/humanize"
+HOMEPAGE = "https://github.com/jmoiron/humanize"
 SECTION = "devel/python"
 
 LICENSE = "MIT"
diff --git a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
index 0ce04829b6..b26a9ebd53 100644
--- a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Vestigial utilities from IPython"
-HOMEPAGE = "http://ipython.org"
+HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f7c3032c3ac398265224533a0a333a35"
 
diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_2.2.0.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_2.2.0.bb
index f4d8d52967..fc43e2854d 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_2.2.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Various helpers to pass trusted data to untrusted environments and back."
-HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
+HOMEPAGE = "https://github.com/mitsuhiko/itsdangerous"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4cda9a0ebd516714f360b0e9418cfb37"
 
diff --git a/meta-python/recipes-devtools/python/python3-libusb1_3.3.0.bb b/meta-python/recipes-devtools/python/python3-libusb1_3.3.0.bb
index 8bce352f10..78480cfa81 100644
--- a/meta-python/recipes-devtools/python/python3-libusb1_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-libusb1_3.3.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Pure-python wrapper for libusb-1.0"
-HOMEPAGE = "http://github.com/vpelletier/python-libusb1"
+HOMEPAGE = "https://github.com/vpelletier/python-libusb1"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
diff --git a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
index 8cd60d3a0f..f52f0f8970 100644
--- a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
+++ b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "AGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788"
 
-HOMEPAGE = "http://lrparsing.sourceforge.net/"
+HOMEPAGE = "https://lrparsing.sourceforge.net/"
 BUGTRACKER = "https://sourceforge.net/p/lrparsing/tickets/"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lrparsing/files/"
 UPSTREAM_CHECK_REGEX = "lrparsing-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.5.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.5.bb
index 990d3cf33e..fc0910770f 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.5.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "It was born from lack of existing library to read/write natively
 from Python the Office Open XML format. All kudos to the PHPExcel team as openpyxl \
 was initially based on PHPExcel."
 
-HOMEPAGE = "http://www.python-excel.org/"
+HOMEPAGE = "https://www.python-excel.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
index 2d6b6ca06c..1644dc62d5 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A MutableSet that remembers its order, so that every entry has an index."
-HOMEPAGE = "http://github.com/LuminosoInsight/ordered-set"
+HOMEPAGE = "https://github.com/LuminosoInsight/ordered-set"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=3bf5e1ad64c0d99032c3143361fa234e"
 
diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
index ad9482e7dd..b956f5ca2f 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
@@ -2,7 +2,7 @@ SUMMARY  = "pandas library for high-performance data analysis tools"
 DESCRIPTION = "pandas is an open source, BSD-licensed library providing \
 high-performance, easy-to-use data structures and data analysis tools for \
 the Python programming language."
-HOMEPAGE = "http://pandas.pydata.org/"
+HOMEPAGE = "https://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cb819092901ddb13a7d0a4f5e05f098a"
 
diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb b/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb
index c2764b27d2..876d89443a 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux."
-HOMEPAGE = "http://pythonhosted.org/python-periphery/"
+HOMEPAGE = "https://pythonhosted.org/python-periphery/"
 LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=30fe6f023a80fb33989fb3b9d773fea0"
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
index 8305c1ed6d..267474c8fe 100644
--- a/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pexpect_4.9.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A Pure Python Expect like Module for Python"
-HOMEPAGE = "http://pexpect.readthedocs.org/"
+HOMEPAGE = "https://pexpect.readthedocs.org/"
 SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
index 9ff4d1318d..8f65d3d4c5 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Python module to interface with the pkg-config command line too"
-HOMEPAGE = "http://github.com/matze/pkgconfig"
+HOMEPAGE = "https://github.com/matze/pkgconfig"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc"
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
index 8fcf83b06a..c29996de53 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "POSIX IPC primitives (semaphores, shared memory and message queues) for Python"
-HOMEPAGE = "http://semanchuk.com/philip/posix_ipc/"
+HOMEPAGE = "https://semanchuk.com/philip/posix_ipc/"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=513d94a7390d4d72f3475e2d45c739b5"
diff --git a/meta-python/recipes-devtools/python/python3-progress_1.6.bb b/meta-python/recipes-devtools/python/python3-progress_1.6.bb
index 59d1f90e98..4a0b0c714e 100644
--- a/meta-python/recipes-devtools/python/python3-progress_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-progress_1.6.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Easy progress reporting for Python"
-HOMEPAGE = "http://github.com/verigak/progress/"
+HOMEPAGE = "https://github.com/verigak/progress/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00ab78a4113b09aacf63d762a7bb9644"
 
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
index e63c2c50b7..f16fddf36f 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Run a subprocess in a pseudo terminal"
-HOMEPAGE = "http://ptyprocess.readthedocs.io/en/latest/"
+HOMEPAGE = "https://ptyprocess.readthedocs.io/en/latest/"
 SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
diff --git a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
index 31d5a377a7..e0ef71df83 100644
--- a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities"
-HOMEPAGE = "http://py.readthedocs.io/"
+HOMEPAGE = "https://py.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
diff --git a/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
index 61e2b205c2..0b8dde4b0e 100644
--- a/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Pure-Python Java Keystore (JKS) library"
 DESCRIPTION = "PyJKS enables Python projects to load and manipulate\
  Java KeyStore (JKS) data without a JVM dependency. PyJKS supports JKS,\
  JCEKS, BKS and UBER (BouncyCastle) keystores."
-HOMEPAGE = "http://github.com/kurtbrose/pyjks"
+HOMEPAGE = "https://github.com/kurtbrose/pyjks"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9694d6cc724caf7f7386be88a4a81958"
 
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
index 12b76ec3c1..d23347878e 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "JSON Web Token implementation in Python"
 DESCRIPTION = "A Python implementation of JSON Web Token draft 32.\
  Original implementation was written by https://github.com/progrium"
-HOMEPAGE = "http://github.com/jpadilla/pyjwt"
+HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
index f70049c898..073e0cdb1c 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Pylint is a Python source code analyzer"
-HOMEPAGE = "http://www.pylint.org/"
+HOMEPAGE = "https://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.11.3.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.11.3.bb
index e36f009869..61614b29b5 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.11.3.bb
@@ -4,7 +4,7 @@ The PyMongo distribution contains tools for interacting with MongoDB \
 database from Python. The bson package is an implementation of the BSON \
 format for Python. The pymongo package is a native Python driver for \
 MongoDB. The gridfs package is a gridfs implementation on top of pymongo."
-HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
+HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
index b1abac17aa..51e9cca01d 100644
--- a/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linux network configuration library for Python"
 DESCRIPTION = "This library contains Python bindings to ioctl calls"
 SECTION = "devel/python"
-HOMEPAGE = "http://github.com/rlisagor/pynetlinux"
+HOMEPAGE = "https://github.com/rlisagor/pynetlinux"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=74e1861736ee959824fe7542323c12e9"
 
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
index 6183783910..39b754dd5d 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "PyZMQ: Python bindings for ZMQ"
 DESCRIPTION = "This package contains Python bindings for ZeroMQ. ZMQ is a lightweight and fast messaging implementation."
-HOMEPAGE = "http://zeromq.org/bindings:python"
+HOMEPAGE = "https://zeromq.org/bindings:python"
 LICENSE = "BSD-3-Clause & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "\
     file://LICENSE.BSD;md5=1787206f198344195a671b60326c59dc \
diff --git a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb b/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
index 8e762580f6..702e9d9db5 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Python client for Redis key-value store"
 DESCRIPTION = "The Python interface to the Redis key-value store."
-HOMEPAGE = "http://github.com/andymccurdy/redis-py"
+HOMEPAGE = "https://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 
diff --git a/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb b/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
index 6e20a10f42..d111c3c9da 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "File transport adapter for Requests"
-HOMEPAGE = "http://github.com/dashea/requests-file"
+HOMEPAGE = "https://github.com/dashea/requests-file"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b"
 
diff --git a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
index 7e72391783..db7c5fee0b 100644
--- a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "FTP Transport Adapter for Requests"
-HOMEPAGE = "http://github.com/Lukasa/requests-ftp"
+HOMEPAGE = "https://github.com/Lukasa/requests-ftp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6683a23c9968b97709441dc884d46df6"
 
diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.2.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.2.2.bb
index 670928548b..cf456ac2e6 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.2.2.bb
@@ -5,7 +5,7 @@ tabular test data syntax and it utilizes the keyword-driven testing approach.\
 Its testing capabilities can be extended by test libraries implemented either\
 with Python or Java, and users can create new higher-level keywords from\
 existing ones using the same syntax that is used for creating test cases."
-HOMEPAGE = "http://robotframework.org"
+HOMEPAGE = "https://robotframework.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb
index 188dfd6efd..82f83f1b58 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.20.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Simple, fast, extensible JSON encoder/decoder for Python"
-HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
+HOMEPAGE = "https://cheeseshop.python.org/pypi/simplejson"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
index 6077ec2524..4c2d94630c 100644
--- a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
@@ -4,7 +4,7 @@ devices from user space via the spidev linux kernel driver.\
 This is a modified version of the code originally found\
 [here](http://elk.informatik.fh-augsburg.de/da/da-49/trees/pyap7k/lang/py-spi)\
 All code is GPLv2 licensed unless explicitly stated otherwise."
-HOMEPAGE = "http://github.com/doceme/py-spidev"
+HOMEPAGE = "https://github.com/doceme/py-spidev"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2077511c543a7c85245a516c47f4de78"
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.39.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.39.bb
index fd6853939e..4668a9da05 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.39.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.39.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
-HOMEPAGE = "http://www.sqlalchemy.org/"
+HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=061025f14213ac2818ff353223d6eca6"
 
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
index 0282c1848d..e3e0e67c15 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Non-validating SQL parser module"
-HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
+HOMEPAGE = "https://pypi.python.org/pypi/sqlparse"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
index 751f32913a..b223a11381 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
@@ -2,7 +2,7 @@ SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web
 DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
 By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
 polling, WebSockets, and other applications that require a long-lived connection to each user."
-HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
+HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
diff --git a/meta-python/recipes-devtools/python/python3-tox_4.24.2.bb b/meta-python/recipes-devtools/python/python3-tox_4.24.2.bb
index 5c3f2dcaa3..2b7d8d896d 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.24.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.24.2.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2023 iris-GmbH infrared & intelligent sensors
 
 SUMMARY = "Automate and standardize testing in Python. It is part of a larger vision of easing the packaging, testing and release process of Python software (alongside pytest and devpi)."
-HOMEPAGE = "http://tox.readthedocs.org/"
+HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb
index 24618e0b3f..b04cbd4b9a 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Fast, Extensible Progress Meter"
-HOMEPAGE = "http://tqdm.github.io/"
+HOMEPAGE = "https://tqdm.github.io/"
 SECTION = "devel/python"
 
 LICENSE = "MIT & MPL-2.0"
diff --git a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
index a8ad4bbdfb..48f3799227 100644
--- a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Bindings for the Twofish implementation by Niels Ferguson"
 DESCRIPTION = "Bindings for the Twofish implementation by Niels Ferguson\
  libtwofish-dev."
-HOMEPAGE = "http://github.com/keybase/python-twofish"
+HOMEPAGE = "https://github.com/keybase/python-twofish"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=33a63abf6d7567b1689d8ce69f00e43b"
 
diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
index c1e931e07e..afe74947f5 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Unified diff parsing/metadata extraction library"
-HOMEPAGE = "http://github.com/matiasb/python-unidiff"
+HOMEPAGE = "https://github.com/matiasb/python-unidiff"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
 
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
index 2da6c88bc8..ace11be8e5 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A Python module for decorators, wrappers and monkey patching."
-HOMEPAGE = "http://wrapt.readthedocs.org/"
+HOMEPAGE = "https://wrapt.readthedocs.org/"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dc34cbad60bc961452eb7ade801d25f7"
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
index 5c572c615b..f8b7c9b5ff 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Library for developers to extract data from Microsoft Excel (tm) spre
 DESCRIPTION = "Extract data from Excel spreadsheets (.xls and .xlsx,\
  versions 2.0 onwards) on any platform. Pure Python (2.6, 2.7, 3.2+). \
 Strong support for Excel dates. Unicode-aware."
-HOMEPAGE = "http://www.python-excel.org/"
+HOMEPAGE = "https://www.python-excel.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00ea1e843a43c20d9b63a8112239b0d1"
 
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
index 6f2adb914d..bed660ced4 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.2.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Python3 interface to the wxWidgets Cross-platform C++ GUI toolkit."
-HOMEPAGE = "http://www.wxpython.org"
+HOMEPAGE = "https://www.wxpython.org"
 
 LICENSE = "LGPL-2.0-only & WXwindows & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=102f37a0d23aa258e59e4cc8b5380b35"
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.2.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.2.bb
index f0ce981480..c22df46564 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.2.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.9.2.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "A python module for system storage configuration"
-HOMEPAGE = "http://fedoraproject.org/wiki/blivet"
+HOMEPAGE = "https://fedoraproject.org/wiki/blivet"
 LICENSE = "LGPL-2.0-or-later"
 SECTION = "devel/python"
 
diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.bb
index 428876e4af..0817bc732a 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "PyEphem astronomical calculations"
-HOMEPAGE = "http://rhodesmill.org/pyephem/"
+HOMEPAGE = "https://rhodesmill.org/pyephem/"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9c930b395b435b00bb13ec83b0c99f40"
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
index 0013762f0a..df66a8ebf7 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "A python library for manipulating kickstart files"
-HOMEPAGE = "http://fedoraproject.org/wiki/pykickstart"
+HOMEPAGE = "https://fedoraproject.org/wiki/pykickstart"
 LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb
index ead376827c..59c9914bc2 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb
@@ -12,7 +12,7 @@ at http://www.dmtf.org/standards/wbem. \
 \
 It also provides a Python provider interface, and is the fastest and easiest \
 way to write providers on the planet."
-HOMEPAGE = "http://pywbem.github.io"
+HOMEPAGE = "https://pywbem.github.io"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
index 6caf5f37ce..aecffa9d7e 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "This module provides access to the LDAP \
 (Lightweight Directory Access Protocol) through Python operations \
 instead of C API. The module mainly acts as a wrapper for the \
 OpenLDAP 2.x libraries. Errors will appear as exceptions."
-HOMEPAGE = "http://www.python-ldap.org/"
+HOMEPAGE = "https://www.python-ldap.org/"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
 
-- 
2.43.0


