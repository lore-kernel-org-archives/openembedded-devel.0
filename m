Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102DAE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 11:09:19 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.15924.1736507352500506663
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 03:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dTKSAzvE;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-219f8263ae0so31575995ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 03:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736507351; x=1737112151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=amLFbmwTYvXrqtmr2mOXeoFKZaNNFIf/x6lYZi8lI9c=;
        b=dTKSAzvE993xzd87ssMMmeIGYFnLusbpdjqPDkbvTcl8ZSAZtAG/v+PeEAmaZBgRfk
         by+JNfFp5KTo+3CLE8b5laXkYUpEX4YRmmM+OJgsqB5dLusR3gauAwnQL2Y+VspL94G5
         tqdze0q3imhfTtDpHGNkbVGXBIqkK6ZB5XoLz/HjyFNg7ZTS4k05aASWnm4b9nRozA2k
         M3u71lgTN1QhtBZTekrW0X4Z7Gk3xjO2cG1ddVOHoUYSJMgTGPVHs3Zkl58hqGsx1OZN
         aw2y3XDT7b4tUtyAUr/SlsdcNgBnoXxo2GcrJt+UrHDsBbVfUBNgsRT9l+80nWAKxDVS
         slcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736507351; x=1737112151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amLFbmwTYvXrqtmr2mOXeoFKZaNNFIf/x6lYZi8lI9c=;
        b=PzQFX48WWAUfp6RTdiot6eHjc5Ib+c5OGS1fSt7KAbT4295+Md3KcpCD9Ka02usC6t
         PLfTIZbRXhU1NBPMdvFcAJluTVuNUfjwPpx1Uzsyb0a39V7tPj5P+g2VFVSqQ6/WkMzt
         OMi4uljfKsNiSX1s3dVVscS2Z3rB/KRq5KU2uKp07mXd6fojewTSq2755W7ZeHxUP7AL
         ncl+smVVcf3E+pE2GtzXZwQShrJ60rP1VVVsbhYhQxRa5A5oO1JxaYOh2HalKRGCs4TM
         QbvXkp9sNIWTdrIwAandmW2kqrJVAcVd+xll/S8kvIr/0t2N2YcnF8PvhPssPkuJ+FgQ
         ti0g==
X-Gm-Message-State: AOJu0Yy8e2N7RSQc7j4Ix610YaBo4jIpmqKYrfIaWgnxfMD+sLcBSPqz
	Ahn/iMwmTf80lBPfuIAeMUJS70zrp1WCjs9uUHgwYX39/0i5zSNvDJGn3A==
X-Gm-Gg: ASbGnctfN5q98mheHSEI+mKXVgeCMAx7f/Dk8kkzeZHTi3pVvS74/ZAHMzhVuAetdZ/
	NrAWgZf6otRROG9g/sau96Ma+nPkyBL0GdVLm6zxjxoQvatOtbKj7T1ZCck98MP7qDX9OEwIRqf
	eV5RBMbojsMBRGlrdmeg1E9nKz+jR/jERjsNERmI2tbrAbUHwOX/fSVie80Y1vDl5oaiqpqpv0Y
	C3V0xpwnEmhU+s/2jADkr/iHFs0isHRyuOUF7d3oJVTA0TtVDJRVzOeoVcuz2EzMg==
X-Google-Smtp-Source: AGHT+IH0iz1Q9osnv2xUBkjAPm4kM6L+9BL1Fj/5IfvNc2gcMzgf2UTJNWhlH4U7+R/bDzvfcuZ7uw==
X-Received: by 2002:a17:902:d482:b0:216:7ee9:2212 with SMTP id d9443c01a7336-21a83f54caemr147845955ad.23.1736507351366;
        Fri, 10 Jan 2025 03:09:11 -0800 (PST)
Received: from L-18010.kpit.com ([49.36.51.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12fbb2sm12053835ad.84.2025.01.10.03.09.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:09:10 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH] meta-oe: Remove True option to getVar calls
Date: Fri, 10 Jan 2025 16:39:04 +0530
Message-Id: <20250110110904.247248-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 11:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114766

getVar() now defaults to expanding by default, thus remove the True
option from getVar() calls with a regex search and replace.

Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb    |  2 +-
 .../suitesparse/suitesparse_5.10.1.bb                | 12 ++++++------
 meta-oe/recipes-kernel/spidev-test/spidev-test.bb    |  2 +-
 meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb    |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index 95b36c926d..ca5deda99e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -120,7 +120,7 @@ python do_create_v8_qemu_wrapper () {
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
2.25.1


