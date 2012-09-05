Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sander@outrightsolutions.nl>) id 1T9Fxj-0006Qo-UY
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 15:48:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 2296E5BC388;
	Wed,  5 Sep 2012 15:35:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yq7zFLO-+QqE; Wed,  5 Sep 2012 15:35:50 +0200 (CEST)
Received: from haze.lan (unknown [IPv6:2a02:2308::1ab:f800:2])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id 453025BC332;
	Wed,  5 Sep 2012 15:35:50 +0200 (CEST)
From: Sander van Grieken <sander@outrightsolutions.nl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 15:35:08 +0200
Message-Id: <1346852108-16462-2-git-send-email-sander@outrightsolutions.nl>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1346852108-16462-1-git-send-email-sander@outrightsolutions.nl>
References: <1346852108-16462-1-git-send-email-sander@outrightsolutions.nl>
Subject: [meta-oe][PATCH 2/2] ifuse: add recipe to expose files on Apple devices via fuse
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
X-List-Received-Date: Wed, 05 Sep 2012 13:48:12 -0000

Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
---
 meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb

diff --git a/meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb b/meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb
new file mode 100644
index 0000000..07131d6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb
@@ -0,0 +1,16 @@
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
+HOMEPAGE ="http://www.libimobiledevice.org/"
+
+DEPENDS = "fuse libimobiledevice"
+
+PR = "r0"
+
+SRC_URI = " \
+    http://www.libimobiledevice.org/downloads/ifuse-${PV}.tar.bz2 \
+    "
+
+SRC_URI[md5sum] = "4152526b2ac3c505cb41797d997be14d"
+SRC_URI[sha256sum] = "47835c8afb72588b3202fe0b206d7ea37a68663d9aa4eaf73f0a4bcb6215fc05"
+
+inherit autotools pkgconfig
-- 
1.7.9.5



