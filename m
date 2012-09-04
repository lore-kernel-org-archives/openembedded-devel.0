Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T91hX-0004XX-Ph
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 00:34:31 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4917933wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 15:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ymlOR+M63LQWeULojIp1VYY+SSBzbOLvfV1NNeOE6t4=;
	b=jIpNO8eFScS8XfXoWZnyTKmPxvTtGKCpq783hulUhEC39YPVpAe1QZxivDdjIIdYzy
	I/vDBJ6co+LZ6+i/XdY8bByrQF7wE6QFDHzQluv5Ny5bU+HeB1sztRH9o6M4f1rmjdlb
	reGyOXpiI2cWlKYlZPIlZfb2zWFk+U7X4TXhGHFQftpHR8R7fgIAX0KY/SOC8G9ItEfb
	AurxN7BfxJMtIfBonBCozIrXz11/fbgw7UO2YM8xVrws+imxjrK9rODPS0a2qVfMMzww
	3JlHe4ZepwZenLlB0Vyhd45rZV+yVP/S6sYOlKyUdsIP7jzWQIZOkjukeUqfyTWgSmtx
	Bf5Q==
Received: by 10.216.158.212 with SMTP id q62mr11782715wek.53.1346797331761;
	Tue, 04 Sep 2012 15:22:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm26273449wib.10.2012.09.04.15.22.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 15:22:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 00:22:13 +0200
Message-Id: <686742d23fa0a9a3ab4acc4272db39f638acf73b.1346790372.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 01/10] e-base: bump EFL_SRCREV to 1.7.0 release and update PV in svn recipes
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
X-List-Received-Date: Tue, 04 Sep 2012 22:34:31 -0000

* python bindings tarball are not released yet

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass                       |  2 +-
 meta-efl/conf/distro/include/efl-from-svn-recipes.inc | 15 ++++++++-------
 meta-efl/recipes-efl/efl/ecore_svn.bb                 |  2 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb                 |  2 +-
 meta-efl/recipes-efl/efl/edje_svn.bb                  |  2 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                   |  2 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb                  |  2 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb                |  2 +-
 meta-efl/recipes-efl/efl/eina_svn.bb                  |  2 +-
 meta-efl/recipes-efl/efl/eio_svn.bb                   |  2 +-
 meta-efl/recipes-efl/efl/elementary_svn.bb            |  2 +-
 meta-efl/recipes-efl/efl/embryo_svn.bb                |  2 +-
 meta-efl/recipes-efl/efl/emotion_svn.bb               |  2 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb                |  3 +--
 meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb  |  2 +-
 meta-efl/recipes-efl/efl/evas_svn.bb                  |  2 +-
 meta-efl/recipes-efl/efl/expedite_svn.bb              |  2 +-
 17 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index e701fb5..98aac41 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "75359"
+EFL_SRCREV ?= "75861"
 
 ARM_INSTRUCTION_SET = "arm"
 
diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
index 4625b19..b017645 100644
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
@@ -1,4 +1,4 @@
-EFL_PREFERRED_VERSION ?= "1.6.99+svn%"
+EFL_PREFERRED_VERSION ?= "1.7.0+svn%"
 
 PREFERRED_VERSION_ecore ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_ecore-native ?= "${EFL_PREFERRED_VERSION}"
@@ -30,9 +30,10 @@ PREFERRED_VERSION_emotion ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_ethumb ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_elementary ?= "${EFL_PREFERRED_VERSION}"
 
-PREFERRED_VERSION_python-elementary ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-ecore ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-edbus ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-edje ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-emotion ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-evas ?= "${EFL_PREFERRED_VERSION}"
+EFL_PYTHON_PREFERRED_VERSION ?= "1.6.99+svn%"
+PREFERRED_VERSION_python-elementary ?= "${EFL_PYTHON_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-ecore ?= "${EFL_PYTHON_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-edbus ?= "${EFL_PYTHON_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-edje ?= "${EFL_PYTHON_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-emotion ?= "${EFL_PYTHON_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-evas ?= "${EFL_PYTHON_PREFERRED_VERSION}"
diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index e00a0cc..4e2cdec 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ b/meta-efl/recipes-efl/efl/eet_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/efl/eina_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/eina_svn.bb
+++ b/meta-efl/recipes-efl/efl/eina_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eio_svn.bb b/meta-efl/recipes-efl/efl/eio_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/eio_svn.bb
+++ b/meta-efl/recipes-efl/efl/eio_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-efl/efl/embryo_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/embryo_svn.bb
+++ b/meta-efl/recipes-efl/efl/embryo_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index 892b298..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
@@ -9,4 +9,3 @@ SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
-
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/expedite_svn.bb b/meta-efl/recipes-efl/efl/expedite_svn.bb
index 06cf950..d8fd5d6 100644
--- a/meta-efl/recipes-efl/efl/expedite_svn.bb
+++ b/meta-efl/recipes-efl/efl/expedite_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.12



