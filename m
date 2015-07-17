Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7A84865CBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 12:04:45 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so68038664qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 05:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=m9hkxvOnyjRmq62y3EaeJ7oBMRxmzdAb30MVXg8EuaA=;
	b=M6oHEWihLxEN8vjUjQE82JQ6BxeKvsgITlG4fqSWmzygG6za5pSEDU44u5mWeN2x4T
	KNsMSY80dA3F88yP0k3q3nBlbDkDboMcyMlRnmaNBiilsBoMIpiB7lI8NtADiPL0TbEU
	vSh3a9D9UUpnWNE9VDnNXBHhhPOgey/m8eTSemp9LE4oC+KhUCC4k3Wy8SsmQuy5bBxf
	eIzb9n5pom64FUT4ruwSsw+2ZaQo4Ax1E49QqsOS/lcKypijhqPBQPT/riy1RrjBT9jn
	L12tcz8Bbzjc3YEEdE0DJI5KTqW3EtHvOkCADWUtRnObQEPV8ox9+jc+hRf6I9wvcqZE
	jK0Q==
X-Received: by 10.55.43.95 with SMTP id r92mr24331020qkh.67.1437134685401;
	Fri, 17 Jul 2015 05:04:45 -0700 (PDT)
Received: from localhost ([179.105.243.19])
	by smtp.gmail.com with ESMTPSA id p15sm679064qkh.10.2015.07.17.05.04.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jul 2015 05:04:44 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 17 Jul 2015 09:04:38 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jul 2015 09:04:37 -0300
Message-Id: <1437134677-27263-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.6
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] opencv: The 'v4l' PACKAGECONFIG should disable libv4l as well
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
X-List-Received-Date: Fri, 17 Jul 2015 12:04:47 -0000

When disabling the Video 4 Linux support, the libv4l should be
disabled as well.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index f8946f4..3ef49da 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -39,7 +39,7 @@ PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
 PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
-PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+PACKAGECONFIG[v4l] = "-DWITH_V4L=ON -DWITH_LIBV4L=ON,-DWITH_V4L=OFF -DWITH_LIBV4L=OFF,v4l-utils,"
 PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
 
 inherit distutils-base pkgconfig cmake
-- 
2.4.6


