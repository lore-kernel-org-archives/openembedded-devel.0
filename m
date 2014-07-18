Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0C56C6028A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 18:23:30 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so1319083wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 11:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P6SHVn+tQMwQ48+BmaggerYDcp6X9eoQcp5aodYpshM=;
	b=WrGuvdgifM9YrAFr4Qrq20z7KcN4JiwibBpe7GI2Ku5evRLLRBsX7LI288vznOV/KP
	FEctIm7IMOPQ/oxSAvucCoqn4gUFIlK2zQ7emYVJYJA6SXt8+f3WcmUx2l3nxxYeRxGC
	2De9+91Y87n2wopawTrBPDu3C41BLKa1K9BNchEosQT/6kZ8AcimbJlFPnJ8OItU2cay
	uIrceG9PWyXJCqpgCv/y2klZv5dnBi4ueSnqmTtWYe+C3JH1fNWBlQbw0dhWGnyILusD
	my/r8HsFeuXM8tHu7srDtdqoTyTwBu6PAiJY26SaD2ZaguMXBLH/Lla2U6gTcN7qy1Dj
	NO1A==
X-Received: by 10.180.20.14 with SMTP id j14mr9272977wie.48.1405707810862;
	Fri, 18 Jul 2014 11:23:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	di7sm15973091wjb.34.2014.07.18.11.23.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 11:23:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 20:23:37 +0200
Message-Id: <1405707818-12348-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1405707818-12348-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405707818-12348-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 3/4] dfu-util-0.4: add foreign to AM_INIT_AUTOMAKE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jul 2014 18:23:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb   |  4 +++-
 meta-oe/recipes-support/dfu-util/dfu-util/configure.patch | 12 ++++++++++++
 meta-oe/recipes-support/dfu-util/dfu-util_0.4.bb          |  4 +++-
 3 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util/configure.patch

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb
index ce6e566..d0dd362 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb
@@ -6,7 +6,9 @@ do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
 DEPENDS = "libusb1-native"
 
 FILESPATH =. "${FILE_DIRNAME}/${BPN}-${PV}:"
-SRC_URI += "file://0001-Revert-Makefile.am-Drop-static-dfu-util.patch"
+SRC_URI += "file://0001-Revert-Makefile.am-Drop-static-dfu-util.patch \
+    file://configure.patch \
+"
 
 do_deploy() {
     install -d ${DEPLOY_DIR_TOOLS}
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util/configure.patch b/meta-oe/recipes-support/dfu-util/dfu-util/configure.patch
new file mode 100644
index 0000000..c83d510
--- /dev/null
+++ b/meta-oe/recipes-support/dfu-util/dfu-util/configure.patch
@@ -0,0 +1,12 @@
+diff -uNr dfu-util-0.4.orig/configure.ac dfu-util-0.4/configure.ac
+--- dfu-util-0.4.orig/configure.ac	2014-07-18 08:18:45.407552416 +0200
++++ dfu-util-0.4/configure.ac	2014-07-18 20:05:11.934894143 +0200
+@@ -4,7 +4,7 @@
+ AC_PREREQ(2.59)
+ AC_INIT([dfu-util],[0.4])
+ AC_CONFIG_AUX_DIR(m4)
+-AM_INIT_AUTOMAKE(AC_PACKAGE_NAME, AC_PACKAGE_VERSION)
++AM_INIT_AUTOMAKE([foreign])
+ AM_CONFIG_HEADER([config.h])
+ 
+ # Test for new silent rules and enable only if they are available
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.4.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.4.bb
index 12d6af6..9f55a86 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.4.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.4.bb
@@ -2,7 +2,9 @@ require dfu-util.inc
 
 DEPENDS = "libusb1"
 
-SRC_URI += "file://no-usbpath.patch"
+SRC_URI += "file://no-usbpath.patch \
+    file://configure.patch \
+"
 
 SRC_URI[md5sum] = "2cf466fabb881e8598fa02f286d3242c"
 SRC_URI[sha256sum] = "f60fea987aa06ee03da22a656d1d113ac224458ec4442bcf1764a62f0930bd07"
-- 
2.0.0


