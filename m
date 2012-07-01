Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SlPUT-0004wp-7q
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Jul 2012 21:07:25 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 747EAEA042;
	Sun,  1 Jul 2012 21:02:37 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 22F2562031; Sun,  1 Jul 2012 20:56:23 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Jul 2012 20:56:23 +0200
Message-Id: <1341168983-10756-2-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1341168983-10756-1-git-send-email-apelete@seketeli.net>
References: <1341168983-10756-1-git-send-email-apelete@seketeli.net>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 1/1] psplash: convert from svn.o-hand.com to git.yoctoproject.org
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
X-List-Received-Date: Sun, 01 Jul 2012 19:07:25 -0000

Convert all psplash recipes from svn.o-hand.com to
git.yoctoproject.org since svn.o-hand.com seems to be down.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/psplash/psplash-angstrom_git.bb     |   21 +++++++++++++++++++++
 recipes/psplash/psplash-angstrom_svn.bb     |   21 ---------------------
 recipes/psplash/psplash-kaeilos_git.bb      |   18 ++++++++++++++++++
 recipes/psplash/psplash-kaeilos_svn.bb      |   18 ------------------
 recipes/psplash/psplash-omap3pandora_git.bb |   21 +++++++++++++++++++++
 recipes/psplash/psplash-omap3pandora_svn.bb |   21 ---------------------
 recipes/psplash/psplash-ti_git.bb           |   22 ++++++++++++++++++++++
 recipes/psplash/psplash-ti_svn.bb           |   22 ----------------------
 recipes/psplash/psplash.inc                 |    8 ++++----
 recipes/psplash/psplash_git.bb              |   20 ++++++++++++++++++++
 recipes/psplash/psplash_svn.bb              |   19 -------------------
 11 files changed, 106 insertions(+), 105 deletions(-)
 create mode 100644 recipes/psplash/psplash-angstrom_git.bb
 delete mode 100644 recipes/psplash/psplash-angstrom_svn.bb
 create mode 100644 recipes/psplash/psplash-kaeilos_git.bb
 delete mode 100644 recipes/psplash/psplash-kaeilos_svn.bb
 create mode 100644 recipes/psplash/psplash-omap3pandora_git.bb
 delete mode 100644 recipes/psplash/psplash-omap3pandora_svn.bb
 create mode 100644 recipes/psplash/psplash-ti_git.bb
 delete mode 100644 recipes/psplash/psplash-ti_svn.bb
 create mode 100644 recipes/psplash/psplash_git.bb
 delete mode 100644 recipes/psplash/psplash_svn.bb

diff --git a/recipes/psplash/psplash-angstrom_git.bb b/recipes/psplash/psplash-angstrom_git.bb
new file mode 100644
index 0000000..35441e4
--- /dev/null
+++ b/recipes/psplash/psplash-angstrom_git.bb
@@ -0,0 +1,21 @@
+require psplash.inc
+require psplash-ua.inc
+
+ALTERNATIVE_PRIORITY = "20"
+
+# You can create your own pslash-poky-img.h by doing
+# ./make-image-header.sh <file>.png POKY
+# and rename the resulting .h to pslash-poky-img.h (for the logo)
+# respectively psplash-bar-img.h (BAR) for the bar.
+# You might also want to patch the colors (see patch)
+
+SRC_URI = "git://git.yoctoproject.org/psplash;protocol=git \
+          file://psplash-18bpp.patch \
+          file://logo-math.patch \
+          file://psplash-poky-img.h \
+          file://psplash-bar-img.h \
+          file://psplash-default \
+          file://splashfuncs \
+          file://psplash-init"
+S = "${WORKDIR}/git"
+
diff --git a/recipes/psplash/psplash-angstrom_svn.bb b/recipes/psplash/psplash-angstrom_svn.bb
deleted file mode 100644
index 2667cc4..0000000
--- a/recipes/psplash/psplash-angstrom_svn.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require psplash.inc
-require psplash-ua.inc
-
-ALTERNATIVE_PRIORITY = "20"
-
-# You can create your own pslash-poky-img.h by doing
-# ./make-image-header.sh <file>.png POKY
-# and rename the resulting .h to pslash-poky-img.h (for the logo)
-# respectively psplash-bar-img.h (BAR) for the bar.
-# You might also want to patch the colors (see patch)
-
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
-          file://psplash-18bpp.patch \
-          file://logo-math.patch \
-          file://psplash-poky-img.h \
-          file://psplash-bar-img.h \
-          file://psplash-default \
-          file://splashfuncs \
-          file://psplash-init"
-S = "${WORKDIR}/psplash"
-
diff --git a/recipes/psplash/psplash-kaeilos_git.bb b/recipes/psplash/psplash-kaeilos_git.bb
new file mode 100644
index 0000000..4e3474a
--- /dev/null
+++ b/recipes/psplash/psplash-kaeilos_git.bb
@@ -0,0 +1,18 @@
+require psplash.inc
+require psplash-ua.inc
+
+ALTERNATIVE_PRIORITY = "20"
+
+SRC_URI = "git://git.yoctoproject.org/psplash;protocol=git \
+          file://logo-math.patch \
+          file://psplash-poky-img.h \
+          file://psplash-bar-img.h \
+          file://psplash-default \
+          file://splashfuncs \
+          file://psplash-init \
+          file://psplash-18bpp.patch \
+          file://psplash-24bpp-BGR666.patch"
+
+S = "${WORKDIR}/git"
+
+
diff --git a/recipes/psplash/psplash-kaeilos_svn.bb b/recipes/psplash/psplash-kaeilos_svn.bb
deleted file mode 100644
index 9a40cc7..0000000
--- a/recipes/psplash/psplash-kaeilos_svn.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require psplash.inc
-require psplash-ua.inc
-
-ALTERNATIVE_PRIORITY = "20"
-
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
-          file://logo-math.patch \
-          file://psplash-poky-img.h \
-          file://psplash-bar-img.h \
-          file://psplash-default \
-          file://splashfuncs \
-          file://psplash-init \
-          file://psplash-18bpp.patch \
-          file://psplash-24bpp-BGR666.patch"
-
-S = "${WORKDIR}/psplash"
-
-
diff --git a/recipes/psplash/psplash-omap3pandora_git.bb b/recipes/psplash/psplash-omap3pandora_git.bb
new file mode 100644
index 0000000..c92aa75
--- /dev/null
+++ b/recipes/psplash/psplash-omap3pandora_git.bb
@@ -0,0 +1,21 @@
+require psplash.inc
+require psplash-ua.inc
+
+ALTERNATIVE_PRIORITY = "30"
+ALTERNATIVE_PRIORITY_omap3pandora = "5"
+
+# You can create your own pslash-poky-img.h by doing
+# ./make-image-header.sh <file>.png POKY
+# and rename the resulting .h to pslash-poky-img.h (for the logo)
+# respectively psplash-bar-img.h (BAR) for the bar.
+# You might also want to patch the colors (see patch)
+
+SRC_URI = "git://git.yoctoproject.org/psplash;protocol=git \
+          file://logo-math.patch \
+          file://psplash-poky-img.h \
+          file://psplash-bar-img.h \
+          file://psplash-default \
+          file://splashfuncs \
+          file://psplash-init"
+S = "${WORKDIR}/git"
+
diff --git a/recipes/psplash/psplash-omap3pandora_svn.bb b/recipes/psplash/psplash-omap3pandora_svn.bb
deleted file mode 100644
index 120679b..0000000
--- a/recipes/psplash/psplash-omap3pandora_svn.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require psplash.inc
-require psplash-ua.inc
-
-ALTERNATIVE_PRIORITY = "30"
-ALTERNATIVE_PRIORITY_omap3pandora = "5"
-
-# You can create your own pslash-poky-img.h by doing
-# ./make-image-header.sh <file>.png POKY
-# and rename the resulting .h to pslash-poky-img.h (for the logo)
-# respectively psplash-bar-img.h (BAR) for the bar.
-# You might also want to patch the colors (see patch)
-
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
-          file://logo-math.patch \
-          file://psplash-poky-img.h \
-          file://psplash-bar-img.h \
-          file://psplash-default \
-          file://splashfuncs \
-          file://psplash-init"
-S = "${WORKDIR}/psplash"
-
diff --git a/recipes/psplash/psplash-ti_git.bb b/recipes/psplash/psplash-ti_git.bb
new file mode 100644
index 0000000..a49df17
--- /dev/null
+++ b/recipes/psplash/psplash-ti_git.bb
@@ -0,0 +1,22 @@
+require psplash.inc
+require psplash-ua.inc
+
+ALTERNATIVE_PRIORITY = "20"
+
+# You can create your own pslash-poky-img.h by doing
+# ./make-image-header.sh <file>.png POKY
+# and rename the resulting .h to pslash-poky-img.h (for the logo)
+# respectively psplash-bar-img.h (BAR) for the bar.
+# You might also want to patch the colors (see patch)
+
+SRC_URI = "git://git.yoctoproject.org/psplash;protocol=git \
+          file://psplash-18bpp.patch \
+          file://logo-math.patch \
+          file://0001-configurability-for-rev-422.patch \
+          file://psplash-poky-img.h \
+          file://psplash-bar-img.h \
+          file://psplash-default \
+          file://splashfuncs \
+          file://psplash-init"
+S = "${WORKDIR}/git"
+
diff --git a/recipes/psplash/psplash-ti_svn.bb b/recipes/psplash/psplash-ti_svn.bb
deleted file mode 100644
index b754d09..0000000
--- a/recipes/psplash/psplash-ti_svn.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require psplash.inc
-require psplash-ua.inc
-
-ALTERNATIVE_PRIORITY = "20"
-
-# You can create your own pslash-poky-img.h by doing
-# ./make-image-header.sh <file>.png POKY
-# and rename the resulting .h to pslash-poky-img.h (for the logo)
-# respectively psplash-bar-img.h (BAR) for the bar.
-# You might also want to patch the colors (see patch)
-
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
-          file://psplash-18bpp.patch \
-          file://logo-math.patch \
-          file://0001-configurability-for-rev-422.patch \
-          file://psplash-poky-img.h \
-          file://psplash-bar-img.h \
-          file://psplash-default \
-          file://splashfuncs \
-          file://psplash-init"
-S = "${WORKDIR}/psplash"
-
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
diff --git a/recipes/psplash/psplash_git.bb b/recipes/psplash/psplash_git.bb
new file mode 100644
index 0000000..4d95ef5
--- /dev/null
+++ b/recipes/psplash/psplash_git.bb
@@ -0,0 +1,20 @@
+require psplash.inc
+require psplash-ua.inc
+
+ALTERNATIVE_PRIORITY = "10"
+
+SRC_URI = "git://git.yoctoproject.org/psplash;protocol=git \
+          file://psplash-poky-img.h \
+          file://psplash-bar-img.h \
+          file://psplash-default \
+          file://splashfuncs \
+          file://psplash-init"
+
+S = "${WORKDIR}/git"
+
+# This really should be default, but due yo openmoko hack below, can't be easily
+SRC_URI_append_angstrom = " file://logo-math.patch "
+SRC_URI_append_jlime = " file://configurability.patch file://progress-color.patch "
+SRC_URI_append_openmoko = " file://configurability.patch "
+SRC_URI_append_boc01 = " file://psplash_grayscale.patch "
+
diff --git a/recipes/psplash/psplash_svn.bb b/recipes/psplash/psplash_svn.bb
deleted file mode 100644
index ea7a7b7..0000000
--- a/recipes/psplash/psplash_svn.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require psplash.inc
-require psplash-ua.inc
-
-ALTERNATIVE_PRIORITY = "10"
-
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
-          file://psplash-poky-img.h \
-          file://psplash-bar-img.h \
-          file://psplash-default \
-          file://splashfuncs \
-          file://psplash-init"
-S = "${WORKDIR}/psplash"
-
-# This really should be default, but due yo openmoko hack below, can't be easily
-SRC_URI_append_angstrom = " file://logo-math.patch "
-SRC_URI_append_jlime = " file://configurability.patch file://progress-color.patch "
-SRC_URI_append_openmoko = " file://configurability.patch "
-SRC_URI_append_boc01 = " file://psplash_grayscale.patch "
-
-- 
1.7.10



