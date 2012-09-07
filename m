Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sander@outrightsolutions.nl>) id 1TA31D-0006qb-Hu
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 20:11:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 697665BC3EA;
	Fri,  7 Sep 2012 19:58:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AZnr4BpH5YdR; Fri,  7 Sep 2012 19:58:38 +0200 (CEST)
Received: from haze.lan (unknown [IPv6:2a02:2308::1ab:f800:2])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id 7F84A5BC3D7;
	Fri,  7 Sep 2012 19:58:38 +0200 (CEST)
From: Sander van Grieken <sander@outrightsolutions.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2012 19:58:26 +0200
Message-Id: <1347040706-23541-1-git-send-email-sander@outrightsolutions.nl>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] smbnetfs: add recipe for smbnetfs, a fuse filesystem for windows networks
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
X-List-Received-Date: Fri, 07 Sep 2012 18:11:03 -0000

Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
---
 .../recipes-connectivity/smbnetfs/smbnetfs_git.bb  |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb

diff --git a/meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb b/meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb
new file mode 100644
index 0000000..3bb1c6d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "smbnetfs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
+HOMEPAGE ="http://sourceforge.net/projects/smbnetfs"
+
+DEPENDS = "fuse samba"
+
+inherit autotools gitpkgv
+
+PKGV = "${GITPKGVTAG}"
+
+SRCREV = "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
+
+SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;protocol=git;branch=master"
+
+S = "${WORKDIR}/git"
-- 
1.7.9.5



