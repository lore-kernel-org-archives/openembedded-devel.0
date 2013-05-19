Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17k-000068-4t
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:57 +0200
Received: by mail-ea0-f180.google.com with SMTP id g10so3106128eak.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=C2GLGHpInJutAHqEipeXXxYJs6DmTTvRZqcRaJjK/Dk=;
	b=WCGHjAb/hZ4o2KP4OUPZ5eziN7WGsBxSTjxvOuUmGdLNQJTtKMlluZvpGOihnFWa0z
	3Tob12WHftRcRADjitjiXCCui9xXV73yhKEkZ+/HT4vWvUhzI1PlZLV9tjUe5hqhwzu4
	RfkvYUTt65tPjXr1+Ab2aUdLMZVXfYFa3tNljZtKfYB9Cg+xqBbkAYI+EoPsK0hwvNC0
	kOSJmab//826iGMA1wFFw0m4znmm+7qNa/aCX8Eq/1KRpeeUzmEDc/CfSQ5fw5ES3zrb
	BI8tjaqmiWgqK5EQDuyK0nADLPn4nTHkuRmZOom+Kxoww2f3AXrsLQBUFiVBYLsjbCWp
	Xn6w==
X-Received: by 10.14.107.200 with SMTP id o48mr74097600eeg.35.1368959257909;
	Sun, 19 May 2013 03:27:37 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:12 +0200
Message-Id: <1368959233-28288-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe++/master 10/11] evince: fix build with gcc 4.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 May 2013 10:45:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

warning/errror was:
tiff2ps.c:1131:4: error: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'tsize_t' [-Werror=format=]
    chunk_size, tiled_image ? "tiles" : "strips");
    ^
cc1: some warnings being treated as errors

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../evince/0001-tiff-fix-compile-warning.patch     |   33 ++++++++++++++++++++
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb   |    7 +++-
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-compile-warning.patch

diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-compile-warning.patch b/meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-compile-warning.patch
new file mode 100644
index 0000000..ebc8976
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-compile-warning.patch
@@ -0,0 +1,33 @@
+From 00b5e55c90477eeac02bec58f032cb6916a1eb5c Mon Sep 17 00:00:00 2001
+From: Hib Eris <hib@hiberis.nl>
+Date: Mon, 20 Feb 2012 21:36:16 +0100
+Subject: [PATCH] tiff: fix compile warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ backend/tiff/tiff2ps.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/backend/tiff/tiff2ps.c b/backend/tiff/tiff2ps.c
+index c0dc0bf..fc63c2e 100644
+--- a/backend/tiff/tiff2ps.c
++++ b/backend/tiff/tiff2ps.c
+@@ -1127,8 +1127,8 @@ PS_Lvl2page(TIFF2PSContext* ctx, TIFF* tif, uint32 w, uint32 h)
+ 	}
+ 	buf_data = (unsigned char *)_TIFFmalloc(chunk_size);
+ 	if (!buf_data) {
+-		TIFFError(ctx->filename, "Can't alloc %u bytes for %s.",
+-			chunk_size, tiled_image ? "tiles" : "strips");
++		TIFFError(ctx->filename, "Can't alloc %u bytes for %s.",
++			(uint) chunk_size, tiled_image ? "tiles" : "strips");
+ 		return(FALSE);
+ 	}
+ 
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
index f1c3563..6197564 100644
--- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
@@ -4,11 +4,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
 DEPENDS = "gnome-icon-theme gnome-doc-utils-native libgnome-keyring nautilus tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
 
-PR = "r4"
+PR = "r5"
 
 inherit gnome pkgconfig gtk-icon-cache gsettings
 
-SRC_URI += "file://cross-compile-fix.patch"
+SRC_URI += " \
+    file://cross-compile-fix.patch \
+    file://0001-tiff-fix-compile-warning.patch \
+"
 
 SRC_URI[archive.md5sum] = "ebc3ce6df8dcbf29cb9492f8dd031319"
 SRC_URI[archive.sha256sum] = "2a4c91ae38f8b5028cebb91b9da9ddc50ea8ae3f3d429df89ba351da2d787ff7"
-- 
1.7.4.4



