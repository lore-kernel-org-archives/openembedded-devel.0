Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oxyea-0001tz-8k
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 10:56:50 +0200
Received: (qmail 19722 invoked by uid 503); 21 Sep 2010 09:10:03 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 21 Sep 2010 09:10:03 -0000
Received: (qmail 5654 invoked by uid 503); 21 Sep 2010 08:39:33 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 21 Sep 2010 08:39:32 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 10:56:42 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2010 10:56:41 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 10:56:03 +0200
Message-Id: <1285059363-2190-9-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285059363-2190-8-git-send-email-eric@eukrea.com>
References: <1285059363-2190-1-git-send-email-eric@eukrea.com>
	<1285059363-2190-2-git-send-email-eric@eukrea.com>
	<1285059363-2190-3-git-send-email-eric@eukrea.com>
	<1285059363-2190-4-git-send-email-eric@eukrea.com>
	<1285059363-2190-5-git-send-email-eric@eukrea.com>
	<1285059363-2190-6-git-send-email-eric@eukrea.com>
	<1285059363-2190-7-git-send-email-eric@eukrea.com>
	<1285059363-2190-8-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8306889512909974865
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gs: add gs-fonts-std
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
X-List-Received-Date: Tue, 21 Sep 2010 08:56:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* thsi is one of the font packages gs can use to render ps files

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/gs/gs-fonts-std_8.11.bb |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gs/gs-fonts-std_8.11.bb

diff --git a/recipes/gs/gs-fonts-std_8.11.bb b/recipes/gs/gs-fonts-std_8.11.bb
new file mode 100644
index 0000000..76e331c
--- /dev/null
+++ b/recipes/gs/gs-fonts-std_8.11.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Ghostscript fonts package"
+LICENSE = "GPL"
+SECTION = "fonts"
+HOMEPAGE = ""
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/gs-fonts/ghostscript-fonts-std-${PV}.tar.gz \
+           "
+
+PACKAGE_ARCH = "all"
+
+SRC_URI[md5sum] = "6865682b095f8c4500c54b285ff05ef6"
+SRC_URI[sha256sum] = "0eb6f356119f2e49b2563210852e17f57f9dcc5755f350a69a46a0d641a0c401"
+
+S = "${WORKDIR}/fonts"
+
+do_install () {
+	install -d ${D}${datadir}/fonts
+	install -m 644 ${S}/*.pfb ${D}${datadir}/fonts
+	install -m 644 ${S}/*.afm ${D}${datadir}/fonts
+	install -m 644 ${S}/*.pfm ${D}${datadir}/fonts
+}
+
+PACKAGES += "${PN}-pfb ${PN}-afm ${PN}-pfm"
+RDEPENDS_${PN} = "${PN}-pfb ${PN}-afm ${PN}-pfm"
+FILES_${PN}-pfb += "${datadir}/fonts/*.pfb"
+FILES_${PN}-afm += "${datadir}/fonts/*.afm"
+FILES_${PN}-pfm += "${datadir}/fonts/*.pfm"
-- 
1.6.3.3



