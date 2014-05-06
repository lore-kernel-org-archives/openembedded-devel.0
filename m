Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4933965F62
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 02:50:09 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 79so1588918ykr.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 19:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=zEWMs1tz19t+4e7TcnfLw+fy5heP97A2PktpR/5diD8=;
	b=HTimYz57vVtP7qg7BPEIdcKFx6hwLU8MrjvNzJle+URBRJijFEbKhCYJoJZTAI7S1g
	27Nr4Fku0mFNPTfc4HwjDh5aL00GNZ2+z2/H1UumL6aWCCTou4SSRfuidu1nvuwKI+eQ
	xlrnBTwtvVgzLO46HdE0ZEKO3xO6W2cQPULSRqqEIjPra/GRecB5869alKS/GuK6ZLbe
	0o8LOgYqFmLqXgn3YEu4MBFRrzyjCbjq7ClH598GlVtsj0XRErEgY/5a+UkUwfN3PBFG
	nG+TbPOHhU0q8nZfkuMLlU710x0HjdBxnMy7Zb19zV2gYNRzDRQ52bP5gv2PwadQsD/B
	+xTw==
X-Received: by 10.236.29.103 with SMTP id h67mr53644579yha.111.1399344610494; 
	Mon, 05 May 2014 19:50:10 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id z4sm19163481yhc.11.2014.05.05.19.50.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 19:50:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id EAC3A1AADFDB0; Mon,  5 May 2014 23:50:05 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon,  5 May 2014 23:50:05 -0300
Message-Id: <1399344605-8547-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] v4l-utils: Update to 1.0.1
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
X-List-Received-Date: Tue, 06 May 2014 02:50:14 -0000

This updates to last stable release and, as a plus, fix an out of tree
build failure.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb | 39 ----------------------
 .../recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb | 26 +++++++++++++++
 2 files changed, 26 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
deleted file mode 100644
index 485a416..0000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "v4l2 and IR applications"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
-                    file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
-
-PR = "r2"
-
-DEPENDS = "jpeg virtual/libx11"
-
-inherit autotools gettext
-
-# libv4l was absorbed into this, let OE know that
-PROVIDES = "libv4l"
-
-SRC_URI = "git://linuxtv.org/v4l-utils.git \
-           file://openat.patch \
-"
-# 54f16ca8183dd8ae8bf4ccc07949795aff0301f5 -> v0.8.8 tag
-SRCREV = "0298efdcd1153b8f719b9164548a3f0546f0cb7c"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev" 
-
-do_configure() {
-    # autotools_do_configure fails with:
-    # | configure.ac:139: error: required file 'build-aux/config.rpath' not found
-    autoreconf -vfi 
-    oe_runconf
-}
-
-PACKAGES =+ "rc-keymaps libv4l libv4l-dbg libv4l-dev"
-
-FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
-FILES_${PN} = "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-infrared.rules"
-FILES_libv4l += "${libdir}/libv4l/* ${libdir}/*.so.*"
-FILES_libv4l-dbg += "${libdir}/libv4l/.debug"
-FILES_libv4l-dev += "${libdir}/*.so ${includedir}/lib* ${libdir}/pkgconfig/lib*"
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
new file mode 100644
index 0000000..6c25c90
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "v4l2 and IR applications"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
+                    file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
+
+DEPENDS = "jpeg virtual/libx11"
+
+inherit autotools gettext
+
+# libv4l was absorbed into this, let OE know that
+PROVIDES = "libv4l"
+
+SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b06ea8b15e27cff352b4536e835448bc"
+SRC_URI[sha256sum] = "fc0132e82a18dfad9619be3abf50c206e2f449b1c14440cde36f25874fdce7df"
+
+EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
+
+PACKAGES =+ "rc-keymaps libv4l libv4l-dbg libv4l-dev"
+
+FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
+FILES_${PN} = "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-infrared.rules"
+FILES_libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
+                 ${libdir}/libv4l/*-decomp"
+FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
+FILES_libv4l-dev += "${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
-- 
2.0.0.rc0


