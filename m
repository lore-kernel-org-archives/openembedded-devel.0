Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5EEE46010B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 12:05:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id k184so21865489wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=r6LgDHEL4zlIwA6C1NBnRyvGmkhZUrI+T90hVmz+pTs=;
	b=Gvz1gy5mwuvzxzzTE9WrC0qz4P8gFGGtUOdAgGSqC5qfwkC6kKLZ1rfJcpZ16bDJoB
	RFkFTRLTpN0vTj1jYh48RAqYH0MYPQEky5uFTG077fNgj4DfMp/vynaEQqu/3m9yGUvV
	f+yKVMThj+Clila8wYR8yhXbWf+cC2SC5eLk9fuxEZ+BJR3zAsyFG5hO6JqVONd71KUI
	GPfLd1dQn+QLVT2NaxjVmUq84qx69rJSUziUxbAy682inaM+7tmYdBR/W+tsJKoTy4Sd
	YnH7gxblv7gcBrcgT/WbDwOQCgxvlCDjZMLvrSXNS/dtFAeZFfptrJiRsmAHnk6ok+aJ
	eLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r6LgDHEL4zlIwA6C1NBnRyvGmkhZUrI+T90hVmz+pTs=;
	b=IxW5zDR9u2QXQ16wtaogJqhG6U3LTt04Smm5r58cA0v3p84yq6odbye9kdhY8/JVVp
	FEPCuB7wVzrtKvE9tkxTbV7KCuvvo8Yn+Q1q6Yyz33AqPDEzGHzUZqGdrMTM/9QYqZQ8
	rQTqQl+6wKp+v4V+N3LNZ9PrG1+Tq/eM7SaoG4TrnROXGt4X+qt9POblPdkssqG/JWpd
	88fIofcX8PAur4T6sZ0A2OmCS3lPGzgSdy5I3QM7g1gNDXZHiAJt0S/xwGrsQqqw67/h
	7YVyy8Z1Nn3yGokgNUXhzrBGJMzCI/OMjYeZvgCAoYA4AG0evljh7tvDuSO/5TiTRVBe
	GP9A==
X-Gm-Message-State: ALyK8tJNmOCeqnyrXzd8vxxPPCLYKhLijeJc/nmGFY00Hg71RUsDH9JpJjnT4BcFzQNTrQ==
X-Received: by 10.28.181.146 with SMTP id e140mr5775385wmf.38.1465905933889;
	Tue, 14 Jun 2016 05:05:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	vv1sm32656073wjc.34.2016.06.14.05.05.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jun 2016 05:05:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jun 2016 14:05:48 +0200
Message-Id: <20160614120548.10035-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-oe][PATCH] libgphoto2, v4l-utils: blacklist, not compatible with libjpeg-turbo-1.5.0
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
X-List-Received-Date: Tue, 14 Jun 2016 12:05:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb   | 3 +++
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
index 3de6942..f0e8b13 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
@@ -53,3 +53,6 @@ FILES_${PN} += "${nonarch_base_libdir}/udev/* ${datadir}/hal"
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
 FILES_${PN}-dev += "${libdir}/*/*/*.la"
 
+# | ../../libgphoto2-2.5.8/camlibs/ax203/jpeg_memsrcdest.h:4:1: error: conflicting types for 'jpeg_mem_src'
+# |  jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+PNBLACKLIST[libgphoto2] ?= "Not compatible with libjpeg-turbo-1.5.0"
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
index 75a42a2..1141bff 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
@@ -43,3 +43,7 @@ FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
 FILES_libv4l-dev += "${includedir} ${libdir}/pkgconfig \
                      ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
                      ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
+
+# | ../../../v4l-utils-1.6.2/lib/libv4lconvert/jpeg_memsrcdest.h:4:1: error: conflicting types for 'jpeg_mem_src'
+# |  jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+PNBLACKLIST[v4l-utils] ?= "Not compatible with libjpeg-turbo-1.5.0"
-- 
2.9.0


