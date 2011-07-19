Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjCNN-0003Wu-9I
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2011 17:38:25 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6JFYIMh027736
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2011 10:34:18 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jul 2011 08:34:19 -0700
Message-Id: <0ded3206a7b2b1794252f21a432bce79c54206a6.1311089581.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311089581.git.tom_rini@mentor.com>
References: <cover.1311089581.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311089581.git.tom_rini@mentor.com>
References: <cover.1311089581.git.tom_rini@mentor.com>
Subject: [meta-oe][PATCH v2 2/2] mercurial-native: Add 1.9 version
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
X-List-Received-Date: Tue, 19 Jul 2011 15:38:25 -0000

This is based on 91c14caa8819b08def8ea99e02949e49604c2e86 from oe.dev
with an update to 1.9.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../mercurial/mercurial-native_1.9.bb              |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
new file mode 100644
index 0000000..7430a74
--- /dev/null
+++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "The Mercurial distributed SCM"
+HOMEPAGE = "http://mercurial.selenic.com/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "python-native"
+PR = "r0"
+
+SRC_URI = "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz"
+SRC_URI[md5sum] = "d4842129fa2732eb6ed1180467bc32e2"
+SRC_URI[sha256sum] = "711e4b1cd2924a7a88499d6c431a9122390183bf554d4e153edbb3b2f30123e0"
+
+S = "${WORKDIR}/mercurial-${PV}"
+
+inherit native
+
+EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} PREFIX=${prefix}"
+
+do_install () {
+        oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
+}
-- 
1.7.0.4



