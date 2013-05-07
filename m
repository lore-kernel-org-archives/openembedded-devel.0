Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqrk-0003bT-IH
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:13 +0200
Received: by mail-ea0-f175.google.com with SMTP id q10so583848eaj.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=5DJRyVDWF1s8cD8g2KhdSWIj6M393A1Ii7gGkQE0PAs=;
	b=ZwPbuGVxUEXVd0isu6JltQEqrp1D+dp8R711dBbw+UrKl4OZ9sFZVMdfzJPHgKLPmZ
	pfXd82k9vf6+3BTDkqUm2E+ZIPxcCTB9hf6DSGeYtJ9OPOyIPuBIPajhnZs4WnmHK8aU
	cENKF2eKQg0C6Hxv4aJFb2xvTP3HK5lAUEAyYrz+VmZLY/wjfDT1E61FOQIVTsRE2gTO
	VV4rpS4uUDk1eDWb/vDx1cleJUDZ+/m6uKXz7ueF5pHJCMk2sfPnzlChuEF3mDHMC5Yw
	LKQwe5bBsJil6GqbC6/Lw4ztfoZT3breCNfn9XOha73VdT4w/A2OzrsUWNGty8yj5+bS
	0Hsw==
X-Received: by 10.15.26.6 with SMTP id m6mr10258815eeu.4.1367966531424;
	Tue, 07 May 2013 15:42:11 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:41 +0200
Message-Id: <1367966513-12566-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 03/15] gnome-vfs: fix build with glib 2.36
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
X-List-Received-Date: Tue, 07 May 2013 23:00:17 -0000
X-List-Received-Date: Tue, 07 May 2013 23:00:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...kefile.am-remove-DG_DISABLE_DEPRECATED-to.patch |   42 ++++++++++++++++++++
 .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |    9 +++-
 2 files changed, 48 insertions(+), 3 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch

diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch
new file mode 100644
index 0000000..d8f7e40
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch
@@ -0,0 +1,42 @@
+From 536e9b57cada4a9f92e073fdf01cdf1def435b6b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 7 May 2013 14:56:06 +0200
+Subject: [PATCH] multiple Makefile.am: remove -DG_DISABLE_DEPRECATED to fix
+ build with glib-2.36
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ daemon/Makefile.am      |    1 -
+ libgnomevfs/Makefile.am |    1 -
+ 2 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/daemon/Makefile.am b/daemon/Makefile.am
+index ca57467..040484f 100644
+--- a/daemon/Makefile.am
++++ b/daemon/Makefile.am
+@@ -8,7 +8,6 @@ INCLUDES= \
+ 	-D_LARGEFILE64_SOURCE                   \
+ 	-D_POSIX_PTHREAD_SEMANTICS		\
+ 	-D_REENTRANT				\
+-	-DG_DISABLE_DEPRECATED			\
+ 	-DGNOME_VFS_PREFIX=\"$(prefix)\"	\
+ 	-DGNOME_VFS_DATADIR=\"$(datadir)\"	\
+ 	-DGNOME_VFS_LIBDIR=\"$(libdir)\"	\
+diff --git a/libgnomevfs/Makefile.am b/libgnomevfs/Makefile.am
+index 69a02e0..5d7d759 100644
+--- a/libgnomevfs/Makefile.am
++++ b/libgnomevfs/Makefile.am
+@@ -19,7 +19,6 @@ INCLUDES =					\
+ 	-D_LARGEFILE64_SOURCE                   \
+ 	-D_POSIX_PTHREAD_SEMANTICS		\
+ 	-D_REENTRANT				\
+-	-DG_DISABLE_DEPRECATED			\
+ 	-DGNOME_VFS_PREFIX=\"$(prefix)\"	\
+ 	-DGNOME_VFS_BINDIR=\"$(bindir)\"	\
+ 	-DGNOME_VFS_DATADIR=\"$(datadir)\"	\
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 78cd1d6..57bbc13 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -13,15 +13,18 @@ DEPENDS = "libxml2 gconf dbus bzip2 gnome-mime-data zlib"
 RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
 # Some legacy packages will require gnome-mime-data to be installed, but use of
 # it is deprecated.
-PR = "r2"
+PR = "r3"
 
 inherit gnome
 
 # This is to provide compatibility with the gnome-vfs DBus fork
 RPROVIDES_${PN} = "gnome-vfs-plugin-dbus"
 
-SRC_URI += "file://gconftool-lossage.patch \
-        file://gnome-vfs-no-kerberos.patch;striplevel=0"
+SRC_URI += " \
+    file://gconftool-lossage.patch \
+    file://gnome-vfs-no-kerberos.patch;striplevel=0 \
+    file://0001-multiple-Makefile.am-remove-DG_DISABLE_DEPRECATED-to.patch \
+"
 
 SRC_URI[archive.md5sum] = "a05fab03eeef10a47dd156b758982f2e"
 SRC_URI[archive.sha256sum] = "62de64b5b804eb04104ff98fcd6a8b7276d510a49fbd9c0feb568f8996444faa"
-- 
1.7.4.4



