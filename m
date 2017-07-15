Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9E551782B4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jul 2017 01:55:54 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id k14so53320046pgr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sbA+tHv2/EQwEktLI5CbrMIDVQiU6igUgW6cwBKAhWI=;
	b=lbH4/TWVX1O3JdyXH5ciR962rOOMdOx2mC18Wpe9J2ouxxCE3G4b1OED7dLLEFgKeG
	5MO1ZJX6WBoCmABR+LXpZhq19rXmgzHf1HrWnNJ1V8pQPxOQn91QbvWcaJSKBL/yriP6
	nduSNvIX92vubypDr2WpRTRLLNQJh9QEihi/wERUBgssy1WXglSgOb49O+3aeCaW0P4A
	uODQd4TE+N3E55nPfxlsboECh6I/Ezw+kzUToH6Ds0Owb6wcysoFAPM/fv24Sx1ipNWI
	AuqJ3aVWrBJKznqo3ZxN2Cc1BwIVviu0lJISJhSeQI2KMz/oyRuDSrs0zxCHMkj7r26I
	Gzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sbA+tHv2/EQwEktLI5CbrMIDVQiU6igUgW6cwBKAhWI=;
	b=OSxnh0jPkMtMUh/oKFCBTyVp2qj5c212ywMAyO0xUIOLq41AVd0torilrFQBgqHUZ7
	m5tmlmBX6A5fRZ+Zk/cOMrl4EU7esJvQME+n4GO2lkdWG+EV5cP40j4nOGbhXLQFNDHL
	jd9kZmM/9D1litTeDzMCnhCXg3JWL29JjyE1nyll9NHSGk6pZOkxhS5GoRtczQKabD+b
	OEaYZSA2E9phWrALYQ120n9O2fshCd1z0buwaY1SBVv4t07E4WQEkJWbYfLVtE0zcP/w
	sRD3qPPQxg7XaTtE+AGl/Zp34Z4dbB4wlM2Qvt8wxeoe336MZ3P79ElTd6KDyzJYypls
	kiSQ==
X-Gm-Message-State: AIVw113XWngPL3RrrK73ZT//7VgQIV9MzpuLS3UpPapyEBMXqfvwZI88
	oGK3X9bY7iudD9pZ
X-Received: by 10.99.122.3 with SMTP id v3mr17518296pgc.98.1500083755535;
	Fri, 14 Jul 2017 18:55:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	l4sm18189589pgr.21.2017.07.14.18.55.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 18:55:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 18:55:39 -0700
Message-Id: <20170715015539.31584-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170715015539.31584-1-raj.khem@gmail.com>
References: <20170715015539.31584-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 6/6] pimd: Upgrade to 2.3.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Jul 2017 01:55:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ure-Dont-use-uname-to-determine-target-OS.patch | 28 ++++++++++++++++++++++
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 19 ---------------
 meta-networking/recipes-support/pimd/pimd_2.3.2.bb | 20 ++++++++++++++++
 3 files changed, 48 insertions(+), 19 deletions(-)
 create mode 100644 meta-networking/recipes-support/pimd/pimd/0001-configure-Dont-use-uname-to-determine-target-OS.patch
 delete mode 100644 meta-networking/recipes-support/pimd/pimd_2.1.8.bb
 create mode 100644 meta-networking/recipes-support/pimd/pimd_2.3.2.bb

diff --git a/meta-networking/recipes-support/pimd/pimd/0001-configure-Dont-use-uname-to-determine-target-OS.patch b/meta-networking/recipes-support/pimd/pimd/0001-configure-Dont-use-uname-to-determine-target-OS.patch
new file mode 100644
index 000000000..eb549ded9
--- /dev/null
+++ b/meta-networking/recipes-support/pimd/pimd/0001-configure-Dont-use-uname-to-determine-target-OS.patch
@@ -0,0 +1,28 @@
+From f3e04281bad361249a8dad0cde150a801d720f67 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 18:46:52 -0700
+Subject: [PATCH] configure: Dont use uname to determine target OS
+
+Helps with cross-compiling
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 6c35a72..f9714e2 100755
+--- a/configure
++++ b/configure
+@@ -31,7 +31,7 @@
+ #DEFS += -DSCOPED_ACL
+ #
+ 
+-OS=`uname`
++OS="Linux"
+ CFG=config.mk
+ TMP=`mktemp /tmp/XXXXXX`
+ BUGREPORT_URL="https://github.com/troglobit/pimd/issues"
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
deleted file mode 100644
index 7edb6422d..000000000
--- a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "pimd is a lightweight stand-alone PIM-SM v2 multicast routing daemon."
-HOMEPAGE = "http://troglobit.com/pimd.html"
-SECTION = "net"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=94f108f91fab720d62425770b70dd790"
-
-SRC_URI = "ftp://ftp.troglobit.com/pimd/${BP}.tar.bz2"
-SRC_URI[md5sum] = "a12448bc7c9bfcebf51a13ebf1ffa962"
-SRC_URI[sha256sum] = "01016940543a0a6131d4e6c91b595d47e187012c59a298eec14c3dbc38564b3a"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-CFLAGS += "-I ${S}/include "
-
-do_install() {
-    unset datadir
-    unset mandir
-    oe_runmake 'DESTDIR=${D}' install
-}
-
diff --git a/meta-networking/recipes-support/pimd/pimd_2.3.2.bb b/meta-networking/recipes-support/pimd/pimd_2.3.2.bb
new file mode 100644
index 000000000..2faa7cb1c
--- /dev/null
+++ b/meta-networking/recipes-support/pimd/pimd_2.3.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "pimd is a lightweight stand-alone PIM-SM v2 multicast routing daemon."
+HOMEPAGE = "http://troglobit.com/pimd.html"
+SECTION = "net"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94f108f91fab720d62425770b70dd790"
+
+SRC_URI = "ftp://ftp.troglobit.com/pimd/${BP}.tar.gz \
+           file://0001-configure-Dont-use-uname-to-determine-target-OS.patch \
+           "
+SRC_URI[md5sum] = "a3c03e40540980b2c06e265a17988e60"
+SRC_URI[sha256sum] = "c77a9812751f114490a28a6839b16aac8b020c8d9fd6aa22bf3880c054e19f1d"
+
+EXTRA_OECONF_append_libc-musl = " --embedded-libc"
+
+inherit autotools-brokensep
+
+do_configure() {
+    oe_runconf
+}
+
-- 
2.13.3


