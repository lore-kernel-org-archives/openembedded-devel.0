Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8E4k-00018g-Er
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 18:30:38 +0200
Received: by gwaa2 with SMTP id a2so5513417gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2011 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=QCmDh8WvAz3gnS+QpQ0XiHJ8gmh9x3c4q0poL9KmixU=;
	b=rrBIi2KyKo9HkHmFNsD6y1+hja1Xp5x8n37YXF28jCihtLY1gEkByhN6ZgiiSpw8tp
	0OCNBUrWHYsSw3MWRq/g4TAnwvPDW2uK8ZWo8J3T5zpIZsuOzfmkWhcYgvoBdAkwBZQk
	aXdg3tpZQ4syVTFAomj2V2ZS7RS+2eTrmErUA=
Received: by 10.236.127.144 with SMTP id d16mr6577121yhi.40.1317054313036;
	Mon, 26 Sep 2011 09:25:13 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id s42sm29716124yhs.0.2011.09.26.09.25.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 09:25:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2011 09:24:44 -0700
Message-Id: <1317054285-19029-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1317054285-19029-1-git-send-email-raj.khem@gmail.com>
References: <1317054285-19029-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/5] gnome-power-manager: Fix build on gnome'less build systems
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
X-List-Received-Date: Mon, 26 Sep 2011 16:30:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sysrooted-pkg-config.patch                     |   35 ++++++++++++++++++++
 .../gnome-power-manager_2.32.0.bb                  |    5 ++-
 2 files changed, 39 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager-2.32.0/sysrooted-pkg-config.patch

diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager-2.32.0/sysrooted-pkg-config.patch b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager-2.32.0/sysrooted-pkg-config.patch
new file mode 100644
index 0000000..f3db7ab
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager-2.32.0/sysrooted-pkg-config.patch
@@ -0,0 +1,35 @@
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
+Index: gnome-power-manager-2.32.0/gnome-doc-utils.make
+===================================================================
+--- gnome-power-manager-2.32.0.orig/gnome-doc-utils.make	2010-01-27 08:28:31.000000000 -0800
++++ gnome-power-manager-2.32.0/gnome-doc-utils.make	2011-09-25 16:16:04.914813800 -0700
+@@ -124,11 +124,11 @@
+ 
+ _xml2po ?= `which xml2po`
+ 
+-_db2html ?= `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
+-_db2omf  ?= `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
+-_chunks  ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
+-_credits ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
+-_ids ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
++_db2html ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2html gnome-doc-utils`
++_db2omf  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
++_chunks  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
++_credits ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
++_ids ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
+ 
+ if ENABLE_SK
+ _ENABLE_SK = true
diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index 9053e8c..aeaf688 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -2,11 +2,14 @@ DESCRIPTION = "Power management daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "glib-2.0 gtk+ gconf gnome-keyring dbus dbus-glib libnotify libwnck cairo libunique xrandr virtual/libx11 libxrender libcanberra upower"
 
 inherit gnome
+
+SRC_URI += "file://sysrooted-pkg-config.patch"
+
 SRC_URI[archive.md5sum] = "9a08e85dce3ffb90775f15e3bda4adda"
 SRC_URI[archive.sha256sum] = "17fa301bf7e133285c0e054ae3be2b0f690c48f59b09f67e04d6ed339b330476"
 
-- 
1.7.5.4



