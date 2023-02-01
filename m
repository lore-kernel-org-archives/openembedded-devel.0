Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC8DC636D3
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 15:51:02 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.26875.1675266657841979489
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Feb 2023 07:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BfSuJ+lY;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so2628240wmq.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 07:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5K3zYUV7s7PmNJyadGkOi/NM+E+IX/HOs7/dmZkMWk=;
        b=BfSuJ+lYrW0PdrfV0M5IEO1fMrDwOXCBta34Gne8i1lua6WsBYsub2m6nY99aP4Cky
         7z+v96Y6z/JEHL5ZCrbHtqXDZB2mSBX7pRZbrCgz0vh/z/5AIWqsFjOQEHxNWxcKMDV5
         QW3ZMRWZmaCkg6LIhsktTAoK2AnzqVk09t5cTtgbIl0yu5FMNstsuK5q+AE99ROKlhiG
         l6iPnQje/0AyzdyOI6moa9Eho0toa4c+uxQk6Ej3DRFT7xCvVGecPFTsVhnWstc46qxv
         WU/hpjhnRavku2janUQ08lWKXLNF4g5/11sarveHyb5WJrG9MPYtE4xF5P/wDlCNTXho
         ZBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5K3zYUV7s7PmNJyadGkOi/NM+E+IX/HOs7/dmZkMWk=;
        b=wrIXeVPxyiMRx+mxYG3ma4LwQIkt5qe1Mu19BtGRLDMc3+BZAwrNO+cMQQ0WOD2dRZ
         5E7xcC9oneaPIykpzb5HxHOZbB7LE2tDajnDX7kS0eL4NCHg/fLXk3NEwkqxnb5OvtoY
         sj+RfqY6K6TXuES/1NJ8BL9+U5qSpxtjvZv89atRdqjpYEmr/3GtXvj/ADlAYq8G5lLT
         UFxxXfvOYdCa2c0B+Tnslr0zexa9jxCYJ7ZuvxlQ3VkAXhsaFmXwULryEWm4kLiY6bfx
         PgKt8tjLvAfUu3AFTp6V9hQIFhwRMhz4qFNyG21OweST6l35WluzEg19WzknlPSDIyic
         fqVw==
X-Gm-Message-State: AO0yUKVYYFDoUS5xLdy8LA5NoGllaMWTPnrUjXo80O7nYzQIMTojS5EP
	KNX/iqOfAEoDenC+i5Z9k7oS8yCCBa8=
X-Google-Smtp-Source: AK7set+OR1UBeo0K++IQVVzGku8ivnRM+qxxj4mM/MAsVZn/ELZOycsbOCgjJsOWZQWEy5tZFdkW4A==
X-Received: by 2002:a05:600c:a297:b0:3dc:42e7:f626 with SMTP id hu23-20020a05600ca29700b003dc42e7f626mr2546848wmb.26.1675266656140;
        Wed, 01 Feb 2023 07:50:56 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o21-20020a05600c379500b003dc4a47605fsm2099633wmr.8.2023.02.01.07.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:50:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] meta: remove True option to getVar calls (again)
Date: Wed,  1 Feb 2023 16:50:53 +0100
Message-Id: <20230201155053.555325-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 15:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100905

* True is default since 2016 and most layers were already updated
  not to pass this parameter where not necessary, e.g. oe-core was
  updated couple times, first in:
  https://git.openembedded.org/openembedded-core/commit/?id=7c552996597faaee2fbee185b250c0ee30ea3b5f

  Updated with the same regexp as later oe-core update:
  https://git.openembedded.org/openembedded-core/commit/?id=9f551d588693328e4d99d33be94f26684eafcaba

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb    |  2 +-
 .../suitesparse/suitesparse_5.10.1.bb                | 12 ++++++------
 meta-oe/recipes-kernel/spidev-test/spidev-test.bb    |  2 +-
 meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb    |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
index e96913e563..e39569bba1 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -114,7 +114,7 @@ python do_create_v8_qemu_wrapper () {
     on the host."""
     qemu_libdirs = [d.expand('${STAGING_DIR_HOST}${libdir}'),
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
-    qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST', True),
+    qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
                                     qemu_libdirs)
     wrapper_path = d.expand('${B}/v8-qemu-wrapper.sh')
     with open(wrapper_path, 'w') as wrapper_file:
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 56cbfce20e..13e6fd066c 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -19,14 +19,14 @@ RPROVIDES:${PN} = "mongoose graphblas"
 # the command line. To get around this problem, set these variables to only the
 # program name and prepend the rest of the value onto the corresponding FLAGS
 # variable.
-CFLAGS:prepend := "${@" ".join(d.getVar('CC', True).split()[1:])} "
-export CC := "${@d.getVar('CC', True).split()[0]}"
+CFLAGS:prepend := "${@" ".join(d.getVar('CC').split()[1:])} "
+export CC := "${@d.getVar('CC').split()[0]}"
 
-CXXFLAGS:prepend := "${@" ".join(d.getVar('CXX', True).split()[1:])} "
-export CXX := "${@d.getVar('CXX', True).split()[0]}"
+CXXFLAGS:prepend := "${@" ".join(d.getVar('CXX').split()[1:])} "
+export CXX := "${@d.getVar('CXX').split()[0]}"
 
-LDFLAGS:prepend := "${@" ".join(d.getVar('LD', True).split()[1:])} "
-export LD := "${@d.getVar('LD', True).split()[0]}"
+LDFLAGS:prepend := "${@" ".join(d.getVar('LD').split()[1:])} "
+export LD := "${@d.getVar('LD').split()[0]}"
 
 export CMAKE_OPTIONS = " \
     -DCMAKE_INSTALL_PREFIX=${D}${prefix} \
diff --git a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
index 81e8327032..2e8c5cbb8d 100644
--- a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
+++ b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
@@ -23,7 +23,7 @@ do_install() {
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 python do_package:prepend() {
-    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
 }
 
 B = "${WORKDIR}/${BPN}-${PV}"
diff --git a/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb b/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
index 47938969bb..e7e4ca50af 100644
--- a/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
+++ b/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
@@ -65,5 +65,5 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 # Even though the libusbip is set to version 0.0.1, set the package version to match kernel
 # e.g. usbip-tools-5.14.21-r0.qemux86_64.rpm for qemu package using kernel 5.14.21
 python do_package:prepend() {
-    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
 }
\ No newline at end of file
-- 
2.39.1


