Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RnyAA-0001b4-FS
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 21:00:46 +0100
Received: from localhost (85.229.138.125) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.213.0; Thu, 19 Jan 2012
	20:53:06 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jan 2012 20:53:07 +0100
Message-ID: <5742b631d5ac1f4d075fbd5f0caa1ef190989342.1327002701.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <cover.1327002701.git.anders@chargestorm.se>
References: <cover.1327002701.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [meta-oe][PATCH v4 1/2] systemd: split out systemd-analyze
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

Split systemd-analyze to a separate package, to remove the implicit
dependency on python. (At least the rpm-packaging backend created a
run-time dependency on python).

Add an RDEPENDS_${PN}-analyze on python-dbus, as this is required for
systemd-analyze to work.

Add an RRECOMMENDS_${PN}-analyze on python-pycairo, as the plot command
in systemd-analyze requires this package.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index bdaaf16..0fa61a7 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r7"
+PR = "r8"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -57,11 +57,15 @@ do_install() {
 	ln -s ${base_bindir}/systemd ${D}/init
 }
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock"
 
+FILES_${PN}-analyze = "${bindir}/systemd-analyze"
+RDEPENDS_${PN}-analyze = "python-dbus"
+RRECOMMENDS_${PN}-analyze = "python-pycairo"
+
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
-- 
1.7.8.3



