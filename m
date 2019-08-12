Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4E65C73196
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 12:05:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 466ZKZ0xlvz28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 14:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565611506;
	bh=Ye4HOXYCMJvsrit+gQDgwrSInt30uzlQ9GNZHlzgVZo=;
	h=From:To:Subject:Date:From;
	b=WNZRH7Q1pMf1+VdmkAOGRsHjArd3ktfNvbWv13Ai5arn8mb1auo9K7qp9EviHBjRw
	AvlTuwXr1/VpqwG4gSftSRXRUycCapydoeMBYtwHwYayr7H6xTt0gFJEbM7gD/EOSa
	ElxYANaJ/BIswL5e2F3QVlLp0uqBqck0Yba8kLpuML6RBCQW8L3K3lKO4/p9jEmTGs
	jE2tpCDDrukOMlHZFrGc8O7irG4E0K7DKeAVg1VVVpiaJASr8odoRjQTKzn8rf5Y78
	BfAWJ1Bc1h16kNWPsIeGkzuVtCZpB88G97O0BD1ZpKlJkN24WHI7Al5GIL6LVPDSM7
	e30VAdpy/NFqqr3S780QiDDalKUj7XTRgcm7U0Nn9+wGhpOMW0qTXIfVdk9V6/xGKs
	MpFlmbAl3taTexweoQkvDXKTi4MCXVflcr5nhaSd7V6pV1phW3HdZtRGM8zlGdqM0M
	kn2ahizSJD/zaMnsTzLf0iYK+r3+TNbpGf8JaBUBO7x49GVgA+pETjyTgyVpLe+psD
	hrofZD+T9cV0lSrRPjecY4QY2ldrpMIDkpyxHLNLATCLOYjqXvt/jf9n/B31xNhYuj
	wxrieUalt8or90HEU3zBSgt5bxf/YrHg7Re5766FW+bzTPj6XXDracKiFMSt6HxX7V
	qijhQHVp5/7qqMnZr9civ77c=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Aug 2019 15:05:05 +0300
Message-Id: <20190812120505.30866-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] wv: Remove, abiword was the only user
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Aug 2019 12:05:06 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
The recipe will be submitted to meta-office.
---
 ...reign-mode-to-avoid-errors-with-miss.patch | 29 -------------------
 ...c-Specify-print-format-in-rtf_output.patch | 26 -----------------
 meta-gnome/recipes-gnome/wv/wv_1.2.9.bb       | 18 ------------
 3 files changed, 73 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/wv/wv/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch
 delete mode 100644 meta-gnome/recipes-gnome/wv/wv/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch
 delete mode 100644 meta-gnome/recipes-gnome/wv/wv_1.2.9.bb

diff --git a/meta-gnome/recipes-gnome/wv/wv/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch b/meta-gnome/recipes-gnome/wv/wv/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch
deleted file mode 100644
index a8c5bc796..000000000
--- a/meta-gnome/recipes-gnome/wv/wv/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From eebe1f27f4b27b05eb4b9b55f9df1124acf4d092 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Fri, 1 Aug 2014 12:25:24 +0200
-Subject: [PATCH] configure: use 'foreign' mode to avoid errors with missing
- NEWS/AUTHORS/etc
-
-Upstream-status: Pending
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3d7eef6..1784bdd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -41,7 +41,7 @@ VERSION=$WV_VERSION
- PACKAGE=wv
- 
- dnl Initialize automake stuff
--AM_INIT_AUTOMAKE($PACKAGE, $VERSION)
-+AM_INIT_AUTOMAKE([foreign])
- 
- # Specify a configuration file
- AM_CONFIG_HEADER(config.h)
--- 
-1.9.0
-
diff --git a/meta-gnome/recipes-gnome/wv/wv/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch b/meta-gnome/recipes-gnome/wv/wv/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch
deleted file mode 100644
index 2fc3f367f..000000000
--- a/meta-gnome/recipes-gnome/wv/wv/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 079529b8d5e339e2211fa2f8c15543a738a627bc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 27 Jun 2017 14:50:51 -0700
-Subject: [PATCH] wvRTF.c: Specify print format in rtf_output()
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- wvRTF.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wvRTF.c b/wvRTF.c
-index 361d258..4f24b30 100644
---- a/wvRTF.c
-+++ b/wvRTF.c
-@@ -192,7 +192,7 @@ output_rtfUserData (rtfUserData * ud)
-     rtf_output_char ('{');
- 
-     /* font color */
--    rtf_output (rtfColors[ud->cCol]);
-+    rtf_output ("%s", rtfColors[ud->cCol]);
- 
-     /* font face */
-     rtf_output ("\\f%d", ud->cFont);
--- 
-2.13.2
-
diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.9.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.9.bb
deleted file mode 100644
index 72b8508a2..000000000
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.9.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Programs for accessing Microsoft Word documents"
-HOMEPAGE = "http://wvware.sourceforge.net/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6cbca01f1c9178aca280e8ff64d85b2f"
-
-DEPENDS = "libgsf glib-2.0 libpng"
-
-SRC_URI = "https://www.abisource.com/downloads/wv/${PV}/${BP}.tar.gz \
-           file://0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch \
-           file://0001-wvRTF.c-Specify-print-format-in-rtf_output.patch \
-           "
-
-SRC_URI[md5sum] = "dbccf2e9f747e50c913b7e3d126b73f7"
-SRC_URI[sha256sum] = "4c730d3b325c0785450dd3a043eeb53e1518598c4f41f155558385dd2635c19d"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = ""
-- 
2.17.1


