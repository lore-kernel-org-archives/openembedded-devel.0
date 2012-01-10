Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkXgi-0000pc-OH
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 10:08:12 +0100
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.213.0; Tue, 10 Jan 2012
	10:00:44 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Jan 2012 10:00:39 +0100
Message-ID: <6382f565655efb9aec552453275832a351bc7467.1326185831.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <cover.1326185831.git.anders@chargestorm.se>
References: <cover.1326185831.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [meta-oe][PATCH v2 3/3] systemd: conditionally RRECOMMENDS kbd*
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
X-List-Received-Date: Tue, 10 Jan 2012 09:08:12 -0000
Content-Type: text/plain

If the machine lacks keyboard support, there is no need for kbd*-packages.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 0fa61a7..7af8357 100644
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
-- 
1.7.8.3



