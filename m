Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OlRjJ-000364-Tl
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 21:22:21 +0200
Received: by qyk11 with SMTP id 11so1085089qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 12:21:31 -0700 (PDT)
Received: by 10.229.37.3 with SMTP id v3mr265834qcd.169.1282072890607;
	Tue, 17 Aug 2010 12:21:30 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id r36sm9127282qcs.15.2010.08.17.12.21.29
	(version=SSLv3 cipher=RC4-MD5); Tue, 17 Aug 2010 12:21:29 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 14:21:25 -0500
Message-Id: <1282072886-11562-2-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
In-Reply-To: <1282072886-11562-1-git-send-email-jkridner@beagleboard.org>
References: <1282072886-11562-1-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard-olddemo-image: saved off beagleboard-demo-image
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
X-List-Received-Date: Tue, 17 Aug 2010 19:22:21 -0000

I want to use the name beagleboard-demo-image for what actually ships
with the xM boards.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/images/beagleboard-olddemo-image.bb |   30 +++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 recipes/images/beagleboard-olddemo-image.bb

diff --git a/recipes/images/beagleboard-olddemo-image.bb b/recipes/images/beagleboard-olddemo-image.bb
new file mode 100644
index 0000000..d83281c
--- /dev/null
+++ b/recipes/images/beagleboard-olddemo-image.bb
@@ -0,0 +1,30 @@
+# Demo image for beagleboard
+
+IMAGE_LINGUAS = "de-de fr-fr en-gb en-us pt-br es-es kn-in ml-in ta-in"
+
+XSERVER ?= "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-input-keyboard \
+"
+
+ANGSTROM_EXTRA_INSTALL ?= ""
+SPLASH = "exquisite exquisite-themes exquisite-theme-angstrom"
+
+export IMAGE_BASENAME = "Beagleboard-demo-image"
+
+DEPENDS = "task-base"
+IMAGE_INSTALL = "\
+    ${XSERVER} \
+    ${ANGSTROM_EXTRA_INSTALL} \
+    task-beagleboard-demo \
+    ${SPLASH} \
+    "
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+#zap root password for release images
+ROOTFS_POSTPROCESS_COMMAND += 'install_linguas; ${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
+
+inherit image
-- 
1.5.6.4



