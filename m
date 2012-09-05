Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sander@outrightsolutions.nl>) id 1T9Htp-0002Br-NC
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 17:52:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id CA61A5BC3B1;
	Wed,  5 Sep 2012 17:39:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FndQcQk1u-04; Wed,  5 Sep 2012 17:39:55 +0200 (CEST)
Received: from haze.lan (unknown [IPv6:2a02:2308::1ab:f800:2])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id 514915BC332;
	Wed,  5 Sep 2012 17:39:55 +0200 (CEST)
From: Sander van Grieken <sander@outrightsolutions.nl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 17:39:33 +0200
Message-Id: <1346859574-18589-1-git-send-email-sander@outrightsolutions.nl>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH v2 1/2] libimobiledevice: add recipe for Apple products protocol support
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
X-List-Received-Date: Wed, 05 Sep 2012 15:52:17 -0000

Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
---
 .../libimobiledevice/libimobiledevice_1.1.4.bb     |   21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
new file mode 100644
index 0000000..debb543
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "A protocol library to access an iPhone or iPod Touch in Linux"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
+    file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7 \
+    "
+
+HOMEPAGE ="http://www.libimobiledevice.org/"
+
+DEPENDS = "libplist usbmuxd libtasn1 gnutls libgcrypt"
+
+SRC_URI = " \
+    http://www.libimobiledevice.org/downloads/libimobiledevice-${PV}.tar.bz2 \
+    "
+
+SRC_URI[md5sum] = "3f28cbc6a2e30d34685049c0abde5183"
+SRC_URI[sha256sum] = "67499cfaa6172f566ee6b0783605acffe484fb7ddc3b09881ab7ac58667ee5b8"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = " --without-cython "
-- 
1.7.9.5



