Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3N6Y-0008P5-Ld
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 10:12:58 +0200
Received: by weyr6 with SMTP id r6so3977251wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=B1yRIRigfk/ROo7g+Ggthi9lXIK+jlYcu+g1XkjZ6DA=;
	b=oXl0zmn4iSO1//SzkiIEpJrmHyBdQz7JINHC7oHsMVUpjWlR7njRFIg/kVjRt0e/Wv
	FhMVSW1z01HrqoTAlO1ofGCOQxc2DuocrFZgkktTIXP7EYQSxDQ2IDDg4xWpU0pX5vTa
	QIYkGFL/ZtIPV7fGcVBtM8iUz7jd6nF+E93albNXCrTXUy42XVYxJikj6FP2MPiEV/kh
	PXpUyevusiLuJlVxzs9JCgmnJGD6j8C8NhEMDZeBeKDFzx8VybtJyEPehabOe0RiE35O
	IwZQ5drbisDwUN1rAlzHT7VKjlsHpx6Ztg0bqmw2+z09tWoJuHqqpkTeWyNDCIexceBs
	YtNA==
Received: by 10.180.97.135 with SMTP id ea7mr25727112wib.11.1345449656547;
	Mon, 20 Aug 2012 01:00:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm26821636wib.8.2012.08.20.01.00.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:00:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 10:00:50 +0200
Message-Id: <7c28fa0c71de1b487d05695b8401333140bc76b5.1345449578.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345449578.git.Martin.Jansa@gmail.com>
References: <cover.1345449578.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 47/52] python-efl: bump PV and reset PR
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
X-List-Received-Date: Mon, 20 Aug 2012 08:12:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-ecore_svn.bb    |    2 +-
 .../recipes-devtools/python/python-edbus_svn.bb    |    2 +-
 .../recipes-devtools/python/python-edje_svn.bb     |    2 +-
 meta-efl/recipes-devtools/python/python-efl.inc    |    4 ++--
 .../python/python-elementary_svn.bb                |    2 +-
 .../recipes-devtools/python/python-emotion_svn.bb  |    2 +-
 .../recipes-devtools/python/python-evas_svn.bb     |    2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-ecore_svn.bb b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
index 2edf864..a6ec5e6 100644
--- a/meta-efl/recipes-devtools/python/python-ecore_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-ecore_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "python-evas ecore"
 RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-edbus_svn.bb b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
index 256a52a..518f7c2 100644
--- a/meta-efl/recipes-devtools/python/python-edbus_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edbus_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "edbus python-dbus"
 RDEPENDS_${PN} += "python-dbus"
diff --git a/meta-efl/recipes-devtools/python/python-edje_svn.bb b/meta-efl/recipes-devtools/python/python-edje_svn.bb
index f527959..a6b376c 100644
--- a/meta-efl/recipes-devtools/python/python-edje_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-edje_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "edje python-evas evas"
 RDEPENDS_${PN} += "python-evas"
diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index a4df6a6..498c3be 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -6,8 +6,8 @@ AUTHOR = "Gustavo Sverzut Barbieri <barbieri@gmail.com>"
 # the extension modules.
 DEPENDS = "python-cython-native python-pyrex-native python-numeric eina"
 RDEPENDS_${PN} += "python-lang"
-PV = "0.7.3+svnr${SRCPV}"
-INC_PR = "r2"
+PV = "1.6.99+svnr${SRCPV}"
+INC_PR = "r0"
 
 # necessary to let the call for python-config succeed
 export BUILD_SYS
diff --git a/meta-efl/recipes-devtools/python/python-elementary_svn.bb b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
index 911ed6f..ffb6d5e 100644
--- a/meta-efl/recipes-devtools/python/python-elementary_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-elementary_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-PR = "${INC_PR}.6"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary python-evas"
 RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
diff --git a/meta-efl/recipes-devtools/python/python-emotion_svn.bb b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
index a39c0c8..89002c3 100644
--- a/meta-efl/recipes-devtools/python/python-emotion_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-emotion_svn.bb
@@ -1,7 +1,7 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "emotion python-evas"
 RDEPENDS_${PN} += "python-ecore"
diff --git a/meta-efl/recipes-devtools/python/python-evas_svn.bb b/meta-efl/recipes-devtools/python/python-evas_svn.bb
index 8d719ce..79844be 100644
--- a/meta-efl/recipes-devtools/python/python-evas_svn.bb
+++ b/meta-efl/recipes-devtools/python/python-evas_svn.bb
@@ -1,6 +1,6 @@
 require python-efl.inc
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "evas"
-- 
1.7.8.6



