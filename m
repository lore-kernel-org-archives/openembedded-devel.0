Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1574260C14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 07:32:47 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so8357231eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 00:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=PteVINjFX1FNHJUs4NYSRuipIBpkgKjZnVHkoyaYtm8=;
	b=yGjZHoOA/6dsv1lJlthdwpiBIOFm7Pc7B64TAaOh5doc44WOjRt8c3q3RK41CsmkIC
	/UcQTx0PoFXAwoJepbwaTbN2jOimZp+y55wUtHZ3aaIByGhps5ptF4IN36s0Ec7TRvh1
	7+8WLmmXHDDD1HZF/rTmeHxo4UZpotgynxJrL/2IIA8Wv6O5TRKIyyreGQbW7XOZXd3D
	QVD6Q0KM7D8111mnede4IuwgkH4qhiTV8Oyx3I6fluvU9LmC8Jekn3Gr5th0h8d7vtB3
	gyTVgNHBqyaa3rbX/3t3ftLhsvFZt3Atl3AvAYlc/bxahYJOhDbW2WBgAkMsVzbmcxTb
	TNwA==
X-Received: by 10.15.34.197 with SMTP id e45mr548801eev.112.1397633567884;
	Wed, 16 Apr 2014 00:32:47 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-162.unitymediagroup.de.
	[178.200.247.162]) by mx.google.com with ESMTPSA id
	a42sm55485161ees.10.2014.04.16.00.32.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Apr 2014 00:32:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Apr 2014 09:32:29 +0200
Message-Id: <1397633550-19323-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1397633550-19323-1-git-send-email-schnitzeltony@googlemail.com>
References: <1397633550-19323-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] evince: make nautilus extension a PACKAGECONFIG and disable by default
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
X-List-Received-Date: Wed, 16 Apr 2014 07:32:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
index 263765f..5aa485e 100644
--- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Evince is a document viewer for document formats like pdf, ps, djvu"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
-DEPENDS = "gnome-icon-theme gnome-doc-utils-native libgnome-keyring nautilus tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
+DEPENDS = "gnome-icon-theme gnome-doc-utils-native libgnome-keyring tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
 
 PR = "r5"
 
@@ -17,7 +17,6 @@ SRC_URI[archive.md5sum] = "ebc3ce6df8dcbf29cb9492f8dd031319"
 SRC_URI[archive.sha256sum] = "2a4c91ae38f8b5028cebb91b9da9ddc50ea8ae3f3d429df89ba351da2d787ff7"
 
 EXTRA_OECONF = " --enable-thumbnailer \
-                 --enable-nautilus \
                  --disable-scrollkeeper \
                  --enable-pixbuf \
                  --disable-help \
@@ -28,6 +27,9 @@ do_install_append() {
     install -m 0755 ${S}/data/icons/48x48/apps/evince.png ${D}${datadir}/pixmaps/
 }
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[nautilus] = "--enable-nautilus,--disable-nautilus,nautilus"
+
 RDEPENDS_${PN} += "glib-2.0-utils"
 
 PACKAGES =+ "${PN}-nautilus-extension"
-- 
1.8.3.1


