Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QJXZn-0006Ef-RN
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 23:01:12 +0200
Received: (qmail invoked by alias); 09 May 2011 20:58:23 -0000
Received: from p5B0A19A9.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.25.169]
	by mail.gmx.net (mp065) with SMTP; 09 May 2011 22:58:23 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+Zp+IyWhOZ+3LuLhLARYKbTCEj1siuLXp6uis3Nd
	KYRit8v2hlxZkv
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 22:59:06 +0200
Message-Id: <1304974747-21466-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [PATCH 1/2] u-boot: add 2011.03
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
X-List-Received-Date: Mon, 09 May 2011 21:01:12 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/u-boot/u-boot_2011.03.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot_2011.03.bb

diff --git a/recipes/u-boot/u-boot_2011.03.bb b/recipes/u-boot/u-boot_2011.03.bb
new file mode 100644
index 0000000..8ab385f
--- /dev/null
+++ b/recipes/u-boot/u-boot_2011.03.bb
@@ -0,0 +1,19 @@
+PR = "r0"
+require u-boot.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
+SRC_URI[md5sum] = "91d02124c94368557d0e9ac05fb8c33f"
+SRC_URI[sha256sum] = "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d3739117d6f6d68083e"
+
+
+TARGET_LDFLAGS = ""
+
+inherit base
+
+do_compile () {
+       oe_runmake ${UBOOT_MACHINE}
+       oe_runmake all
+}
+
-- 
1.7.4.4



