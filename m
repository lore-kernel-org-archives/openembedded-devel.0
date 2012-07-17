Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr2Tg-0001y4-Db
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 09:45:52 +0200
Received: by wgbdr1 with SMTP id dr1so93048wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 00:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=FV0CkUdVE1GRPH6iwWaBhHJrT82+wFb8jRAbBytaCos=;
	b=DMxZrP1mwVMJzpm/iNkuQIrEI+oNbrr4xOusSrDsWhjK2JV2Fv1A+BkKD2fZ7P4Qc+
	ugPsuuUP1mCmoe8G1sTbA1MnN2r5j2fNEwhBYP5DZ/MXsLJeeUfAfXNpmR59GGASzpLR
	KTvUs1sl5nXQ70OofIPxzgbJzqv/mmelShn0FVbJf3++9DrXSzBNLTYsFArijDmfvcRD
	yJMPOYu3H6T7kQScXPMo9dhHLnM6WcWAhAjt7ryOIJkUHiFpR7hiefUXgE10lJvyKkuj
	vRJoXFu6CPd+nEnFXCl/CkHG0tG6UQ2+kiTLY0Z+pHY33WqSY3KAzxV7meQ4/B/phWDw
	RnaQ==
Received: by 10.216.74.21 with SMTP id w21mr777495wed.77.1342510473281;
	Tue, 17 Jul 2012 00:34:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df4sm25718414wib.4.2012.07.17.00.34.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 00:34:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 09:34:39 +0200
Message-Id: <1342510480-24412-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342510333-32367-1-git-send-email-koen@dominion.thruhere.net>
References: <1342510333-32367-1-git-send-email-koen@dominion.thruhere.net>
Subject: [meta-oe][meta-efl][PATCH 1/2] meta-efl: recipes: bump PR to rebuild after libudev0 soname change to libudev1
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
X-List-Received-Date: Tue, 17 Jul 2012 07:45:52 -0000

* this patch depends on http://patchwork.openembedded.org/patch/32085/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-elementary_svn.bb                |    2 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    1 +
 meta-efl/recipes-efl/e17/elfe_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eeze.inc                  |    2 +-
 meta-efl/recipes-efl/efl/elementary.inc            |    2 +-
 meta-efl/recipes-efl/efl/emotion.inc               |    2 +-
 meta-efl/recipes-efl/efl/ethumb.inc                |    2 +-
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    1 +
 8 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
index dfe194b..911ed6f 100644
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary python-evas"
 RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 0c9ad93..852bbcc 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2667a0f4120372ea91f7467cdff4095f"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
+PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/e17/elfe_svn.bb
index 33b8d05..f6d6fdb 100644
--- a/meta-efl/recipes-efl/e17/elfe_svn.bb
+++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
@@ -1,7 +1,7 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 PV = "0.0.1+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 require e-module.inc
 
diff --git a/meta-efl/recipes-efl/efl/eeze.inc b/meta-efl/recipes-efl/efl/eeze.inc
index 5d523c9..1b0f489 100644
--- a/meta-efl/recipes-efl/efl/eeze.inc
+++ b/meta-efl/recipes-efl/efl/eeze.inc
@@ -6,7 +6,7 @@ DEPENDS = "ecore eet udev"
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r0"
+INC_PR = "r1"
 
 # Some upgrade path tweaking
 AUTO_LIBNAME_PKGS = ""
diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
index 46dee90..50c708d 100644
--- a/meta-efl/recipes-efl/efl/elementary.inc
+++ b/meta-efl/recipes-efl/efl/elementary.inc
@@ -5,7 +5,7 @@ DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb poppler"
 
 inherit efl gettext
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 EXTRA_OECONF = "\
   --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
diff --git a/meta-efl/recipes-efl/efl/emotion.inc b/meta-efl/recipes-efl/efl/emotion.inc
index 4b36a35..20a8852 100644
--- a/meta-efl/recipes-efl/efl/emotion.inc
+++ b/meta-efl/recipes-efl/efl/emotion.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
 # we no longer build the libxine backend, since the gstreamer backend seems more promising
 DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 inherit efl
 
diff --git a/meta-efl/recipes-efl/efl/ethumb.inc b/meta-efl/recipes-efl/efl/ethumb.inc
index 92a83ee..0c3080c 100644
--- a/meta-efl/recipes-efl/efl/ethumb.inc
+++ b/meta-efl/recipes-efl/efl/ethumb.inc
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
 DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 inherit efl
 
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index 1bde2fe..8b1064a 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -6,6 +6,7 @@ SECTION = "devel"
 DEPENDS = "vala-native glib-2.0 dbus dbus-glib eina eet evas ecore edje elementary tiff"
 PV = "2011.01.13.1+svnr${SRCPV}"
 PE = "1"
+PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 SRCNAME = "vala"
 
-- 
1.7.8.6



