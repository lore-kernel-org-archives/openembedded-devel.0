Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uoo-0004XD-Tg
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:24 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id D0D08275CE9E; Mon, 18 Oct 2010 20:51:51 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id CC3BB275CD26;
	Mon, 18 Oct 2010 20:51:49 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:22 +0200
Message-Id: <1287427884-1517-14-git-send-email-morphis@gravedo.de>
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
Subject: [PATCH 13/15] initscripts-shr: add mountdevtmpfs init script for palmpre machine
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:24 -0000

On the palmpre machine we are currently come into the SHR rootfs through mounting it from
/boot and switch the rootfs via pivot_root. So we can't automatically mount devtmpfs on
/dev. Instead we do this right after SHR begins to boot and before any other filesystem is
mounted on the new rootfs.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 .../shr/initscripts-shr/palmpre/mountdevtmpfs.sh   |    9 +++++++++
 recipes/shr/initscripts-shr_0.0.1.bb               |    9 ++++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 recipes/shr/initscripts-shr/palmpre/mountdevtmpfs.sh

diff --git a/recipes/shr/initscripts-shr/palmpre/mountdevtmpfs.sh b/recipes/shr/initscripts-shr/palmpre/mountdevtmpfs.sh
new file mode 100644
index 0000000..dbeb7c0
--- /dev/null
+++ b/recipes/shr/initscripts-shr/palmpre/mountdevtmpfs.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+mount -t devtmpfs -o mode=0755,nr_inodes=0 devtmpfs /dev
+
+# Create additional nodes which devtmpfs does not provide
+test -c /dev/fd || ln -s /proc/self/fd /dev/fd
+test -c /dev/stdin || ln -s fd/0 /dev/stdin
+test -c /dev/stdout || ln -s fd/1 /dev/stdout
+test -c /dev/stderr || ln -s fd/2 /dev/stderr
diff --git a/recipes/shr/initscripts-shr_0.0.1.bb b/recipes/shr/initscripts-shr_0.0.1.bb
index e4dc736..ce76fbd 100644
--- a/recipes/shr/initscripts-shr_0.0.1.bb
+++ b/recipes/shr/initscripts-shr_0.0.1.bb
@@ -5,7 +5,7 @@ DEPENDS = ""
 RDEPENDS_${PN} = "procps"
 LICENSE = "GPL"
 PV = "0.0.1"
-PR = "r20"
+PR = "r21"
 
 RCONFLICTS_${PN} = "initscripts"
 
@@ -32,6 +32,8 @@ SRC_URI = "file://alignment.sh \
 	   file://umountnfs.sh \
 	   "
 
+SRC_URI_append_palmpre = " file://mountdevtmpfs.sh"
+
 inherit base
 
 do_install () {
@@ -74,6 +76,11 @@ do_install () {
 	install -m 0755	${WORKDIR}/umountfs		${D}${sysconfdir}/init.d
 	install -m 0755	${WORKDIR}/umountnfs.sh		${D}${sysconfdir}/init.d
 
+	if [ "${MACHINE}" == "palmpre" ]; then
+		install -m 0755 ${WORKDIR}/mountdevtmpfs.sh ${D}${sysconfdir}/init.d
+		ln -sf ../init.d/mountdevtmpfs.sh ${D}${sysconfdir}/rcS.d/S03mountdevtmpfs.sh
+	fi
+
 #
 # Create runlevel links
 #
-- 
1.7.1



