Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <jdk@ti.com>)
	id 1R7MVi-000529-D9 for openembedded-devel@lists.openembedded.org;
	Sat, 24 Sep 2011 09:18:54 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p8O7933Z015880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Sep 2011 02:09:03 -0500
Received: from DLEE74.ent.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p8O7932I028742
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Sep 2011 02:09:03 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 24 Sep 2011 02:09:03 -0500
Received: from D620.gateway.2wire.net (h0-23.vpn.ti.com [172.24.0.23])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id p8O792bQ003179;
	Sat, 24 Sep 2011 02:09:02 -0500
From: Jason Kridner <jdk@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 24 Sep 2011 03:08:14 -0400
Message-ID: <1316848094-30368-1-git-send-email-jdk@ti.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [meta-oe] WIP: cloud9: created
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
X-List-Received-Date: Sat, 24 Sep 2011 07:18:54 -0000
Content-Type: text/plain

Cloud9 is a web-browser based IDE.  This application should support
multiple architectures as long as they have node.js and a build of
node-o3-xml that is dropped into this system.  Ideally, that library
would be added separately as a system-dependent portion, because
everything else should be ISA independent.

Advice on cleaning up this recipe is welcome.  I will continue to
improve it as I understand how.  It is rather useful as-is.
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb |   28 +++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
new file mode 100644
index 0000000..626332f
--- /dev/null
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Meet Cloud9, development-as-a-service for Javascripters and other developers"
+HOMEPAGE = "http://c9.io"
+RDEPENDS = "nodejs"
+
+SRC_URI = "git://github.com/jadonk/cloud9.git;protocol=git \
+"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
+
+SRCREV = "08bae1d1cc2ba9f7f883a25afd07f0339a82fa8b"
+S = "${WORKDIR}/git"
+
+do_configure_prepend () {
+ git submodule update --init --recursive
+}
+
+do_compile () {
+}
+
+do_install () {
+ install -m 0755 -d ${D}/usr/share/cloud9 ${D}${bindir}
+ rsync -r --exclude=".*" ${S}/* ${D}/usr/share/cloud9
+ touch ${D}${bindir}/cloud9
+ echo "#!/bin/sh" > ${D}${bindir}/cloud9
+ echo "node /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /home/root -p 3000" >> ${D}${bindir}/cloud9
+ chmod 0755 ${D}${bindir}/cloud9
+}
-- 
1.7.4.1



