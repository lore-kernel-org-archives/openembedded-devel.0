Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O5fEb-0003uh-AO
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Apr 2010 15:17:28 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 676134B0127;
	Sat, 24 Apr 2010 15:13:46 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 304574B0131;
	Sat, 24 Apr 2010 15:13:44 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Apr 2010 15:14:46 +0200
Message-Id: <1272114888-16964-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1272114888-16964-1-git-send-email-eric@eukrea.com>
References: <1272114888-16964-1-git-send-email-eric@eukrea.com>
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] v86d : add 0.1.9
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
X-List-Received-Date: Sat, 24 Apr 2010 13:17:29 -0000

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/v86d/v86d_0.1.9.bb |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/v86d/v86d_0.1.9.bb

diff --git a/recipes/v86d/v86d_0.1.9.bb b/recipes/v86d/v86d_0.1.9.bb
new file mode 100644
index 0000000..e85ab91
--- /dev/null
+++ b/recipes/v86d/v86d_0.1.9.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "User support binary for the uvesafb kernel module"
+SRC_URI = "http://dev.gentoo.org/~spock/projects/uvesafb/archive/v86d-${PV}.tar.bz2 \
+           file://fbsetup"
+DEPENDS = "virtual/kernel"
+LICENSE = "GPLv2"
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
+
+RRECOMMENDS_${PN} = "kernel-module-uvesafb"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_HOST = 'i.86.*-linux'
+
+INITSCRIPT_NAME = "fbsetup"
+INITSCRIPT_PARAMS = "start 0 S ."
+
+do_configure () {
+	./configure --with-x86emu
+}
+
+do_compile () {
+	KDIR="${STAGING_KERNEL_DIR}" make
+}
+
+do_install () {
+	install -d ${D}${base_sbindir}
+	install v86d ${D}${base_sbindir}/
+	install -d ${D}${sysconfdir}/init.d/
+	install -m 0755 ${WORKDIR}/fbsetup ${D}${sysconfdir}/init.d/fbsetup
+}
+
+inherit update-rc.d
+
+SRC_URI[md5sum] = "ebbbc8e7013c9544b6ba6981add43831"
+SRC_URI[sha256sum] = "8167dec4ff919cfd73f854bbd3244f05c2b867e014fa8298044ea7cfd66d18a8"
-- 
1.6.3.3



