Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T91iL-0004XX-UY
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 00:35:21 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4917933wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 15:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=bZmevy2W5+35nUne4kta6M/QpUo67MnZCNFLVJdZT8U=;
	b=Lkpc17L5aePiJ9DP2c0r1d+FWoHwwGMN++D9Nmk1LploA7fLWbjYoUVJIWOB+Z8FTt
	eY9qVU05wQe0VdXwKfKbFFubt7bLM+Eqm6UqKpK2sgD0LjHQM3RZ3XfHO1MHwBu5uY1O
	8a86Lh0tNzEaBLYkimaJrJXzJYz1BYX46FiMgG8N8/pgIOcA4TObBfQQNL1jh961V0sz
	v/9iozxMl4jwmv21O5IoRi3/rzARfE1Y9zTi3OcJK73WS1/3MEgZa5ZRw1lWWdogY/0u
	8oQkVX+IdS86SeqM9/SlbACV/DYfd6p46RnrCc1Hm1kmZyqOoO6jFk/LHB52IoLoXE9J
	aTsw==
Received: by 10.180.102.136 with SMTP id fo8mr33387410wib.19.1346797381985;
	Tue, 04 Sep 2012 15:23:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm40132767wiy.4.2012.09.04.15.22.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 15:23:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 00:22:18 +0200
Message-Id: <f558247d9bed4fc62cdbc8e4b5f43bb6079e8b14.1346790372.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 06/10] python-efl: upgrade svn recipes to 1.7.0+svn
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
X-List-Received-Date: Tue, 04 Sep 2012 22:35:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/conf/distro/include/efl-from-svn-recipes.inc     | 13 ++++++-------
 meta-efl/recipes-devtools/python/python-ecore_svn.bb      |  2 +-
 meta-efl/recipes-devtools/python/python-edbus_svn.bb      |  2 +-
 meta-efl/recipes-devtools/python/python-edje_svn.bb       |  2 +-
 meta-efl/recipes-devtools/python/python-elementary_svn.bb |  2 +-
 meta-efl/recipes-devtools/python/python-emotion_svn.bb    |  2 +-
 meta-efl/recipes-devtools/python/python-evas_svn.bb       |  2 +-
 7 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
index c28e281..d3a7e81 100644
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
@@ -30,12 +30,11 @@ PREFERRED_VERSION_emotion ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_ethumb ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_elementary ?= "${EFL_PREFERRED_VERSION}"
 
-EFL_PYTHON_PREFERRED_VERSION ?= "1.6.99+svn%"
-PREFERRED_VERSION_python-elementary ?= "${EFL_PYTHON_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-ecore ?= "${EFL_PYTHON_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-edbus ?= "${EFL_PYTHON_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-edje ?= "${EFL_PYTHON_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-emotion ?= "${EFL_PYTHON_PREFERRED_VERSION}"
-PREFERRED_VERSION_python-evas ?= "${EFL_PYTHON_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-elementary ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-ecore ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-edbus ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-edje ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-emotion ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_python-evas ?= "${EFL_PREFERRED_VERSION}"
 
 PREFERRED_VERSION_terminology ?= "0.1.0+svn%"
diff --git a/meta-efl/recipes-devtools/python/python-ecore_svn.bb b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
index a0298e8..d551073 100644
--- a/meta-efl/recipes-devtools/python/python-ecore_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_svn.bb b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
index a0298e8..d551073 100644
--- a/meta-efl/recipes-devtools/python/python-edbus_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
diff --git a/meta-efl/recipes-devtools/python/python-edje_svn.bb b/meta-efl/recipes-devtools/python/python-edje_svn.bb
index 3d392d0..eca8b75 100644
--- a/meta-efl/recipes-devtools/python/python-edje_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edje_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
index a0298e8..d551073 100644
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
diff --git a/meta-efl/recipes-devtools/python/python-emotion_svn.bb b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
index a0298e8..d551073 100644
--- a/meta-efl/recipes-devtools/python/python-emotion_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
diff --git a/meta-efl/recipes-devtools/python/python-evas_svn.bb b/meta-efl/recipes-devtools/python/python-evas_svn.bb
index a0298e8..d551073 100644
--- a/meta-efl/recipes-devtools/python/python-evas_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-evas_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.99+svnr${SRCPV}"
+PV = "1.7.0+svnr${SRCPV}"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
-- 
1.7.12



