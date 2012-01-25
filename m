Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RpyXj-0007gK-N7
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 09:49:23 +0100
Received: by eekd41 with SMTP id d41so1604084eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 00:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=R1KoceX/bddwqSUCZ/na6CXngQhAP4RNAofPfIIWmas=;
	b=YqkeAnQaq8KE+1+pXv8gL8L+ALP9vtqJXau9bu0H7b0THpV8cSu4dMm5khh6c5VH2N
	ukUCYXstCPLmmTnYOtPyOt8wghJMABh8oHffx8q5ofUn85mhRmHwjWy3z8oeGxl/TDEP
	FaN8E4plAPBKTSMrzRy7OxU/sSabey2O3F9jw=
Received: by 10.14.9.155 with SMTP id 27mr5611742eet.75.1327480897074;
	Wed, 25 Jan 2012 00:41:37 -0800 (PST)
Received: from localhost.localdomain (ip-95-222-156-232.unitymediagroup.de.
	[95.222.156.232])
	by mx.google.com with ESMTPS id c16sm78749577eei.1.2012.01.25.00.41.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 00:41:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 09:41:39 +0100
Message-Id: <1327480899-14058-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [meta-oe] gimp: replace --without-libwmf / --without-wmf
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
X-List-Received-Date: Wed, 25 Jan 2012 08:49:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

accidently did not commit the latest (tested) changes

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb b/meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb
index 31e8925..f952883 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.6.11.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=878e3965c7b52d85827c75f5a2f3b314"
 
 DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff webkit-gtk lcms gegl poppler"
 
+PR = "r1"
+
 inherit gnome
 
 SRC_URI = "ftp://ftp.gimp.org/pub/gimp/v2.6/gimp-${PV}.tar.bz2 \
@@ -14,7 +16,7 @@ SRC_URI[md5sum] = "bb2939fe13e54fc7255cef5d097bb5dd"
 SRC_URI[sha256sum] = "9b6d08d0803b3912ea596d1b77b9c21ee13778c23388a225c004b8c1587cb0a1"
 
 EXTRA_OECONF = "--disable-python \
-                --without-libwmf"
+                --without-wmf"
 
 do_configure_append() {
 	find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-- 
1.7.6.4



