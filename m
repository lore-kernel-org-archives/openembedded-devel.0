Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1258ACDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 10:42:46 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.278255.1697625757994723224
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 03:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ac20t5Aq;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-6ba8eb7e581so1008021b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 03:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697625757; x=1698230557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5fWDjAHaXrV3nTbunhqkTXjictfBv8B5FQq2xCo4bM=;
        b=Ac20t5AqRGxp+ZCwhVzM8Pnw6QMsR3QyClwOmJdBNv7x0Qg/GbULV7h1ZusPfCUsCE
         LuRz1r8snbXZO09x7/Twv1OF0wIOSIAKlYLI6cStVt1/X3EdU0vhGLZdWblyaMAsdbcY
         jo/1xWPAx48vGm4eIdqyQdZTac4Zjmd+kPz9rEbdLTrW3X9Ij1PJ9Dis1GxqU6uLLweE
         EeUXJ7HG4/7otrlnpb01ZZr6PWdGs8788MGK+M+YAKQLadzXDgyVbopPw+sMBZlWQts8
         Jajo18TRT7JlDG5CmGmCmne9mWRl/C5LNb1Q7OS1YoZo19PIZAamgCexYpT+N/3Ta06c
         Qfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697625757; x=1698230557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5fWDjAHaXrV3nTbunhqkTXjictfBv8B5FQq2xCo4bM=;
        b=sxVOFpPFwEqDqIfe9ajkH458eGBCzYs1LZsjDX7WAsA03xPepxSPTACCt+8HyOZ4su
         4ijjXviP9WsMN4oRxVfj9oe0uUy2Di5jVtXV/GmQmThJQ0nrNGAiqmACT7F5sR3JKOwP
         fQrYGCptowDGUQKix4oE7S6k2agiUQ01Au1dDNAfItqGDzAKyr6NEP+8AEgH6KXAv+jp
         LK+iqLxbHRM2iwaed6OvGZvig7CV52iUWhdnX24trm4TIAhNse6tjuaoypNWvGfzbjy7
         z4F8Z6Sh6ibIUdMOZhLxYfUacuFf6Jfk+fHVc441XYIqqlC+kIQ0hbZ08daR3TmhFogZ
         r2ZQ==
X-Gm-Message-State: AOJu0Yznv+ruMhg5iXY9N/HQsrb4PcyWLHpJBg2Bj2mn7t/d7iJ3OYvY
	kUHf6fafuKzYD2TGVshyxGdKznNpJiVXcg==
X-Google-Smtp-Source: AGHT+IFYeRUumaxXKUc9WJT+GxggqljkAbFosYSjceDXEVwj93LeDrJzpYtUSc3cg369vKBOsC+BHQ==
X-Received: by 2002:a05:6a20:c182:b0:15d:6fd3:8e74 with SMTP id bg2-20020a056a20c18200b0015d6fd38e74mr5379763pzb.3.1697625756904;
        Wed, 18 Oct 2023 03:42:36 -0700 (PDT)
Received: from L-18010.kpit.com ([2401:4900:1c17:cf4:b6e8:1680:2a6e:78e2])
        by smtp.gmail.com with ESMTPSA id 16-20020a17090a199000b002636dfcc6f5sm1139564pji.3.2023.10.18.03.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:42:36 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	akash hadke <akash.hadke@kpit.com>
Subject: [meta-java][kirkstone][PATCH] meta-java: Adapt LICENSE as SPDX identifiers
Date: Wed, 18 Oct 2023 16:12:07 +0530
Message-Id: <20231018104207.478330-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 10:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105568

From: akash hadke <akash.hadke@kpit.com>

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
index 42c5daf..f3a6aff 100644
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
index ca7652a..e29264a 100644
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


