Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7A14360269
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 18:21:56 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id w95so1247372wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 10:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SqeNAA7BRkHkH6qfsK/k/5N9CIYlc4TRxoVzaPjPZrc=;
	b=Lpi3HnPQDfr2O/As2VMx5LDPiXY8HAx7PqtVeJyC0CIs0ahwyDLvBkbBzwfYk59TeC
	wMcK3rFx9GMKX5c7nC3C/gkZr208AWv0qNMZdmgKX2IEzwSdmu0LuaFz8Et1Qgx1boUd
	asboS1T6wD2kjUCfQxHsT6tbGVKh6JgQNAytkVxuS44kenjTXp/R0nhxQDssk1eX3MvT
	e5sUZiWn4MFvTBE6LE/yhmXQ6cKAJJCiGyTVC8Cf+2I61uuz4aODK5cPJepMjvYSP5Zo
	sJWiSwJ14Osf0g8qWcOlDhNrzwOc1Ag8wDz1QNwwMaqtv0alUEzmxc6TA5FgewIO5mEy
	NDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SqeNAA7BRkHkH6qfsK/k/5N9CIYlc4TRxoVzaPjPZrc=;
	b=jMGXBZie8ZMUpjo3kSJ44eKwk5I3yiXhBWyPq14ASD0jGWgIoGGm3E7TdjkOQhVooX
	acfVDT1EgTORqWOn0hTymjEhQIh+3lWG9potZ0JK1grXGkmUDbcnIvQ8f4WRsqz1l9/2
	XefR8G+/L4ryjW2PlclVNd3KIJhKI/HreF/WARSN12VmAdS7kqakD2DCKtpXxoDeqLst
	u83AwS4zVQ7OJQ7vtXNCwSNABcC5Mx4A6ejgVGqpZm1Apc1b/oGtmCsoDZYSEyGPEPuF
	VP44v45xBtCWjbZLIU2Qz3jGnxiqHOWOJGTxBoSf40x1PDFUUCVx0Bqa0kzCmYv0aIVi
	Oa1Q==
X-Gm-Message-State: AKGB3mLZP/BlPAUTK7CR0ytdxIA9i/n9qCcKdz37WlTCKc6FTJC8C1mQ
	2+SYK4idA7OknOX6NdnzywwtNQ==
X-Google-Smtp-Source: ACJfBouKnlXcjWOsNiGveXchJpABJEsVYKSVU8KZZsmdo/22wOOcdjkKDoGAXzYLyBdS86NqDvI6Yg==
X-Received: by 10.223.182.19 with SMTP id f19mr14677615wre.81.1513534916965;
	Sun, 17 Dec 2017 10:21:56 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC3E4151E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc3:e415:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 139sm7762637wmp.7.2017.12.17.10.21.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 10:21:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Dec 2017 19:21:37 +0100
Message-Id: <20171217182144.21123-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171217182144.21123-1-schnitzeltony@gmail.com>
References: <20171217182144.21123-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][V2 1/8] gvfs: update 1.32.1 -> 1.34.1
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
X-List-Received-Date: Sun, 17 Dec 2017 18:21:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* --with-archive-includes and --with-archive-libs were removed in [1]
* --enable-gtk was removed in [2]
* build tested with full (except cdda) and empty PACKAGECONFIG
* run tested with PACKAGECONFIG = "archive gcr libmtp libgphoto2 samba systemd"
* fixes long delay when unmounting memory sticks

[1] https://git.gnome.org/browse/gvfs/commit/configure.ac?id=03fbe16aebced70118f070f898d7b459e1125580
[2] https://git.gnome.org/browse/gvfs/commit/configure.ac?id=dff13283c943c8b10265bd3925d86f17cdc4be6f

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/{gvfs_1.32.1.bb => gvfs_1.34.1.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.32.1.bb => gvfs_1.34.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.32.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.34.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.32.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.34.1.bb
index d380688..8d7865f 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.32.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.34.1.bb
@@ -8,15 +8,13 @@ DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2 polkit sha
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.md5sum] = "cbe766b46f324e17d7abcfb4a89a1684"
-SRC_URI[archive.sha256sum] = "d0b6c9edab09d52472355657a2f0a14831b2e6c58caba395f721ab683f836ade"
+SRC_URI[archive.md5sum] = "44012824aa75797a7d272cd60f07b488"
+SRC_URI[archive.sha256sum] = "7ef9b2aec234004271a575118a0e35b3c36ce3309e5f9da109635651843372b4"
 
 EXTRA_OECONF = " \
     --disable-gdu \
     --enable-udisks2 \
     --disable-documentation \
-    --with-archive-includes=${STAGING_INCDIR} \
-    --with-archive-libs=${STAGING_LIBDIR} \
 "
 
 PACKAGES =+ "gvfsd-ftp gvfsd-sftp gvfsd-trash"
@@ -46,7 +44,6 @@ PACKAGECONFIG[afc] = "--enable-afc, --disable-afc, libimobiledevice libplist"
 PACKAGECONFIG[archive] = "--enable-archive, --disable-archive, libarchive"
 PACKAGECONFIG[avahi] = "--enable-avahi, --disable-avahi, avahi"
 PACKAGECONFIG[gcr] = "--enable-gcr, --disable-gcr, gcr"
-PACKAGECONFIG[gtk] = "--enable-gtk, --disable-gtk, gtk+3"
 PACKAGECONFIG[http] = "--enable-http, --disable-http, libsoup-2.4"
 PACKAGECONFIG[libmtp] = "--enable-libmtp, --disable-libmtp, libmtp"
 PACKAGECONFIG[libgphoto2] = "--enable-gphoto2, --disable-gphoto2, libgphoto2"
-- 
2.9.5


