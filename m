Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42047C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 14:08:17 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.71527.1698329291174241949
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 07:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K9p5GL6H;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6bbfb8f7ac4so217772b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 07:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698329290; x=1698934090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8w0U6et4mtvnsHNosSAcjP/L73ho5uO8dJeHmfmsdg=;
        b=K9p5GL6HRB1en2cm9aiDNkOkh7qub1A4S68lhgibOR5xdLkYIazBDJFKtTMi9xWfgy
         YkO4rLrWyUEdGevtTOwRPzS+ebbuPCAVrttY0sU8Gt5RoT7EJ5yp+WhW7QOx1w1UuByL
         pU/ioQovfQNWmNmsdjPlChFS89PbtCLdfHiQOVkSne3Nm0gEBFCXD/n5wz8eoa5RTg4V
         W5zT5GWH1+3IdWHB7iUGngoYNzatzb1CLee2fHqfy4kDVoWPOg8W+HAhCPmC5ly1No2l
         T5ijEIgWlO8Cx+99aYmaxyobAomd4BvFheEwb/EO4dLDwBs0PVGuHFl23qkw9+c9zpNH
         4Elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698329290; x=1698934090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8w0U6et4mtvnsHNosSAcjP/L73ho5uO8dJeHmfmsdg=;
        b=pyAl+2ePXRp6/GOmw1pYjaeD2M4v0m/baIua0nQv0gsRJ1OwUycZdWcL8H5Ziu1LU+
         FI1nZq0Qcj2CLBAuiHckHOSgpllxlWf89VObb9JqkiwjtlcE2+TmLj3sluJv1oeeRZlL
         kiqYSfs+Inv0dxvCpgsscFhl+5KPLdIT2l/f4BeSNQf7SVrDC+Ioqc+ykJ0u/ZAPUp1S
         LJ8Zu4eW6TeHI4A5yMI1ZWlEVvwbqCZmjWnyl6ZeE3TLUFXpAD7VPVY+wIKO9zkXUIYC
         SpWSTDrrQrw7T09cfr7GrCGCbHuXCVx7kP9f7PONP+71U6bfSje2H4Zsz0U0S4Jp9heA
         7e1Q==
X-Gm-Message-State: AOJu0YxCCwgtSjhDp/QF1N1BKBhUsT3m/gE7h1L3ficRmHvo38fwLghc
	9fK4+J20NjKI1HEl8WEtYb5epunD15o=
X-Google-Smtp-Source: AGHT+IF6qUvy3hq83KoGuPNPqLd7MJsgzVHdC0AzC9yCdm+nVDCyZmTRzKdl7JdLE+N8ab3MvnsnrA==
X-Received: by 2002:a05:6a00:4598:b0:6be:4b10:b27d with SMTP id it24-20020a056a00459800b006be4b10b27dmr18176624pfb.0.1698329289549;
        Thu, 26 Oct 2023 07:08:09 -0700 (PDT)
Received: from L-18010.kpit.com ([203.192.207.62])
        by smtp.gmail.com with ESMTPSA id k2-20020aa79982000000b006c03d1ba03asm2898410pfh.220.2023.10.26.07.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 07:08:09 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-java][master][PATCH v2] meta-java: Adapt LICENSE as SPDX identifiers
Date: Thu, 26 Oct 2023 19:37:26 +0530
Message-Id: <20231026140726.20258-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 14:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105751

As per Yocto 4.0 migration, LICENSE variables should use SPDX
identifiers
Convert this by a tool present at below location
poky/scripts/contrib/convert-spdx-licenses.py

Link: https://docs.yoctoproject.org/migration-guides/migration-4.0.html#license-changes

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 .../ca-certificates-java/ca-certificates-java_20180516.bb       | 2 +-
 recipes-core/cacao/cacao-initial-native_0.98.bb                 | 2 +-
 recipes-core/classpath/classpath-native.inc                     | 2 +-
 recipes-core/classpath/classpath.inc                            | 2 +-
 recipes-core/fastjar/fastjar.inc                                | 2 +-
 recipes-core/jamvm/jamvm.inc                                    | 2 +-
 recipes-core/xml-commons/xom_1.2.10.bb                          | 2 +-
 recipes-extended/dbus/dbus-java_2.7.bb                          | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
index 460d39a..368458b 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Common CA certificates (JKS trustStore)"
 DESCRIPTION = "This package uses the hooks of the ca-certificates \
 package to update the cacerts JKS trustStore used for many java runtimes."
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "\
 	file://debian/copyright;md5=ab0f6b6900f6564dc3e273dfa36fcc72 \
 	file://src/main/java/org/debian/security/InvalidKeystorePasswordException.java;endline=17;md5=f9150bf1ca3139a38ddb54f9e1c0eb9b \
diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb b/recipes-core/cacao/cacao-initial-native_0.98.bb
index 8432456..e8c9bdb 100644
--- a/recipes-core/cacao/cacao-initial-native_0.98.bb
+++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
@@ -1,6 +1,6 @@
 SUMMARY = "CacaoVM for use as OpenEmbedded's Java VM"
 HOMEPAGE = "http://www.cacaojvm.org/"
-LICENSE  = "GPL-2.0"
+LICENSE  = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION  = "interpreters"
 
diff --git a/recipes-core/classpath/classpath-native.inc b/recipes-core/classpath/classpath-native.inc
index c81e064..e325d94 100644
--- a/recipes-core/classpath/classpath-native.inc
+++ b/recipes-core/classpath/classpath-native.inc
@@ -1,6 +1,6 @@
 SUMMARY = "GNU Classpath standard Java libraries - For native Java-dependent programs"
 HOMEPAGE = "http://www.gnu.org/software/classpath/"
-LICENSE = "GPL-2.0 & SAX-PD"
+LICENSE = "GPL-2.0-only & SAX-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
 
 DEPENDS = "fastjar-native zip-native"
diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
index 35e7db3..0a53e14 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/classpath/"
 SECTION = "libs"
 
 # GPLv2 + custom linking exception
-LICENSE = "GPL-2.0 & SAX-PD"
+LICENSE = "GPL-2.0-only & SAX-PD"
 
 PBN = "classpath"
 
diff --git a/recipes-core/fastjar/fastjar.inc b/recipes-core/fastjar/fastjar.inc
index 8412236..1fb58a8 100644
--- a/recipes-core/fastjar/fastjar.inc
+++ b/recipes-core/fastjar/fastjar.inc
@@ -2,7 +2,7 @@ SUMMARY = "jar replacement written in C."
 HOMEPAGE = "http://savannah.nongnu.org/projects/fastjar/"
 SECTION = "devel"
 PRIORITY = "optional"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 PR = "r1"
 
 DEPENDS = "zlib"
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index 693817f..57e77c1 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -1,6 +1,6 @@
 SUMMARY = "A compact Java Virtual Machine which conforms to the JVM specification version 2."
 HOMEPAGE = "http://jamvm.sourceforge.net/"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "zlib classpath virtual/javac-native libffi virtual/java-initial-native"
diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
index 42ad957..d01d5b2 100644
--- a/recipes-core/xml-commons/xom_1.2.10.bb
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tree-based API for processing XML with Java"
 DESCRIPTION = "XML object model which is a tree-based API for processing XML \
 with Java that strives for correctness, simplicity, and performance."
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f18f166096348ef9d457214a2484816"
 
 HOMEPAGE = "http://xom.nu"
diff --git a/recipes-extended/dbus/dbus-java_2.7.bb b/recipes-extended/dbus/dbus-java_2.7.bb
index 0e5ae92..1bfe5a7 100644
--- a/recipes-extended/dbus/dbus-java_2.7.bb
+++ b/recipes-extended/dbus/dbus-java_2.7.bb
@@ -4,7 +4,7 @@ SUMMARY:${PN}-bin = "${SUMMARY} (Binaries)"
 AUTHOR = "Matthew Johnson <dbus@matthew.ath.cx>"
 HOMEPAGE = "http://dbus.freedesktop.org/doc/dbus-java"
 SECTION = "libs"
-LICENSE = "LGPL-2.1 & AFL-2.1"
+LICENSE = "LGPL-2.1-only & AFL-2.1"
 
 DEPENDS = "libmatthew gettext-native fastjar-native"
 RDEPENDS:${PN}-viewer = "java2-runtime libunixsocket-java ${PN}-bin libmatthew-debug-java ${JPN}"
-- 
2.25.1


