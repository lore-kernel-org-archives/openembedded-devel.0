Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PghgN-0000L1-Am
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 18:55:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id EC8BA314D1A8;
	Sat, 22 Jan 2011 18:54:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id OnEpyhUrEGpz; Sat, 22 Jan 2011 18:54:19 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 1CA9E314D133;
	Sat, 22 Jan 2011 18:54:18 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sat, 22 Jan 2011 17:54:18 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jan 2011 17:54:17 +0000
Message-Id: <1295718857-31279-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
Cc: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
Subject: [PATCH] python-zopeinterface-3.5.1: fix packaging
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
X-List-Received-Date: Sat, 22 Jan 2011 17:55:30 -0000

* Inherit setuptools instead of distutils.

  Install paths with distutils (built on x86_64 for mipsel):
  usr/lib/python2.6/site-packages/zope.interface-3.5.1-py2.6-linux-x86_64.egg/zope/interface/*.py

  Install paths with setuptools:
  usr/lib/python2.6/site-packages/zope/interface/*.py

* Package tests into ${PN}-tests.
* Package .c files into ${PN}-dev.
* Package .txt files into ${PN}-doc.
* oe-stylized.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
---
 recipes/zope/python-zopeinterface_3.5.1.bb |   22 +++++++++++++---------
 1 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/recipes/zope/python-zopeinterface_3.5.1.bb b/recipes/zope/python-zopeinterface_3.5.1.bb
index c0d3f60..1267756 100644
--- a/recipes/zope/python-zopeinterface_3.5.1.bb
+++ b/recipes/zope/python-zopeinterface_3.5.1.bb
@@ -2,17 +2,21 @@ DESCRIPTION = "Interface definitions for Zope products"
 SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "ZPL"
-
-RPROVIDES_${PN} += " zope-interfaces"
-
-inherit distutils
-
-PR = "r1"
+RPROVIDES_${PN} += "zope-interfaces"
+PR = "r2"
 
 SRC_URI = "http://pypi.python.org/packages/source/z/zope.interface/zope.interface-${PV}.tar.gz"
+SRC_URI[md5sum] = "685fc532550abb07cca6190c9cd2b901"
+SRC_URI[sha256sum] = "b81d898532c47f73475c2d0c23580e289eed25923d007eca8e62750c0998bba0"
+
 S = "${WORKDIR}/zope.interface-${PV}"
 
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"  
+inherit setuptools
 
-SRC_URI[md5sum] = "685fc532550abb07cca6190c9cd2b901"
-SRC_URI[sha256sum] = "b81d898532c47f73475c2d0c23580e289eed25923d007eca8e62750c0998bba0"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
+FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.c"
+FILES_${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.txt"
+FILES_${PN}-tests = " \
+        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/tests \
+        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/common/tests \
+"
-- 
1.7.2.3



