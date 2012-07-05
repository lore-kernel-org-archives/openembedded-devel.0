Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCL-0003c9-Gs
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:37 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 900A5EA051
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:14 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 02A3360D52; Thu,  5 Jul 2012 19:39:34 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:32 +0200
Message-Id: <f9611c025109a3e0d6cebf12f49ae24c97759c09.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
Subject: [PATCH 14/14] psplash: convert from svn.o-hand.com to git.yoctoproject.org
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
X-List-Received-Date: Thu, 05 Jul 2012 17:50:37 -0000

Convert all psplash recipes from svn.o-hand.com to
git.yoctoproject.org since svn.o-hand.com seems to be down.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 .../{psplash-angstrom_svn.bb => psplash-angstrom_git.bb}       |    5 ++---
 .../psplash/{psplash-kaeilos_svn.bb => psplash-kaeilos_git.bb} |    6 ++----
 ...psplash-omap3pandora_svn.bb => psplash-omap3pandora_git.bb} |    5 ++---
 recipes/psplash/{psplash-ti_svn.bb => psplash-ti_git.bb}       |    5 ++---
 recipes/psplash/psplash.inc                                    |    8 ++++----
 recipes/psplash/{psplash_svn.bb => psplash_git.bb}             |    5 ++---
 6 files changed, 14 insertions(+), 20 deletions(-)
 rename recipes/psplash/{psplash-angstrom_svn.bb => psplash-angstrom_git.bb} (85%)
 rename recipes/psplash/{psplash-kaeilos_svn.bb => psplash-kaeilos_git.bb} (77%)
 rename recipes/psplash/{psplash-omap3pandora_svn.bb => psplash-omap3pandora_git.bb} (85%)
 rename recipes/psplash/{psplash-ti_svn.bb => psplash-ti_git.bb} (86%)
 rename recipes/psplash/{psplash_svn.bb => psplash_git.bb} (84%)

diff --git a/recipes/psplash/psplash-angstrom_svn.bb b/recipes/psplash/psplash-angstrom_git.bb
similarity index 85%
rename from recipes/psplash/psplash-angstrom_svn.bb
rename to recipes/psplash/psplash-angstrom_git.bb
index 2667cc4..a68b957 100644
--- a/recipes/psplash/psplash-angstrom_svn.bb
+++ b/recipes/psplash/psplash-angstrom_git.bb
@@ -9,7 +9,7 @@ ALTERNATIVE_PRIORITY = "20"
 # respectively psplash-bar-img.h (BAR) for the bar.
 # You might also want to patch the colors (see patch)
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
+SRC_URI = "git://git.yoctoproject.org/psplash;protocol=git \
           file://psplash-18bpp.patch \
           file://logo-math.patch \
           file://psplash-poky-img.h \
@@ -17,5 +17,4 @@ SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
           file://psplash-default \
           file://splashfuncs \
           file://psplash-init"
-S = "${WORKDIR}/psplash"
-
+S = "${WORKDIR}/git"
diff --git a/recipes/psplash/psplash-kaeilos_svn.bb b/recipes/psplash/psplash-kaeilos_git.bb
similarity index 77%
rename from recipes/psplash/psplash-kaeilos_svn.bb
rename to recipes/psplash/psplash-kaeilos_git.bb
index 9a40cc7..6993aeb 100644
--- a/recipes/psplash/psplash-kaeilos_svn.bb
+++ b/recipes/psplash/psplash-kaeilos_git.bb
@@ -3,7 +3,7 @@ require psplash-ua.inc
 
 ALTERNATIVE_PRIORITY = "20"
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
+SRC_URI = "git://git.yoctoproject.org/psplash;protocol=git \
           file://logo-math.patch \
           file://psplash-poky-img.h \
           file://psplash-bar-img.h \
@@ -13,6 +13,4 @@ SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
           file://psplash-18bpp.patch \
           file://psplash-24bpp-BGR666.patch"
 
-S = "${WORKDIR}/psplash"
-
-
+S = "${WORKDIR}/git"
diff --git a/recipes/psplash/psplash-omap3pandora_svn.bb b/recipes/psplash/psplash-omap3pandora_git.bb
similarity index 85%
rename from recipes/psplash/psplash-omap3pandora_svn.bb
rename to recipes/psplash/psplash-omap3pandora_git.bb
index 120679b..c0e8610 100644
--- a/recipes/psplash/psplash-omap3pandora_svn.bb
+++ b/recipes/psplash/psplash-omap3pandora_git.bb
@@ -10,12 +10,11 @@ ALTERNATIVE_PRIORITY_omap3pandora = "5"
 # respectively psplash-bar-img.h (BAR) for the bar.
 # You might also want to patch the colors (see patch)
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
+SRC_URI = "git://git.yoctoproject.org/psplash;protocol=git \
           file://logo-math.patch \
           file://psplash-poky-img.h \
           file://psplash-bar-img.h \
           file://psplash-default \
           file://splashfuncs \
           file://psplash-init"
-S = "${WORKDIR}/psplash"
-
+S = "${WORKDIR}/git"
diff --git a/recipes/psplash/psplash-ti_svn.bb b/recipes/psplash/psplash-ti_git.bb
similarity index 86%
rename from recipes/psplash/psplash-ti_svn.bb
rename to recipes/psplash/psplash-ti_git.bb
index b754d09..9069daa 100644
--- a/recipes/psplash/psplash-ti_svn.bb
+++ b/recipes/psplash/psplash-ti_git.bb
@@ -9,7 +9,7 @@ ALTERNATIVE_PRIORITY = "20"
 # respectively psplash-bar-img.h (BAR) for the bar.
 # You might also want to patch the colors (see patch)
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
+SRC_URI = "git://git.yoctoproject.org/psplash;protocol=git \
           file://psplash-18bpp.patch \
           file://logo-math.patch \
           file://0001-configurability-for-rev-422.patch \
@@ -18,5 +18,4 @@ SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
           file://psplash-default \
           file://splashfuncs \
           file://psplash-init"
-S = "${WORKDIR}/psplash"
-
+S = "${WORKDIR}/git"
diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
index 2d999d1..1791edc 100644
--- a/recipes/psplash/psplash.inc
+++ b/recipes/psplash/psplash.inc
@@ -1,14 +1,14 @@
 DESCRIPTION = "Userspace framebuffer boot logo based on usplash."
-HOMEPAGE = "http://projects.o-hand.com/psplash"
+HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/psplash"
 SECTION = "base"
 LICENSE = "GPLv2+"
 PROVIDES = "virtual/psplash"
 RPROVIDES_${PN} = "virtual-psplash"
 RCONFLICTS_${PN} = "exquisite"
 
-SRCREV = "422"
-PV = "0.0+svnr${SRCPV}"
-PR = "r34"
+SRCREV = "d8ebee6f2b14d72b69bd37f1ea7e64e936a24695"
+PV = "0.1+git${SRCPV}"
+PR = "r0"
 
 # You can create your own pslash-poky-img.h by doing
 # ./make-image-header.sh <file>.png POKY
diff --git a/recipes/psplash/psplash_svn.bb b/recipes/psplash/psplash_git.bb
similarity index 84%
rename from recipes/psplash/psplash_svn.bb
rename to recipes/psplash/psplash_git.bb
index ea7a7b7..49e8e7e 100644
--- a/recipes/psplash/psplash_svn.bb
+++ b/recipes/psplash/psplash_git.bb
@@ -3,17 +3,16 @@ require psplash-ua.inc
 
 ALTERNATIVE_PRIORITY = "10"
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
+SRC_URI = "git://git.yoctoproject.org/psplash;protocol=git \
           file://psplash-poky-img.h \
           file://psplash-bar-img.h \
           file://psplash-default \
           file://splashfuncs \
           file://psplash-init"
-S = "${WORKDIR}/psplash"
+S = "${WORKDIR}/git"
 
 # This really should be default, but due yo openmoko hack below, can't be easily
 SRC_URI_append_angstrom = " file://logo-math.patch "
 SRC_URI_append_jlime = " file://configurability.patch file://progress-color.patch "
 SRC_URI_append_openmoko = " file://configurability.patch "
 SRC_URI_append_boc01 = " file://psplash_grayscale.patch "
-
-- 
1.7.10



