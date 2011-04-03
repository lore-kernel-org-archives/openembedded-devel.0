Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1Q6THs-0005tp-7g
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Apr 2011 21:48:40 +0200
Received: by vxd7 with SMTP id 7so4263792vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Apr 2011 12:46:35 -0700 (PDT)
Received: by 10.52.90.107 with SMTP id bv11mr5125988vdb.288.1301859995160;
	Sun, 03 Apr 2011 12:46:35 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id h18sm2571853vbr.16.2011.04.03.12.46.34
	(version=SSLv3 cipher=OTHER); Sun, 03 Apr 2011 12:46:34 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Apr 2011 14:46:32 -0500
Message-Id: <1301859992-9658-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
Subject: [PATCH] avrgal: add recipe for avrgal-1.0
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
X-List-Received-Date: Sun, 03 Apr 2011 19:48:40 -0000

Avrgal is a hacked light version of avrdude intended to make it easier
to cross compile and use for uploading programs to the Arduino
boootloader.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/avrgal/avrgal_1.0.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 recipes/avrgal/avrgal_1.0.bb

diff --git a/recipes/avrgal/avrgal_1.0.bb b/recipes/avrgal/avrgal_1.0.bb
new file mode 100644
index 0000000..f6f6f37
--- /dev/null
+++ b/recipes/avrgal/avrgal_1.0.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "AVRGAL is a hacked light version of AVRDUDE intended to make it easier to cross compile and use for uploading programs to the Arduino boootloader"
+HOMEPAGE = "http://elinux.org/Avrgal"
+SECTION = "console"
+LICENSE = "GPLv2"
+
+DEPENDS = "virtual/libusb0 ncurses"
+
+SRC_URI = "http://elinux.org/images/8/8a/Avrgal.tar.gz"
+
+inherit autotools
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_install() {
+	mkdir -p ${D}${bindir}
+	install -m 0755 ${S}/avrgal ${D}${bindir}
+}
+
+SRC_URI[md5sum] = "7af51d301edf8548314d28d6d2cc1bc0"
+SRC_URI[sha256sum] = "43bc8442ea9c0df2a5e172cea8630969c541025587eb8c81f0eb703ac6a2d709"
-- 
1.5.6.4



