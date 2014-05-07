Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id EA0A465EC2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 19:39:42 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c41so1041777eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=0hYs2hO8CfdMhVuam+4FwVVAT8CUX/5T0dlISS2OJJM=;
	b=YZ/jbkDTVPOIjzMQlc417Isz7zA2zdCE+FNDcVD0bZU9Ve9GWR4ZXEo8yIaqyfC5M1
	J5iXX+zcXAECrTbPvq+JJ4ZsglE4xuU3XkV/wC5YFCknr2e9TpuZuEO5ylG9iug/Ao/f
	qQqErTss6SlMXqfmO7PYQaL4ctNtMrAogzkP/efRvvChSD4lSd9oppb3nJp6GLCvKH2W
	1mxjYV/HaIrGMw6ljg3/ph6nU9fchntcTQ7tNyt2v/1NxbSddsdrfppBIH3NktosV9rw
	308XhW33t6EoX5Q0st2v8bWZJgEAhAbJOS8k4wXYtUmfbGMgNviZCIy835f+4xmYmqRZ
	9NUA==
X-Received: by 10.14.180.8 with SMTP id i8mr10616240eem.67.1399491583657;
	Wed, 07 May 2014 12:39:43 -0700 (PDT)
Received: from localhost.localdomain (p5B0A08BA.dip0.t-ipconnect.de.
	[91.10.8.186])
	by mx.google.com with ESMTPSA id m8sm48389547eeg.11.2014.05.07.12.39.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 12:39:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 21:39:17 +0200
Message-Id: <1399491557-3073-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1399491557-3073-1-git-send-email-schnitzeltony@googlemail.com>
References: <1399491557-3073-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gimp: add DEPENDS and PACKAGECONFIG for help-browser
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
X-List-Received-Date: Wed, 07 May 2014 19:39:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* missing DEPENDS were detected in Martin's world with test-dependencies
  (libxmu & libxpm will still apear in distroless environments)
* help-browser depends on webkit-gtk which takes very long to build so disable
  it by default

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
index e7d9c45..77bc6bd 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
@@ -4,10 +4,14 @@ SECTION = "x11/graphics"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff webkit-gtk lcms gegl poppler"
+DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff lcms gegl poppler jasper"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
 inherit gnome
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[helpbrowser] = "--with-webkit, --without-webkit, webkit-gtk"
+
 SRC_URI = "http://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
            file://freetype.patch \
           "
-- 
1.8.3.1


