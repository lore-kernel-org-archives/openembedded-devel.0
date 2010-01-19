Received: from proxy1.bredband.net ([195.54.101.71])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NXNBf-0002zm-D6
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 00:08:42 +0100
Received: from ipb1.telenor.se (195.54.127.164) by proxy1.bredband.net
	(7.3.140.3)
	id 4AD3E1C0027B1DEB for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 00:06:23 +0100
X-SMTPAUTH-B2: 
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApwOAKbJVUtT4zqIPGdsb2JhbAAIm24BAQEBN7xJhDME
X-IronPort-AV: E=Sophos;i="4.49,307,1262559600"; d="scan'208";a="27837131"
Received: from c-883ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.58.136])
	by ipb1.telenor.se with ESMTP; 20 Jan 2010 00:06:23 +0100
Message-ID: <4B563AED.6020504@atmel.com>
Date: Wed, 20 Jan 2010 00:06:21 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 195.54.101.71
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Build fbv with JPEG and PNG enabled
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
X-List-Received-Date: Tue, 19 Jan 2010 23:08:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Build fbv with jpeg and png enabled

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/fbv/fbv-1.0b/fbv-1.0b.patch |   12 ++++++++++++
 recipes/fbv/fbv_1.0b.bb             |   23 +++++++++++++++--------
 2 files changed, 27 insertions(+), 8 deletions(-)
 create mode 100644 recipes/fbv/fbv-1.0b/fbv-1.0b.patch

diff --git a/recipes/fbv/fbv-1.0b/fbv-1.0b.patch
b/recipes/fbv/fbv-1.0b/fbv-1.0b.patch
new file mode 100644
index 0000000..6fbd1fb
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
-- 
Best Regards
Ulf Samuelsson



