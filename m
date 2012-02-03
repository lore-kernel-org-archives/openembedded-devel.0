Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RtRuG-00029V-Fj
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Feb 2012 23:47:00 +0100
Received: from mizar.localdomain (79.7.167.83) by smtp207.alice.it (8.6.023.02)
	id 4F05A665035FEBE5; Fri, 3 Feb 2012 23:39:02 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri,  3 Feb 2012 23:38:56 +0100
Message-Id: <1328308736-3740-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1328308736-3740-1-git-send-email-andrea.adami@gmail.com>
References: <1328308736-3740-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][PATCH 2/2] tzcode-native_2011i: remove and use oe-core recipe
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
X-List-Received-Date: Fri, 03 Feb 2012 22:47:00 -0000

* there are no evident reasons justifying the presence in meta-oe layer.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-extended/tzcode/tzcode-native.inc  |   18 ------------------
 .../recipes-extended/tzcode/tzcode-native_2011i.bb |   20 --------------------
 2 files changed, 0 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/tzcode/tzcode-native.inc
 delete mode 100644 meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb

diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native.inc b/meta-oe/recipes-extended/tzcode/tzcode-native.inc
deleted file mode 100644
index 2f9f176..0000000
--- a/meta-oe/recipes-extended/tzcode/tzcode-native.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-INC_PR = "r5"
-
-SRC_URI = " \
-        http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode-${PV};subdir=${BPN}-${PV} \
-        http://www.iana.org/time-zones/repository/releases/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV};subdir=${BPN}-${PV} \
-	"
-
-inherit native
-
-do_install () {
-        install -d ${D}${bindir}
-        install -m 755 zic ${D}${bindir}/
-        install -m 755 zdump ${D}${bindir}/
-        install -m 755 tzselect ${D}${bindir}/
-}
-
-NATIVE_INSTALL_WORKS = "1"
diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb b/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
deleted file mode 100644
index 8ab4504..0000000
--- a/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require tzcode-native.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://README;md5=3ae8198f82258417ce29066d3b034035"
-
-# Note that elsie.nci.nih.gov removes old versions when new is coming out
-# So if this doesn't build for you because of missing source file, just
-# bump it to the latest available version, removing old one
-# Also, tzdata (and it is needed to build tzcode) version can differ from
-# tzcode version, thus this variable
-
-TZDATA_PV = "2011i"
-
-PR = "${INC_PR}.2"
-
-SRC_URI[tzcode-2011i.md5sum] = "cf7f4335b7c8682899fa2814e711c1b2"
-SRC_URI[tzcode-2011i.sha256sum] = "f0dd991de3f8d6c599c104e294377c9befa1ef40aa5a1d09e2e295a453f3c1ec"
-SRC_URI[tzdata-2011i.md5sum] = "c7a86ec34f30f8d6aa77ef94902a3047"
-SRC_URI[tzdata-2011i.sha256sum] = "f8dde7ca5e61f21ac34c8cdbef5568d00c829981211098f059d8104964c81ffa"
-
-- 
1.7.3.4



