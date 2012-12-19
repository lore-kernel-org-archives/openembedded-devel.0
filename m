Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TlMnQ-0005eB-My
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2012 17:47:04 +0100
Received: by mail-gg0-f175.google.com with SMTP id y1so485189ggc.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 08:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=B456jJduEktfI07VrGYg4DysZnkJ6KwXLWotBvDzS8E=;
	b=lpFXOplVKU4n1oLrPBCIz+VjXofgRAW3GZOp9rErpvj+d/rwhQRaISCsmzLLE+R2PH
	VqLfdLOq/rSkN64bn5lFd1BnFqWsdHSnXNtkGUMPEOhgjPmNZKfjFBKfTGhW8hhoziKJ
	bXxtkJsGCMpIABp0e/m1apZKEfz9YZo6vBJITAcCOUwu4Oe0ez2KQkGwqspdaRXH0hqH
	pQdvyUQ6HFVeUJ1CwNLCgrsfJ90+jGViRAwsAtGL5lx+r+A9997t0Zen1sp6kOoH5CWa
	5hcYEFpf3jkDHBXnGdUBALQifJd1Wa47Mc0enJQw9XOO44Dp/ssl/vRdhVeOInnhCdbk
	Jl5Q==
X-Received: by 10.236.149.210 with SMTP id x58mr6237639yhj.42.1355934740908;
	Wed, 19 Dec 2012 08:32:20 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.170])
	by mx.google.com with ESMTPS id v9sm4593775anm.22.2012.12.19.08.32.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 08:32:20 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Dec 2012 14:32:09 -0200
Message-Id: <1355934731-32281-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2 1/3] Revert "openmotif: remove due to lack of libxp in repository"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 16:47:05 -0000

This reverts commit 14b68506078a4133e743491d35245775a58a1317.

Change-Id: I3dd4afe60d217e96fef08377c2d32f5c793af992
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../openmotif/openmotif/configure.patch            |   15 ++++++++
 .../recipes-support/openmotif/openmotif_2.3.3.bb   |   38 ++++++++++++++++++++
 2 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/openmotif/openmotif/configure.patch
 create mode 100644 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb

diff --git a/meta-oe/recipes-support/openmotif/openmotif/configure.patch b/meta-oe/recipes-support/openmotif/openmotif/configure.patch
new file mode 100644
index 0000000..8868e80
--- /dev/null
+++ b/meta-oe/recipes-support/openmotif/openmotif/configure.patch
@@ -0,0 +1,15 @@
+--- a/configure.ac~	2009-10-27 14:10:23.000000000 -0200
++++ b/configure.ac	2011-05-31 10:51:00.207232036 -0300
+@@ -3,12 +3,6 @@
+ AC_CONFIG_SRCDIR([lib/Xm/Form.c])
+ AC_PREREQ(2.52)
+ AC_CONFIG_AUX_DIR(.)
+-AC_CHECK_FILE(/usr/X/include/X11/X.h,
+-  AC_PREFIX_DEFAULT(/usr/X),
+-  AC_PREFIX_DEFAULT(/usr))
+-AC_CHECK_FILE(/usr/X11R6/include/X11/X.h,
+-  AC_PREFIX_DEFAULT(/usr/X11R6),
+-  AC_PREFIX_DEFAULT(/usr))
+ 
+ dnl AM_MAINTAINER_MODE
+ AC_CANONICAL_TARGET
diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
new file mode 100644
index 0000000..2e9c2de
--- /dev/null
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -0,0 +1,38 @@
+SECTION = "libs"
+DESCRIPTION = "OSM/Motif implementation."
+LICENSE = "OGPL"
+DEPENDS = "xbitmaps virtual/libx11 libxt libxp"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
+
+SRC_URI = "http://openmotif.com/files/public_downloads/openmotif/2.3/2.3.3/openmotif-2.3.3.tar.gz \
+           file://configure.patch;patch=1"
+
+SRC_URI[md5sum] = "fd27cd3369d6c7d5ef79eccba524f7be"
+SRC_URI[sha256sum] = "c85f5545e218fa0c59a3789192132d472fc5a33e914a221a568eee4fc10cd103"
+
+inherit autotools
+
+PACKAGES += "${PN}-bin"
+
+FILES_${PN}-bin = "${bindir}"
+
+do_compile() {
+	(
+		# HACK: build a native binaries need during the build
+		unset CC LD CXX CCLD CFLAGS
+		oe_runmake -C config/util CC="${BUILD_CC}" LD="${BUILD_LD}" CXX="${BUILD_CXX}" LIBS="" makestrs
+    )
+    if [ "$?" != "0" ]; then
+        exit 1
+    fi
+    oe_runmake -C lib
+    oe_runmake -C include
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} -C lib install
+    oe_runmake DESTDIR=${D} -C include install
+}
+
+LEAD_SONAME = "libXm.so.4"
-- 
1.7.2.5



