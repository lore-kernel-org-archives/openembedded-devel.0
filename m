Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8E4k-00014l-Mc
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 18:30:38 +0200
Received: by gwaa2 with SMTP id a2so5513349gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2011 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=4Dy94/o5zEWu7vwrfSJvjnaRbOvmvuf1mHHw2xTV/KE=;
	b=i1597pPKEoBN7244AQVONxpZdIUu3sOfVLNWUB+/hAFC5PlthKPsHIvgtMHahUstiy
	HfpHoZ5fWI+M1eh5Emkg4Z+RJtw755whru5c+8aRUaXhMEuatBpyF8oaO9BXdE9ikEfY
	D/nxRjTnnI6V5Alh9keFYj60gcUXLl9IdeZCo=
Received: by 10.236.155.1 with SMTP id i1mr22332441yhk.8.1317054309546;
	Mon, 26 Sep 2011 09:25:09 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id s42sm29716124yhs.0.2011.09.26.09.25.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 09:25:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2011 09:24:42 -0700
Message-Id: <1317054285-19029-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1317054285-19029-1-git-send-email-raj.khem@gmail.com>
References: <1317054285-19029-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/5] gnome-disk-utility: Fix build on gnomelss host systems
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
X-List-Received-Date: Mon, 26 Sep 2011 16:30:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-disk-utility/sysrooted-pkg-config.patch  |   37 ++++++++++++++++++++
 .../gnome-disk-utility_2.32.0.bb                   |    3 ++
 2 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/sysrooted-pkg-config.patch

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/sysrooted-pkg-config.patch b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/sysrooted-pkg-config.patch
new file mode 100644
index 0000000..48e63b1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/sysrooted-pkg-config.patch
@@ -0,0 +1,37 @@
+In cross environment we have to prepend the sysroot to the path found by
+pkgconfig since the path returned from pkgconfig does not have sysroot prefixed
+it ends up using the files from host system. Now usually people have gnome installed
+so the build succeeds but if you dont have gnome installed on build host then
+it wont find the files on host system and packages using gnome-doc-utils wont
+compile.
+
+This should work ok with non sysrooted builds too since in those cases PKG_CONFIG_SYSROOT_DIR
+will be empty
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gnome-disk-utility-2.32.0/gnome-doc-utils.make
+===================================================================
+--- gnome-disk-utility-2.32.0.orig/gnome-doc-utils.make	2010-09-15 08:27:46.000000000 -0700
++++ gnome-disk-utility-2.32.0/gnome-doc-utils.make	2011-09-25 16:04:30.693795591 -0700
+@@ -133,12 +133,12 @@
+ _xml2po ?= `which xml2po`
+ _xml2po_mode = $(if $(DOC_ID),mallard,docbook)
+ 
+-_db2html ?= `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
+-_db2omf  ?= `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
+-_malrng  ?= `$(PKG_CONFIG) --variable malrng gnome-doc-utils`
+-_chunks  ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
+-_credits ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
+-_ids ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
++_db2html ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2html gnome-doc-utils`
++_db2omf  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
++_malrng  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable malrng gnome-doc-utils`
++_chunks  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
++_credits ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
++_ids ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
+ 
+ if ENABLE_SK
+ _ENABLE_SK = true
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index ab1113c..dab938f 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
 DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart nautilus"
 
+PR = "r1"
+
 inherit gnome
 SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
 SRC_URI[archive.sha256sum] = "03e461b6bda7f773f8018d25fa3213d3073d4dc83a76e6b39d962652f4de6a98"
@@ -12,6 +14,7 @@ SRC_URI[archive.sha256sum] = "03e461b6bda7f773f8018d25fa3213d3073d4dc83a76e6b39d
 SRC_URI += "\
      file://disable-scrollkeeper.patch \
      file://fix-dbus-interfaces.patch \
+     file://sysrooted-pkg-config.patch \
      "
 
 EXTRA_OECONF += "--disable-scrollkeeper"
-- 
1.7.5.4



