Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lokkb-0001Fy-Jw
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 31 Mar 2009 22:40:01 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id C3D8C189477; Tue, 31 Mar 2009 22:40:10 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.linuxtogo.org
Date: Tue, 31 Mar 2009 22:40:10 +0200
Message-Id: <1238532010-2837-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] omapzoom: linux-omap work better on the device than linux-omapzoom, so switch to that
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
X-List-Received-Date: Tue, 31 Mar 2009 20:40:02 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 conf/machine/omapzoom.conf |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/conf/machine/omapzoom.conf b/conf/machine/omapzoom.conf
index 22fe5d4..58b61f1 100644
--- a/conf/machine/omapzoom.conf
+++ b/conf/machine/omapzoom.conf
@@ -24,8 +24,7 @@ EXTRA_IMAGECMD_jffs2 = "-lnp "
 # Guesswork
 SERIAL_CONSOLE = "115200 ttyS2"
 
-# Will be merged into the linux-omap recipe soon
-PREFERRED_PROVIDER_virtual/kernel = "linux-omapzoom"
+PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 
 KERNEL_IMAGETYPE = "uImage"
 
-- 
1.5.6.5



