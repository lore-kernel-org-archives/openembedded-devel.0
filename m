Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id BD7F97F94B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 21:37:03 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id t8so5975051lfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 14:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=jdlKZRi6Ov36vmmR9owsKaSGmIIKIDGt6OQFiAEp3HM=;
	b=ebo4MqXyECtr+I+SYqyAcjZafjT/Lt8UtMCkrbkeVq9/liCnofDujvLS0jZCwfWUEd
	Z4oz8eE0p5sm0aQ4GTLJ/69kPEgRDUyrJzyQQqwJPb/hwJtZPt7XGwn7Gz9i9WimPos3
	Gov/w//NvMXky0XHYUZ3kx2/7US99r+qqYJWSqsGfi2zObGPZeBrFOuY0HiesOz1sDEg
	Px2BhcAk1YLSZTJoZPo4Goi82eZgFvpAZV95nWdHq7v7cahwjbfuzD54lyER5365uEc6
	nWDMgzjXMKYc/xrZk7tD0V+Wtq+VStoLilkZzI48p+QR2zib/q/IWNAxtIaaCrGcsv+g
	ep+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jdlKZRi6Ov36vmmR9owsKaSGmIIKIDGt6OQFiAEp3HM=;
	b=jkyee1dZ1uZPEXGB2II3pds8X9LkaH/YXyvDCQtAzHogSoV0t0tt4G7+hqQV9zTBax
	pWBVfxovX4859FmZNAF0wPodQXzTy/G3Xf66VqSJy8rQEb4k4p8z61CIsnPYKJa6rmq9
	TJ0LbzdnegidjQzruE/sbCBdjF4jmG/8pOxLTEzYqdXdVikVmvEfZ0lnwj3c75oLxZYZ
	Jg7VCoQrAEs4eN1d27NgcmQiNZ//wweGVhZejg7FdUF14iQIelSXSO4hagAaGpWYYSsd
	gISnLG+j4SfNf7jXWSyoiruM3d1Rl2R/GaUIYDD5nNChckXG+lC+cfBp8Oz4sTOMJk9w
	B56A==
X-Gm-Message-State: APjAAAX5YsEvTzukgtyIZcTYjMkEaVvpebOlmPDjX4dIrmWP06ENnJqC
	hG6jCoRtubrrMKB5YCRa2A+EeWTUDUQ=
X-Google-Smtp-Source: APXvYqy/HByi8SbV8CS9w1wqXDbJ9xcEm7m0yhSkDBr6D/HOXCAAJ6DbqlczcrOxEC9iTa2Aj3joYw==
X-Received: by 2002:ac2:5483:: with SMTP id t3mr10116186lfk.39.1569015424030; 
	Fri, 20 Sep 2019 14:37:04 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	l23sm716619lje.106.2019.09.20.14.37.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 14:37:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Sep 2019 23:36:59 +0200
Message-Id: <20190920213659.4820-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] xf86-video-nouveau: update to 1.0.16
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
X-List-Received-Date: Fri, 20 Sep 2019 21:37:04 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...-video-nouveau_1.0.15.bb => xf86-video-nouveau_1.0.16.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-nouveau_1.0.15.bb => xf86-video-nouveau_1.0.16.bb} (78%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.16.bb
similarity index 78%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.16.bb
index 2b1b87c4d..3966867ee 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.16.bb
@@ -15,6 +15,5 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "717203cb87029cddcbccf7398f9ad8c3"
-SRC_URI[sha256sum] = "aede10fd395610a328697adca3434fb14e9afbd79911d6c8545cfa2c0e541d4c"
-
+SRC_URI[md5sum] = "ecd9be89d853301167e3d564c49f7a8e"
+SRC_URI[sha256sum] = "304060806415579cdb5c1f71f1c54d11cacb431b5552b170decbc883ed43bf06"
-- 
2.17.1


