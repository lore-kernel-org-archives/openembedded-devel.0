Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A6ECC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:42:56 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32790.1792042973579838092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XxptVoL1;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e812e2b31bso27727015ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042973; x=1792647773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6XFErGIZX9Fhi/AwL31IjD2jBf3aVWUSf4PZDRq5+Aw=;
        b=XxptVoL1DGRzn0jO1IYjea4e9pO4q3VcHuQO7P0RVdrMvQvQ2UBo0oQW+Xzy8j+lXW
         0QZBemYEalfbMeEcSePEPIIADLh15id4PyoejMKe6p/aY8rrsU+MKP69HcPlB/vtIAT5
         yiaaIODTlOAZA61Thz3ZZudu3qsP9Pb1lquVyR8CuSpjXX/6xjp91k8+IBxNrz4KQAFo
         yhTbBI+1bSuTST5wsuv9JTIH1sEl3Fbe/Y5kIR0Dp7zPGn8DKDJoSneB3KC397tokm1W
         xZXhpKK1dtO6orABHSPFSjmpG+iMWLxm24qLYEmmWzJrnMsYbdU2W9cYVGy1Qjt7RE/m
         xYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042973; x=1792647773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6XFErGIZX9Fhi/AwL31IjD2jBf3aVWUSf4PZDRq5+Aw=;
        b=sDjs5dM/BXJU5lRmxwA26QrMtfI4L4e3wiBvk17OJTje6eGYS6nWqx4W78GIZ449uZ
         qD3iYXf36dLGFrBRd2Ob6J0pUns8CG5qOqlri5DnxI3VkXincjFzdJ95deBV/vbtrGCF
         UK+/4gmRpt3UA2URF2/CqwlCgBh2upGI7kxg3diGXYZ+tG7T0khS+ZVBivkEEn2KQb2b
         mVSse3oH13/Ui8Ty/ub/91Hj2N9aPm0ohi+mUFeF2ZqHTrZV7cPJoV24Bes+82KB93sz
         u5OJT5wLj3xlGlfmqc6oiV0cY1OMohDrqDWiFg19uELZ+JURn8kFF1WHDKwCIuuKIHtM
         M97Q==
X-Gm-Message-State: AFq9FYJrQ0AYqy3n608GlAShCCMBK9UTZfeXghx621CXJPsZuBwVV3De
	+zIUQouSDd9GLa6kwhtUxzA4loJ6SpdL0dW2ScVCA0ZSEgv1LJIma+x/rV0jQA==
X-Gm-Gg: AYBFou0asZwGRLU5HT+P82Vpo/R97wvEZsDefTXqU+0Ls7bOJQ0qCxPDxDKZkK0X8Ko
	s62BvxkNs7jt+QiCmORTWAdDf3Tip6VOCAwd60Td6wdYh+0EKZUnn8yJyJ5vgwf9dZDe8H1LFmx
	QyFsovjpwDgsDUI/AbuekXL7PfXftjN9GocAiT5EFQGqFy4BuPpp2WLcBc/pgWjHj7+AOTfhYd3
	k/TgggXY+5j3k4hN23N4NVg3mJPt44nYvN2XLc+ZmnHVIoui7VkzLFx+UL3KgfTyuHx7zTOoHyF
	cwJ7VSleb5fDS9R+DmptsR2ASFJ4CZb/z48Dwp9QMBB3BffglKKfgwPG6D12JFEJXG7GGj54XV3
	Lhym8SUnMgt8b1sqex9oHjea0/E+Z8yDgqcolva0R+5zXWm244Z7GILnPB3+Q+p+f2XYCft03g3
	BdS5AM7X3jPfx7twStD6pRZyTAsE9ffKKHGzX97TE+R3oliAJObpIJQ6/RxV/UyWJzoLPkxz5YP
	pyBu4xq6AyLmzZoH7Ss5LQ=
X-Received: by 2002:a17:902:ef4f:b0:2e5:c563:c0dc with SMTP id d9443c01a7336-2e842cdb0f8mr162708665ad.42.1792042972792;
        Wed, 14 Oct 2026 22:42:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.42.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:42:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/82] Revert "libpwquality: remove recipe (moved to oe-core)"
Date: Thu, 15 Oct 2026 18:40:50 +1300
Message-ID: <f74048a5707dd8253e2a4109407501d1b1798468.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130922

From: Markus Volk <f_l_k@t-online.de>

This reverts commit 50d5f23e07431865470d16aeaeb8e442f690186b.

The import into oe-core (3d295bef38 "libpwquality: import recipe from
meta-oe") is only in oe-core master, not in blacksail, so on blacksail
the recipe is missing and gnome-disk-utility, gnome-control-center,
cryptsetup and others fail with "Nothing PROVIDES 'libpwquality'".

AI-Generated: Uses Claude Code (Claude Opus 4.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 ...-Use-setuptools-instead-of-distutils.patch | 78 +++++++++++++++++++
 ...02-Makefile.am-respect-PYTHONSITEDIR.patch | 26 +++++++
 .../libpwquality/libpwquality_1.4.5.bb        | 39 ++++++++++
 4 files changed, 144 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead-of-distutils.patch
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch
 create mode 100644 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index cc3f7cf064..225cd95604 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -368,6 +368,7 @@ RDEPENDS:packagegroup-meta-oe-extended = "\
     liblognorm \
     libmodbus \
     libplist \
+    libpwquality \
     libqb \
     librelp \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "libreport", "", d)} \
diff --git a/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead-of-distutils.patch b/meta-oe/recipes-extended/libpwquality/files/0001-Use-setuptools-instead-of-distutils.patch
new file mode 100644
index 0000000000..7eaca66b5c
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
diff --git a/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch b/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch
new file mode 100644
index 0000000000..cd59a6d887
--- /dev/null
+++ b/meta-oe/recipes-extended/libpwquality/files/0002-Makefile.am-respect-PYTHONSITEDIR.patch
@@ -0,0 +1,26 @@
+From edc51ba1b446913232cdf2945f485392bca72dc7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 3 Aug 2015 13:43:14 +0800
+Subject: [PATCH] Makefile.am: respect ${PYTHONSITEDIR}
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/libpwquality/libpwquality/commit/5192eab011ada47b0157f8d0524bf5b18bba3bd0]
+
+ python/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 6e51744..0a3bad5 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -14,7 +14,7 @@ all-local:
+ 	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV)
+ 
+ install-exec-local:
+-	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=${prefix}
++	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=${prefix} --install-lib=$(pythonsitedir)
+ 
+ clean-local:
+ 	rm -rf py$(PYTHONREV)
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
new file mode 100644
index 0000000000..b7c673be52
--- /dev/null
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Library for password quality checking and generating random passwords"
+HOMEPAGE = "https://github.com/libpwquality/libpwquality"
+SECTION = "devel/lib"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bd2f1386df813a459a0c34fde676fc2"
+
+DEPENDS = "cracklib"
+
+SRC_URI = "git://github.com/libpwquality/libpwquality;branch=master;protocol=https \
+    file://0001-Use-setuptools-instead-of-distutils.patch \
+    file://0002-Makefile.am-respect-PYTHONSITEDIR.patch \
+"
+SRCREV = "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
+
+
+inherit autotools-brokensep gettext
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'setuptools3-base', '', d)}
+
+do_configure:prepend() {
+    cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
+}
+
+export PYTHON_DIR
+export BUILD_SYS
+export HOST_SYS
+
+EXTRA_OECONF += "--libdir=${libdir} \
+                 --with-securedir=${base_libdir}/security \
+"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} python3"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[python3] = "--enable-python-bindings --with-python-rev=${PYTHON_BASEVERSION} --with-python-binary=${STAGING_BINDIR_NATIVE}/python3-native/python3 --with-pythonsitedir=${PYTHON_SITEPACKAGES_DIR},--disable-python-bindings,python3-setuptools-native"
+
+FILES:${PN} += "${base_libdir}/security/pam_pwquality.so"
+FILES:${PN}-dbg += "${base_libdir}/security/.debug"
+FILES:${PN}-staticdev += "${base_libdir}/security/pam_pwquality.a"
+FILES:${PN}-dev += "${base_libdir}/security/pam_pwquality.la"

