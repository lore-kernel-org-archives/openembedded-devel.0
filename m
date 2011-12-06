Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrtE-0004Zk-3l
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:04:44 +0100
Received: by mail-ee0-f47.google.com with SMTP id v2so902377eea.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+I6Y5NJnHrAF9J3Srpo+E+zL3avbPkdynnSLeTpesGk=;
	b=osQxOvs/KLqrRlRDSqmHWGdKCRF7N4V5MuCh3zeb6AkwWGuFDjFjKH7I0F9Vt5SUSe
	Z7qEMhx/9rV/y1EQLiYB0PEh6ng/Babp28GsCIH1lq1x5qQlgiQi3Z+2sLaG4jCtq93+
	+j4EtTJ9jyWvK/HTw0/VUspbrIp+yaAnU0iGI=
Received: by 10.14.9.102 with SMTP id 78mr1805772ees.79.1323165475779;
	Tue, 06 Dec 2011 01:57:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm58107818eej.3.2011.12.06.01.57.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:57:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:04 +0100
Message-Id: <03dc7431f458d51c058ccdac2db34c4843ac4f08.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 05/16] e-base: introduce EFL_SRCREV_1.1.0 and bump EFL_SRCREV
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
X-List-Received-Date: Tue, 06 Dec 2011 10:04:44 -0000

* add EFL_SRCREV_1.1.0 with SRCREV of release and use it for released libs
* EFL_SRCREV will continue to track development in bindings, elementary and e17

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass          |    6 +++++-
 meta-efl/recipes-efl/e17/expedite_svn.bb |    5 ++---
 meta-efl/recipes-efl/efl/ecore_svn.bb    |    4 ++--
 meta-efl/recipes-efl/efl/edbus_svn.bb    |    4 ++--
 meta-efl/recipes-efl/efl/edje_svn.bb     |    4 ++--
 meta-efl/recipes-efl/efl/eet_svn.bb      |    4 ++--
 meta-efl/recipes-efl/efl/eeze_svn.bb     |    4 ++--
 meta-efl/recipes-efl/efl/efreet_svn.bb   |    4 ++--
 meta-efl/recipes-efl/efl/eina_svn.bb     |    4 ++--
 meta-efl/recipes-efl/efl/embryo_svn.bb   |    4 ++--
 meta-efl/recipes-efl/efl/evas_svn.bb     |    4 ++--
 11 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 05997bd..79104ec 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,11 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "65690"
+EFL_SRCREV ?= "65808"
+# revision when 1.1.0 (eet is actually 1.5.0) was released, 
+# so we can lock some release libs to this revision 
+# and use EFL_SRCREV to track e17 and elementary
+EFL_SRCREV_1.1.0 ?= "65800"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
diff --git a/meta-efl/recipes-efl/e17/expedite_svn.bb b/meta-efl/recipes-efl/e17/expedite_svn.bb
index 47b5f48..ee91c98 100644
--- a/meta-efl/recipes-efl/e17/expedite_svn.bb
+++ b/meta-efl/recipes-efl/e17/expedite_svn.bb
@@ -2,9 +2,8 @@ DESCRIPTION = "Expedite is a comprehensive benchmarking suite for Evas"
 DEPENDS = "eet evas"
 RDEPENDS_${PN} = "expedite-themes evas-engine-buffer evas-engine-fb evas-engine-software-generic evas-engine-software-x11 evas-engine-gl-x11 evas-loader-png"
 LICENSE = "MIT BSD"
-PV = "0.6.0+svnr${SRCPV}"
-PR = "r5"
-SRCREV = "${EFL_SRCREV}"
+SRCREV = "${EFL_SRCREV_1.1.0}"
+PV = "1.1.0+svnr${SRCPV}"
 
 inherit e
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index c71c1b9..5cad73d 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -1,7 +1,7 @@
 require ecore.inc
 
-SRCREV = "${EFL_SRCREV}"
-PV = "1.0.999+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV_1.1.0}"
+PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index 646c379..5d79c02 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -1,7 +1,7 @@
 require edbus.inc
 
-SRCREV = "${EFL_SRCREV}"
-PV = "1.0.999+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV_1.1.0}"
+PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index 65d723d..c3e1a95 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -1,7 +1,7 @@
 require edje.inc
 
-SRCREV = "${EFL_SRCREV}"
-PV = "1.0.999+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV_1.1.0}"
+PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
index 67be595..aad311b 100644
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ b/meta-efl/recipes-efl/efl/eet_svn.bb
@@ -1,7 +1,7 @@
 require eet.inc
 
-SRCREV = "${EFL_SRCREV}"
-PV = "1.4.999+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV_1.1.0}"
+PV = "1.5.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
index 4f39c0c..b7986e1 100644
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
@@ -1,7 +1,7 @@
 require eeze.inc
 
-SRCREV = "${EFL_SRCREV}"
-PV = "1.0.999+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV_1.1.0}"
+PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index df7903b..6c7661c 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -1,7 +1,7 @@
 require efreet.inc
 
-SRCREV = "${EFL_SRCREV}"
-PV = "1.0.999+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV_1.1.0}"
+PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/efl/eina_svn.bb
index 23b45c5..b510449 100644
--- a/meta-efl/recipes-efl/efl/eina_svn.bb
+++ b/meta-efl/recipes-efl/efl/eina_svn.bb
@@ -1,7 +1,7 @@
 require eina.inc
 
-SRCREV = "${EFL_SRCREV}"
-PV = "1.0.999+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV_1.1.0}"
+PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-efl/efl/embryo_svn.bb
index 5cfc1d7..7c185e7 100644
--- a/meta-efl/recipes-efl/efl/embryo_svn.bb
+++ b/meta-efl/recipes-efl/efl/embryo_svn.bb
@@ -1,7 +1,7 @@
 require embryo.inc
 
-SRCREV = "${EFL_SRCREV}"
-PV = "1.0.999+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV_1.1.0}"
+PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index 3712760..284891e 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -1,7 +1,7 @@
 require evas.inc
 
-SRCREV = "${EFL_SRCREV}"
-PV = "1.0.999+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV_1.1.0}"
+PV = "1.1.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.8



