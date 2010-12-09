Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQjvo-00005C-Sq
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:05:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 5D001314B8E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id K3T+vHuZ4Ckp
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:48 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id DA4A6314B04A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:47 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 09 Dec 2010 17:03:47 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Dec 2010 17:03:40 +0000
Message-Id: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/8] gst-plugins-base: update to 0.10.31
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
X-List-Received-Date: Thu, 09 Dec 2010 17:05:25 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/gstreamer/gst-plugins-base_0.10.31.bb |   26 +++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gstreamer/gst-plugins-base_0.10.31.bb

diff --git a/recipes/gstreamer/gst-plugins-base_0.10.31.bb b/recipes/gstreamer/gst-plugins-base_0.10.31.bb
new file mode 100644
index 0000000..d479e13
--- /dev/null
+++ b/recipes/gstreamer/gst-plugins-base_0.10.31.bb
@@ -0,0 +1,26 @@
+require gst-plugins.inc
+
+SRC_URI += " \
+            file://ivorbis-thumb.patch \
+"
+
+SRC_URI[archive.md5sum] = "9baa0d87e81c88b2477a3554ab629c46"
+SRC_URI[archive.sha256sum] = "abb006c78222cfb69d31e983268d1d5219e9d4e0da24c6c4cd687968af7a33bd"
+
+PR = "${INC_PR}.0"
+
+PROVIDES += "gst-plugins"
+
+# gst-plugins-base only builds the alsa plugin
+# if alsa has been built and is present.  You will
+# not get an error if this is not present, just
+# a missing alsa plugin
+DEPENDS += "udev cdparanoia pango libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv gtk+"
+
+# Needs a udev that enabled gudev, which isn't the default
+EXTRA_OECONF_append = " --with-gudev"
+
+do_configure_prepend() {
+	sed -i -e s:QtGui:NoQtGui:g ${S}/configure.ac
+}
+
-- 
1.7.2.3



