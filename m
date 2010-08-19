Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Om7DE-00041H-Fn
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 17:39:34 +0200
Received: by qyk8 with SMTP id 8so1477108qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 08:39:03 -0700 (PDT)
Received: by 10.224.20.9 with SMTP id d9mr6596924qab.310.1282232341837;
	Thu, 19 Aug 2010 08:39:01 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id f15sm1838426qcr.25.2010.08.19.08.39.00
	(version=SSLv3 cipher=RC4-MD5); Thu, 19 Aug 2010 08:39:00 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Aug 2010 10:38:59 -0500
Message-Id: <1282232339-24482-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
In-Reply-To: <1282085220-18619-1-git-send-email-jkridner@beagleboard.org>
References: <1282085220-18619-1-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] esc-media: updated revision
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
X-List-Received-Date: Thu, 19 Aug 2010 15:39:34 -0000

Added startup.wav (missed it the first time).  Corrected the MD5SUM.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/esc/esc-media_5.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/esc/esc-media_5.bb

diff --git a/recipes/esc/esc-media_5.bb b/recipes/esc/esc-media_5.bb
new file mode 100644
index 0000000..725de19
--- /dev/null
+++ b/recipes/esc/esc-media_5.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Media files to include on the Embedded Systems Conference workshop"
+LICENSE="Various"
+
+SRC_URI = "http://hivelocity.dl.sourceforge.net/project/showoff/esc_media_files.tar.gz"
+SRC_URI[md5sum] = "b75cbc0ce0dfcbd85de12e7fe9ecab8b"
+SRC_URI[sha256sum] = "364f474a6356326c113d964885207d90741f2e95770b079d96fffc4295e62739"
+
+S=${WORKDIR}/esc_media_files
+
+do_install() {
+    ESC_MEDIA="2009-obama-congress-speech.avi AlphaAnimal.license \
+               AlphaAnimal.m4a BigBuckBunny_640x360.m4v bbb.flac \
+               bbb.mp3 bbb.ogg davincieffect.aac gstreamer-logo.svg \
+               sprc720.flv startup.wav"
+
+    install -d ${D}${datadir}/esc-media
+    for F in ${ESC_MEDIA} ; do
+        install -m 0644 ${S}/${F} ${D}${datadir}/esc-media
+    done
+}
+
+FILES_${PN} += "${datadir}/esc-media"
+
-- 
1.5.6.4



