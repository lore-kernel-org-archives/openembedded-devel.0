Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lsdll-0002GK-OI
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Apr 2009 16:01:19 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id A946D189367; Sat, 11 Apr 2009 16:00:59 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Apr 2009 16:00:59 +0200
Message-Id: <1239458459-2493-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] gst-plugins-base: depend on libtheora so gst-plugin theora gets built
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
X-List-Received-Date: Sat, 11 Apr 2009 14:01:19 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gstreamer/gst-plugins-base_0.10.22.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gstreamer/gst-plugins-base_0.10.22.bb b/recipes/gstreamer/gst-plugins-base_0.10.22.bb
index 92f2f56..3086d93 100644
--- a/recipes/gstreamer/gst-plugins-base_0.10.22.bb
+++ b/recipes/gstreamer/gst-plugins-base_0.10.22.bb
@@ -2,11 +2,11 @@ require gst-plugins.inc
 
 PROVIDES += "gst-plugins"
 
-PR = "r1"
+PR = "r2"
 
 # gst-plugins-base only builds the alsa plugin
 # if alsa has been built and is present.  You will
 # not get an error if this is not present, just 
 # a missing alsa plugin
-DEPENDS += "alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv"
+DEPENDS += "libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv"
 
-- 
1.5.6.5



