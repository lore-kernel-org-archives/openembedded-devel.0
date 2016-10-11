Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id EBC406AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 07:45:49 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id l131so2192437lfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 00:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t0vZ5YKl9gynuCBzu/fF+46lyBpsFmd6QoqN75C9zNc=;
	b=Bhi5Kk3TEgklKi4qo8VQpJaM+m+AqI1d8xo/2Mnv2pKCOsFtoEDGXWY51UZkzU6Wei
	qlmv9lcT83DIS973RiE1TVTm5wvMk1NhF/Yrps3qW9+AQOt9hhrujkNYP5UqL5hYMb+J
	4J0TYoI3vtlhywLuUE6wHgND77mqWRNh1wa8SMNiGOUtebD0chd9LhlIe+Y6LfNPf66B
	XXakrDEDmxsZje+qTGiY29IYQWcSzYwpakuJQ6P+GAGE1462P2jxGo2ZHem4Wk5Wxc38
	Qniut5/1dlN7E0BNGFuJSa69IYSZga+vqgVM8Rt/WSPBI+6q3Y/oYN/3pDWhjxwdjz4u
	3OWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t0vZ5YKl9gynuCBzu/fF+46lyBpsFmd6QoqN75C9zNc=;
	b=KAwJc53lpYrvLMLHEkb83Dy/EK0AULlcnEJ8jCadfO2/47J2BrOIvJiTmLm5y+KoSj
	ftKicW0hGcfm2XELd308tIGITTHW1jKDtTe3OSF/z8VS9ZpadVN7Vbw6hQt7p+8UnAKt
	hNv0ddJotUvUz5Mem0lmqx2DV0yYR2mHFlWIDZX8jmvKhhjCyNcywyTUy/jq0PCNdRG7
	g2axfXkFmnjEzvOfK8VdncyUM9q3Ui4Ldio2XYtC3qAdCtseSItoy5eUPES3qGrNlNap
	a049H49TBuOspQYUPpam5mPyqJKxXF+77A+uk08pvvrZOBuwCbDpogEijIm/Nf2GX6wt
	5bJg==
X-Gm-Message-State: AA6/9Rm0LSZOROBCC3BhRzPqgu3u7yqZe13NxFtXpvzzLFtUupuD29FZ9Dw1rUPHUMIbxQ==
X-Received: by 10.194.248.226 with SMTP id yp2mr2968722wjc.117.1476171950488; 
	Tue, 11 Oct 2016 00:45:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	qq7sm4069784wjc.30.2016.10.11.00.45.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Oct 2016 00:45:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2016 09:45:47 +0200
Message-Id: <20161011074548.5520-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161006080729.26628-1-Martin.Jansa@gmail.com>
References: <20161006080729.26628-1-Martin.Jansa@gmail.com>
Cc: Juhee Cho <juhee.cho@lge.com>
Subject: [meta-oe][PATCH 1/2] leptonica: add PACKAGECONFIG for giflib
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
X-List-Received-Date: Tue, 11 Oct 2016 07:45:50 -0000

From: Juhee Cho <juhee.cho@lge.com>

* make it easier to disable giflib

Signed-off-by: Juhee Cho <juhee.cho@lge.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
index 0aebe89..c32d24a 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "A pedagogically-oriented open source site containing software that is broadly useful for image processing and image analysis applications"
-DEPENDS = "jpeg tiff libpng zlib giflib"
+DEPENDS = "jpeg tiff libpng zlib"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=20cdd3af097ca431b82004c691f406a6"
 
@@ -11,7 +11,8 @@ EXTRA_OECONF += " \
     --without-libwebp \
 "
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "giflib"
 PACKAGECONFIG[openjpeg] = "--with-libopenjpeg,--without-libopenjpeg,openjpeg"
+PACKAGECONFIG[giflib] = "--with-giflib,--without-giflib,giflib"
 
 inherit autotools pkgconfig
-- 
2.10.1


