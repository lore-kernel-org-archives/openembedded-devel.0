Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqD3a-0000Ss-2n
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 23:10:14 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 3843FCA1E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 22:39:07 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuY3ALpDmktT4zvyPGdsb2JhbACaaAwBAQEBNy2uSY1ThHsE
X-IronPort-AV: E=Sophos;i="4.49,628,1262559600"; d="scan'208";a="49444917"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 12 Mar 2010 22:39:07 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 22:39:06 +0100
Message-Id: <1268429946-12810-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 62.127.194.21
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] fbv-1.0: Build fbv with support for jpeg and bmp
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
X-List-Received-Date: Fri, 12 Mar 2010 22:10:14 -0000

fbv today only supports png files.
This patch will ensure fbv also support jpeg and bmp formats

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/fbv/fbv-1.0b/fbv-1.0b.patch |   12 ++++++++++++
 recipes/fbv/fbv_1.0b.bb             |   23 +++++++++++++++--------
 2 files changed, 27 insertions(+), 8 deletions(-)
 create mode 100644 recipes/fbv/fbv-1.0b/fbv-1.0b.patch

diff --git a/recipes/fbv/fbv-1.0b/fbv-1.0b.patch b/recipes/fbv/fbv-1.0b/fbv-1.0b.patch
new file mode 100644
index 0000000..2ca9d52
--- /dev/null
+++ b/recipes/fbv/fbv-1.0b/fbv-1.0b.patch
@@ -0,0 +1,12 @@
+diff -urN fbv-1.0b-0rig/Makefile fbv-1.0b/Makefile
+--- fbv-1.0b-0rig/Makefile	2009-08-20 00:33:58.000000000 +0200
++++ fbv-1.0b/Makefile	2009-08-20 00:34:16.000000000 +0200
+@@ -12,7 +12,7 @@
+ OBJECTS	= ${SOURCES:.c=.o}
+ 
+ OUT	= fbv
+-#LIBS	= -lungif -L/usr/X11R6/lib -ljpeg -lpng
++LIBS	= -L/usr/lib -ljpeg -lpng #-lungif
+ 
+ all: $(OUT)
+ 	@echo Build DONE.
diff --git a/recipes/fbv/fbv_1.0b.bb b/recipes/fbv/fbv_1.0b.bb
index 04c7066..4a5bd6b 100644
--- a/recipes/fbv/fbv_1.0b.bb
+++ b/recipes/fbv/fbv_1.0b.bb
@@ -1,25 +1,32 @@
 DESCRIPTION = "Frame Buffer Viewer"
 LICENSE = "GPL"
-DEPENDS = "libpng"
+DEPENDS = "libpng jpeg"
 PR = "r1"
 
 SRC_URI = "http://s-tech.elsat.net.pl/fbv/fbv-1.0b.tar.gz \
-	   file://cross_compile.patch;patch=1"
+	file://cross_compile.patch;patch=1 \
+	file://fbv-1.0b.patch;patch=1 \
+	"
+
+#inherit autotools
 
 do_configure() {
-	CC="${CC}" ./configure --without-libungif --without-bmp \
-		--without-libjpeg
+	CC="${CC}" ./configure --without-libungif
 }
 
 do_compile() {
 	oe_runmake CFLAGS="-O2 -Wall -D_GNU_SOURCE -D__KERNEL_STRICT_NAMES" \
 		CC="${CC}"
 }
+
 do_install() {
 	install -d ${D}${bindir}
-        install -m 0755 fbv ${D}${bindir}
+	install -m 0755 fbv ${D}${bindir}
 
-        # man
-        install -d ${D}${mandir}/man1/
-        install -m 0644 fbv.1 ${D}${mandir}/man1/fbv.1
+# man
+#	install -d ${D}${mandir}/man1/
+#	install -m 0644 fbv.1 ${D}${mandir}/man1/fbv.1
 }
+
+PACKAGES = "fbv"
+
-- 
1.6.0.2



