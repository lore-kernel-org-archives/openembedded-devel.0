Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD3ECDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 10:44:26 +0000 (UTC)
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
 by mx.groups.io with SMTP id smtpd.web11.278273.1697625857576879082
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 03:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Za2HkCvD;
 spf=pass (domain: gmail.com, ip: 209.85.161.65, mailfrom: akash.hadke27@gmail.com)
Received: by mail-oo1-f65.google.com with SMTP id 006d021491bc7-57bf04841ccso1372143eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697625856; x=1698230656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vVeGa8CFrNM36bJhhmi2g/OOeXShFPaDr20apxz2G04=;
        b=Za2HkCvDZsKpM5DPZm/1FKBN5JAENyCybppQ4evjGjs70DZRxWu1KlXw9IE+OPj5qL
         FzcqX68nWVPc2lMzXXrDGkGDmC718Iqo15morPglv+W21NSYtiZCuwBjeIg0FBikr0Ie
         FCIj/pXZyctt3mOA1eYzJb8vH6F34O1kJr0iwb6SHcVujKL5IvlqOAnKzg9YgbGTp5Gh
         kHYt7WeC1Y02mpA+e56cd7IcIwOi7MkJjiGqjeQfL8UsMhldDZ4T23To4ikc75H57N8T
         RlF/YdkOHJYtzPO/PHQ/MKCx9tyGFwFrABFJTlGScxfmPo+xeX3Y98AARNMc0h8/jTtX
         pxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697625856; x=1698230656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVeGa8CFrNM36bJhhmi2g/OOeXShFPaDr20apxz2G04=;
        b=l6AgXB9XJAKqHlgAYcEISetE3lMS32EzfaSQthZUSNJY/aJcwfHSAOOSzXQquDL2h+
         FA4fU/A+y3CN/tke0ZYuvK7zh2njr720hw3EdbsEUHP2UhHs42hHJEaHraHRHFtKZ/j0
         acKDFpbOFhjoQ9IRwiSv4sgOo1UqQJkuVEzR0ly/PBRsyrldF8VpZPIPSq9jXwgBRl+J
         w+F3GLlHBMI/eSjtk+4wSbySgPpTgiEHVeQRCyfVGiprlgTwyS2gUqydrXa0e31KbJkk
         JePaiQ8YTSc0TiEhI9W/zjKshRfywz4gLzjxWfAJJlsfzSTURlQwwNoSQAVDJKnvzRGL
         xBKQ==
X-Gm-Message-State: AOJu0YwA6ec1NIaZOvVdeJvOyNOkT//rITnrMoXGeseG79/sJOR9bzO+
	H9cMmtrFkhcd5sHiAZCxxyksZANZj/as9Q==
X-Google-Smtp-Source: AGHT+IFmhG79dyDQTEm2aev3XS04gS3TPb9EXRyIP2KnQo56A3OVyO/PoZgbkpHhqq01sVa5JLgYAA==
X-Received: by 2002:a05:6359:7041:b0:166:d98f:89b with SMTP id ua1-20020a056359704100b00166d98f089bmr4725640rwb.1.1697625856354;
        Wed, 18 Oct 2023 03:44:16 -0700 (PDT)
Received: from L-18010.kpit.com ([2401:4900:1c17:cf4:b6e8:1680:2a6e:78e2])
        by smtp.gmail.com with ESMTPSA id d12-20020a056a00198c00b0064f76992905sm2971174pfl.202.2023.10.18.03.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:44:16 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	akash hadke <akash.hadke@kpit.com>
Subject: [meta-java][master][PATCH] meta-java: Adapt LICENSE as SPDX identifiers
Date: Wed, 18 Oct 2023 16:13:35 +0530
Message-Id: <20231018104335.478441-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 10:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105569

As per Yocto 4.0 migration, LICENSE variables should use SPDX
identifiers
Convert this by a tool present at below location
poky/scripts/contrib/convert-spdx-licenses.py

Link: https://docs.yoctoproject.org/migration-guides/migration-4.0.html#license-changes

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 .../ca-certificates-java/ca-certificates-java_20180516.bb       | 2 +-
 recipes-core/cacao/cacao-initial-native_0.98.bb                 | 2 +-
 recipes-core/cacao/cacao_git.bb                                 | 2 +-
 recipes-core/classpath/classpath-native.inc                     | 2 +-
 recipes-core/classpath/classpath.inc                            | 2 +-
 recipes-core/fastjar/fastjar.inc                                | 2 +-
 recipes-core/jamvm/jamvm.inc                                    | 2 +-
 recipes-core/xml-commons/xom_1.2.10.bb                          | 2 +-
 recipes-extended/dbus/dbus-java_2.7.bb                          | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

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
 
diff --git a/recipes-core/cacao/cacao_git.bb b/recipes-core/cacao/cacao_git.bb
index fef7f34..80129b1 100644
--- a/recipes-core/cacao/cacao_git.bb
+++ b/recipes-core/cacao/cacao_git.bb
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


