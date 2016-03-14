Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 26FBD70178
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 10:32:27 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id k12so47330lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 03:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7Gcag06ZK1/i2IV4iQ3fD6Nbzp5/eUdBbUEmo2sJuxI=;
	b=fm6BP/cRg4DoSVy2d+PN+NnXazptGHdxf2SVfmoHJpoXY3OJp3JUmoQYiJSFoieVPK
	GMvOremK+5M93PiYg+QkIa0yYZWzjr5wv6x/5K1Ey+SigNQ2zHSXhO+ef8vNZUcFtKr9
	IbOJNU+5IfJVqillXi0Oqrw7hZWKnd5klbhdqKa8HWAiGUZgtw2D+C/c3VjzCKeaGJ/f
	bC+OTEbgkCcKc1Ghxg/TwXqvQu/oHzpjkAR6DBlGbYQLq+F7aE4cL54iGWjql9G58/HG
	ig+icNZtoxc9PyuMT98ZmvmMdAmmewni5mqfGLOWvXiFX6xqrhgpyCR68LLgM31ue3/j
	QUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7Gcag06ZK1/i2IV4iQ3fD6Nbzp5/eUdBbUEmo2sJuxI=;
	b=bmtKuNFIwFCMn2kKUiSTlmmpRPU4+j0x1RqzNIOluQEHSY5wi32I8vyJA2ELvbtAcj
	gSGoN67HGbI3URKLkbkTJPlAJ1PxS0UsdRNDusm3q6sN+4Gfn+/UuxagQwXcsFtQClIH
	P2Jl14TirQGqik42Zmp+B02OdGyA8LjQYMZfzWA0QbpmCu1q8F2Kgyo5SF6RtMX/omBc
	qdmq4VyyJcpH9qJnoyV6XHCXfQbcoM3xbl2nI/eNfAyGJRb56Z0FRiUlwcXllLdMRtGw
	WXkYzu9nxOcsH7jLuKmfJxFuZyoBMoTwGwuiUbGJjnHduAl3wR5pk6xEn22NE8tBFAN1
	Z52A==
X-Gm-Message-State: AD7BkJJz5LIjDM04H72ZLvtTCCZSzPRXwrIgVGs69caLLPDfIDQPRo1PFRovgJ/v1Vq6Jg==
X-Received: by 10.112.171.70 with SMTP id as6mr7658169lbc.85.1457951548150;
	Mon, 14 Mar 2016 03:32:28 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	h134sm3561944lfh.3.2016.03.14.03.32.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Mar 2016 03:32:27 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2016 11:32:22 +0100
Message-Id: <1457951544-23279-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457951544-23279-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1457951544-23279-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 2/4] opencv: Remove blacklist
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
X-List-Received-Date: Mon, 14 Mar 2016 10:32:28 -0000

Version 3.0 builds fine with ffmpeg v3

[ 32%] Building CXX object
modules/videoio/CMakeFiles/opencv_videoio.dir/src/cap_ffmpeg.cpp.o
DEBUG: Shell function do_compile finished

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
index f6c4ca8fac16..1a34efa7f01f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
@@ -130,7 +130,4 @@ do_install_append() {
 
     install -d ${D}${datadir}/OpenCV/samples/bin/
     cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
-}
-
-# http://errors.yoctoproject.org/Errors/Details/40660/
-PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3"
+}
\ No newline at end of file
-- 
2.7.0


