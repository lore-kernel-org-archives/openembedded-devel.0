Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Nzq3S-0000n6-Py
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 13:38:09 +0200
Received: from w0952.wlan.rz.tu-bs.de ([134.169.203.190] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Nzq0B-0001AF-Kh by authid <stefan@sostec.de> with cram_md5;
	Thu, 08 Apr 2010 13:34:30 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>)
	id 1Nzq0A-0000L6-FS; Thu, 08 Apr 2010 13:34:26 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Apr 2010 13:34:25 +0200
Message-Id: <1270726465-1273-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] angstrom-2008-preferred-versions.inc: Bump python version to 2.6.4
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
X-List-Received-Date: Thu, 08 Apr 2010 11:38:14 -0000

This is done to match the python-native version. Without this we seem to get
trouble with some header mismatch or similar:

 ./libpython2.6.so: undefined reference to `_PyParser_Grammar'
---
 .../include/angstrom-2008-preferred-versions.inc   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
index dcab24b..79d1fd1 100644
--- a/conf/distro/include/angstrom-2008-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
@@ -36,7 +36,7 @@ PREFERRED_VERSION_pango-native     = "1.24.4"
 PREFERRED_VERSION_pkgconfig	= "0.23"
 PREFERRED_VERSION_pkgconfig-native = "0.23"
 PREFERRED_VERSION_pulseaudio 	= "0.9.15"
-PREFERRED_VERSION_python = "2.6.2"
+PREFERRED_VERSION_python = "2.6.4"
 PREFERRED_VERSION_qt4-tools-native = "${ANGSTROM_QT_VERSION}"
 PREFERRED_VERSION_qt4-tools-sdk = "${ANGSTROM_QT_VERSION}"
 PREFERRED_VERSION_qt4-embedded = "${ANGSTROM_QT_VERSION}"
-- 
1.7.0.4



