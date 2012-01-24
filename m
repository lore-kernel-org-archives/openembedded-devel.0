Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RpheZ-0000eb-8N
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jan 2012 15:47:20 +0100
Received: by wibhq7 with SMTP id hq7so286357wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2012 06:39:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.93.132 with SMTP id cu4mr4066663wib.9.1327415973665;
	Tue, 24 Jan 2012 06:39:33 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id df2sm19073224wib.4.2012.01.24.06.39.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 06:39:32 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jan 2012 16:39:26 +0200
Message-Id: <1327415966-511-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQkoSnvjDg/3Z1cJsGHOShTYkGOzcnIpPBJNy5CF9ucFaS/BboTawwH6lBf5FsPSzAemE2Nt
Cc: flocirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] In LICENSE "&&" should be replaced with "&" [forgot .inc files]
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
X-List-Received-Date: Tue, 24 Jan 2012 14:47:20 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

In this way meta-oe recipes will be parsed correctly in yocto.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc |    2 +-
 meta-oe/recipes-core/glib-2.0/glibmm.inc      |    2 +-
 meta-oe/recipes-devtools/swig/swig.inc        |    2 +-
 meta-oe/recipes-gnome/gtk+/gtkmm.inc          |    2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc         |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
index b4f72d7..91ce737 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Bonobo CORBA interfaces library"
-LICENSE = "GPLv2 && LGPLv2.1"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 SECTION = "x11/gnome/libs"
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm.inc b/meta-oe/recipes-core/glib-2.0/glibmm.inc
index 948f7c7..60e9bce 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm.inc
+++ b/meta-oe/recipes-core/glib-2.0/glibmm.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "C++ bindings for the glib library."
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"
 
-LICENSE = "LGPLv2.1 && GPLv2"
+LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-devtools/swig/swig.inc
index 65c562e..1c33e6e 100644
--- a/meta-oe/recipes-devtools/swig/swig.inc
+++ b/meta-oe/recipes-devtools/swig/swig.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "SWIG - Simplified Wrapper and Interface Generator"
 HOMEPAGE = "http://swig.sourceforge.net/"
-LICENSE = "BSD && GPLv3"
+LICENSE = "BSD & GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
                     file://LICENSE-GPL;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LICENSE-UNIVERSITIES;md5=e0eaeeef7b2662c0c2d0d3c0b2509f75"
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm.inc b/meta-oe/recipes-gnome/gtk+/gtkmm.inc
index 38a4a2b..b1a170a 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm.inc
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "C++ bindings for the GTK+ toolkit."
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"
 
-LICENSE = "LGPLv2.1 && GPLv2"
+LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 781f597..7ac6a41 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -1,6 +1,6 @@
 SECTION = "utils"
 DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
-LICENSE = "GPLv2 && LGPLv2"
+LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
 INC_PR = "r0"
-- 
1.7.5.4



