Return-Path: <crg7475@mailbox.org>
X-Greylist: delayed 416 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Oct 2019 23:05:35 UTC
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id A8A377FA8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 23:05:35 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id D5E4BA4A23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 23:58:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	message-id:date:date:subject:subject:from:from:received; s=
	mail20150812; t=1572303519; bh=hXwMhpUjabsGAXCnhlbgyUUMwKx3/n9qb
	6fbJjdRXYw=; b=dzAtXWNLDwYH2w0T3pb3NsJSJSjSL0NWRKnhvZZLOqOrmkiWe
	WtdNKwRE7HSXrbHWel8ZdIsREogewUBGmIIoSt7IRhJskxPeVFHvbXRxPQsjB/+j
	AfXGu9rzuHKnbF2eMzS3K6wJb2424OSgQ7+X4Fz1Njf6KzydETOyxXhOhVj/jJmU
	QCmmunE55PjA1rSsk8UgARsdLDLM43pNGLrTpHpsInCzDoKr7lprneoVSRUyct1i
	T9dAj6R8JNOcCExr43hdoJgfJg0SmNuyoNRt3tsp57METcssrnmg2EHaRYdUdPsP
	5vEl5OCxlH+953qcVNdE+/p+M9hBFVhGCSYYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1572303519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc; bh=6QMAlNtkD+otfFP8Dc1RWBcF3dR+nX22n3KpTabdsxY=;
	b=erd4qlWJnOIsQkIczhhmB27XKeOIE9pYRWZFcfMgX4WaWQmszr4NrZ+LrRoFMA1ebRQFMX
	cXtsDYoct9FbuI8ZEb6FAJQTHSFqd2WzqfxnnsYhRIqvSJt+ul3ewypZCh5I+sg/2pN7kR
	fZk6Ldo5KA834VqNrzghGMramiUwRZeNy1mjINRWznQDVExJHJA/peWXGC8goCUuRTs3qZ
	Y/u9oF6IpwEFuh5VqfLk1NhuUsfhQ/fInwZlhxxjeAdwwnxrdCepOkrtRUyFLN92RqwPEZ
	En05+Ac3BcRbPK18uBEXpcJa2N8sawffz0BGByr333zxueiNrQoxptVvMOTLoQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
	[80.241.56.116]) (amavisd-new, port 10030) with ESMTP id xmbikKw1vrb6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 23:58:39 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 23:58:31 +0100
Message-Id: <20191028225831.16745-1-crg7475@mailbox.org>
Subject: [meta-oe][PATCH] opencv: Enable pkg-config .pc file generation
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
X-List-Received-Date: Mon, 28 Oct 2019 23:05:35 -0000

In OpenCV 4, .pc file generation is disabled by default. Yet, other
software such as GStreamer and FFmpeg rely on the .pc files during build
time configuration. Explicitely enable .pc file generation to make sure
pkg-config can be used for getting information about OpenCV.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index 77b5dd60c..5e89db097 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -64,6 +64,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     -DCMAKE_SKIP_RPATH=ON \
     -DOPENCV_ICV_HASH=${IPP_MD5} \
     -DIPPROOT=${WORKDIR}/ippicv_lnx \
+    -DOPENCV_GENERATE_PKGCONFIG=ON \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-- 
2.17.1


