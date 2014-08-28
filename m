Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-08.prod.phx3.secureserver.net
	(p3plsmtpa12-08.prod.phx3.secureserver.net [68.178.252.237])
	by mail.openembedded.org (Postfix) with ESMTP id 9645671164
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:13:42 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa12-08.prod.phx3.secureserver.net with 
	id kC6Q1o0081mTNtu01C6VDr; Thu, 28 Aug 2014 05:06:29 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Aug 2014 07:06:19 -0500
Message-Id: <1409227581-20888-4-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1409227581-20888-1-git-send-email-pab@pabigot.com>
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>
Subject: [meta-oe][PATCH 3/5] pps-tools: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Aug 2014 12:13:43 -0000

This provides some utilities and a user-space header necessary to use
the Linux KPPS (RFC 2783) capabilities of gpsd and ntp.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-oe/recipes-support/pps-tools/pps-tools_git.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/pps-tools/pps-tools_git.bb

diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_git.bb b/meta-oe/recipes-support/pps-tools/pps-tools_git.bb
new file mode 100644
index 0000000..73c46ee
--- /dev/null
+++ b/meta-oe/recipes-support/pps-tools/pps-tools_git.bb
@@ -0,0 +1,16 @@
+SUMMARY = "User-space tools for LinuxPPS"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+PV = "0.0.0+git${SRCPV}"
+SRCREV = "0deb9c7e135e9380a6d09e9d2e938a146bb698c8"
+SRC_URI = "git://github.com/ago/pps-tools.git"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}${bindir} ${D}${includedir} \
+                   ${D}${includedir}/sys
+        oe_runmake 'DESTDIR=${D}' install
+}
-- 
1.8.5.5


