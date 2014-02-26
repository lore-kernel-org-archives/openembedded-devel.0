Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6930C6F3B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 23:15:04 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id o10so788922eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 15:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ryhWmU4dBFETLbsFumWnGBOT2oAQm2vrnngEEmTzQAw=;
	b=IRA90nfRSxgD32RDT3NZnwtvI+2fbaZGvWty8/xdx9lS0/SrGN1jEbKan3YakxPgsW
	qcODAGHtIAftoL6AJr7Jf6yYfEogsfs2DKYX4GbYgAfAmN8jpisKAI8BacorC5vo7M9o
	ks5Vlc4ZCSW903joMv0s+RXvBTT9FN9zx2XpEpFKsP2XbDxUAPxVd4HT9E1KaM7rxGUD
	n7YlDLYOTn7RWGS3lci4TZKvIjpvvbPHfQsZnJ/w2JhQko35OE8Xh/+vpwG4cJQ4zCS1
	hy+WVs53rNt4bDiTzTgXDdwPMiXCOs7QfGDbs9bIhpZq+o+e58eeTM+FNBfLnf87ZWtK
	Rbbg==
X-Received: by 10.14.174.5 with SMTP id w5mr9946126eel.14.1393456505769;
	Wed, 26 Feb 2014 15:15:05 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id l4sm9425166eeo.9.2014.02.26.15.15.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 15:15:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 00:15:01 +0100
Message-Id: <1393456501-30516-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393456501-30516-1-git-send-email-Martin.Jansa@gmail.com>
References: <1393456501-30516-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] ode: upgrade to 0.13
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
X-List-Received-Date: Wed, 26 Feb 2014 23:15:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/ode/ode_0.13.bb | 27 +++++++++++++++++++++++++++
 meta-oe/recipes-support/ode/ode_0.9.bb  | 28 ----------------------------
 2 files changed, 27 insertions(+), 28 deletions(-)
 create mode 100644 meta-oe/recipes-support/ode/ode_0.13.bb
 delete mode 100644 meta-oe/recipes-support/ode/ode_0.9.bb

diff --git a/meta-oe/recipes-support/ode/ode_0.13.bb b/meta-oe/recipes-support/ode/ode_0.13.bb
new file mode 100644
index 0000000..8e9eb15
--- /dev/null
+++ b/meta-oe/recipes-support/ode/ode_0.13.bb
@@ -0,0 +1,27 @@
+SUMMARY = "ODE is an Open Source Physics Engine"
+SECTION = "libs"
+HOMEPAGE = "http://www.ode.org"
+LICENSE = "LGPLv2.1 & BSD"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=1de906ee96808d9776dd72a5f9a79a22 \
+    file://LICENSE.TXT;md5=771782cb6245c7fbbe74bc0ec059beff \
+"
+# LICENSE-BSD.TXT is missing in 0.13 tarball, but COPYING still says it's dual licensed
+# and svn repo still contains LICENSE-BSD.TXT so maybe it will return in next tarball
+# file://LICENSE-BSD.TXT;md5=c74e6304a772117e059458fb9763a928
+
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/opende/ode-${PV}.tar.bz2"
+SRC_URI[md5sum] = "04b32c9645c147e18caff7a597a19f84"
+SRC_URI[sha256sum] = "34ce3e236e313bf109a0cb5546d2fca462aed99f29a42e62bc1463b803c31ef9"
+
+inherit autotools binconfig
+
+EXTRA_OECONF = "--disable-demos --enable-soname"
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+
+PACKAGECONFIG ?= ""
+# if it isn't explicitly selected and "$build_os" == "$target_os", then configure will run
+# series of AC_TRY_RUN which won't work for cross-compilation and configure fails
+PACKAGECONFIG[double-precision] = "--enable-double-precision,--disable-double-precision"
diff --git a/meta-oe/recipes-support/ode/ode_0.9.bb b/meta-oe/recipes-support/ode/ode_0.9.bb
deleted file mode 100644
index 8b9955e..0000000
--- a/meta-oe/recipes-support/ode/ode_0.9.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "ODE is an Open Source Physics Engine"
-SECTION = "libs"
-HOMEPAGE = "http://www.ode.org"
-LICENSE = "LGPLv2.1 & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE-BSD.TXT;md5=c74e6304a772117e059458fb9763a928 \
-                    file://LICENSE.TXT;md5=771782cb6245c7fbbe74bc0ec059beff"
-
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/opende/ode-src-${PV}.zip \
-           file://install.patch"
-
-SRC_URI[md5sum] = "4c03759b76a0649a6d5108c8e172e1e4"
-SRC_URI[sha256sum] = "460d0851b743b1f144ef2a8259004d6774504c95d08e9357a96a296111496feb"
-
-inherit autotools binconfig
-
-EXTRA_OECONF = "--disable-demos --enable-soname"
-
-do_configure_append() {
-    echo "#define dInfinity DBL_MAX" >>include/ode/config.h
-}
-
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-
-PACKAGECONFIG ?= ""
-# if it isn't explicitly selected and "$build_os" == "$target_os", then configure will run
-# series of AC_TRY_RUN which won't work for cross-compilation and configure fails
-PACKAGECONFIG[double-precision] = "--enable-double-precision,--disable-double-precision"
-- 
1.9.0


