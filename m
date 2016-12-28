Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7655D719E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:20:03 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id x140so15642732lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 05:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TUNaI6bMCqYfMygt151cdmvWtfkdBYt9X//4Px0Ecr4=;
	b=ej7lF4ezhGMn0k1Qbn46kuMe25dWz+ECKtHxpL58VFVdOEMpjc8rx47/1t+PCENvhK
	2YJpi2KrWwzYzalk5O200Kq6pSEp3xZ+piRKivAqMWyQefdRd63/OJ8Zv95NSc70HzqY
	pLhzVjOcebx4rjxuynwwFF7L8U8nxzlWbnuPqjCg/iAGqbZEBYeU+qhOdf3Rx/HqGQSk
	gv9lLDxHHmZtFUyRTJyyD2h2+SSc+211L5xwU0TH7fEEiuWH+qdT6MCTX6cBu4WiimDr
	xGD+X/kv0QMCi78k5cVAutLtWjyOWqP6UAl6xKOivwJPXYnyDwxiBiOxqUFUPzfAVJBi
	qRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TUNaI6bMCqYfMygt151cdmvWtfkdBYt9X//4Px0Ecr4=;
	b=oFEI4nlrtZcZS0Gur5Lta9ih+VjhRuzpckuhS+MXqcWTURPuXHIGww5dToQgS4/QPO
	Si3GTOXeiclVpy8pVUzZSVunD0YC84FXPH656pT/UTfSJtjkrY/hM5cOjqdMpOWNE6FD
	zmeLjW4gFeMQpFeP0zW5T4Sa+ofJ4gTwNMN/NzM7wFATF3ZvZlKtzDryR5ZT0yDsuzHq
	P5D2lwqCaG4p2eXFoZwEYzn1bl5U5ILl1iqasjJ09c60rXxwIeqDBV0DWi8XNyBpcSZy
	tV9Qr1hrrC/j0fIj9LlJ/64sjgthygD+Uc5ouO0FHECNEADWBYxomoZXxfGFNexAxECU
	+5tw==
X-Gm-Message-State: AIkVDXL1c30ezntQmekZ0T61HsjVprmpw5ADycjs0dXVTMWw7EPWb16G0oCFRiCSC9LfZA==
X-Received: by 10.25.160.20 with SMTP id j20mr2643715lfe.66.1482931204260;
	Wed, 28 Dec 2016 05:20:04 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	137sm11902825lfz.2.2016.12.28.05.20.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Dec 2016 05:20:01 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: martin.jansa@gmail.com, raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 Dec 2016 14:19:55 +0100
Message-Id: <20161228131956.29551-3-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161228131956.29551-1-ricardo.ribalda@gmail.com>
References: <20161228131956.29551-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 3/4] opencv: Add new PACKAGECONFIG text
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
X-List-Received-Date: Wed, 28 Dec 2016 13:20:04 -0000

Fixes dangling dependency on text contrib module

WARNING: opencv-3.1+gitAUTOINC+92387b1ef8-r0 do_package_qa: QA Issue:
libopencv-text rdepends on tesseract, but it isn't a build dependency,
	missing tesseract in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 2851233c01de..667623e71a41 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -69,6 +69,7 @@ PACKAGECONFIG[python2] = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${
 PACKAGECONFIG[python3] = "-DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"
 PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
 PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
+PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
 
-- 
2.11.0


