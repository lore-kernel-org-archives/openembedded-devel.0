Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkaMx-0005W6-MM
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 12:59:59 +0100
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.213.0; Tue, 10 Jan 2012
	12:52:31 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Jan 2012 12:52:29 +0100
Message-ID: <5dd3bb213c6027bdde9de0394b5dbbd0aeedaac7.1326196151.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <cover.1326196151.git.anders@chargestorm.se>
References: <cover.1326196151.git.anders@chargestorm.se>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 3/3] systemd: conditionally RRECOMMENDS kbd*
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
X-List-Received-Date: Tue, 10 Jan 2012 12:00:00 -0000
Content-Type: text/plain

If the machine lacks keyboard support, there is no need for kbd*-packages.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 0fa61a7..56e5d82 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r8"
+PR = "r9"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -101,7 +101,7 @@ RDEPENDS_${PN} += "dbus-systemd udev-systemd"
 # of blacklist support, so use proper modprobe from module-init-tools
 # And pull in the kernel modules mentioned in INSTALL
 # swapon -p is also not supported by busybox
-RRECOMMENDS_${PN} += "kbd kbd-consolefonts \
+RRECOMMENDS_${PN} += "${@base_contains("MACHINE_FEATURES", "keyboard", "kbd kbd-consolefonts", "", d)} \
                       systemd-serialgetty \
                       util-linux-agetty \
                       util-linux-swaponoff \
@@ -110,6 +110,9 @@ RRECOMMENDS_${PN} += "kbd kbd-consolefonts \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
+# RRECOMMENDS depends on MACHINE_FEATURES, thus this needs to be MACHINE_ARCH
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 # TODO:
 # u-a for runlevel and telinit
 
-- 
1.7.8.3



