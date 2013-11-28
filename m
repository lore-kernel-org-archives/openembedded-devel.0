Return-Path: <nickdademo@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id AD4086D82F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 02:39:11 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id q10so11121917pdj.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=c+DYWOt/7RpUfIaoGUCNAG835cR1A4gHqiRYvX0DV8Y=;
	b=JPb4UNes+fyJWtWHNO68TRIL1PBpK+OP4R0rSyRqWzKOvVGk7RZAyt71Z4n+dGivLw
	cXIHpjMfNRCKDx7MEE+3Z5jmn95VCRXaUcYmN/IdWqaeh759uvaMsuqI3MMkCTO6+SjL
	4+h6q24DyEvmZajKVkC6vk0cy0s/MEeDMcJcbQiMxwmYht+imYW2PN3vcklqkkuJxwFo
	ccOO6bMsbxhpakw7ErEfjKVxakn7c2qGD8cAQDet5KVBScCkBdNf/bEeBPRX4pY6QTV9
	vAVjhaTIEKMBclrsGRIrZ2wWMEwdxC6A2xSC/Rl6PPBQCC5anGUUzPuSOWV6J6GQzavG
	+KLg==
X-Received: by 10.68.217.129 with SMTP id oy1mr8311086pbc.23.1385606351186;
	Wed, 27 Nov 2013 18:39:11 -0800 (PST)
Received: from localhost.localdomain
	(d110-32-96-161.meb801.vic.optusnet.com.au. [110.32.96.161])
	by mx.google.com with ESMTPSA id qz9sm90012001pbc.3.2013.11.27.18.39.09
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 18:39:10 -0800 (PST)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Nov 2013 13:38:38 +1100
Message-Id: <1385606318-6049-1-git-send-email-nickdademo@gmail.com>
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
X-List-Received-Date: Thu, 28 Nov 2013 02:39:12 -0000

Pass LIB_SUFFIX to CMake during a multilib build so that the generated library folder has the correct suffix.

Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 9dd9cd0..df89b0a 100644
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
+                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
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


