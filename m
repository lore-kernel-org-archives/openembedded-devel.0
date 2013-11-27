Return-Path: <nickdademo@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 38A9F6C731
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:41:04 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id v10so9702991pde.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 02:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9CzEN4/vPvooxGGcvkqUmHvauEe29FF/IVGGJaoJmcc=;
	b=FUB/dKe4QzRXA3YjuXdymCap2PibXsmmuoQHWyJKgWZzkp/QsKHtN71V1Tla5uW8wP
	s1C1vEMW8RfOWKPFhAr8c12RO1AvRyIPSf2Xg+0YzqUfFEvkGxMYHkEwCXPwZzaWqyq2
	YTAbu+k0N/l1gwg6TewAeVK3V5GipS0LqZIY48BiN5eNwnkwt6yJ59QEh1PyagNMcsYQ
	RD+HFWlAABefu3jkSRdVpzmhX2aZn0uKxoH9ML808wHWLKXJkXYzg+Gj1zYG0sRUXbkv
	XDuxDh19c/TKIy+IoESk09NOdTBGZ1DodPmS4GNLWjxwWhJdk7ou7VlNXlvrmLogh11z
	Ff3w==
X-Received: by 10.66.163.164 with SMTP id yj4mr41138531pab.91.1385548863757;
	Wed, 27 Nov 2013 02:41:03 -0800 (PST)
Received: from localhost.localdomain
	(d110-32-96-161.meb801.vic.optusnet.com.au. [110.32.96.161])
	by mx.google.com with ESMTPSA id qz9sm85714165pbc.3.2013.11.27.02.41.01
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 02:41:03 -0800 (PST)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2013 21:40:30 +1100
Message-Id: <1385548830-6541-1-git-send-email-nickdademo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] opencv: bump SRCREV and make recipe multilib build compatible
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
X-List-Received-Date: Wed, 27 Nov 2013 10:41:04 -0000

Pass LIB_SUFFIX to CMake during a multilib build so that the generated library folder has the correct suffix.

Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 9dd9cd0..8d4d8da 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -9,7 +9,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
 
-SRCREV = "c5afaa4e8dfe507e87531f7688b9cf65c1f701c6"
+SRCREV = "1253c2101b22b9e89400553fd220858cda8d6ea5"
 SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
            file://opencv-fix-pkgconfig-generation.patch \
 "
@@ -27,6 +27,8 @@ EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
                  -DWITH_GSTREAMER=OFF \
                  -DCMAKE_SKIP_RPATH=ON \
                  ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
+                 ${@bb.utils.contains("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+                 ${@bb.utils.contains("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
 
 PACKAGECONFIG ??= "eigen gtk jpeg libav png tiff v4l"
@@ -88,4 +90,10 @@ RDEPENDS_python-opencv = "python-core python-numpy"
 do_install_append() {
     cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
     sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
+
+    # Move Python files into correct library folder (for multilib build)
+    if [ "$libdir" != "/usr/lib" ]; then
+        mv ${D}/usr/lib/* ${D}/${libdir}/
+        rm -rf ${D}/usr/lib
+    fi
 }
-- 
1.7.9.5


