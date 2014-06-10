Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A201E6FDFD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 17:17:55 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id k14so6875252wgh.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4d+IGqPaNdGf3+opcp2ljNGZ1UkGIRg/59A9lJFfjxg=;
	b=vRRH9GeOy937ImyC79BYcBN86DsjupS/Aby4pFO3s+oxa1fQl7uSkWwgcm6pMVbuhu
	84Btf4+BOdOC/doL7qpFOIXy5gE4iIixpfFXF230m4dvsCuLCtFHG8xng29XMjND0PBU
	7za0TguEyijx+mp+xfGi0/04gA7Ub188lSMRuzQuJGSpvLMb+FYkV9Rb6Ghytg/8Zoxr
	1xCHRJlJjrBiifuOnqsGHqYKbmxTfuey1LPMgyCC0dKxG1eP9z4xIFLz4+RoKiNOv8bO
	MjOQItx4Y0r0KN3NOpi+bsdxBitDrKI1pVGuY/HeewksNHpEPbfBp2PR4baLOWnyYquB
	I/2w==
X-Received: by 10.15.99.75 with SMTP id bk51mr333401eeb.21.1402420676334;
	Tue, 10 Jun 2014 10:17:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w6sm53387958eef.20.2014.06.10.10.17.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jun 2014 10:17:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jun 2014 19:18:14 +0200
Message-Id: <1402420694-17957-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-efl][PATCH] efl: add PACKAGECONFIG for c++11 and disable it by default
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
X-List-Received-Date: Tue, 10 Jun 2014 17:17:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index deca4bf..7ccb634 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -51,6 +51,9 @@ PACKAGECONFIG_class-native = "luajit"
 PACKAGECONFIG[opengl-full] = "--with-opengl=full,,virtual/libgl"
 PACKAGECONFIG[opengl-es] = "--with-opengl=es,,virtual/libgles2"
 PACKAGECONFIG[opengl-none] = "--with-opengl=none,,"
+# be aware when enabling this for efl-native, we don't provide gcc-native so you need to make
+# sure that all your builders have g++ which supports -std=gnu++11
+PACKAGECONFIG[c++11] = "--enable-c++11,--disable-c++11"
 PACKAGECONFIG[gstreamer] = "--enable-gstreamer,--disable-gstreamer,gstreamer"
 PACKAGECONFIG[gstreamer1] = "--enable-gstreamer1,--disable-gstreamer1,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
-- 
2.0.0


