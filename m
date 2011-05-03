Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QHGod-00053P-46
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 16:43:07 +0200
Received: (qmail invoked by alias); 03 May 2011 14:40:17 -0000
Received: from p5B0A2372.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.35.114]
	by mail.gmx.net (mp010) with SMTP; 03 May 2011 16:40:17 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19sR49XpKZs27UTNxTKKYr/QIEtBvNr22RpwrFsUw
	Ntz+dNqoR8NHSv
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 May 2011 16:40:48 +0200
Message-Id: <1304433651-3278-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [PATCH v2 1/4] elftosb: Add native helper to create boot stream files used by freescale iMX SoCs
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
X-List-Received-Date: Tue, 03 May 2011 14:43:07 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../elftosb/uclibc_and_eglibc_have_no_powf.patch   |   12 ++++++++++++
 recipes/freescale/elftosb_10.12.01.bb              |   20 ++++++++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 recipes/freescale/elftosb/uclibc_and_eglibc_have_no_powf.patch
 create mode 100644 recipes/freescale/elftosb_10.12.01.bb

diff --git a/recipes/freescale/elftosb/uclibc_and_eglibc_have_no_powf.patch b/recipes/freescale/elftosb/uclibc_and_eglibc_have_no_powf.patch
new file mode 100644
index 0000000..7874023
--- /dev/null
+++ b/recipes/freescale/elftosb/uclibc_and_eglibc_have_no_powf.patch
@@ -0,0 +1,12 @@
+--- a/elftosb2/ElftosbAST.cpp.old	2010-09-20 15:28:03.000000000 +0200
++++ b/elftosb2/ElftosbAST.cpp	2011-04-18 22:25:54.000000000 +0200
+@@ -755,7 +755,8 @@
+ 			#ifdef WIN32
+ 				result = 0;
+ 			#else
+-				result = lroundf(powf(float(leftValue), float(rightValue)));
++				//result = lroundf(powf(float(leftValue), float(rightValue)));
++				result = 0;
+ 			#endif
+ 				break;
+ 			case kBitwiseAnd:
diff --git a/recipes/freescale/elftosb_10.12.01.bb b/recipes/freescale/elftosb_10.12.01.bb
new file mode 100644
index 0000000..9fc18a0
--- /dev/null
+++ b/recipes/freescale/elftosb_10.12.01.bb
@@ -0,0 +1,20 @@
+LICENSE = "FREESCALE"
+PR = "r0"
+
+SRC_URI = "http://foss.doredevelopment.dk/mirrors/imx/elftosb-${PV}.tar.gz \
+           file://uclibc_and_eglibc_have_no_powf.patch"
+
+SRC_URI[md5sum] = "e8005d606c1e0bb3507c82f6eceb3056"
+SRC_URI[sha256sum] = "77bb6981620f7575b87d136d94c7daa88dd09195959cc75fc18b138369ecd42b"
+
+BBCLASSEXTEND = "native"
+
+do_install() {
+        install -d ${D}${bindir}
+        install ${S}/bld/linux/elftosb ${D}${bindir}/
+        install ${S}/bld/linux/keygen ${D}${bindir}/
+        install ${S}/bld/linux/sbtool ${D}${bindir}/
+}
+
+NATIVE_INSTALL_WORKS = "1"
+
-- 
1.7.4.4



