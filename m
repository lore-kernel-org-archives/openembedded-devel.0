Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7B160196
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 13:56:16 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id c41so5970231yho.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=unEIDoGAOLGzWX/vnMCpNZXHMrc5jBwtP/E3G5fDRaM=;
	b=aO+oQjpVLtkIlR8f8eSixBVTVwlokvdBcf8b/ZkQbW7gQaMN1T+AQtVokQzS/xqTjD
	v304bFQhs18+xhQVPfTH/FuCv8l9fhS/n5Ocatif0mmWalTgr5KU/cQwkyHQ7iK/72Gq
	iBLZn8XZnvh+NfO/JtLPSPHvCfEutRKDCUhEzcPE4cy8LzZ5TmLFXOnXmR9kAbRhshGb
	jnAdf03Gsfb17VVKMeuYA4t0sPQwPrtyyG4UYZGEkfVwLl/EcddCq5qVfk/g2ZAAmMjB
	F3cScYuBWsm5wM8bcUvppUxSlsV2/jn1leYRDpCPjvMcEHt3P7FrVbpnb0Lvpd5hwIkO
	WkYg==
X-Received: by 10.236.111.2 with SMTP id v2mr69890282yhg.39.1404222976956;
	Tue, 01 Jul 2014 06:56:16 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	v63sm27995891yhi.43.2014.07.01.06.56.15 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 01 Jul 2014 06:56:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Jul 2014 10:56:02 -0300
Message-Id: <1404222962-18298-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] opencv: Disable 'gtk' backend if X11 is not available
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
X-List-Received-Date: Tue, 01 Jul 2014 13:56:19 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index df512f6..4059063 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -31,7 +31,8 @@ EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
 
-PACKAGECONFIG ??= "eigen gtk jpeg libav png tiff v4l"
+PACKAGECONFIG ??= "eigen jpeg libav png tiff v4l \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)}"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
 PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+,"
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
-- 
1.7.10.4


