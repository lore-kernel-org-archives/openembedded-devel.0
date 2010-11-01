Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anders@chargestorm.se>) id 1PCum0-0005Pd-HM
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 14:50:14 +0100
Received: from localhost (195.84.30.88) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.106.1; Mon, 1 Nov 2010
	14:48:05 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Nov 2010 14:48:01 +0100
Message-ID: <1288619281-4363-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 1.7.2.3
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
X-SA-Exim-Connect-IP: 83.145.59.140
X-SA-Exim-Mail-From: anders@chargestorm.se
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Updated resolvconf to 1.46.
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
X-List-Received-Date: Mon, 01 Nov 2010 13:50:54 -0000
Content-Type: text/plain

1.45 is no longer downloadable from Debian.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 recipes/resolvconf/resolvconf_1.46.bb |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 recipes/resolvconf/resolvconf_1.46.bb

diff --git a/recipes/resolvconf/resolvconf_1.46.bb b/recipes/resolvconf/resolvconf_1.46.bb
new file mode 100644
index 0000000..8991f7f
--- /dev/null
+++ b/recipes/resolvconf/resolvconf_1.46.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Resolvconf is a framework for keeping track of the system's \
+information about currently available nameservers. It sets \
+itself up as the intermediary between programs that supply \
+nameserver information and programs that need nameserver \
+information."
+SECTION = "console/network"
+LICENSE = "GPL"
+AUTHOR = "Thomas Hood"
+HOMEPAGE = "http://packages.debian.org/resolvconf"
+DEPENDS = "bash"
+RDEPENDS_${PN} = "bash"
+PR = "r1"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
+
+do_compile () {
+	:
+}
+
+do_install () {
+	install -d ${D}${sysconfdir} ${D}${sbindir} ${D}${base_sbindir} ${D}${localstatedir}/run/resolvconf/interface
+	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
+	cp -pPR etc/* ${D}${sysconfdir}/
+	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
+	install -m 0644 README ${D}${docdir}/${P}/
+	install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/
+}
+
+PACKAGE_ARCH = "all"
+
+
+SRC_URI[md5sum] = "b276fc8834793f5c969ed7b57cb51660"
+SRC_URI[sha256sum] = "2996caa40fbe2e2c5b2558e2333bd520558aa21250a6ecc7310ca3e6f231292b"
-- 
1.7.2.3



