Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RnyAA-0001b5-I4
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 21:00:46 +0100
Received: from localhost (85.229.138.125) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.213.0; Thu, 19 Jan 2012
	20:53:06 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jan 2012 20:53:08 +0100
Message-ID: <ba787e718994267f09ff11b8b4122d536175bffc.1327002701.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <cover.1327002701.git.anders@chargestorm.se>
References: <cover.1327002701.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [meta-oe][PATCH v4 2/2] systemd: conditionally RRECOMMENDS kbd*
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
X-List-Received-Date: Thu, 19 Jan 2012 20:00:46 -0000
Content-Type: text/plain

Let the distro define a keyboard distro feature, to conditionally include
kbd*. (Headless distros might not want to RRECOMMENDS kbd*).

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 0fa61a7..363fb05 100644
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
+RRECOMMENDS_${PN} += "${@base_contains("DISTRO_FEATURES", "keyboard", "kbd kbd-consolefonts", "", d)} \
                       systemd-serialgetty \
                       util-linux-agetty \
                       util-linux-swaponoff \
-- 
1.7.8.3



