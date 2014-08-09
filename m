Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8B970A10
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:28 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so6691766wgh.26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D6P5aQuAz2dP0q4b2Q9WYNM3BsS2dCQR5bSk2yQZ6uY=;
	b=KPh1JEDot8dqhW08LsuyR6LEP8neFbeeTq427GsyRIFrpjz4inYZAFvwre2vU4ABf5
	QhrYLnS4uW/KYkq6OFubqMf85GvghgjH/vZZJJo/qSdr56ibE27D1bnPK9xDWD2XdHvN
	o6NGaVUzfqZQztkTuc8yGJP81Ii29cgDz18doEzv9QZB1QR1itAFG+4nSC2MEEWo6QBd
	5pRMnpYDkS/XxVk/jwS5z/RcKM1gqhB3MDsepfYSe2BxVD+m/sHSq8ai618nPdAADIeD
	hEDQiHmmFO0fLJVCp/MYbp8fJBuKU+d/3nYKQvaP9hvuwCnseEJCx/KVqR2w6NJCOCVf
	x8Sw==
X-Received: by 10.194.142.200 with SMTP id ry8mr38285637wjb.37.1407600509360; 
	Sat, 09 Aug 2014 09:08:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	au7sm25511448wjc.41.2014.08.09.09.08.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:23 +0200
Message-Id: <1407600537-10857-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/36] tracker: add all floating dependencies
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:29 -0000

* fixes following floating dependencies:
  tracker/tracker/latest lost dependency on  enca gtk+3 libgee
    libunistring upower
  tracker/tracker-dev/latest lost dependency on  cairo enca expat
    fontconfig freetype giflib gstreamer lcms libgstpbutils-0.10
    libgsttag-0.10 liblzma libpoppler
    libpoppler-glib libunistring libx11 libxau libxcb libxcb-render
    libxcb-shm libxdmcp libxext libxrender pixman taglib taglib-c tiff

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index eea8edc..21df29d 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "Tracker is a tool designed to extract information and metadata about your personal data so that it can be searched easily and quickly."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ee31012bf90e7b8c108c69f197f3e3a4"
-DEPENDS = "file gstreamer gamin dbus libexif gettext sqlite3 icu"
+DEPENDS = "file gstreamer gamin dbus libexif gettext sqlite3 icu gst-plugins-base libgnome-keyring poppler tiff enca libgsf libunistring giflib taglib bzip2 upower gtk+3 libgee"
+
 RDEPENDS_${PN} += " gvfs gsettings-desktop-schemas"
 HOMEPAGE = "http://projects.gnome.org/tracker/"
 
-- 
2.0.4


