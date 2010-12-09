Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQjvv-00006Y-OX
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:05:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 4BF74314B04A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:04:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id JU+oDs907o23
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:56 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 46C2E314B8DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:52 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 09 Dec 2010 17:03:52 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Dec 2010 17:03:44 +0000
Message-Id: <1291914227-25068-5-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
References: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/8] gst-plugins-base: removed unpinned versions
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
X-List-Received-Date: Thu, 09 Dec 2010 17:05:33 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/gstreamer/gst-plugins-base/make382.patch |   25 --------------------
 recipes/gstreamer/gst-plugins-base_0.10.17.bb    |   17 -------------
 recipes/gstreamer/gst-plugins-base_0.10.22.bb    |   17 -------------
 recipes/gstreamer/gst-plugins-base_0.10.23.bb    |   15 ------------
 recipes/gstreamer/gst-plugins-base_0.10.28.bb    |   27 ----------------------
 recipes/gstreamer/gst-plugins-base_0.10.29.bb    |   27 ----------------------
 recipes/gstreamer/gst-plugins-base_0.10.30.bb    |   27 ----------------------
 7 files changed, 0 insertions(+), 155 deletions(-)
 delete mode 100644 recipes/gstreamer/gst-plugins-base/make382.patch
 delete mode 100644 recipes/gstreamer/gst-plugins-base_0.10.17.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-base_0.10.22.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-base_0.10.23.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-base_0.10.28.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-base_0.10.29.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-base_0.10.30.bb

diff --git a/recipes/gstreamer/gst-plugins-base/make382.patch b/recipes/gstreamer/gst-plugins-base/make382.patch
deleted file mode 100644
index f41dd76..0000000
--- a/recipes/gstreamer/gst-plugins-base/make382.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Index: gst-plugins-base-0.10.29/common/gtk-doc.mak
-===================================================================
---- gst-plugins-base-0.10.29.orig/common/gtk-doc.mak
-+++ gst-plugins-base-0.10.29/common/gtk-doc.mak
-@@ -232,6 +232,6 @@ dist-hook: dist-check-gtkdoc dist-hook-l
- 	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
- 	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
- 	cd $(distdir) && rm -f $(DISTCLEANFILES)
--        -gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
-+	-gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
- 
- .PHONY : dist-hook-local docs
-Index: gst-plugins-base-0.10.29/common/gtk-doc-plugins.mak
-===================================================================
---- gst-plugins-base-0.10.29.orig/common/gtk-doc-plugins.mak
-+++ gst-plugins-base-0.10.29/common/gtk-doc-plugins.mak
-@@ -352,7 +352,7 @@ dist-hook: dist-check-gtkdoc dist-hook-l
- 	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
- 	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
- 	cd $(distdir) && rm -f $(DISTCLEANFILES)
--        -gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
-+	-gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
- 
- .PHONY : dist-hook-local docs
- 
diff --git a/recipes/gstreamer/gst-plugins-base_0.10.17.bb b/recipes/gstreamer/gst-plugins-base_0.10.17.bb
deleted file mode 100644
index 5948796..0000000
--- a/recipes/gstreamer/gst-plugins-base_0.10.17.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require gst-plugins.inc
-
-PR = "${INC_PR}.1"
-
-PROVIDES += "gst-plugins"
-
-# gst-plugins-base only builds the alsa plugin
-# if alsa has been built and is present.  You will
-# not get an error if this is not present, just 
-# a missing alsa plugin
-DEPENDS += "alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv"
-
-PR = "r5"
-
-
-SRC_URI[archive.md5sum] = "151b66228e08ab0c7601713030fb1c3f"
-SRC_URI[archive.sha256sum] = "f82cfd5669c756726f503dde5936e2fbe2969631095f0efc40df1fae1a74f70d"
diff --git a/recipes/gstreamer/gst-plugins-base_0.10.22.bb b/recipes/gstreamer/gst-plugins-base_0.10.22.bb
deleted file mode 100644
index 21ed3e2..0000000
--- a/recipes/gstreamer/gst-plugins-base_0.10.22.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require gst-plugins.inc
-
-PR = "${INC_PR}.1"
-
-PROVIDES += "gst-plugins"
-
-PR = "r2"
-
-# gst-plugins-base only builds the alsa plugin
-# if alsa has been built and is present.  You will
-# not get an error if this is not present, just 
-# a missing alsa plugin
-DEPENDS += "libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv"
-
-
-SRC_URI[archive.md5sum] = "5d0f1e07f8f6db564971b50f75261e8a"
-SRC_URI[archive.sha256sum] = "184c5aed03ebfe38a276fc03cb7d8685d9a6da5a48bf6a0565c83e11a29cd5f9"
diff --git a/recipes/gstreamer/gst-plugins-base_0.10.23.bb b/recipes/gstreamer/gst-plugins-base_0.10.23.bb
deleted file mode 100644
index 9d2fbb7..0000000
--- a/recipes/gstreamer/gst-plugins-base_0.10.23.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require gst-plugins.inc
-
-PR = "${INC_PR}.1"
-
-PROVIDES += "gst-plugins"
-
-# gst-plugins-base only builds the alsa plugin
-# if alsa has been built and is present.  You will
-# not get an error if this is not present, just 
-# a missing alsa plugin
-DEPENDS += "libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv"
-
-
-SRC_URI[archive.md5sum] = "641cc7def2d8667b9b4df15e69dba25f"
-SRC_URI[archive.sha256sum] = "1c11d98eb9a1b1bc54becf465e74c2aa4019bb57a31dd70686269af6a9b9e93b"
diff --git a/recipes/gstreamer/gst-plugins-base_0.10.28.bb b/recipes/gstreamer/gst-plugins-base_0.10.28.bb
deleted file mode 100644
index 000761f..0000000
--- a/recipes/gstreamer/gst-plugins-base_0.10.28.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-require gst-plugins.inc
-
-SRC_URI += " \
-            file://gst-plugins-base_rowstride.patch \
-            file://ivorbis-thumb.patch \
-"
-
-SRC_URI[archive.md5sum] = "0107cf985ac90544bae70288220f5bab"
-SRC_URI[archive.sha256sum] = "132b6fd7749fcbfa9ad88c854aada44b6870c4175bda21cdb01a52b59a98e14f"
-
-PR = "${INC_PR}.1"
-
-PROVIDES += "gst-plugins"
-
-# gst-plugins-base only builds the alsa plugin
-# if alsa has been built and is present.  You will
-# not get an error if this is not present, just 
-# a missing alsa plugin
-DEPENDS += "udev cdparanoia pango libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv"
-
-# Needs a udev that enabled gudev, which isn't the default
-EXTRA_OECONF_append = " --with-gudev"
-
-do_configure_prepend() {
-	sed -i -e s:QtGui:NoQtGui:g ${S}/configure.ac
-}
-
diff --git a/recipes/gstreamer/gst-plugins-base_0.10.29.bb b/recipes/gstreamer/gst-plugins-base_0.10.29.bb
deleted file mode 100644
index 7931ba1..0000000
--- a/recipes/gstreamer/gst-plugins-base_0.10.29.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-require gst-plugins.inc
-
-SRC_URI += " \
-            file://ivorbis-thumb.patch \
-            file://make382.patch \
-"
-
-SRC_URI[archive.md5sum] = "d07e251152cccbaa81807c14cf0fd8c0"
-SRC_URI[archive.sha256sum] = "ac035cce4d68e2e0b980d3ddb6c74674667cbfde6cddc65e18ea16368d34732c"
-
-PR = "${INC_PR}.1"
-
-PROVIDES += "gst-plugins"
-
-# gst-plugins-base only builds the alsa plugin
-# if alsa has been built and is present.  You will
-# not get an error if this is not present, just 
-# a missing alsa plugin
-DEPENDS += "udev cdparanoia pango libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv"
-
-# Needs a udev that enabled gudev, which isn't the default
-EXTRA_OECONF_append = " --with-gudev"
-
-do_configure_prepend() {
-	sed -i -e s:QtGui:NoQtGui:g ${S}/configure.ac
-}
-
diff --git a/recipes/gstreamer/gst-plugins-base_0.10.30.bb b/recipes/gstreamer/gst-plugins-base_0.10.30.bb
deleted file mode 100644
index 0826562..0000000
--- a/recipes/gstreamer/gst-plugins-base_0.10.30.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-require gst-plugins.inc
-
-SRC_URI += " \
-            file://ivorbis-thumb.patch \
-            file://make382.patch \
-"
-
-SRC_URI[archive.md5sum] = "3ad90152b58563e1314af26c263f3c4c"
-SRC_URI[archive.sha256sum] = "63938641380be9935c804ae8d55acdcfd93920ed2deb72dcf70f027a78b085d7"
-
-PR = "${INC_PR}.0"
-
-PROVIDES += "gst-plugins"
-
-# gst-plugins-base only builds the alsa plugin
-# if alsa has been built and is present.  You will
-# not get an error if this is not present, just 
-# a missing alsa plugin
-DEPENDS += "udev cdparanoia pango libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv gtk+"
-
-# Needs a udev that enabled gudev, which isn't the default
-EXTRA_OECONF_append = " --with-gudev"
-
-do_configure_prepend() {
-	sed -i -e s:QtGui:NoQtGui:g ${S}/configure.ac
-}
-
-- 
1.7.2.3



