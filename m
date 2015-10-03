Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 755807707C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 20:30:43 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so73061237wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 13:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Tldz06K5v+1SichMXFoC8GpkFq4C5oyN6RvVURXmdMY=;
	b=QdkGtO6nh+YxusB/3FjukzIhjb2sv0gPno4LnHVD5Y9tIWxRThvxSqI+KrORb0bdSj
	hgp0qqRIPlR01F9+1NoyzZ6y5yN4zCKis9VgzN26JfSibprQddoeQ0jPcigDtsLCFOvZ
	tQG1wlxlGh9tWAFhkkz0BlvYq1NJXPYX2URP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Tldz06K5v+1SichMXFoC8GpkFq4C5oyN6RvVURXmdMY=;
	b=PHnwWAlhI7M/42QK0sjtEOp09HuLEOEDiKmQxgMJjq6gDoomDpc0e5ptwkEle0+h/a
	xK8JSBWU4ZdZqqhlhXkshr97Cbr0xTAI/RgKkk0EaPu3B3r4PuukABrnmB9zhSE7yRpc
	RHKGerX9cIJL1qTGR2rA/vbuAntCPbFv+o9N7UeXqFAL6PoXmxWWNT5KmAsT7YSFfO8r
	JRHbtTu8MYFOMOcbxj4VWMgHWcTvRyk3/CydcBJk7tx7Pz/XyHHoELF4ILU3ogvScNhv
	UKeKj1TuTPgbU10X1c/UXwLdWiJZ6NNR6EIX0NV0El8loPAAyebEXzrmY07E4chZBWiq
	5eWA==
X-Gm-Message-State: ALoCoQmOKkc3B2HiNvd9yB+ICED+3Ksl4JgC5WfxBkna6qeOu+9yVRxgj4tGGqPKrollxgo/VaY8
X-Received: by 10.180.10.197 with SMTP id k5mr3579971wib.22.1443904243498;
	Sat, 03 Oct 2015 13:30:43 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-187-70.w2-13.abo.wanadoo.fr. [2.13.130.70])
	by smtp.gmail.com with ESMTPSA id o10sm5799799wia.4.2015.10.03.13.30.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Oct 2015 13:30:42 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Oct 2015 22:35:10 +0200
Message-Id: <1443904510-21743-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/3][meta-multimedia] libmediaart-2.0: Add recipe
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
X-List-Received-Date: Sat, 03 Oct 2015 20:30:46 -0000

libmediaart 1.9.0 is a new version of the libmediaart
library, API-incompatible with the older 0.x one.

libmediaart-2.0 is needed to build Rygel, but as the 1.0
version is still needed, let us build them both if required.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.0.bb |  7 +++++++
 meta-multimedia/recipes-support/libmediaart/libmediaart.inc          | 14 ++++++++++++++
 meta-multimedia/recipes-support/libmediaart/libmediaart_0.7.0.bb     | 14 +-------------
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


