Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O9Olt-0006X9-Vp
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 22:31:15 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id E98264B0111;
	Tue,  4 May 2010 22:27:26 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71]) by smtp2-g21.free.fr (Postfix) with ESMTP;
	Tue,  4 May 2010 22:27:25 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 May 2010 22:26:49 +0200
Message-Id: <1273004809-24230-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1273004809-24230-1-git-send-email-eric@eukrea.com>
References: <1273004809-24230-1-git-send-email-eric@eukrea.com>
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] crda: add version 1.1.1
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
X-List-Received-Date: Tue, 04 May 2010 20:31:15 -0000

- http://wireless.kernel.org/en/developers/Regulatory/CRDA
- CRDA acts as the udev helper for communication between the kernel and
userspace for regulatory compliance.

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/crda/crda_1.1.1.bb |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/crda/crda_1.1.1.bb

diff --git a/recipes/crda/crda_1.1.1.bb b/recipes/crda/crda_1.1.1.bb
new file mode 100644
index 0000000..f1d43a9
--- /dev/null
+++ b/recipes/crda/crda_1.1.1.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Wireless Central Regulatory Domain Agent"
+HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
+SECTION = "base"
+PRIORITY = "optional"
+LICENSE = "ISC"
+PR = "r0"
+
+DEPENDS = "libgcrypt libnl python-native python-m2crypto-native"
+RDEPENDS = "udev"
+
+SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
+	http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2009.11.25-regulatory.bin;name=reg \
+	"
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+	install -d ${D}/usr/lib/crda/
+	install -m 0644 ${WORKDIR}/2009.11.25-regulatory.bin ${D}/usr/lib/crda/regulatory.bin
+}
+
+SRC_URI[crda.md5sum] = "5fc77af68b3e21736b8ef2f8b061c810"
+SRC_URI[crda.sha256sum] = "59b4760da44a8f803caeaaa7fb97e0c6bd3f35f40445b28258e7f14c2fbe13b5"
+SRC_URI[reg.md5sum] = "873b5c55a26c8ba7674e083f51cb10aa"
+SRC_URI[reg.sha256sum] = "3ac77fa4d8034e4f5bc484adc4b073c3636dea26803e5e695cc54c15b629154a"
+
+FILES_${PN} += "\
+	/lib/udev/rules.d/85-regulatory.rules \
+	/usr/lib/crda/regulatory.bin \
+	"
\ No newline at end of file
-- 
1.6.3.3



