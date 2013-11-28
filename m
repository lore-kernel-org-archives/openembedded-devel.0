Return-Path: <nickdademo@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 90D576D8D7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 02:23:48 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id uo5so11589370pbc.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JTp7Kglyn0fhPKaVBlLAPJuE/3WxzBe1eb6T4fyRJ/k=;
	b=irQi3Btf28PJkUTMZf8BffpXV+1wGhbjViOnGLpN5Os16SRwTxfcM1efwE4z6tbXXK
	netQrfZRTqeV7FCOfRhUk2hUqq9yVbUPEQp6CEpoIo4RxnbDsLTXQ1VVgkl2uJYXWGJA
	kZi67lgGTbFahWSSwT54XladJIQMpa5YKLiozhjzUM4jHH5Z83ReD6Ox7Af+t33adk28
	yKHKwhRtXbS+jUu2ViJpQhp9eEHLbWbHwwzD6PrrxNGUei5S4raQ7Ih855Fr6ki0j/+a
	mhEJAN9+X/9/ceGQ4uXN2zaa6u7CkvwyooG9r3R27gyjbMktdxLVBvxcpMdHrkNFwomx
	p6Lw==
X-Received: by 10.68.136.34 with SMTP id px2mr8159827pbb.113.1385605428169;
	Wed, 27 Nov 2013 18:23:48 -0800 (PST)
Received: from localhost.localdomain
	(d110-32-96-161.meb801.vic.optusnet.com.au. [110.32.96.161])
	by mx.google.com with ESMTPSA id vh3sm58044040pbc.8.2013.11.27.18.23.44
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 18:23:46 -0800 (PST)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Nov 2013 13:23:03 +1100
Message-Id: <1385605383-5772-1-git-send-email-nickdademo@gmail.com>
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
X-List-Received-Date: Thu, 28 Nov 2013 02:23:49 -0000

Pass LIB_SUFFIX to CMake during a multilib build so that the generated library folder has the correct suffix.

Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 8d4d8da..df89b0a 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -27,8 +27,8 @@ EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
                  -DWITH_GSTREAMER=OFF \
                  -DCMAKE_SKIP_RPATH=ON \
                  ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
-                 ${@bb.utils.contains("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@bb.utils.contains("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
+                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
 
 PACKAGECONFIG ??= "eigen gtk jpeg libav png tiff v4l"
-- 
1.7.9.5


