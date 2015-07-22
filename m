Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4CDC875791
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 19:47:21 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so160299900qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 12:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=dOnXUANI3Xsw0vNE12O8VBqDT05xyjp55wKgfWAPNBo=;
	b=AMrUFXHMSeJg84Sd9jxFaMR3ZvuBr6CQqkUBvBuhUKf240SN4Jdv01Cr9FyO+/GJqT
	CDNyUM/J6aKkE/NmrlXvrq+aOmpzI2POLXZQur68scc0vttdpDJDTEhyOxwJMJ3ipG0/
	EJnvXLVhop1thwVGGAKTHsGoonZaPVugYlOrB+ES1JUMYAoVAY6GAPZph1c9D8uRyDo3
	bemWI7C/JBS6+cJql0YSq2Ts2LO+wqb0SdfxbOznjfWJD2rL5koEygKecov6MRj8uhG3
	VUlbOLnPJK7DrDQcRvS+68/n2Dm/B9S9LjcMBUzFByc5ZAjILlAAuW8zV/70VsfFKwYe
	Vz5g==
X-Received: by 10.140.39.133 with SMTP id v5mr6514902qgv.34.1437594441619;
	Wed, 22 Jul 2015 12:47:21 -0700 (PDT)
Received: from localhost ([179.105.243.19]) by smtp.gmail.com with ESMTPSA id
	y11sm1209200qky.42.2015.07.22.12.47.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jul 2015 12:47:20 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 22 Jul 2015 16:47:14 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Jul 2015 16:47:06 -0300
Message-Id: <1437594429-21142-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.6
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 1/4] opencv: Only enable 'libav' support if commercial license is whitelisted
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
X-List-Received-Date: Wed, 22 Jul 2015 19:47:23 -0000

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


