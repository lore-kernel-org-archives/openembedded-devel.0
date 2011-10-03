Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAigZ-0005A2-9T
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:59 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4Vj5pez78j+VDeYxKuKZ4XVg5mb0NhOFdLCyK+b1534=;
	b=DU7z2DHaYwfM4cuuyo2wkW9EXDqqg7j/oJXfw1AZtthwj5jCqyzKbLMYm3th14KqJy
	bCDhZydxX23Bmh7cEg0Luyyaeu6SKGFm6R4tt5wXfEF3F2sKuyl1iXVZuRq0ThppMx7A
	iOQkYjYtPaBSv66u81tCBKsutXy2yLhU54Cz0=
Received: by 10.204.142.145 with SMTP id q17mr5075648bku.230.1317648629266;
	Mon, 03 Oct 2011 06:30:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v16sm13231559bkd.6.2011.10.03.06.30.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:30:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:22 +0200
Message-Id: <9de454689961675df4d498abac26521cec061fac.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 24/25] python-efl: use INC_PR
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
X-List-Received-Date: Mon, 03 Oct 2011 13:36:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-ecore_svn.bb    |    1 +
 .../recipes-devtools/python/python-edbus_svn.bb    |    1 +
 .../recipes-devtools/python/python-edje_svn.bb     |    1 +
 meta-efl/recipes-devtools/python/python-efl.inc    |    2 +-
 .../python/python-elementary_svn.bb                |    1 +
 .../recipes-devtools/python/python-emotion_svn.bb  |    1 +
 .../recipes-devtools/python/python-evas_svn.bb     |    1 +
 7 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-ecore_svn.bb b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
index 0b87608..a6ec5e6 100644
--- a/meta-efl/recipes-devtools/python/python-ecore_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
@@ -1,6 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "python-evas ecore"
 RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_svn.bb b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
index d6144e9..518f7c2 100644
--- a/meta-efl/recipes-devtools/python/python-edbus_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
@@ -1,6 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "edbus python-dbus"
 RDEPENDS_${PN} += "python-dbus"
diff --git a/meta-efl/recipes-devtools/python/python-edje_svn.bb b/meta-efl/recipes-devtools/python/python-edje_svn.bb
index 581cc1c..8afcbfd 100644
--- a/meta-efl/recipes-devtools/python/python-edje_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edje_svn.bb
@@ -1,6 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "edje python-evas"
 RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index f816305..fe4521c 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -7,7 +7,7 @@ AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
 DEPENDS = "python-cython-native python-pyrex-native python-numeric eina"
 RDEPENDS_${PN} += "python-lang"
 PV = "0.7.3+svnr${SRCPV}"
-PR = "ml1"
+INC_PR = "r2"
 
 # necessary to let the call for python-config succeed
 export BUILD_SYS
diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
index e7f18ec..ffb6d5e 100644
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -1,6 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary python-evas"
 RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
diff --git a/meta-efl/recipes-devtools/python/python-emotion_svn.bb b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
index ae2eb4c..89002c3 100644
--- a/meta-efl/recipes-devtools/python/python-emotion_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
@@ -1,6 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "emotion python-evas"
 RDEPENDS_${PN} += "python-ecore"
diff --git a/meta-efl/recipes-devtools/python/python-evas_svn.bb b/meta-efl/recipes-devtools/python/python-evas_svn.bb
index 8ec9c41..79844be 100644
--- a/meta-efl/recipes-devtools/python/python-evas_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-evas_svn.bb
@@ -1,5 +1,6 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "evas"
-- 
1.7.7



