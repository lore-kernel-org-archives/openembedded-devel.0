Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkFFn-0006rP-5U
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 14:27:11 +0100
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.213.0; Mon, 9 Jan 2012
	14:18:41 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Jan 2012 14:18:38 +0100
Message-ID: <5fec4c565130ce5590d5073421f211898d12dc24.1326114932.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.8.2
In-Reply-To: <cover.1326114932.git.anders@chargestorm.se>
References: <cover.1326114932.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH 2/2] systemd: split out systemd-analyze
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
X-List-Received-Date: Mon, 09 Jan 2012 13:27:11 -0000
Content-Type: text/plain

Split systemd-analyze to a separate package, to remove the implicit
dependency on python. (At least the rpm-packaging backend created a
run-time dependency on python).

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index bdaaf16..1d71bb6 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r7"
+PR = "r8"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -57,11 +57,13 @@ do_install() {
 	ln -s ${base_bindir}/systemd ${D}/init
 }
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock"
 
+FILES_${PN}-analyze = "${bindir}/systemd-analyze"
+
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
-- 
1.7.8.2



