Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5206465E05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 16:03:03 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id hz1so2048809pad.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 09:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2qFj59U8X5CiA3EW1eUIiOvPcO04AOTTnZV3Mjv9nw8=;
	b=B/prPj1qpJGCzVlQskTuC0mJmFgHAhlka8fSoeJpvB/XL0Mw6FFOuuOWMd24RR8iFm
	ysLMkYcR64Xo/LqEBNZE54AhlslJ5APOP40cFgoGJUBiUp8FW8vZJZOzIv/yABAk/n9+
	mKkumlPsPbDsiJ25HNRGdFAW5nd6hvt8wpedhK5wh2wsJVunQFoOk0h3IdMjBVAOSVAx
	ZcwYR97J2i9jm/2wWm9c5eGfBZ+oFVii99p9E9YWP8BGNjjlqpxEc3IUA9h7Xg0f/Q+Y
	1SiY/bYt3bZKpi4u17MgAU3Yh9+3qdAAWVIM3UuGXuG5QPBjGSqw5Xadu7dGU1ohy1FU
	YAuA==
X-Gm-Message-State: ALoCoQlVLdgfmieyJSRJNv+C6wIsCn9Zjl2x+rbdYIWNoEoebsJ9KBu/82C43CdyXof2b31GcOvF
X-Received: by 10.68.192.106 with SMTP id hf10mr6359582pbc.30.1402502584404;
	Wed, 11 Jun 2014 09:03:04 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	sv10sm31229790pab.32.2014.06.11.09.03.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jun 2014 09:03:03 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jun 2014 09:03:01 -0700
Message-Id: <1402502581-19299-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libnet: fix build issue with package upgrade
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
X-List-Received-Date: Wed, 11 Jun 2014 16:03:06 -0000

The main issue was the endianess detection. The ac override did not work.
The current version has updated automake and autoconf files that address better endianess detection and it plays well with YP autotools.

Build tested on all qemus arches.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libnet/libnet-1.1.6/fix-endianess-test.patch   | 40 ----------------------
 .../recipes-connectivity/libnet/libnet_1.1.6.bb    | 23 -------------
 .../recipes-connectivity/libnet/libnet_1.2-rc3.bb  | 19 ++++++++++
 3 files changed, 19 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.6/fix-endianess-test.patch
 delete mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb

diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.6/fix-endianess-test.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.6/fix-endianess-test.patch
deleted file mode 100644
index 4f9d5a4..0000000
--- a/meta-oe/recipes-connectivity/libnet/libnet-1.1.6/fix-endianess-test.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Use autoconf's endian check instead of the locally defined check
-so that we can determine the endianess without having to compile
-a program.
-
-Idea from http://www.security-lists.org/lists/libnet/2003/03/00001.html
-
-Also remove the old test from aclocal.m4.
-
-Rebased for libnet-1.1.6
-
-diff --git a/configure.in b/configure.in
-index e54c688..e2e768e 100644
---- a/configure.in
-+++ b/configure.in
-@@ -4,6 +4,7 @@ dnl All rights reserved.
- dnl
- dnl Process this file with autoconf to produce a configure script.
- 
-+AC_PREREQ(2.52)
- AC_INIT(libnet, 1.1.6)
- AC_MSG_RESULT(beginning autoconfiguration process for libnet-${PACKAGE_VERSION} ...)
- AC_CANONICAL_SYSTEM
-@@ -38,7 +39,16 @@ dnl
- dnl And some custom things
- dnl
- 
--AC_LIBNET_ENDIAN_CHECK
-+AC_C_BIGENDIAN([
-+ AC_DEFINE(LIBNET_BIG_ENDIAN)
-+ ENDIANESS="LIBNET_BIG_ENDIAN"
-+ LIBNET_CONFIG_DEFINES="$LIBNET_CONFIG_DEFINES -DLIBNET_BIG_ENDIAN"
-+],[
-+ AC_DEFINE(LIBNET_LIL_ENDIAN)
-+ ENDIANESS="LIBNET_LIL_ENDIAN"
-+ LIBNET_CONFIG_DEFINES="$LIBNET_CONFIG_DEFINES -DLIBNET_LIL_ENDIAN"
-+], AC_MSG_WARN(cannot detect endianess. try setting ac_cv_c_bigendian to yes or no)) 
-+
- dnl AC_LBL_LIBRARY_NET
- 
- AC_SUBST(ENDIANESS)
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb
deleted file mode 100644
index 0db074b..0000000
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "A packet dissection and creation library"
-# libnet at packetfactory.net is dead
-HOMEPAGE = "https://github.com/sam-github/libnet"
-SECTION = "libs"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=fb43d5727b2d3d1238545f75ce456ec3"
-DEPENDS = "libpcap"
-# There are major API changes beween libnet v1.0 and libnet v1.1
-PROVIDES = "libnet-1.1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${BPN}-${PV}.tar.gz \
-           file://fix-endianess-test.patch"
-
-SRC_URI[md5sum] = "710296fe424a49344e5fcc0d09e53317"
-SRC_URI[sha256sum] = "d392bb5825c4b6b672fc93a0268433c86dc964e1500c279dc6d0711ea6ec467a"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-inherit autotools binconfig
-
-do_configure_prepend() {
-    rm -f aclocal.m4 Makefile.am ltmain.sh
-}
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
new file mode 100644
index 0000000..a558e80
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A packet dissection and creation library"
+# libnet at packetfactory.net is dead
+HOMEPAGE = "https://github.com/sam-github/libnet"
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=3ec839e00408b484d33b472a86b7c266"
+DEPENDS = "libpcap"
+# There are major API changes beween libnet v1.0 and libnet v1.1
+PROVIDES = "libnet-1.2rc2"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f051e6e5bdecddb90f77c701c2ca1804"
+SRC_URI[sha256sum] = "72c380785ad44183005e654b47cc12485ee0228d7fa6b0a87109ff7614be4a63"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+inherit autotools binconfig
+
-- 
1.9.1


