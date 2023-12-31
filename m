Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93470C47258
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.218941.1704025420013025452
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNiQ7udr;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33677fb38a3so8183705f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025418; x=1704630218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yefNwaG9lIkB36dVsMrr/Vq0BNaZzPQvK6POGFI7MWs=;
        b=YNiQ7udr2nvTT9Z9gFajs/ekdYs4+7HFx8STWp2EhmqlzATVm6MdtaFfEvpBJp+jwc
         unPOdyT2uiTH2U3UCLk9P5xqotFV8QRl/tMONQIQ/OeFTeFCHjzhMtd6KqUTzdtuB39V
         k3uL8q2/i29HMy9M0J9VLWat03LIadfRVqFr6jgEX/3u+KWjgv+t+xOFqKLbHsvvze2C
         mA9P00KQNu88dp5b+0oYXBz8AUL97GquisgtUEO+MoQXzGRqRqaluSgrgHEiQwSTcf4V
         +slrhZSNBccb9HWlTxxCXK9BUz8uCYw/7Jm901tWbHeefvHgUQ/BJgVvlGa12unYqnVB
         cQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025418; x=1704630218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yefNwaG9lIkB36dVsMrr/Vq0BNaZzPQvK6POGFI7MWs=;
        b=SFFNqnAoRfQpsP6/VO6lEffS5HM2kdho62FbNYAn+IGFVC8h2N2KIRqUiWOHNpPo05
         I/sXbdct9nEygQuW/R83MDXeF7fsXoW6/5frLm4LIkwOMfu8mns+3tqN+jMsyY7hRDos
         KZ+a0H4obcQo6O0LnaqmsiH27p5PMau6/oGRIM5tnvSTR77StOwv4cWQRxuMn/on+FAv
         NzCJoGWqDqaF049PIr2388b+Neq7yOCbapINl13mZUZ5VwtWWyzXG9tleIKlLPj10sNF
         5ejj270Sidm6lYqqc7ngxGfy7D5tYyW91mF7Z1zBR3mSJVvFVb/QfVkldmEnOYSFUWuS
         8Aww==
X-Gm-Message-State: AOJu0Yz/hVcJ4TO5GZfSOldKbk8VTLG+MBDWn3nFbYcCej5yjaLKzXO0
	T25qHgq1FrHDWAaCwtt3++cG+hoVOL4=
X-Google-Smtp-Source: AGHT+IEiA/j2ftDptZv7POM6UPg3WyBK+3v4nIuqjlZcMLex2w4dIAo6ZeHvv139/7JguXul2HN4VA==
X-Received: by 2002:a5d:5486:0:b0:336:6e1b:9021 with SMTP id h6-20020a5d5486000000b003366e1b9021mr6786449wrv.106.1704025418444;
        Sun, 31 Dec 2023 04:23:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/23] libpwquality: backport a python 3.12 compatibility patch
Date: Sun, 31 Dec 2023 13:23:11 +0100
Message-Id: <20231231122329.405225-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107956

This also allows dropping a previous patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-Use-setuptools-instead-of-distutils.patch | 78 +++++++++++++++++++
 ...missing-python-include-dir-for-cross.patch | 43 ----------
 .../libpwquality/libpwquality_1.4.5.bb        |  6 +-
 3 files changed, 81 insertions(+), 46 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead-of-distutils.patch
 delete mode 100644 meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch

diff --git a/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead-of-distutils.patch b/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead-of-distutils.patch
new file mode 100644
index 000000000..7eaca66b5
--- /dev/null
+++ b/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead-of-distutils.patch
@@ -0,0 +1,78 @@
+From ad95b7684365dea8335c34527d4c1463c1668af0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Fri, 31 Mar 2023 14:52:19 +0200
+Subject: [PATCH] Use setuptools instead of distutils
+
+distutils is removed from Python 3.12+:
+https://peps.python.org/pep-0632/
+
+Upstream-Status: Backport [https://github.com/libpwquality/libpwquality/commit/7b5e0f0097faebdcc6a8b783237bbba7a983147a]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ libpwquality.spec.in | 11 ++---------
+ python/Makefile.am   |  2 +-
+ python/setup.py.in   |  6 +++---
+ 3 files changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/libpwquality.spec.in b/libpwquality.spec.in
+index 70a6f53..0809126 100644
+--- a/libpwquality.spec.in
++++ b/libpwquality.spec.in
+@@ -33,9 +33,11 @@ BuildRequires: gettext
+ BuildRequires: pam-devel
+ %if %{with python2}
+ BuildRequires: python2-devel
++BuildRequires: python2-setuptools
+ %endif
+ %if %{with python3}
+ BuildRequires: python3-devel
++BuildRequires: python3-setuptools
+ %endif
+ 
+ URL: https://github.com/libpwquality/libpwquality/
+@@ -103,15 +105,6 @@ cp -a . %{py3dir}
+ pushd %{py3dir}
+ %endif
+ %if %{with python3}
+-# setuptools >= 60 changes the environment to use its bundled copy of distutils
+-# by default, not the Python-bundled one. To run the Python's standard library
+-# distutils, the environment variable must be set.
+-# Although technically setuptools is not needed for this package, if it's
+-# pulled by another package, it changes the environment and consequently,
+-# the build fails. This was reported in:
+-# https://github.com/pypa/setuptools/issues/3143
+-export SETUPTOOLS_USE_DISTUTILS=stdlib
+-
+ %configure \
+ 	--with-securedir=%{_moduledir} \
+ 	--with-pythonsitedir=%{python3_sitearch} \
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 1d00c0c..6e51744 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -14,7 +14,7 @@ all-local:
+ 	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV)
+ 
+ install-exec-local:
+-	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --prefix=${DESTDIR}${prefix}
++	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=${prefix}
+ 
+ clean-local:
+ 	rm -rf py$(PYTHONREV)
+diff --git a/python/setup.py.in b/python/setup.py.in
+index a741b91..f934c50 100755
+--- a/python/setup.py.in
++++ b/python/setup.py.in
+@@ -6,9 +6,9 @@
+ 
+ import os
+ 
+-from distutils.core import setup, Extension
+-from distutils.command.build_ext import build_ext as _build_ext
+-from distutils.command.sdist import sdist as _sdist
++from setuptools import setup, Extension
++from setuptools.command.build_ext import build_ext as _build_ext
++from setuptools.command.sdist import sdist as _sdist
+ 
+ def genconstants(headerfile, outputfile):
+     hf = open(headerfile, 'r')
diff --git a/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch b/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
deleted file mode 100644
index 636b29407..000000000
--- a/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1ea09e09ab2387c326bb7170835361ece6e25477 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 3 Aug 2015 13:43:14 +0800
-Subject: [PATCH] setup.py.in: add missing python include dir for cross
- compiling
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- python/Makefile.am | 2 +-
- python/setup.py.in | 3 ++-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 1d00c0c..52816b2 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -14,7 +14,7 @@ all-local:
- 	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV)
- 
- install-exec-local:
--	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --prefix=${DESTDIR}${prefix}
-+	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --prefix=${DESTDIR}${prefix} --install-lib=${DESTDIR}/${PYTHONSITEDIR}
- 
- clean-local:
- 	rm -rf py$(PYTHONREV)
-diff --git a/python/setup.py.in b/python/setup.py.in
-index a741b91..6759a95 100755
---- a/python/setup.py.in
-+++ b/python/setup.py.in
-@@ -33,7 +33,7 @@ class sdist(_sdist):
- 
- pwqmodule = Extension('pwquality',
-             sources = ['pwquality.c'],
--            include_dirs = ['../src'],
-+            include_dirs = ['../src', os.path.join(os.environ['STAGING_INCDIR'], os.environ['PYTHON_DIR'])],
-             library_dirs = ['../src/.libs'],
-             libraries = ['pwquality'])
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
index 5287430c4..91afedcb6 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -5,11 +5,11 @@ SECTION = "devel/lib"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bd2f1386df813a459a0c34fde676fc2"
 
-DEPENDS = "cracklib"
+DEPENDS = "cracklib python3-setuptools-native"
 
 SRC_URI = "git://github.com/libpwquality/libpwquality;branch=master;protocol=https \
-           file://add-missing-python-include-dir-for-cross.patch \
-"
+           file://0001-Use-setuptools-instead-of-distutils.patch \
+           "
 SRCREV = "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


