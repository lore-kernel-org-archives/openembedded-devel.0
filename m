Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B1B727887B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 10:10:08 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id r78so10229230wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 02:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SqeNAA7BRkHkH6qfsK/k/5N9CIYlc4TRxoVzaPjPZrc=;
	b=PIBh0pGnlkVHhe5d34hjLb195mbEjKaIHPLy8fBhwRGMEbZq6otelEI0H/w8RpAY4V
	sEcVtRMEPctZvgKFlvGjRxiKkD4OUJRcFM/tHfFogrFaZ8mQPxKG6NsLRnb7nu/4DPFo
	vst0YeP8ZMdEoXRsgecXDCI7huF+IkL/PllCkbFax0c7TjYl+52yRJny/iQSYlC+okHj
	yEh4Xoo2OBbJSS+DCXPTVYySmOzwtS4klpJM4yMwh4VPZegZ1+QAL1ncwJNQVDR6ESIo
	otR/hGG57+nAA6rPwjKXH2RfoNieS18EAxwirF1bWqjn4X6ht5p481xc1WQQS+/Ljkjy
	QPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SqeNAA7BRkHkH6qfsK/k/5N9CIYlc4TRxoVzaPjPZrc=;
	b=npEHRUzMu5X5FPfz8NSL5IO7PVUuFL3rvIdBiKuMvCJb8V2M/6NZ+y2FSzQzMPTMe2
	AVTZdiRlvMXc2yEzyO42IA/erFpA1aiB56Q1fckiJrcG0rmdmnXuOB5dHrnhsHizIK3S
	pIrjodvta6qBFodbEuIjq2wLqwzfvOomYFyOUPirA9WQc8lxvdF7T/wPRYX88o4i/TcQ
	rLylvvnS4ctLtpD9VPfeuZHqLaafsZHjcTeIRsk/VJBjDbZiM4fkjBDoTS+0goAg6L/J
	sQELmAnYt5uj5ESQIBp6TqJPJ09VTxrNnmPkr9Xl5eE+bDjK5foMvNZUaQCJmzGjqE66
	E2xg==
X-Gm-Message-State: AKGB3mIxiugqSKDGEzsGnkDFOlo7xUYwRpzJ6PYL7BTVlH4X2zBUDHB4
	VpxNychf7u6Xoa6TfzntTlB65Q==
X-Google-Smtp-Source: ACJfBotGKApGhpi4zre3Pxde5UXwTR/PN4Vv0Q6yeHdfNgE1Zuw1xx9po3SJgAgN34nJbK90S6ttdw==
X-Received: by 10.28.153.210 with SMTP id b201mr1844948wme.2.1513246209346;
	Thu, 14 Dec 2017 02:10:09 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id c3sm1840174wrf.21.2017.12.14.02.10.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 02:10:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 11:09:26 +0100
Message-Id: <20171214100929.11094-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171214100929.11094-1-schnitzeltony@gmail.com>
References: <20171214100929.11094-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] gvfs: update 1.32.1 -> 1.34.1
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
X-List-Received-Date: Thu, 14 Dec 2017 10:10:09 -0000
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


