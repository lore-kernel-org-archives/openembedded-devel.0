Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TOy49-0000TB-Em
	for openembedded-devel@openembedded.org; Thu, 18 Oct 2012 23:55:46 +0200
Received: (qmail 24910 invoked by uid 1003); 18 Oct 2012 21:35:43 -0000
Received: from unknown (HELO oebuild.amer.corp.natinst.com)
	(philip@balister.org@157.22.28.10)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	18 Oct 2012 21:35:43 -0000
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Thu, 18 Oct 2012 14:36:57 -0700
Message-Id: <1350596217-26554-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1350596217-26554-1-git-send-email-philip@balister.org>
References: <1350596217-26554-1-git-send-email-philip@balister.org>
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe][PATCH 2/2] sshfs-fuse : Import recipe from Openembedded Classic.
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
X-List-Received-Date: Thu, 18 Oct 2012 21:55:46 -0000

From: Philip Balister <philip@opensdr.com>

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../sshfs-fuse/sshfs-fuse_2.4.bb                   |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/sshfs-fuse/sshfs-fuse_2.4.bb

diff --git a/meta-oe/recipes-connectivity/sshfs-fuse/sshfs-fuse_2.4.bb b/meta-oe/recipes-connectivity/sshfs-fuse/sshfs-fuse_2.4.bb
new file mode 100644
index 0000000..83d5c87
--- /dev/null
+++ b/meta-oe/recipes-connectivity/sshfs-fuse/sshfs-fuse_2.4.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "This is a filesystem client based on the SSH File Transfer Protocol using FUSE."
+AUTHOR = "Miklos Szeredi <miklos@szeredi.hu>"
+HOMEPAGE = "http://fuse.sourceforge.net/sshfs.html"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "glib-2.0 fuse"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/${P}.tar.gz"
+S = "${WORKDIR}/${P}"
+
+inherit autotools
+
+FILES_${PN} += "${libdir}/sshnodelay.so"
+
+SRC_URI[md5sum] = "3c7c3647c52ce84d09486f1da3a3ce24"
+SRC_URI[sha256sum] = "3c93ba8522568093c94ff9c5a3763929380dd229365d905769ff82475d774dd1"
+
-- 
1.7.7.6



