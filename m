Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <jdk@ti.com>)
	id 1RBZvx-0002Z1-VK for openembedded-devel@lists.openembedded.org;
	Thu, 06 Oct 2011 00:27:26 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p95MLnvj015993
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Oct 2011 17:21:49 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p95MLnEi016144
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Oct 2011 17:21:49 -0500 (CDT)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p95MLnh7010056
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Oct 2011 17:21:49 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3; Wed, 5 Oct 2011
	17:21:49 -0500
Received: from D620.am.dhcp.ti.com (d620.am.dhcp.ti.com [10.247.23.112])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id p95MLneH010962;
	Wed, 5 Oct 2011 17:21:49 -0500
From: Jason Kridner <jdk@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Oct 2011 18:21:51 -0400
Message-ID: <1317853311-13497-1-git-send-email-jdk@ti.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [meta-oe v2] cloud9: created
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
X-List-Received-Date: Wed, 05 Oct 2011 22:27:26 -0000
Content-Type: text/plain

Cloud9 is a web-browser based IDE running on node.js.

This application should support multiple architectures as long as they have
node.js and a build of node-o3-xml that is dropped into this system.
Currently, that includes x86 32/64-bit and ARM armv7.  Ideally, that library
would be added separately as a system-dependent portion, because everything
else should be ISA independent.

Signed-off-by: Jason Kridner <jdk@ti.com>
---
v2:
* addressed feedback from http://patches.openembedded.org/patch/12077/
* moved shared workspace to /var/lib/cloud9
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb |   38 +++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
new file mode 100644
index 0000000..6ae2246
--- /dev/null
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Meet Cloud9, development-as-a-service for Javascripters and other developers"
+HOMEPAGE = "http://c9.io"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
+DEPENDS = "rsync"
+RDEPENDS = "nodejs"
+
+SRC_URI = "git://github.com/jadonk/cloud9.git;protocol=git \
+"
+
+SRCREV = "08bae1d1cc2ba9f7f883a25afd07f0339a82fa8b"
+S = "${WORKDIR}/git"
+
+# Most of cloud9 is in git submodules that still need to be fetched.
+do_configure_prepend () {
+ git submodule update --init --recursive
+}
+
+# There's nothing left to be compiled at this time.
+# node-o3-xml is the only compiled code module in here.
+# The repository has binaries for:
+#  Linux ARM armv7
+#  Linux x86 32/64-bit
+#  Sun Solaris 32-bit
+#  Mac x86 32/64-bit
+#  Windows x86 32-bit
+do_compile () {
+:
+}
+
+do_install () {
+ install -m 0755 -d ${D}/usr/share/cloud9 ${D}${bindir} ${D}/var/lib/cloud9
+ rsync -r --exclude=".*" ${S}/* ${D}/usr/share/cloud9
+ touch ${D}${bindir}/cloud9
+ echo "#!/bin/sh" > ${D}${bindir}/cloud9
+ echo "node /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000" >> ${D}${bindir}/cloud9
+ chmod 0755 ${D}${bindir}/cloud9
+}
-- 
1.7.4.1



