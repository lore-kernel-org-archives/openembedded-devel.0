Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id F33726FF78
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2016 00:47:43 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w84so2136550wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 17:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5O6uDncNawKHpXvZ0eAZDyi7H1mq43dOFGp0ULFbSk8=;
	b=Z1YUTB/sf0QccecF9L0PFdO6lG4ntsS1bOXHWpzJ/2dS/wyAqTZ5jgfUI5P7/2oGFi
	pKDdWd+syxaIIzPFt48h+3EcoPWQke65WtVcsY4Xx+9OAgtYWCbDhVk5cPoUBkzvZ1UB
	/1uBUGaQZNKR2B9+5F5xkLd91uUyi8iTrykehaXqagSR4Xw+Q8GmEwwRbXjqNTOWmCxV
	wO0lDaZ5XselDk8xZP3qjNL7f1p0E+DK82dp23Bs0/p4a7oDNwnzz6lIiFiB8npLjUgJ
	rQS67lsNvj7M0s6HYB3oW1d9nwq3wRMerWvyaqhVyYi0vwUoVAcAYmjcn0/BCE7y4r4Z
	bxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5O6uDncNawKHpXvZ0eAZDyi7H1mq43dOFGp0ULFbSk8=;
	b=mGj4GWbhJKzgywjaGUmIWYZOATv4AGODSrE/d1HEJoZ3yqjIi2ggessw89FaHxh/p7
	+ui7M00hfKukcDVELqt+KFaE1aP1rJyirFH4hZy7tekCLV3TS/ciQ8pKc5rRznP7ULen
	Vx/XmtE3uqZjqeAvL7flnNURyWzPRE9FOP/LYacDAMULA8FodbRAbL3xxFTs4LC2DBg0
	GGQFGkxqCQVtrCoocykZ6ORf8wauZfliTFlAB9PVNlwvXX5QJ6CBY59hrEpUiyYrFCYc
	vXkGFey0Po2ZS9sNFsy9YO6wU14M5jriWjE0GpRMb+5q2AL4ZAFvhIFaBQZfYidoQy6k
	knEQ==
X-Gm-Message-State: AE9vXwPyWLGcMAJf+G5NjvRNAmEfmgOSQiuhkhs7BMMEhfHO3yrxijCfXu8zJ7CzmkWRdw==
X-Received: by 10.28.206.75 with SMTP id e72mr3813612wmg.65.1474159663174;
	Sat, 17 Sep 2016 17:47:43 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0635.dip0.t-ipconnect.de.
	[79.223.6.53]) by smtp.googlemail.com with ESMTPSA id
	a1sm15415116wju.41.2016.09.17.17.47.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Sep 2016 17:47:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2016 02:47:25 +0200
Message-Id: <1474159646-8902-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/2] fftw: build all configurations by one recipe
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
X-List-Received-Date: Sun, 18 Sep 2016 00:47:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* avoids conflicts installing same files into sysroot
* for packages requiring a specific version of fftw: simply add fftw to DEPENDS
* no need for some distro decision - recipes depndong on fftw take what they
  need
* each executable is packed into an own package to avoid dragging in all
  libraries

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/fftw/fftw.inc       | 25 ------------
 meta-oe/recipes-support/fftw/fftw_3.3.4.bb  | 62 ++++++++++++++++++++++++++++-
 meta-oe/recipes-support/fftw/fftwf_3.3.4.bb | 11 -----
 meta-oe/recipes-support/fftw/fftwl_3.3.4.bb |  9 -----
 4 files changed, 61 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fftw/fftw.inc
 delete mode 100644 meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
 delete mode 100644 meta-oe/recipes-support/fftw/fftwl_3.3.4.bb

diff --git a/meta-oe/recipes-support/fftw/fftw.inc b/meta-oe/recipes-support/fftw/fftw.inc
deleted file mode 100644
index a0adf59..0000000
--- a/meta-oe/recipes-support/fftw/fftw.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "FFTW"
-SECTION = "libs"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PROVIDES = "virtual/fftw"
-
-RPROVIDES_${PN} += "libfftw3"
-
-SRC_URI = "http://www.fftw.org/fftw-${PV}.tar.gz"
-
-S = "${WORKDIR}/fftw-${PV}"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-fortran --enable-shared --enable-threads"
-
-do_configure_prepend() {
-    echo 'AM_PROG_AS' >> ${S}/configure.ac
-}
-
-PACKAGES =+ "lib${BPN}"
-FILES_lib${BPN} = "${libdir}/lib*.so.*"
-
-# rename binary in /bin and use u-a tpo choose between different precision implementations?
diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
index 990f01e..cbcd1b9 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
@@ -1,6 +1,66 @@
-require fftw.inc
+DESCRIPTION = "FFTW"
+SECTION = "libs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
+SRC_URI = "http://www.fftw.org/fftw-${PV}.tar.gz"
 SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
 SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
 
+inherit autotools pkgconfig
+
+# we had multiple recipes in the past
+PROVIDES = "fftwl fftwf"
+
+EXTRA_OECONF = "--disable-fortran --enable-shared --enable-threads"
+
+do_configure() {
+    # configure fftw
+	mkdir -p ${B}
+    cd ${B}
+    # full (re)configure
+    autotools_do_configure
+    mv ${B} ${WORKDIR}/build-fftw
+
+    # configure fftwl
+	mkdir -p ${B}
+    cd ${B}
+    # configure only
+    oe_runconf  --enable-long-double
+    mv ${B} ${WORKDIR}/build-fftwl 
+
+    # configure fftwf
+	mkdir -p ${B}
+    cd ${B}
+    # configure only
+    oe_runconf --enable-single ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)}
+    mv ${B} ${WORKDIR}/build-fftwf
+}
+
+do_compile() {
+    for lib in fftw fftwl fftwf; do
+        cd ${WORKDIR}/build-$lib
+        autotools_do_compile
+    done
+}
+
+do_install() {
+    for lib in fftw fftwl fftwf; do
+        cd ${WORKDIR}/build-$lib
+        autotools_do_install
+    done
+}
+
+
+PACKAGES =+ "libfftw libfftwl libfftwf"
+FILES_libfftw = "${libdir}/libfftw3.so.* ${libdir}/libfftw3_*.so.*"
+FILES_libfftwl = "${libdir}/libfftw3l.so.* ${libdir}/libfftw3l_*.so.*"
+FILES_libfftwf = "${libdir}/libfftw3f.so.* ${libdir}/libfftw3f_*.so.*"
+
+PACKAGES =+ "fftw-wisdom fftwl-wisdom fftwf-wisdom fftw-wisdom-to-conf"
+FILES_fftw-wisdom = "${bindir}/fftw-wisdom"
+FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
+FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
+FILES_fftw-wisdom-to-conf = "${bindir}/fftw-wisdom-to-conf"
+
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
deleted file mode 100644
index 4a65986..0000000
--- a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require fftw.inc
-
-# conflicts with fftw and fftwl
-EXCLUDE_FROM_WORLD = "1"
-
-EXTRA_OECONF += "--enable-single \
-    ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)} \
-"
-
-SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
-SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
diff --git a/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb b/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
deleted file mode 100644
index 432ff12..0000000
--- a/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require fftw.inc
-
-# conflicts with fftw and fftwf
-EXCLUDE_FROM_WORLD = "1"
-
-EXTRA_OECONF += "--enable-long-double"
-
-SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
-SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
-- 
2.5.5


