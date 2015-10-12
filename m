Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id D5E74766DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 11:39:10 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so145372049wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=cy/cWGaROMPNtjeGV/MAkEAtDHzLbmGXN01juLhAuJY=;
	b=H3rxb47rgsB1jaKurKK96Pd1huuUfLG3ee1BgI5jUuHZzAxbWwou4DF1FfuetzDl4F
	PNC56zxVB7ckzSmOIqZOqCCfVOLTZvK7GkgdSwA0dlF1spi+2jSVqNLhyktUcPNnAvFp
	nSkHLLFcDkE/LKPH/nZBqRnNjH0cyfueUa960=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=cy/cWGaROMPNtjeGV/MAkEAtDHzLbmGXN01juLhAuJY=;
	b=H2YLo8jICHzEil410iN0hBBN9utcf+7f7MBAh3gaNfwcSFyqzlUumFgXPjAPylsLaC
	8HWb3BEun6vMt1ndhKCwlgYWENa+D/4D0w06+XLITiJo9Vjk1km0BfmUYU5jtaLQCBc2
	5ndiUaWSESlZaQWqOKpPCckACX2PnjQNcWQ5IziP+Ny6ibv7O3tu+dhpElhzolUq4i8z
	KHP2rRBcujQJT1bJHYSYsuQ/dr55sxGsTVABXJZyTlOfYYO5A0rfRssdgaCITbXP43Fi
	OXsE/FMux5EAolSVG//gggYGjnlkgY2G8ClOXQ22yOnfNXgaBK7pjn/NFhKJipKei6Vw
	Hswg==
X-Gm-Message-State: ALoCoQmL+9iYS4d8EXJmi5dCoSJk4Wkn9gwKP2D3zfhMctKSrWZeiVsGWyeWIVHzUyUf5BSSbI5D
X-Received: by 10.194.48.81 with SMTP id j17mr28891743wjn.81.1444649950117;
	Mon, 12 Oct 2015 04:39:10 -0700 (PDT)
Received: from centos7.vannes.iot ([46.18.96.42])
	by smtp.gmail.com with ESMTPSA id
	pk7sm19389727wjb.2.2015.10.12.04.39.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Oct 2015 04:39:09 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Oct 2015 13:38:38 +0200
Message-Id: <1444649918-14947-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2 1/4][meta-multimedia] libmediaart-2.0: Add recipe
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
X-List-Received-Date: Mon, 12 Oct 2015 11:39:11 -0000

libmediaart 1.9.0 is a new version of the libmediaart
library, API-incompatible with the older 0.x one.

libmediaart-2.0 is needed to build Rygel, but as the 1.0
version is still needed, let us build them both if required.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../recipes-support/libmediaart/libmediaart-2.0_1.9.0.bb   |  7 +++++++
 .../recipes-support/libmediaart/libmediaart.inc            | 14 ++++++++++++++
 .../recipes-support/libmediaart/libmediaart_0.7.0.bb       | 14 +-------------
 3 files changed, 22 insertions(+), 13 deletions(-)
 create mode 100644 meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.0.bb
 create mode 100644 meta-multimedia/recipes-support/libmediaart/libmediaart.inc

diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.0.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.0.bb
new file mode 100644
index 0000000..44f135a
--- /dev/null
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.0.bb
@@ -0,0 +1,7 @@
+require libmediaart.inc
+
+SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
+SRC_URI[md5sum] = "0b65d64398d2f3dff89534c9dfffab4f"
+SRC_URI[sha256sum] = "94668adb29d4dc3115b0fd105942ebd5ca6f5f9dbb2afa8a191a73a747dd506f"
+
+S = "${WORKDIR}/libmediaart-${PV}"
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart.inc b/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
new file mode 100644
index 0000000..a117e9b
--- /dev/null
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
@@ -0,0 +1,14 @@
+SUMMARY = "Library tasked with managing, extracting and handling media art caches"
+
+LICENSE = "LGPLv2+ & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
+                    file://libmediaart/extract.c;endline=18;md5=dff2b6328ab067b5baadc135f9876c36 \
+                    file://tests/mediaarttest.c;endline=18;md5=067106eaa1f7a9d918759a096667f18e"
+
+DEPENDS = "glib-2.0 gdk-pixbuf"
+
+GNOME_COMPRESS_TYPE = "xz"
+
+inherit gnomebase gtk-doc
+
+EXTRA_OECONF = "--disable-introspection --disable-qt --enable-gdkpixbuf"
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb
index ed7f079..eb45974 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb
@@ -1,16 +1,4 @@
-SUMMARY = "Library tasked with managing, extracting and handling media art caches"
+require libmediaart.inc
 
-LICENSE = "LGPLv2+ & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
-                    file://libmediaart/extract.c;endline=18;md5=dff2b6328ab067b5baadc135f9876c36 \
-                    file://tests/mediaarttest.c;endline=18;md5=067106eaa1f7a9d918759a096667f18e"
-
-DEPENDS = "glib-2.0 gdk-pixbuf"
-
-GNOME_COMPRESS_TYPE = "xz"
 SRC_URI[archive.md5sum] = "1a44933d4cd0064e3c76d8d0ddacddc9"
 SRC_URI[archive.sha256sum] = "3a9dffcad862aed7c0921579b93080d694b8a66f3676bfee8037867f653a1cd3"
-
-inherit gnomebase gtk-doc
-
-EXTRA_OECONF = "--disable-introspection --disable-qt --enable-gdkpixbuf"
-- 
1.8.3.1


