Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlXd-0007YZ-QI
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:20:51 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=SP9HZKs5HaaEOd+9yG9ZDnhaAZv1Z3j27xlpKxCfSi0=;
	b=WPqqrZlN2v18Kgp96tU2RZUOeutAVqqvJx/Jvxywat1Vkcech84nK9yyjeR/GZ+PMv
	1JniPk4grOEZUnS3O9mwRRFe+oKPxbEIZuoGu1Vvg7/t9h2wu5fEgix5t40B3cXmATSf
	E9sjIRbGkdM9rKgZb4y2G/JQex/FdIH1UtkAo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hytxGolARtHhuMy/bgIeAT4r9JaeSOppxxnAsFC9Yvd4dwZukt6uDa0EW5PG6c8ase
	CifE5OK1CI2LwuwjTct/VpVoTrmZ4wxicFqgtiWlFlufB2lHy2w+wjy/jbCGiUCDhjU2
	NPGe7Syew9X5k8HRmTJpx0K9rhIUG3aurd8mw=
Received: by 10.223.27.195 with SMTP id j3mr4735471fac.83.1306696664216;
	Sun, 29 May 2011 12:17:44 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id b22sm497394fak.25.2011.05.29.12.17.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:17:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:13 +0200
Message-Id: <5c51f3a60c21fc324545dc00ecb83d152dd203f4.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/16] tangogps: add LIC_FILES_CHKSUM and drop distro override
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
X-List-Received-Date: Sun, 29 May 2011 19:20:51 -0000

* include tangogps.inc directly to recipe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/tangogps/tangogps.inc      |   15 ---------------
 .../recipes-support/tangogps/tangogps_0.99.4.bb    |   18 +++++++++++++++---
 2 files changed, 15 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-support/tangogps/tangogps.inc

diff --git a/meta-oe/recipes-support/tangogps/tangogps.inc b/meta-oe/recipes-support/tangogps/tangogps.inc
deleted file mode 100644
index 436fe07..0000000
--- a/meta-oe/recipes-support/tangogps/tangogps.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "tangoGPS is a map and GPS application using Openstreetmap"
-AUTHOR = "Marcus Bauer <marcus.bauer@gmail.com>"
-HOMEPAGE = "http://tangogps.org/"
-SECTION = "x11/applications"
-LICENSE = "GPLv2"
-PRIORITY = "optional"
-DEPENDS = "curl gtk+ gconf sqlite3 libexif libsoup-2.4"
-
-SRC_URI = "http://www.tangogps.org/downloads/tangogps-${PV}.tar.gz;name=archive"
-S = "${WORKDIR}/tangogps-${PV}"
-
-inherit autotools pkgconfig
-
-RRECOMMENDS_${PN} = "gpsd"
-RRECOMMENDS_shr = "fso-gpsd"
diff --git a/meta-oe/recipes-support/tangogps/tangogps_0.99.4.bb b/meta-oe/recipes-support/tangogps/tangogps_0.99.4.bb
index ab682f3..a5706d3 100644
--- a/meta-oe/recipes-support/tangogps/tangogps_0.99.4.bb
+++ b/meta-oe/recipes-support/tangogps/tangogps_0.99.4.bb
@@ -1,4 +1,16 @@
-require tangogps.inc
+DESCRIPTION = "tangoGPS is a map and GPS application using Openstreetmap"
+AUTHOR = "Marcus Bauer <marcus.bauer@gmail.com>"
+HOMEPAGE = "http://tangogps.org/"
+SECTION = "x11/applications"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+PRIORITY = "optional"
+DEPENDS = "curl gtk+ gconf sqlite3 libexif libsoup-2.4"
 
-SRC_URI[archive.md5sum] = "0f07ede94a21eb84f5e017fa88a1fc3d"
-SRC_URI[archive.sha256sum] = "660fdf89ef3c379f2fc0c2a9d0c9d3bfa5345835786b72bf9f513ba9ec2c812a"
+SRC_URI = "http://www.tangogps.org/downloads/${P}.tar.gz"
+SRC_URI[md5sum] = "0f07ede94a21eb84f5e017fa88a1fc3d"
+SRC_URI[sha256sum] = "660fdf89ef3c379f2fc0c2a9d0c9d3bfa5345835786b72bf9f513ba9ec2c812a"
+
+inherit autotools pkgconfig
+
+RRECOMMENDS_${PN} = "gpsd"
-- 
1.7.5.rc3



