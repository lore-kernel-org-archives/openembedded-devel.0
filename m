Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6ED60EFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 12:08:32 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so5580629wgg.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Aug 2014 05:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fyVJB6BD+t0IcAUoIAxxG/+Gt4dLAlMyp/AaobPm9Hs=;
	b=U5bzFtTF10o6u8oY3czZiniqimZGm6oKgCiHeS5Xq7IYnJ8gNuojUIo763cCx4m0cC
	Ci6qvn4TordXXPkwlZfajU2Bx49xbQJK1wRlVWJhLLtR36/zsBN0spPcDLG1lQWNb8UR
	bk/xurWO/yQazZ/+PJtP+QEe4vUoMr22YgMlP9mJFok/5rR97MRx2oIYExkhDlBNvccl
	RaTzXRwmjKHo+0dJTtL1EF11idYYPIGPKtfTrxMP/4U3An+Y4vT2AL0eYbsNldmFUf4n
	so0aububfsjwvCFSulFfAaePak1pQF375pXuh0hvym/0fz7dLvZpafvtFT7IbHAo/j57
	X4pA==
X-Received: by 10.180.198.100 with SMTP id jb4mr3875815wic.72.1407499713491;
	Fri, 08 Aug 2014 05:08:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v14sm16935870wjw.38.2014.08.08.05.08.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 05:08:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Aug 2014 14:09:03 +0200
Message-Id: <1407499743-22969-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-oe][WIP][PATCH] openal-soft: disable examples, convert alsa and pulseaudio to PACKAGECONFIGs
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
X-List-Received-Date: Fri, 08 Aug 2014 12:08:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/openal/openal-soft_1.15.1.bb       | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
index d11b4d8..ab038a7 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
@@ -5,16 +5,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=facc3a8f452930083bbb95d82b989c35"
 
 inherit cmake
 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-"
-
 SRC_URI = "http://kcat.strangesoft.net/openal-releases/${BP}.tar.bz2"
 SRC_URI[md5sum] = "ea83dec3b9655a27d28e7bc7cae9cd71"
 SRC_URI[sha256sum] = "0e29a162f0841ccb4135ce76e92e8a704589b680a85eddf76f898de5236eb056"
 
-EXTRA_OECMAKE = "-DALSA=${@base_contains('DISTRO_FEATURES', 'alsa', 'TRUE', 'FALSE', d)} \
-                 -DPULSEAUDIO=${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'TRUE', 'FALSE', d)} \
+PACKAGECONFIG ?= "\
+    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
 "
+PACKAGECONFIG[alsa] = "-DALSA=TRUE, -DALSA=FALSE, alsa-lib"
+PACKAGECONFIG[pulseaudio] = "-DPULSEAUDIO=TRUE, -DPULSEAUDIO=FALSE, pulseaudio"
+# currently doesn't work with libav-9
+# PKG_CHECK_MODULES(FFMPEG libavcodec>=53.61.100 libavformat>=53.32.100 libavutil>=51.35.100)
+# but alffmpeg.c:418:44: error: 'AV_CH_LAYOUT_MONO' undeclared (first use in this function)
+PACKAGECONFIG[examples] = "-DEXAMPLES=TRUE, -DEXAMPLES=FALSE, libav"
 
 FILES_${PN} += "${datadir}/openal"
-- 
2.0.4


