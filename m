Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id A96D876FEA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:56 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so2929056wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=8T2wIEZxndbyCIXsgngkTwxU5Qk/6J299FDb2200Rw4=;
	b=XyfkK2hU7I7uLZo6hjvwStTpejSpCSnqQW87v2+z95SuWLZ5wHRalu56Pi1KqAKz8r
	ML21iJqsx4ts1GMHsdB9/jr+bHr6SIWc33IlJ1EF3bqoT0g//xAHhr814IBEZ0Qtdl1V
	R6H/O5poIlf35ZntgaHUywtFO6DrY/bQaxkoxYREFzStAoSQ7cJFcRljpxOCbzO6teej
	rGG/AAjMKF5AOz5RsknDWraowpxIjrlBgzaxvgSnhS0nd3oKWvmZfDPC5aui5KUicP6V
	MB1/aCyCM/e0zbG6GIwIUgFdl0S/Ojgljnbx7dKDXL8WdetQyMc+7xwuaO7TicykMkYg
	N5fA==
X-Received: by 10.180.105.138 with SMTP id gm10mr1793235wib.37.1442450516306; 
	Wed, 16 Sep 2015 17:41:56 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:27 +0200
Message-Id: <1442450491-14912-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 15/19] gimp: add libgudev to DEPENDS
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: QA Issue: gimp rdepends on libgudev, but it isn't a build dependency? [build-deps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
index b897816..1522fd6 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
@@ -4,7 +4,7 @@ SECTION = "x11/graphics"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff lcms gegl poppler jasper bzip2"
+DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff lcms gegl poppler jasper bzip2 libgudev"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
 inherit gnome gtk-doc
-- 
2.1.0


