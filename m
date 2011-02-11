Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Pnsfg-00054E-2g
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 14:04:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 995DB314D9EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:03:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id OL28RKJThf6a
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:03:07 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 32790314D9FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:03:06 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 11 Feb 2011 13:03:06 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 13:03:06 +0000
Message-Id: <1297429386-5688-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] gst-plugins-base-0.10.32: use integer-based resampling without FPU
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
X-List-Received-Date: Fri, 11 Feb 2011 13:04:32 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/gstreamer/gst-plugins-base_0.10.32.bb |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes/gstreamer/gst-plugins-base_0.10.32.bb b/recipes/gstreamer/gst-plugins-base_0.10.32.bb
index f30c4f9..025b589 100644
--- a/recipes/gstreamer/gst-plugins-base_0.10.32.bb
+++ b/recipes/gstreamer/gst-plugins-base_0.10.32.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
 SRC_URI[archive.md5sum] = "2920af2b3162f3d9fbaa7fabc8ed4d38"
 SRC_URI[archive.sha256sum] = "e9aabfac83f6480896da0686e9c911989f896fbad634821b7771ed84a446172b"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 PROVIDES += "gst-plugins"
 
@@ -17,8 +17,13 @@ PROVIDES += "gst-plugins"
 # a missing alsa plugin
 DEPENDS += "udev cdparanoia pango libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv libxrandr gtk+"
 
+def get_gstreamer_fpu_setting(bb, d):
+    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+        return "--with-audioresample-format=int"
+    return ""
+
 # Needs a udev that enabled gudev, which isn't the default
-EXTRA_OECONF += " --with-gudev --disable-gnome_vfs"
+EXTRA_OECONF += "--with-gudev --disable-gnome_vfs ${@get_gstreamer_fpu_setting(bb, d)}"
 
 do_configure_prepend() {
 	sed -i -e s:QtGui:NoQtGui:g ${S}/configure.ac
-- 
1.7.2.3



