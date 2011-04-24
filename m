Received: from smtp.tibbo.com ([81.171.42.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvorkin@tibbo.com>) id 1QE0gq-0003Mz-K3
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Apr 2011 16:53:36 +0200
Received: (qmail 18483 invoked by uid 508); 24 Apr 2011 18:56:57 +0400
Received: from dvhome.kansstel.ru (HELO localhost.localdomain) (79.171.10.83)
	by smtp.tibbo.com with SMTP; 24 Apr 2011 18:56:57 +0400
From: Dvorkin Dmitry <dvorkin@tibbo.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Apr 2011 18:52:02 +0400
Message-Id: <1303656722-27767-1-git-send-email-dvorkin@tibbo.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] ar9170 firmware
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
X-List-Received-Date: Sun, 24 Apr 2011 14:53:36 -0000

Signed-off-by: Dvorkin Dmitry <dvorkin@tibbo.com>
---
 recipes/firmwares/ar9170fw.bb |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 recipes/firmwares/ar9170fw.bb

diff --git a/recipes/firmwares/ar9170fw.bb b/recipes/firmwares/ar9170fw.bb
new file mode 100644
index 0000000..f2bb836
--- /dev/null
+++ b/recipes/firmwares/ar9170fw.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "ar9170 Wifi firmware"
+HOMEPAGE = "http://linuxwireless.org/en/users/Drivers/ar9170#open_firmware"
+LICENSE = "GPL"
+
+SRC_URI = "http://www.kernel.org/pub/linux/kernel/people/mcgrof/firmware/ar9170/ar9170.fw"
+
+S = "${WORKDIR}"
+
+do_compile() {
+	:
+}
+
+do_install() {
+	install -d ${D}/lib/firmware/
+	cp -rpP *.fw ${D}/lib/firmware/
+}
+
+FILES_${PN} += "/lib/firmware/*"
+PACKAGE_ARCH = "all"
+
+SRC_URI[md5sum] = "34feec4ec0eae3bb92c7c1ea2dfb4530"                            
+SRC_URI[sha256sum] = "1b379c5a8d6ab3a43911f7949d6306fe2dae3afb1368be5452a8fc7d9c54e0a0"
-- 
1.7.3.4



