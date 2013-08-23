Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id B4F166AE18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 13:43:14 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id g10so698003pdj.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 06:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lmsWRykVkWeWruHDalQqvEC3pPHLXoT2fyRqZzn6XUA=;
	b=Xt4Fp32Cxjz2B+zWoDmNaoeJpytGSJ8u82Zad41qNYFPWeVnAC60BW6ldOwUTyYWyy
	f56XrU20tYiXK/pbXj4CEZhQgXw2N566Bo2ChK6P4yPR9TsYHt5jes1ldXEJ+Nj4gFqP
	Q0Ehi6neGzBp5XWMME/EhxZlASBs2VpdLmbZZ0LoME3nyInTD9SI9qyGrEZosbbno6pA
	hvDbCUrEZMH/NjP5xZnF8O8oV4iz26SFpIQfU3RpgcF0OCLK0ghhQJ+cmHtNy2GrMa2u
	ov4KR/hZtWCralHF0Chwte78kO/u7LtflTQsYvhJOxddaPhz3No7g5r+cogIEP27bEpN
	1mSg==
X-Received: by 10.68.52.200 with SMTP id v8mr19294543pbo.48.1377265395795;
	Fri, 23 Aug 2013 06:43:15 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	mr3sm21611476pbb.27.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 06:43:15 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Aug 2013 23:38:44 +1000
Message-Id: <1377265124-14387-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-oe][PATCH] xf86-video-nouveau: new recipe
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
X-List-Received-Date: Fri, 23 Aug 2013 13:43:14 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../xorg-driver/xf86-video-nouveau_1.0.9.bb              | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb
new file mode 100644
index 0000000..7b52de0
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.9.bb
@@ -0,0 +1,16 @@
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4641deddaa80fe7ca88e944e1fd94a94"
+
+SUMMARY = "X.Org X server -- nouveau video driver"
+
+DESCRIPTION = "Open-source X.org graphics driver for NVIDIA graphics"
+
+DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
+            virtual/libgl xineramaproto libpciaccess"
+RDEPENDS_${PN} += "xserver-xorg-module-exa"
+
+COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+
+SRC_URI[md5sum] = "8b2c0df5de3929597ade8c5ddb489a44"
+SRC_URI[sha256sum] = "b247c800e532fad1c80a5666d8ca0d4e5712064b6d7a3b030b32206a8de04482"
-- 
1.8.3.4


