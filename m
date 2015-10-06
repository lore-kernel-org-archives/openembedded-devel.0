Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBA5755FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 22:30:46 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so187492279wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 15:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ggFLZCgZn5sOiIRIwaiaKltUYnlW8duOkYC1vro0mbk=;
	b=Z8dp9ZxPcpN2C3AP9b/Kc9sN239m37epsKB9RNsJ9dJLMuRJyIx/EetPCgaZ8PaXQs
	ANxmDXKXaDb3O2263ztB7mIvwullFvQw/Rkp2+nOWLOt0Wx/SGDz6QKaDrupIA4usV/X
	b0Qwh2snrP55Ql+rM4lcwjh7t4Rvkry2RHhnhQ4RAbsKnQF/F7k8lYsUZnyy1PN/nwX8
	tSl/w+BJcxdJG7eyeMGdZq4LTO/HgMvCSi9wVsNNsD7YRjsxzkVRwJawQ86IL9+vPEgp
	I+Ao5XgOWyOJRS5QcQghe78gfYZH6A5HsiGd977N6oVuL4dfn30KzczyV3cw00A37i41
	tlzg==
X-Received: by 10.180.211.39 with SMTP id mz7mr20325932wic.65.1444170646151;
	Tue, 06 Oct 2015 15:30:46 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	h6sm21569211wiy.14.2015.10.06.15.30.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 15:30:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2015 00:30:42 +0200
Message-Id: <1444170642-23088-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 8/8] Revert "freerdp: move to nonworking"
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
X-List-Received-Date: Tue, 06 Oct 2015 22:30:46 -0000

* use PNBLACKLIST instead

This reverts commit 353b2ceff20c8fcf4d58e048cab8b88f1fdccf9e.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp.inc        | 51 ++++++++++++++++++++++
 meta-oe/recipes-support/freerdp/freerdp_git.bb     | 21 +++++++++
 .../recipes-support/nonworking/freerdp/freerdp.inc | 51 ----------------------
 .../nonworking/freerdp/freerdp_git.bb              | 16 -------
 4 files changed, 72 insertions(+), 67 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp.inc
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp_git.bb
 delete mode 100644 meta-oe/recipes-support/nonworking/freerdp/freerdp.inc
 delete mode 100644 meta-oe/recipes-support/nonworking/freerdp/freerdp_git.bb

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
new file mode 100644
index 0000000..34dac4b
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -0,0 +1,51 @@
+# Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license
+
+DESCRIPTION = "FreeRDP RDP client"
+HOMEPAGE = "http://www.freerdp.com"
+DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib pulseaudio pcsc-lite libxkbfile libxinerama"
+SECTION = "x11/network"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pkgconfig cmake
+
+EXTRA_OECMAKE += "-DWITH_PULSEAUDIO=ON \
+                  -DWITH_PCSC=ON \
+                  -DWITH_CUPS=ON \
+                  -DWITH_FFMPEG=OFF \
+                  -DWITH_CUNIT=OFF \
+                  -DWITH_X11=ON \
+                  -DWITH_XKBFILE=ON \
+                  -DWITH_XINERAMA=ON"
+
+PACKAGES =+ "libfreerdp"
+
+LEAD_SONAME = "libfreerdp.so"
+FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
+
+PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
+
+python populate_packages_prepend () {
+    freerdp_root = d.expand('${libdir}/freerdp')
+
+    do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='libfreerdp-plugin-audin')
+
+    do_split_packages(d, freerdp_root, '^(rdpsnd_.*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='libfreerdp-plugin-rdpsnd')
+
+    do_split_packages(d, freerdp_root, '^(tsmf_.*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='libfreerdp-plugin-tsmf')
+
+    do_split_packages(d, freerdp_root, '^([^-]*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='')
+}
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
new file mode 100644
index 0000000..fd7f74c
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -0,0 +1,21 @@
+# Copyright (C) 2010-2012, O.S. Systems Software Ltda.
+# Released under the MIT license
+
+include freerdp.inc
+
+inherit gitpkgv
+
+PV = "1.0.2+gitr${SRCPV}"
+PKGV = "${GITPKGVTAG}"
+
+EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF"
+
+SRCREV = "f311acaffb9190567e2b478a98d7cbfaf2709f6b"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-1.0"
+
+S = "${WORKDIR}/git"
+
+PNBLACKLIST[freerdp] ?= "Installs into double prefix, causing all files installed in /usr/usr and empty packages"
+# freerdp-1.0.2+gitrAUTOINC+f311acaffb: freerdp: Files/directories were installed but not shipped
+#       /usr/usr
+#       ....
diff --git a/meta-oe/recipes-support/nonworking/freerdp/freerdp.inc b/meta-oe/recipes-support/nonworking/freerdp/freerdp.inc
deleted file mode 100644
index 34dac4b..0000000
--- a/meta-oe/recipes-support/nonworking/freerdp/freerdp.inc
+++ /dev/null
@@ -1,51 +0,0 @@
-# Copyright (C) 2010-2012 O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license
-
-DESCRIPTION = "FreeRDP RDP client"
-HOMEPAGE = "http://www.freerdp.com"
-DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib pulseaudio pcsc-lite libxkbfile libxinerama"
-SECTION = "x11/network"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-inherit pkgconfig cmake
-
-EXTRA_OECMAKE += "-DWITH_PULSEAUDIO=ON \
-                  -DWITH_PCSC=ON \
-                  -DWITH_CUPS=ON \
-                  -DWITH_FFMPEG=OFF \
-                  -DWITH_CUNIT=OFF \
-                  -DWITH_X11=ON \
-                  -DWITH_XKBFILE=ON \
-                  -DWITH_XINERAMA=ON"
-
-PACKAGES =+ "libfreerdp"
-
-LEAD_SONAME = "libfreerdp.so"
-FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
-
-PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
-
-python populate_packages_prepend () {
-    freerdp_root = d.expand('${libdir}/freerdp')
-
-    do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
-        output_pattern='libfreerdp-plugin-%s',
-        description='FreeRDP plugin %s',
-        prepend=True, extra_depends='libfreerdp-plugin-audin')
-
-    do_split_packages(d, freerdp_root, '^(rdpsnd_.*)\.so$',
-        output_pattern='libfreerdp-plugin-%s',
-        description='FreeRDP plugin %s',
-        prepend=True, extra_depends='libfreerdp-plugin-rdpsnd')
-
-    do_split_packages(d, freerdp_root, '^(tsmf_.*)\.so$',
-        output_pattern='libfreerdp-plugin-%s',
-        description='FreeRDP plugin %s',
-        prepend=True, extra_depends='libfreerdp-plugin-tsmf')
-
-    do_split_packages(d, freerdp_root, '^([^-]*)\.so$',
-        output_pattern='libfreerdp-plugin-%s',
-        description='FreeRDP plugin %s',
-        prepend=True, extra_depends='')
-}
diff --git a/meta-oe/recipes-support/nonworking/freerdp/freerdp_git.bb b/meta-oe/recipes-support/nonworking/freerdp/freerdp_git.bb
deleted file mode 100644
index 0e9bf06..0000000
--- a/meta-oe/recipes-support/nonworking/freerdp/freerdp_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-# Copyright (C) 2010-2012, O.S. Systems Software Ltda.
-# Released under the MIT license
-
-include freerdp.inc
-
-inherit gitpkgv
-
-PV = "1.0.2+gitr${SRCPV}"
-PKGV = "${GITPKGVTAG}"
-
-EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF"
-
-SRCREV = "f311acaffb9190567e2b478a98d7cbfaf2709f6b"
-SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-1.0"
-
-S = "${WORKDIR}/git"
-- 
2.6.0


