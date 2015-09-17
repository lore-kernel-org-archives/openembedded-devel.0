Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id AE29076FDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:45 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so2877157wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=DjGvXvpYFmaPn3xBnsor8xxXBTE9CwI5WYuBSk8/7iQ=;
	b=WUzUnm/nYQSDaihL8Fv65yrQ2D0vOAIOJ/Hi4/XME/T4T0bmyJ3U5aqewl7Ii/WVUS
	oA962NU788akQEbLPGC7J4Sp76ix0SDEnKhCDb6OL8RZx9t525i+YuA9UQ9EN8+GxAxM
	dAlGg6RjmXGiq+eBWpK+tHI1sTsPrgwXV04QnAj7/jn9Jt4WwDrqNAnlqiFytAgQ/6bC
	5cuKfbjd6fZlkDHMmj8bToD03cHgx0jJOvwIe8MU06jzdMBuXky3V9i0GGPUU8RNnp6Q
	9KmgUxx77cxlpCphCUeZt/S/rICvdaOhRFf3SLPiniQsPO7AV9YeQQKjFoM3pucr+EWm
	G+0A==
X-Received: by 10.194.108.4 with SMTP id hg4mr28136663wjb.45.1442450505202;
	Wed, 16 Sep 2015 17:41:45 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:15 +0200
Message-Id: <1442450491-14912-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/19] libcdio: update to 0.93
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Build test for recipes depending on libcdio:

* gst-plugins-ugly_0.10.19.bb with PACAKGECONFIG += "cdio"
* gstreamer1.0-plugins-ugly with PACAKGECONFIG += "cdio"
* mpd

xbmc was not tested it is blacklisted for a while

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libcdio/{libcdio_0.82.bb => libcdio_0.93.bb}                   | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-multimedia/libcdio/{libcdio_0.82.bb => libcdio_0.93.bb} (71%)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb
similarity index 71%
rename from meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb
rename to meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb
index 8cf393d..f21f914 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb
@@ -8,14 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "ncurses"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "1c29b18e01ab2b966162bc727bf3c360"
-SRC_URI[sha256sum] = "1acb3de8e0927906ade7a34c5853173d3068b87b02dfba80d0bf11e47f0b5d39"
+SRC_URI[md5sum] = "d154476feaac5a7b5f180e83eaf3d689"
+SRC_URI[sha256sum] = "4972cd22fd8d0e8bff922d35c7a645be0db0ab0e7b3dfaecc9cd8272429d6975"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "ac_cv_member_struct_tm_tm_gmtoff=no --disable-rpath"
-DEBUG_OPTIMIZATION_thumb = "-Os -fno-omit-frame-pointer -g"
-
 PACKAGES += "${PN}-utils"
 
 FILES_${PN} = "${libdir}/${PN}${SOLIB}"
-- 
2.1.0


