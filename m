Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BA8ECD997
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 19:06:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28701.1770318363475241950
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 11:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PLyPBtgN;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee07570deso11665115e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 11:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770318362; x=1770923162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJGpU534I8R6yuO7NumVDbZ4I8LAHVRbV45ADhgdXxc=;
        b=PLyPBtgNohK7UYRlBZMdATklf7IeYiajHpjTgRrvDzvIh+8he59950MM/miqpfSDSA
         aKPc1safO/GMLIebhfnz8tkYHDNra9dVU29fUjDyiSmMbUIFb4lyWYGIjeZEf/Tcvdig
         MFoME2/XMKYqtOh5aMKgmpQDh/zQTJnrBR5CjBEoVHZKG1/Ef/ZXKMxD7inGAJnqyMX/
         hKsuqDSbYMK6pOfefGr+nhP4u4MdS94VNR2z6AVZP8LhfyLsGscO7UqVI7cghqyRwphK
         s7FbZeYwDUjVWM5HC1Jwei1tjG4ZtlskEaiY2qEULF1QlJdsrO0euZH7ITVx1TqJepUl
         Btlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770318362; x=1770923162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJGpU534I8R6yuO7NumVDbZ4I8LAHVRbV45ADhgdXxc=;
        b=B2oZa6rVXtSF/onsAq0ZCThFmGoatNNN9+F2SjzJgOa4SRSYBOE2xPseoKeMkvlx0L
         LQN8b5Hj+SEseToLRqYLYClD9ZznrnA1jygbUCGlyf+7MnBCYDI5KqqoLpFyBTaQScvC
         dbJgGBkkOIooBiUTV5zh2G9rSP7jpo+ukzYBIuNjeaqYWmkgBvrCSzs1JOmb+/btlPl3
         eP4Pb7gbD2Mk6aWxf76kOp7qcj/17quov/ARoMlzbHLPIszqoeRRlPMEa82sQqpfu2Rb
         yGv2+tQ2BIgjWQBBVJ8epj4tw7gIy4aFDxfhDI4JsZbFOJi1beUXRNyxK8sNMmaUSmCy
         lubw==
X-Gm-Message-State: AOJu0YxFDIKuO/E+KYHbjyDj17bE/yYIwROKjCqDiafZyzgSWjGi23Me
	0nbuqvbBpbX2a90/cXiQFZk+MCsk6WaZWi3INVYMbwa/1F3kbC7kDUu40LYMNw==
X-Gm-Gg: AZuq6aKrDNmmaOi5Ran5U+4LVI53kuJLXuRsQr52DSUU5Hn9OzLum5qU8cZcwGDbfgA
	l0v4ElZ6c6Ft1lXlHSBAbDd+nCaQ/XYP1zH0moDumc0sQATR2n8fLaW3bbR04WPWF4996wc8D83
	fCFez19yLcd0hXohVmkQPrejABcQl52JVfhQzc3bkWukBkqyKcKXGPrwsRhrsd/JCMqFXemlykC
	2Y0R30UzBSTKKLiDkfXdjB4dfpGMjpODFYDgtQVc1ujr4bQj6txTkzSa5afqPzrEpYXxdP72JCQ
	+/oAcl+OWygxJ79NrUFn0ljrM69L684Cj1q7fegKidAZg0/xNpNHG461ZxjkI/zGGL4wTxlnjzW
	bTkJrCKe1XAYI97Rm8Dbg8Slwijh3ghCSN8dhG+SakPndwCjqjnyisjdvKN9mz+RKgSxo9+v/f/
	GWK233zimM
X-Received: by 2002:a05:600c:5253:b0:480:6941:d38b with SMTP id 5b1f17b1804b1-4832021cdcamr5731905e9.30.1770318361490;
        Thu, 05 Feb 2026 11:06:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629756ff1sm205402f8f.43.2026.02.05.11.06.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 11:06:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pax-utils: upgrade 1.3.3 -> 1.3.10
Date: Thu,  5 Feb 2026 20:06:00 +0100
Message-ID: <20260205190600.3184342-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 19:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124219

Update the SRC_URI also, the previous one became inaccessible
a while ago. This is an official mirror[1].

Since the last update the project switched to meson build system.

Changes:
https://github.com/gentoo/pax-utils/compare/v1.3.3...v1.3.10

[1]: https://packages.gentoo.org/packages/app-misc/pax-utils

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../pax-utils/pax-utils_1.3.10.bb             | 30 ++++++++++++++++
 .../pax-utils/pax-utils_1.3.3.bb              | 35 -------------------
 2 files changed, 30 insertions(+), 35 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.10.bb
 delete mode 100644 meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb

diff --git a/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.10.bb b/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.10.bb
new file mode 100644
index 0000000000..08dfcb7545
--- /dev/null
+++ b/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.10.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Security-focused ELF files checking tool"
+DESCRIPTION = "This is a small set of various PaX aware and related \
+utilities for ELF binaries. It can check ELF binary files and running \
+processes for issues that might be relevant when using ELF binaries \
+along with PaX, such as non-PIC code or executable stack and heap."
+HOMEPAGE = "https://wiki.gentoo.org/wiki/Hardened/PaX_Utilities"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
+
+SRC_URI = "git://github.com/gentoo/pax-utils;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "d279ca563775105859f1f8c8467b8244d758cc62"
+
+RDEPENDS:${PN} += "bash"
+
+BBCLASSEXTEND = "native"
+
+inherit meson pkgconfig
+
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[libcap] = "-Duse_libcap=enabled, -Duse_libcap=disabled, libcap"
+PACKAGECONFIG[libseccomp] = "-Duse_seccomp=true, -Duse_seccomp=false, libseccomp"
+PACKAGECONFIG[pyelftools] = "-Dlddtree_implementation=python, -Dlddtree_implementation=sh,, python3-pyelftools"
+
+do_install:append(){
+    if ${@bb.utils.contains('PACKAGECONFIG', 'pyelftools', 'true', 'false', d)}; then
+        sed -i 's,#!/usr/bin/env python,#!/usr/bin/env python3,' ${D}${bindir}/lddtree
+    fi
+}
+
diff --git a/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb b/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb
deleted file mode 100644
index 4e80ca87ee..0000000000
--- a/meta-oe/recipes-devtools/pax-utils/pax-utils_1.3.3.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Security-focused ELF files checking tool"
-DESCRIPTION = "This is a small set of various PaX aware and related \
-utilities for ELF binaries. It can check ELF binary files and running \
-processes for issues that might be relevant when using ELF binaries \
-along with PaX, such as non-PIC code or executable stack and heap."
-HOMEPAGE = "http://www.gentoo.org/proj/en/hardened/pax-utils.xml"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
-
-SRC_URI = "https://dev.gentoo.org/~vapier/dist/pax-utils-${PV}.tar.xz"
-SRC_URI[sha256sum] = "eeca7fbd98bc66bead4a77000c2025d9f17ea8201b84245882406ce00b9b6b14"
-
-RDEPENDS:${PN} += "bash"
-
-export GNULIB_OVERRIDES_WINT_T = "0"
-
-do_configure:prepend() {
-    touch ${S}/NEWS ${S}/AUTHORS ${S}/ChangeLog ${S}/README
-}
-
-do_install() {
-    oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
-}
-
-BBCLASSEXTEND = "native"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG ??= ""
-
-PACKAGECONFIG[libcap] = "--with-caps, --without-caps, libcap"
-PACKAGECONFIG[libseccomp] = "--with-seccomp, --without-seccomp, libseccomp"
-PACKAGECONFIG[pyelftools] = "--with-python, --without-python,, python3-pyelftools"
-
-EXTRA_OECONF += "--enable-largefile"

