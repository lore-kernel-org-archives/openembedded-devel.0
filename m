Return-Path: <milo-software@users.sourceforge.net>
Received: from smtp02.online.nl (smtp02.online.nl [194.134.41.32])
	by mail.openembedded.org (Postfix) with ESMTP id 313BA60557
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 18:12:18 +0000 (UTC)
Received: from smtp02.online.nl (localhost [127.0.0.1])
	by smtp02.online.nl (Postfix) with ESMTP id 8A93CA0A0;
	Tue, 21 Oct 2014 20:12:17 +0200 (CEST)
Received: from phenom.local (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.online.nl (Postfix) with ESMTP;
	Tue, 21 Oct 2014 20:12:17 +0200 (CEST)
From: Mike Looijmans <milo-software@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Oct 2014 20:12:15 +0200
Message-Id: <1413915135-20979-1-git-send-email-milo-software@users.sourceforge.net>
X-Mailer: git-send-email 1.7.9.5
X-Online-Scanned: by Cloudmark authority (on smtp02.online.nl)
Cc: Mike Looijmans <milo-software@users.sourceforge.net>
Subject: [PATCH] libdvdcss: Upgrade to 1.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Oct 2014 18:12:23 -0000

License is still GPLv2. Has been in use for a while, and no problems detected.
---
 .../recipes-multimedia/vlc/libdvdcss_1.2.13.bb     |   12 ------------
 .../recipes-multimedia/vlc/libdvdcss_1.3.0.bb      |   12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.3.0.bb

diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
deleted file mode 100644
index 1a316d3..0000000
--- a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "libdvdcss is a simple library designed for accessing DVDs like a block device without having to bother about the decryption."
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI = "http://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss-${PV}.tar.bz2"
-
-inherit autotools
-
-EXTRA_OECONF = " --disable-doc "
-
-SRC_URI[md5sum] = "53cfc52a60a156763c425572e5179273"
-SRC_URI[sha256sum] = "84f1bba6cfef1df87f774fceaefc8e73c4cda32e8f6700b224ad0acb5511ba2c"
diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.3.0.bb b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.3.0.bb
new file mode 100644
index 0000000..79e64ae
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.3.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "libdvdcss is a simple library designed for accessing DVDs like a block device without having to bother about the decryption."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss-${PV}.tar.bz2"
+
+inherit autotools
+
+EXTRA_OECONF = " --disable-doc "
+
+SRC_URI[md5sum] = "7f0fdb3ff91d638f5e45ed7536f7eb67"
+SRC_URI[sha256sum] = "7c414acd520c4e4dd7267952f72d738ff50321a7869af4d75c65aefad44f1395"
-- 
1.7.9.5


