Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RIH7H-0006bu-If
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 11:46:47 +0200
Received: by wwf10 with SMTP id 10so7127571wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2011 02:40:51 -0700 (PDT)
Received: by 10.216.131.163 with SMTP id m35mr8665867wei.70.1319449250694;
	Mon, 24 Oct 2011 02:40:50 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fr4sm9299104wbb.0.2011.10.24.02.40.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 02:40:49 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 11:40:31 +0200
Message-Id: <1319449234-12080-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1319449234-12080-4-git-send-email-koen@dominion.thruhere.net>
References: <1319449234-12080-1-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-2-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-3-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-4-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 5/8] libass 0.9.11: import from OE classic
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
X-List-Received-Date: Mon, 24 Oct 2011 09:46:47 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/libass/libass.inc       |   25 ++++++++++++++++++++
 meta-oe/recipes-multimedia/libass/libass_0.9.11.bb |    7 +++++
 2 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/libass/libass.inc
 create mode 100644 meta-oe/recipes-multimedia/libass/libass_0.9.11.bb

diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass.inc
new file mode 100644
index 0000000..9fc0e07
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libass/libass.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "libass is a portable subtitle renderer for the ASS/SSA (Advanced Substation Alpha/Substation Alpha) subtitle format. It is mostly compatible with VSFilter."
+HOMEPAGE = "http://code.google.com/p/libass/"
+SECTION = "libs/multimedia"
+
+LICENSE = "ISC"
+
+DEPENDS = "enca fontconfig freetype libpng"
+
+INC_PR = "r0"
+
+SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.bz2"
+
+inherit autotools pkgconfig
+
+OE_EXTRACONF = " \
+	--enable-enca \
+	--enable-fontconfig \
+	--enable-png \
+"
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN}-tests = " \
+	${libdir}/test/test \
+"
diff --git a/meta-oe/recipes-multimedia/libass/libass_0.9.11.bb b/meta-oe/recipes-multimedia/libass/libass_0.9.11.bb
new file mode 100644
index 0000000..62c7cf8
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libass/libass_0.9.11.bb
@@ -0,0 +1,7 @@
+require ${PN}.inc
+PR = "${INC_PR}.0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI[md5sum] = "f9042884397002ba40aa89dc7d34f59f"
+SRC_URI[sha256sum] = "ffd0a7ccf635c4795edb8f61015b47ff84ec9c5babf502dd2cc8223d4489745c"
-- 
1.6.6.1



