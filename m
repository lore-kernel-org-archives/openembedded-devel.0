Received: from smtpauth17.prod.mesa1.secureserver.net ([64.202.165.29])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Ph5qI-0003jO-CR
	for openembedded-devel@openembedded.org; Sun, 23 Jan 2011 20:43:18 +0100
Received: (qmail 16288 invoked from network); 23 Jan 2011 19:16:59 -0000
Received: from unknown (209.242.7.132)
	by smtpauth17.prod.mesa1.secureserver.net (64.202.165.29) with ESMTP;
	23 Jan 2011 19:16:59 -0000
Message-ID: <4D3C8312.2040405@mwester.net>
Date: Sun, 23 Jan 2011 13:35:46 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@openembedded.org>
Subject: [PATCH] add version 1.1.3 of cryptsetup
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
X-List-Received-Date: Sun, 23 Jan 2011 19:43:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Updates cryptsetup recipe to version 1.1.3, the most recent version that builds
with the current version of automake in OE.  Note that we need to keep the old
1.0.5 recipe, even though it is not fetchable any longer, because the license
has changed.

Signed-off-by: Mike Westerhof <mike@mwester.net>
---

diff --git a/recipes/cryptsetup/cryptsetup_1.1.3.bb b/recipes/cryptsetup/cryptsetup_1.1.3.bb
new file mode 100644
index 0000000..54fd96e
--- /dev/null
+++ b/recipes/cryptsetup/cryptsetup_1.1.3.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Setup virtual encryption devices under dm-crypt Linux"
+HOMEPAGE = "http://code.google.com/p/cryptsetup/"
+SECTION = "console"
+LICENSE = "GPLv2"
+DEPENDS = "util-linux-ng device-mapper libgcrypt popt"
+RRECOMMENDS_${PN} = "kernel-module-aes \
+                     kernel-module-dm-crypt \
+                     kernel-module-md5 \
+                     kernel-module-cbc \
+                     kernel-module-sha256 \
+                    "
+PR = "r0"
+
+SRC_URI = "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2"
+SRC_URI[md5sum] = "318a64470861ea5b92a52f2014f1e7c1"
+SRC_URI[sha256sum] = "9c8e68a272f6d9cfb6cd65cc0743f4c44a2096c61f74e0602bf40208b5e69c0a"
+
+inherit autotools


