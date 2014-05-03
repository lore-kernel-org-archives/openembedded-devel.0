Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 41F1D6028A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 May 2014 07:23:30 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bj1so6579503pad.15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 May 2014 00:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+HDiePv4thzaJcVKSLLIInQFL1PeG3FMp6DzQMTH/SA=;
	b=fU2QZ0pcckSQNNdnBV+ltuwxO6UJ6Wo18sv0vws8s3zvoMaOLMI4B1CsRlkOc77O7C
	d67H9yClOeCWeuzLfvTW77Bi8kVYrGNe5MfLlmyxQCT6G+lKuywW0fLyD/3aaDDxabf9
	iw00XQnkk+lbFaCsrYHD+JZAMpQWI9FEF+51P7GSKf8aZZAxHoO3V/Hr/oOcFA3SZrNI
	MgZDyWRneZL88zROcvM4dUJGJoJj7uIngQlPulbSqK8TIn4dVdZmKDCa/aBG1Zqm1a1r
	TsK2NPj37ITKXpHTty8dVyQkFuROh//20XX18HIdRvYf+1A3h7+TzP3XfSx1mHjJEAAK
	yOvg==
X-Received: by 10.66.150.228 with SMTP id ul4mr44971930pab.16.1399101811485;
	Sat, 03 May 2014 00:23:31 -0700 (PDT)
Received: from t420s.entropic-communications.com ([12.199.200.26])
	by mx.google.com with ESMTPSA id
	vo1sm11592491pab.32.2014.05.03.00.23.30 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 May 2014 00:23:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 May 2014 00:23:01 -0700
Message-Id: <1399101781-5560-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] libjpeg-turbo: update 1.3.0 -> 1.3.1
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
X-List-Received-Date: Sat, 03 May 2014 07:23:32 -0000

This commit also modifies SRC_URI to fetch a release tarfile instead
of checking out from SourceForge SVN and makes some minor updates to
the jpeg-tools DESCRIPTION text.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb    | 39 ++++++++++++++++++++++
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb     | 36 --------------------
 2 files changed, 39 insertions(+), 36 deletions(-)
 create mode 100644 meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb
 delete mode 100644 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb
new file mode 100644
index 0000000..d30811e
--- /dev/null
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
+HOMEPAGE = "http://libjpeg-turbo.org/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
+                    file://jpeglib.h;endline=14;md5=a08bb0a80f782a9f8da313cc4015ed6f \
+                    file://djpeg.c;endline=9;md5=7629c51aed78174711c20a40194a8f1b \
+"
+
+BASEPV = "${@d.getVar('PV',1).split('+')[1]}"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}-${BASEPV}.tar.gz"
+SRC_URI[md5sum] = "2c3a68129dac443a72815ff5bb374b05"
+SRC_URI[sha256sum] = "c132907417ddc40ed552fe53d6b91d5fecbb14a356a60ddc7ea50d6be9666fb9"
+
+S = "${WORKDIR}/${PN}-${BASEPV}"
+
+# Drop-in replacement for jpeg
+PROVIDES = "jpeg"
+RPROVIDES_${PN} += "jpeg"
+RREPLACES_${PN} += "jpeg"
+RCONFLICTS_${PN} += "jpeg"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--with-jpeg8 "
+
+PACKAGES =+ "jpeg-tools libturbojpeg"
+
+DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
+FILES_jpeg-tools = "${bindir}/*"
+
+FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
+INSANE_SKIP_libturbojpeg = "dev-so"
+
+BBCLASSEXTEND = "native"
+DEPENDS = "nasm-native"
+
+LEAD_SONAME = "libjpeg.so.8"
diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
deleted file mode 100644
index fa4acfd..0000000
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
-HOMEPAGE = "http://libjpeg-turbo.org/"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
-                    file://jpeglib.h;endline=14;md5=a08bb0a80f782a9f8da313cc4015ed6f \
-                    file://djpeg.c;endline=13;md5=03db065044529233c296324be85530ab \
-"
-PV = "8d+1.3.0"
-SRCREV = "988"
-SRC_URI = "svn://svn.code.sf.net/p/libjpeg-turbo/code;protocol=svn;module=trunk"
-
-S = "${WORKDIR}/trunk"
-
-# Drop-in replacement for jpeg
-PROVIDES = "jpeg"
-RPROVIDES_${PN} += "jpeg"
-RREPLACES_${PN} += "jpeg"
-RCONFLICTS_${PN} += "jpeg"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--with-jpeg8 "
-
-PACKAGES =+ "jpeg-tools libturbojpeg"
-
-DESCRIPTION_jpeg-tools = "The jpeg-tools package includes the client programs for access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files."
-FILES_jpeg-tools = "${bindir}/*"
-
-FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
-INSANE_SKIP_libturbojpeg = "dev-so"
-
-BBCLASSEXTEND = "native"
-DEPENDS = "nasm-native"
-
-LEAD_SONAME = "libjpeg.so.8"
-- 
1.8.1.2


