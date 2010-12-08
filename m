Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQScB-0007W9-Ky
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 23:36:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 06EBA314B659
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 23:34:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id uX+gpTnNOFve
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 23:34:23 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id BBDAA314B05B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 23:34:22 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 22:34:22 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 22:34:22 +0000
Message-Id: <1291847662-4820-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gst-plugins-bad: update EXTRA_OECONF (mjpegtools, sdl)
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
X-List-Received-Date: Wed, 08 Dec 2010 22:36:00 -0000

* Fix build with mjepegtools installed, by disabling mpeg2enc and mplex.
  The configure script of gst-plugins-bad wants to use AC_TRY_RUN for
  both of them, which doesn't work when cross-compiling.
* Remove --enable-sdl, because it is the default.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/gstreamer/gst-plugins-bad_0.10.20.bb |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.20.bb b/recipes/gstreamer/gst-plugins-bad_0.10.20.bb
index 74e395b..17f20eb 100644
--- a/recipes/gstreamer/gst-plugins-bad_0.10.20.bb
+++ b/recipes/gstreamer/gst-plugins-bad_0.10.20.bb
@@ -5,7 +5,12 @@ SRC_URI[archive.sha256sum] = "1031dff866df976a957f34039addbab4c0753406299a275f4c
 
 DEPENDS += "orc-native orc libcdaudio gst-plugins-base openssl directfb libmodplug librsvg"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-# We don't have vdpau headers in OE and it creates crosscompile badness
-EXTRA_OECONF_append = " --disable-vdpau --enable-sdl"
+# We don't have vdpau headers in OE and it creates crosscompile badness.
+# Also, mpeg2enc and mplex from mjpegtools don't build, because of AC_TRY_RUN.
+EXTRA_OECONF += " \
+        --disable-mpeg2enc \
+        --disable-mplex \
+        --disable-vdpau \
+"
-- 
1.7.2.3



