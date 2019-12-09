Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id D427B7FA49
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:38:53 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t2so14153569wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PT73Rtyca+LQJomrWwtryAmkbbvN/Pph4OZ51KoqNNw=;
	b=P6DDe4LR4WeeTclOlEHVXDKQO2w6XnR0kHFRRQYPF4L4Jiz0vka584TDrGpOSFt3Jf
	SPqUv8Q+5kwe06VPyRkPdWJkreY2PjSLH/hNx2JIfrOCU5Yt212StjlWWx+y+VHQwUuJ
	GLmk47TwHaPgwE2CKt8hpM3GJZXeww9mQt0jfz/ObmMBdBwl0edvxbMuHHF1I95dXd/E
	BLu5GIGQ1Cq2MMcpoBtXKZX2MC/bhbif2YIMA4b1CTE8YF0eQ8MEuBQRgl+uDtD6JZIa
	oEPqNvyWBudL+C9ZF8d20uuNm0dJ26ndAdIKX1YV9Dv63P5Qyf/1IoaDOQR2KQ7lTrQN
	MPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PT73Rtyca+LQJomrWwtryAmkbbvN/Pph4OZ51KoqNNw=;
	b=R0g4S/ftoGsEoZmXxmWgFNzVUcyAuEpES+FRbb4QNfFIoFImVOsTpU5W9epq/KXKOE
	m6cB6ov3BKPtIawepvp8lGxsVPCQqAQcMMu2kLbqHHrIEUQI1bF3cgo+U6VoWwG/shbO
	AJDkUAneBtmpr2u9PXamFGQtl3LTHdC5yesEE7j0aHRg2NGnpdABOkg8vm9JeeFqWkAv
	9XXJLb5i6trbzubqO9IeSqTonxX/xdbhaQbdmodbcnJdy5xvtLNcA3uDVTTHGFXogsJz
	sQxPyHpY4uBiW+q67lD+Un0MUrfoKq5aDXhz7nDj5jB93WpSEqsfGJB74wRHqFyfSET9
	8spQ==
X-Gm-Message-State: APjAAAV7qBWXeFLZ2/m0Q9HIpjLp4KBSGVqyXMSVNF1UxYXhYVSo9k1u
	KzWm6wfRhEyA9CfC8zp3Dak+ouCa
X-Google-Smtp-Source: APXvYqzVdO7zj8gYKQnfjjg4Iw8VFzlL76d88F09Snebn+rxhUCaRqRhmHbNfX0uZ/dhbNxQSSEubQ==
X-Received: by 2002:a05:6000:11c6:: with SMTP id
	i6mr27939726wrx.178.1575851934434; 
	Sun, 08 Dec 2019 16:38:54 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.38.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:38:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:14 +0100
Message-Id: <20191209003840.3383-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/29] libgsf: upgrade 1.14.45 -> 1.14.46
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
X-List-Received-Date: Mon, 09 Dec 2019 00:38:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* there have been no traces that gconf is still necessary
* while at it cleanup recipe

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ....ac-drop-a-copy-paste-of-introspection.m4-m.patch |  0
 .../libgsf/{libgsf_1.14.45.bb => libgsf_1.14.46.bb}  | 12 ++++--------
 2 files changed, 4 insertions(+), 8 deletions(-)
 rename meta-gnome/recipes-gnome/libgsf/{files => libgsf}/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch (100%)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.45.bb => libgsf_1.14.46.bb} (59%)

diff --git a/meta-gnome/recipes-gnome/libgsf/files/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch b/meta-gnome/recipes-gnome/libgsf/libgsf/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/libgsf/files/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
rename to meta-gnome/recipes-gnome/libgsf/libgsf/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.46.bb
similarity index 59%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.46.bb
index ac36ceb04..049320afc 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.46.bb
@@ -5,23 +5,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
 
 SECTION = "libs"
 
-DEPENDS= "libxml2 bzip2 glib-2.0 zlib intltool-native gnome-common-native"
+DEPENDS= "libxml2 bzip2 glib-2.0 zlib gnome-common-native"
 
-inherit autotools pkgconfig gnomebase gobject-introspection
+inherit gnomebase gobject-introspection gettext gtk-doc
 
+SRC_URI[archive.md5sum] = "5bc6d1d6394f0ed5a58e8f2e5e4ead7f"
+SRC_URI[archive.sha256sum] = "ea36959b1421fc8e72caa222f30ec3234d0ed95990e2bf28943a85f33eadad2d"
 SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
-SRC_URI[archive.md5sum] = "e45cc8aa9c49516d540b7d7307f755f1"
-SRC_URI[archive.sha256sum] = "5cbc2c0f1dc44d202fa0c6e3a51e9f17b0c2deb8711ba650432bfde3180b69fa"
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gdk-pixbuf] = "--with-gdk-pixbuf,--without-gdk-pixbuf,gdk-pixbuf"
 
 EXTRA_OECONF = "\
-    --disable-gtk-doc \
     --with-bz2 \
 "
 
-RDEPENDS_${PN} = "gconf"
-
 FILES_${PN} += "${datadir}/thumbnailers"
-- 
2.21.0


