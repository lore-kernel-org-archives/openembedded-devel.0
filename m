Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8E4f-00014S-9t
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 18:30:33 +0200
Received: by mail-gy0-f175.google.com with SMTP id 8so5421936gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2011 09:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=lamQUBWULdfTekRuA1zzu3NQzhR9CfiE2kRTNyAOvas=;
	b=uVhGm21vmH5QIWrAftNszS1L6r35A0ArIVVcMQu36VLkwqxPfdPVTEKAuTWtw+1Ryi
	94CMrhVbQDdG6BrYzigHns8bb1g73oYJNDdYH90hvFYkmKNLabQHHQPG1lUcF0JngYP2
	n/5sTLcxXXF5EvyemovKYcU5ZV0K4V4Z+lMZU=
Received: by 10.236.124.97 with SMTP id w61mr40414419yhh.106.1317054311002;
	Mon, 26 Sep 2011 09:25:11 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id s42sm29716124yhs.0.2011.09.26.09.25.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 09:25:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2011 09:24:43 -0700
Message-Id: <1317054285-19029-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1317054285-19029-1-git-send-email-raj.khem@gmail.com>
References: <1317054285-19029-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/5] gdm: Fix build on gnome'less build systems
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
X-List-Received-Date: Mon, 26 Sep 2011 16:30:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gdm/gdm-2.32.2/sysrooted-pkg-config.patch      |   37 ++++++++++++++++++++
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    3 +-
 2 files changed, 39 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm-2.32.2/sysrooted-pkg-config.patch

diff --git a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/sysrooted-pkg-config.patch b/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/sysrooted-pkg-config.patch
new file mode 100644
index 0000000..1f9fa2a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/sysrooted-pkg-config.patch
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
+Index: gdm-2.32.2/gnome-doc-utils.make
+===================================================================
+--- gdm-2.32.2.orig/gnome-doc-utils.make	2011-05-31 08:06:59.000000000 -0700
++++ gdm-2.32.2/gnome-doc-utils.make	2011-09-25 15:32:39.540992521 -0700
+@@ -133,12 +133,12 @@
+ _xml2po ?= `which xml2po`
+ _xml2po_mode = $(if $(DOC_ID),mallard,docbook)
+ 
+-_db2html ?= `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
+-_db2omf  ?= `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
+-_malrng  ?= `$(PKG_CONFIG) --variable malrng gnome-doc-utils`
+-_chunks  ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
+-_credits ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
+-_ids ?= $(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
++_db2html ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2html gnome-doc-utils`
++_db2omf  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
++_malrng  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable malrng gnome-doc-utils`
++_chunks  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
++_credits ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
++_ids ?= ${PKG_CONFIG_SYSROOT_DIR}$(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
+ 
+ if ENABLE_SK
+ _ENABLE_SK = true
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 6fcea0d..b1cbf45 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,13 +4,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r4"
+PR = "r5"
 
 inherit gnome update-rc.d
 
 SRC_URI += " \
             file://cross-xdetection.diff \
             file://0001-Remove-user-switch-applet.patch \
+            file://sysrooted-pkg-config.patch \
             file://%gconf-tree.xml \
             file://gdm \
             file://gdm.conf \
-- 
1.7.5.4



