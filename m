Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RIH77-0006aa-DZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 11:46:37 +0200
Received: by wyg19 with SMTP id 19so6135383wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2011 02:40:40 -0700 (PDT)
Received: by 10.227.171.3 with SMTP id f3mr8609303wbz.100.1319449240731;
	Mon, 24 Oct 2011 02:40:40 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	fw16sm30193649wbb.13.2011.10.24.02.40.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 02:40:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 11:40:27 +0200
Message-Id: <1319449234-12080-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 1/8] wavpack 4.60.1: import from OE classic
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
X-List-Received-Date: Mon, 24 Oct 2011 09:46:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-multimedia/wavpack/wavpack_4.60.1.bb   |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb

diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb
new file mode 100644
index 0000000..cc5b844
--- /dev/null
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_4.60.1.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "WavPack is a completely open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://license.txt;md5=f596650807588c61fcab60bec8242df8"
+
+SRC_URI = "http://wavpack.com/wavpack-${PV}.tar.bz2"
+SRC_URI[md5sum] = "7bb1528f910e4d0003426c02db856063"
+SRC_URI[sha256sum] = "175ee4f2effd6f51e6ec487956f41177256bf892c2e8e07de5d27ed4ee6888c5"
+
+inherit autotools lib_package
+
-- 
1.6.6.1



