Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 53A9476E70
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 22:42:42 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x185so2112848qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 15:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HHlLvRs5HJCIUnpoHI5Q5VzqhRLHPptSFlbAG79blzo=;
	b=HeL4EPsA6qjp69abjrzimGgWOIiS6WuS0ah4BE7fJyZFR+skQdQHiP9Vo/KMFxhjFJ
	nWg29l/t+MeR7i1iZT21sMjqyFFd0NX7Oy49+nSKA7lUckMIs32wWwRlU0qKbM30Ov0P
	Vm6yfbTfypYokNKCMWqp/4hKPq2u5KY71jpJDFxIHKvEDLKACCV/Hk8mpSo0zXRuqqjz
	vsrd6hrQk6dWq81MLXM3qi0T3FjBMyDJRQhyLfRZRU0+xoA+CTrvcVLudDq5En2fsGKF
	ik0FVdRNj42pWglAYZf3+wQjQ7kgepfvEfZqptMxUYeQBkLpzVKV3Tl1tSrTBqFEMYMG
	LEvA==
X-Gm-Message-State: AEkooutFQsjK/bzw+yEr+f1I1Uu9+iEiFf8iBHD1MRql5zz+KG5Yv7S3ELFRtfi+bVuymQ==
X-Received: by 10.55.19.23 with SMTP id d23mr999451qkh.230.1470782563689;
	Tue, 09 Aug 2016 15:42:43 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	m10sm21663492qta.31.2016.08.09.15.42.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 15:42:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 18:42:31 -0400
Message-Id: <1470782552-5625-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/2] devicekit-power: remove obsolete package that was migrated to upower in 2010
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
X-List-Received-Date: Tue, 09 Aug 2016 22:42:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../devicekit/devicekit-power_014.bb               | 30 ----------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta-oe/recipes-support/devicekit/devicekit-power_014.bb

diff --git a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
deleted file mode 100644
index c2b7e66..0000000
--- a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Devicekit power"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=756cf97871f77233638937da21b025d3"
-
-DEPENDS = "libusb-compat libusb1 udev glib-2.0 dbus-glib polkit intltool-native libgudev"
-
-SRC_URI = "http://upower.freedesktop.org/releases/DeviceKit-power-${PV}.tar.gz;name=archive"
-SRC_URI[archive.md5sum] = "935d37f1e14b3c8a1d6dabcd9a38d3ca"
-SRC_URI[archive.sha256sum] = "ad3e9a8bd9525d66fadc7fa53ef99e0632aa8cca8fd5bc27483956261153b373"
-
-S = "${WORKDIR}/DeviceKit-power-${PV}"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = " --with-backend=linux"
-
-do_configure_prepend() {
-    sed -i -e s:-nonet:\:g ${S}/doc/man/Makefile.am
-    sed -i -e 's: doc : :g' ${S}/Makefile.am
-}    
-
-FILES_${PN} += "${datadir}/dbus-1/ \
-                ${datadir}/polkit-1/ \
-                ${base_libdir}/udev/* \
-"
-
-FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
-
-
-
-- 
1.9.1


