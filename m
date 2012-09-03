Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8dMA-0005wD-PF
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 22:34:50 +0200
Received: by wgbdr1 with SMTP id dr1so3841420wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2012 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ymlOR+M63LQWeULojIp1VYY+SSBzbOLvfV1NNeOE6t4=;
	b=crcESktu7r+J0BH933Vq0mWFFImqHVsdL8J2fjvgiPKxxBE21+CWvRHvz/jobAD1zE
	/1M75YFbQVt6GYE7mTVg0DddxyfwVDdPg/v/ubq4Rrwg3As38o7MMQhIfW+4kRgR2OEL
	cRWsim2gGvRnArfPeQlfh4UFeq1M3Ys0B7GEaeQAe537/kC9YwJ5tjCWq1vMXC5LV/0A
	Dwdnmii6lav2jpJkF38jML7V5yV3fmk6SGxH3I66/1qwKHFhAJUMr8ynI/jRmS0Z8wGX
	1OHEkTQ1hNcVJAX1me++6ijWCBQtLOeIfjlJE1i/gjmM7sBq8xufWeHR3X4KBq5yxjEu
	Me2w==
Received: by 10.216.134.20 with SMTP id r20mr10970490wei.61.1346703750110;
	Mon, 03 Sep 2012 13:22:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm20650817wiv.11.2012.09.03.13.22.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 13:22:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2012 22:22:43 +0200
Message-Id: <686742d23fa0a9a3ab4acc4272db39f638acf73b.1346703604.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346703604.git.Martin.Jansa@gmail.com>
References: <cover.1346703604.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346703604.git.Martin.Jansa@gmail.com>
References: <cover.1346703604.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/3] e-base: bump EFL_SRCREV to 1.7.0 release and update PV in svn recipes
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
X-List-Received-Date: Mon, 03 Sep 2012 20:34:50 -0000

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



