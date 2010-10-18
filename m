Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uoh-0004WH-Ox
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:18 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id A9674275CD26; Mon, 18 Oct 2010 20:51:44 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id B7173275CE2F;
	Mon, 18 Oct 2010 20:51:42 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:18 +0200
Message-Id: <1287427884-1517-10-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 09/15] palmpre-audio-scripts: add initial version
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:18 -0000

For the palmpre machine some special audio scripts are needed to do audio routing, as it
is not possible to do audio routing with common tools used on other machines.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/palmpre/palmpre-audio-scripts_1.0.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/palmpre/palmpre-audio-scripts_1.0.bb

diff --git a/recipes/palmpre/palmpre-audio-scripts_1.0.bb b/recipes/palmpre/palmpre-audio-scripts_1.0.bb
new file mode 100644
index 0000000..48332e7
--- /dev/null
+++ b/recipes/palmpre/palmpre-audio-scripts_1.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Audio scripts necessary for audio routing on the palmpre machine"
+HOMEPAGE = "http://www.palm.com/"
+AUTHOR = "Palm Inc."
+SECTION = "console/utils"
+LICENSE = "Palm"
+
+PR = "r0"
+SRC_URI = "http://downloads.freesmartphone.org/palmpre-audio-scripts_${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "3e263163203ce66ae5f3a75776971d73"
+SRC_URI[sha256sum] = "044bbd9879f6e46b21c675421501f8920a4cab3ed4623259e2a52abecccd114e"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_install() {
+	install -d ${D}${sysconfdir}/audio/scripts
+	
+	for script in `ls ${WORKDIR}/*.txt`
+	do
+		install -m 0644 "${script}" "${D}${sysconfdir}/audio/scripts"
+	done
+}
+
-- 
1.7.1



