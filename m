Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4992673694
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 12:52:03 +0000 (UTC)
Received: by qgii95 with SMTP id i95so55755648qgi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 05:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=dOnXUANI3Xsw0vNE12O8VBqDT05xyjp55wKgfWAPNBo=;
	b=eWnuTak7BiX+4Mekb7ME3n3fg9+nPUmGJmkw6A6bybyhXhQ4S3uklemEJHur3YVVQG
	9wQ/EvaFC0U0U+L5qzwYZmsERErmrlppdUFebw0yauoremymQ/pWYgX8qpNnmLJ2q3Wi
	YkP8xH7LlBLyla544HvRk7ZvrbSss/50nNxbeqqaG8QsTC2qS1hWsDi++JARUtxdXKxN
	1bj7XwpUiR7eEBNnfv4OtEGrrkt/QNbxmEY2i7XZqI13EErfcfcvfdD0DrpZi9MQ/q8k
	4CIMdj7A/n2YS+SpWyM7xAz/K65Ooeh+Rq69wHCGdKr24oKd00AbasGNpSLu6ugK4nFL
	PJ/g==
X-Received: by 10.140.91.81 with SMTP id y75mr53340303qgd.3.1437483123698;
	Tue, 21 Jul 2015 05:52:03 -0700 (PDT)
Received: from localhost ([179.105.243.19]) by smtp.gmail.com with ESMTPSA id
	o3sm12683672qga.36.2015.07.21.05.52.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jul 2015 05:52:02 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 21 Jul 2015 09:51:57 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jul 2015 09:51:53 -0300
Message-Id: <1437483116-22509-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.6
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2 1/4] opencv: Only enable 'libav' support if commercial license is whitelisted
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
X-List-Received-Date: Tue, 21 Jul 2015 12:52:07 -0000

The libav support requires the commercial license to be
whitelist. This makes opencv to work in non-commercial setups without
needing to change the PACKAGECONFIG settings manually.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 2754616..f8946f4 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -30,8 +30,9 @@ EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
 
-PACKAGECONFIG ??= "eigen jpeg libav png tiff v4l \
-                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)}"
+PACKAGECONFIG ??= "eigen jpeg png tiff v4l \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
+                   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
 PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+,"
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
-- 
2.4.6


