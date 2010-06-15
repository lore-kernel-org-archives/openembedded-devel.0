Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OOakC-00028q-3g
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 20:20:17 +0200
Received: from p5b035734.dip.t-dialin.net ([91.3.87.52] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OOafr-0004GL-0o by authid <stefan@sostec.de> with cram_md5;
	Tue, 15 Jun 2010 20:15:49 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1OOafi-0001yE-MW; Tue, 15 Jun 2010 20:15:38 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jun 2010 20:15:25 +0200
Message-Id: <1276625727-22991-3-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH][STABLE 2/4] bug20.conf: Sync with Bug Labs repo
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
X-List-Received-Date: Tue, 15 Jun 2010 18:20:17 -0000

From: John Connolly <john@buglabs.net>

This brings the bug20 machine file in sync with the Bug Labs internal version.
The difference was only ubi as FSTYPE, tslib usage and some jffs2 tweaking.

Signed-off-by: John Connolly <john@buglabs.net>
Signed-off-by: Stefan Schmidt <stefan@buglabs.net>

---
 conf/machine/bug20.conf |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
index dbc1faf..2979c7e 100644
--- a/conf/machine/bug20.conf
+++ b/conf/machine/bug20.conf
@@ -8,6 +8,7 @@ XSERVER = "xserver-xorg \
            xserver-xorg-extension-dri \
            xserver-xorg-extension-glx \
            xf86-input-evdev \
+           xf86-input-tslib \
            xf86-input-mouse \
            xf86-video-omapfb \
            xf86-input-keyboard"
@@ -20,7 +21,8 @@ require conf/machine/include/omap3.inc
 # this kernel is not provided in OE yet
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-hah"
 
-IMAGE_FSTYPES += "tar.bz2"
+IMAGE_FSTYPES += "tar.bz2 ubi"
+EXTRA_IMAGECMD_jffs2 = "-lnp "
 
 SERIAL_CONSOLE = "115200 ttyS2"
 
-- 
1.7.1



