Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4EEB16EAFA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 22:21:59 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id k10so2740919eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 14:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Z3ioiSw0n6kyJpoLbapl7fLzp6O2+nUcNE/o/BXL88I=;
	b=QvMZW8WlrlcONExgNmQR4r69JW+g7Zz8DYbc1i9KIj5vWIlz6GpZ0bWxamWCiMr7xu
	tOWy9JEtvPYnSqaLJLetYJvRV5ox/okoMttZ0FYCA4g73pBnf7h6s26bGiqbdkC+ivbj
	KuX2DefquN2t4UJ9x65vj0bR8G7AkHlVKLqkTA2k8hyqEQWiVepgGAsAnVgVDzPc7qzs
	qLORvgwQKEub7DoDx9T4poWGt1WviKoouj37IKJj/9q4305f18X6vjpLFCOGODxu8qs3
	ZgeS+Z5w8jLos6SYVBLnjmRq4gw07fGNmSXR9jmSUPtrfNzInd1e0hKeMOaRINQ/Xk1C
	yJpg==
X-Received: by 10.15.51.196 with SMTP id n44mr21091293eew.27.1393194120240;
	Sun, 23 Feb 2014 14:22:00 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l4sm21035758eeo.9.2014.02.23.14.21.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Feb 2014 14:21:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 23:21:53 +0100
Message-Id: <1393194113-24177-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][meta-efl][PATCH] ode: Move to nonworking
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
X-List-Received-Date: Sun, 23 Feb 2014 22:22:00 -0000

* according to http://www.openembedded.org/wiki/Bitbake_World_Status
  it's broken at least since 2013-10-30 and nobody seems to care

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nonworking/ode/ode/install.patch               | 23 +++++++++++++++++++++
 meta-oe/recipes-support/nonworking/ode/ode_0.9.bb  | 24 ++++++++++++++++++++++
 meta-oe/recipes-support/ode/ode/install.patch      | 23 ---------------------
 meta-oe/recipes-support/ode/ode_0.9.bb             | 24 ----------------------
 4 files changed, 47 insertions(+), 47 deletions(-)
 create mode 100644 meta-oe/recipes-support/nonworking/ode/ode/install.patch
 create mode 100644 meta-oe/recipes-support/nonworking/ode/ode_0.9.bb
 delete mode 100644 meta-oe/recipes-support/ode/ode/install.patch
 delete mode 100644 meta-oe/recipes-support/ode/ode_0.9.bb

diff --git a/meta-oe/recipes-support/nonworking/ode/ode/install.patch b/meta-oe/recipes-support/nonworking/ode/ode/install.patch
new file mode 100644
index 0000000..2f6cdb0
--- /dev/null
+++ b/meta-oe/recipes-support/nonworking/ode/ode/install.patch
@@ -0,0 +1,23 @@
+--- ode-0.9.orig/Makefile.am	2007-02-21 15:54:54.000000000 +0100
++++ ode-0.9/Makefile.am	2010-08-21 16:15:55.000000000 +0200
+@@ -25,13 +25,13 @@
+ 
+ if USE_SONAME
+ install-exec-hook:
+-	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
+-	$(libdir)/libode.so
+-	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
+-	$(libdir)/@ODE_SONAME@
+-	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
+-	$(libdir)/@ODE_SONAME@.@ODE_REVISION@
+-	/sbin/ldconfig
++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
++	$(DESTDIR)/$(libdir)/libode.so
++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
++	$(DESTDIR)/$(libdir)/@ODE_SONAME@
++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
++	$(DESTDIR)/$(libdir)/@ODE_SONAME@.@ODE_REVISION@
++	echo /sbin/ldconfig
+ else
+ install-exec-hook:
+ endif
diff --git a/meta-oe/recipes-support/nonworking/ode/ode_0.9.bb b/meta-oe/recipes-support/nonworking/ode/ode_0.9.bb
new file mode 100644
index 0000000..1f3a5ca
--- /dev/null
+++ b/meta-oe/recipes-support/nonworking/ode/ode_0.9.bb
@@ -0,0 +1,24 @@
+SUMMARY = "ODE is an Open Source Physics Engine"
+SECTION = "libs"
+HOMEPAGE = "http://www.ode.org"
+LICENSE = "LGPLv2.1 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE-BSD.TXT;md5=c74e6304a772117e059458fb9763a928 \
+                    file://LICENSE.TXT;md5=771782cb6245c7fbbe74bc0ec059beff"
+
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/opende/ode-src-${PV}.zip \
+           file://install.patch"
+
+SRC_URI[md5sum] = "4c03759b76a0649a6d5108c8e172e1e4"
+SRC_URI[sha256sum] = "460d0851b743b1f144ef2a8259004d6774504c95d08e9357a96a296111496feb"
+
+inherit autotools binconfig
+
+EXTRA_OECONF = "--disable-demos --enable-soname"
+
+do_configure_append() {
+    echo "#define dInfinity DBL_MAX" >>include/ode/config.h
+}
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+
diff --git a/meta-oe/recipes-support/ode/ode/install.patch b/meta-oe/recipes-support/ode/ode/install.patch
deleted file mode 100644
index 2f6cdb0..0000000
--- a/meta-oe/recipes-support/ode/ode/install.patch
+++ /dev/null
@@ -1,23 +0,0 @@
---- ode-0.9.orig/Makefile.am	2007-02-21 15:54:54.000000000 +0100
-+++ ode-0.9/Makefile.am	2010-08-21 16:15:55.000000000 +0200
-@@ -25,13 +25,13 @@
- 
- if USE_SONAME
- install-exec-hook:
--	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
--	$(libdir)/libode.so
--	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
--	$(libdir)/@ODE_SONAME@
--	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
--	$(libdir)/@ODE_SONAME@.@ODE_REVISION@
--	/sbin/ldconfig
-+	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
-+	$(DESTDIR)/$(libdir)/libode.so
-+	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
-+	$(DESTDIR)/$(libdir)/@ODE_SONAME@
-+	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
-+	$(DESTDIR)/$(libdir)/@ODE_SONAME@.@ODE_REVISION@
-+	echo /sbin/ldconfig
- else
- install-exec-hook:
- endif
diff --git a/meta-oe/recipes-support/ode/ode_0.9.bb b/meta-oe/recipes-support/ode/ode_0.9.bb
deleted file mode 100644
index 1f3a5ca..0000000
--- a/meta-oe/recipes-support/ode/ode_0.9.bb
+++ /dev/null
@@ -1,24 +0,0 @@
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
-- 
1.9.0


