Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85966C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:05 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69134.1782634324835071370
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=llKqIxrx;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bf132969bso3406686eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634324; x=1783239124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5g7nF4X3zCBxHkYmvucVrot0N37HzX3BpVS1Rgw8dw=;
        b=llKqIxrxXpqflojfG+70VIxXO49u4PZikzY0xgFWBoN4ayuGVPdeO78qTnAnKxD6i1
         Sh4aKgmHg7fQDccBjeeC99E0/1gl1t65DBpAJCeIkghgVwV5he/JNBwAbqL8WAEgttNG
         Uc4A7VXQMy79q7tIarCxWdbRtFz+uRimdUpQ6BZn3cWmULN5gbMPuhfZajqJBoyVF1Vh
         PYWlG1PKrEtfRmC3aEQEWAv1HAVn8ANdZuDSNcp3kRJBgFoYMMK0VBcfo0wm1O4RuUu0
         5Wr9X4fF9ksslhAxt2SmiMO3Is+VQXMKHhQtrXvVqFIQUVaFPwGT5eU9ge9qrcD+aSHL
         urJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634324; x=1783239124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5g7nF4X3zCBxHkYmvucVrot0N37HzX3BpVS1Rgw8dw=;
        b=hWQl65P39Pdcvi+NOysJJHHBO/W19AwiqONhRIYk5B1l0Ylh6mFUsZCSSMaMaj8BvX
         OgE7Mky7gJqWJmMC5jCKXzwwLeZaxyCl2CxW07gFW09eXuRzAYL1MFDZL+xRvROaF2cq
         e2xHzGBW53Bv6EZDNViXxhN48IHg85EF4eEJ5iPMvP7WSb+dPeUI1URk0/N4Z8Xd9YnB
         G6ng/7cCISPD6gM61dkrEqvangbh+xTbm80//dvFgCPJVNu+JMyTV/89Fx6WT8Ag2W9W
         28CGUovX6pmFUY1OBM1/irJR8J17NdhYowdwY+Ujyv2LbqTa/96UAm3Ac9olC7iQwoQy
         5cjA==
X-Gm-Message-State: AOJu0Yxo2Km1j2QUOMRHTR1My0V+mnKgSs1wN1F2fllWxCyzaRWlMP55
	tDKcL/72sNctXApFVGBZUMaE9BrTesYchquawY9HDhKPsIE6X7F5sHrnui0LbdL8c8GdKA==
X-Gm-Gg: AfdE7ckar5Jcj49EY7YLuO6Gl6lXTD/LTfb9GGM616+t5dZjBwp9V7vSMNhhR4aZjcv
	5pZOE639b3PhlWpYRvQ6X6J7Pm1m75zgefymEEJWQCwsnXeA1YOEwAocJu22scupuTmTWdgWHkx
	q1OakucNGnXrXe+JCb6ARhmPNMFO5tcbrBzfDz+rHWmViOyY2yGb2LyOTiYrSCSoP7nVCi8PmY4
	jw9IPrSziMgdJIq6EPmyKnuPgyUMyP2syGmICosQ2wW8sjuXMiy5+FjfpBrpz1oKvJ4vRt7wc4C
	drvfroEO33DNPiXHDwJZrzadKD05+6A3PzLOc0ZzGIZZYgyIey+jinmIzbRh74n9aVhMY1lHCyk
	EjXnBNOB8qv+2BnJdYT2iwvZZ8LC47lUwuAfE39I8/1YEOZ2yOBIChoaZ49uskhoKFqjL4dHDKN
	TWEXr4uG/PJnwOc733K8qKFLOf6yJhznFXYStRaxCUNeSMM81Ww3rSRKfrDKLl9kaSgR88RkwOM
	xDmkYmbUyFOOsi78K3wQfK/kfRM0N91ad+svEukvJPAqxZaryraHrkSOzFhyTvVYh0MEYvNSZt1
	FWOU0GeRLVdedZc69IuZz8WbsNnjLl/GkhzyzBO8
X-Received: by 2002:a05:7301:a88:b0:304:4f23:4466 with SMTP id 5a478bee46e88-30c84be5889mr12121145eec.15.1782634324060;
        Sun, 28 Jun 2026 01:12:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 042/128] mercurial: upgrade 6.6.3 -> 7.2.2
Date: Sun, 28 Jun 2026 01:09:53 -0700
Message-ID: <20260628081122.178348-42-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127852

Mercurial 7.x reworked its Makefile to install via pip. Use a
DESTDIR-aware setup.py install instead, add python3-setuptools-scm-native
and pin the version via SETUPTOOLS_SCM_PRETEND_VERSION, and fix the
PYTHON Makefile sed.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../mercurial/mercurial_6.6.3.bb              | 37 -------------
 .../mercurial/mercurial_7.2.2.bb              | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
 create mode 100644 meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
deleted file mode 100644
index 3fa692029e..0000000000
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "The Mercurial distributed SCM"
-HOMEPAGE = "http://mercurial.selenic.com/"
-SECTION = "console/utils"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS = "python3 python3-native python3-setuptools-native"
-RDEPENDS:${PN} = "python3 python3-modules"
-
-inherit python3native python3targetconfig
-
-SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "f75d6a4a75823a1b7d713a4967eca2f596f466e58fc6bc06d72642932fd7e307"
-
-S = "${UNPACKDIR}/mercurial-${PV}"
-
-BBCLASSEXTEND = "native"
-
-export LDSHARED = "${CCLD} -shared"
-
-EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
-    PREFIX=${prefix}"
-
-do_configure:append () {
-    sed -i -e 's:PYTHON?=python:PYTHON=python3:g' ${S}/Makefile
-}
-
-do_install () {
-    oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
-    sed -i -e 's:${STAGING_BINDIR_NATIVE}/python3-native/python3:${USRBINPATH}/env python3:g' ${D}${bindir}/hg
-}
-PACKAGES =+ "${PN}-python"
-
-FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}"
-FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
-
-CVE_PRODUCT = "mercurial-scm:mercurial mercurial:mercurial"
diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb b/meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb
new file mode 100644
index 0000000000..34a3eb9e51
--- /dev/null
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb
@@ -0,0 +1,53 @@
+SUMMARY = "The Mercurial distributed SCM"
+HOMEPAGE = "http://mercurial.selenic.com/"
+SECTION = "console/utils"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "python3 python3-native python3-setuptools-native python3-setuptools-scm-native"
+RDEPENDS:${PN} = "python3 python3-modules"
+
+inherit python3native python3targetconfig
+
+SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
+SRC_URI[sha256sum] = "f2ec8e7eeef0500591706d374555f0ceb118822068e75fa3b32be07dd2184f6c"
+
+S = "${UNPACKDIR}/mercurial-${PV}"
+
+BBCLASSEXTEND = "native"
+
+export LDSHARED = "${CCLD} -shared"
+
+# Mercurial's setup.py derives its version via setuptools-scm; the release
+# tarball is not a VCS checkout, so tell setuptools-scm the version explicitly.
+export SETUPTOOLS_SCM_PRETEND_VERSION = "${PV}"
+
+EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
+    PREFIX=${prefix}"
+
+do_configure:append () {
+    sed -i -e 's:^PYTHON?*=.*:PYTHON=python3:g' ${S}/Makefile
+}
+
+# Mercurial 7.x removed the "make build"/"make all" targets and reworked
+# "make install-bin" to use "pip install", which needs pip in the sysroot and
+# ignores DESTDIR. Drive setup.py directly instead (the legacy, DESTDIR-aware
+# path). python3targetconfig makes setup.py cross-compile the C extensions
+# with the target toolchain.
+do_compile () {
+    ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
+}
+
+do_install () {
+    ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
+        --skip-build --root=${D} --prefix=${prefix} \
+        --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+        --single-version-externally-managed
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/python3-native/python3:${USRBINPATH}/env python3:g' ${D}${bindir}/hg
+}
+PACKAGES =+ "${PN}-python"
+
+FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}"
+FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
+
+CVE_PRODUCT = "mercurial-scm:mercurial mercurial:mercurial"

