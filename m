Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi64-0002oS-Ln
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:18:59 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=v5EKHpBXk0qoXyrM0CcGsPToWKRj6oVJ27cxM/DBMno=;
	b=Vl74CH9OVLqfAjSMt7PrjVHj/JvWcswvaX5dJ0WFVoi5BiUCrEh496q287CfTqKJNz
	r1s6FSF4Rprgs2J14iU7u2iwIgyb+HbtKzXqkZX8gV0y20xnOF7ZWbecpCxO3ZHBmwu+
	RJprbHXND1kCluCiJfyeKtsNtmz0srMbsahhr105KLNkTedyNnHQNBS7T5TVzYwCnr8+
	2JLO3irY4IAhD5dOv39FIYqRwsge0omqS2ShOGt5Mg5l6oF14mMLolZ/O0hSWOFU7KuC
	UeTZoE+EfAbDtvrPY5qB7FwFpHHKQPsDlDM96iyzVaFRLipua8CFCRQSgBSBpyYzFu9i
	e5cw==
Received: by 10.14.220.71 with SMTP id n47mr42149153eep.39.1354586677068;
	Mon, 03 Dec 2012 18:04:37 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm34813661eep.15.2012.12.03.18.04.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:04:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:09 +0100
Message-Id: <d2a906fa42ce25d38cc7001d86b61f3304050f9c.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 36/58] gnome-vfs: fix QA warnings in packaging
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
X-List-Received-Date: Tue, 04 Dec 2012 02:34:02 -0000

gnome-vfs-2.24.4: gnome-vfs: Files/directories were installed but not shipped
  /usr/lib/gnome-vfs-2.0/modules/libcomputer.la
  /usr/lib/gnome-vfs-2.0/modules/libvfs-test.a
  /usr/lib/gnome-vfs-2.0/modules/libcomputer.a
  /usr/lib/gnome-vfs-2.0/modules/libdns-sd.la
  /usr/lib/gnome-vfs-2.0/modules/libgzip.la
  /usr/lib/gnome-vfs-2.0/modules/libtar.la
  /usr/lib/gnome-vfs-2.0/modules/libsftp.la
  /usr/lib/gnome-vfs-2.0/modules/libnntp.a
  /usr/lib/gnome-vfs-2.0/modules/libhttp.la
  /usr/lib/gnome-vfs-2.0/modules/libsftp.a
  /usr/lib/gnome-vfs-2.0/modules/libftp.la
  /usr/lib/gnome-vfs-2.0/modules/libnetwork.a
  /usr/lib/gnome-vfs-2.0/modules/libbzip2.a
  /usr/lib/gnome-vfs-2.0/modules/libgzip.a
  /usr/lib/gnome-vfs-2.0/modules/libnetwork.la
  /usr/lib/gnome-vfs-2.0/modules/libfile.la
  /usr/lib/gnome-vfs-2.0/modules/libvfs-test.la
  /usr/lib/gnome-vfs-2.0/modules/libnntp.la
  /usr/lib/gnome-vfs-2.0/modules/libfile.a
  /usr/lib/gnome-vfs-2.0/modules/libftp.a
  /usr/lib/gnome-vfs-2.0/modules/libhttp.a
  /usr/lib/gnome-vfs-2.0/modules/libbzip2.la
  /usr/lib/gnome-vfs-2.0/modules/libdns-sd.a
  /usr/lib/gnome-vfs-2.0/modules/libtar.a

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 531a2d7..62d63ae 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -13,7 +13,7 @@ DEPENDS = "libxml2 gconf dbus bzip2 gnome-mime-data zlib"
 RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
 # Some legacy packages will require gnome-mime-data to be installed, but use of
 # it is deprecated.
-PR = "r1"
+PR = "r2"
 
 inherit gnome
 
@@ -35,10 +35,11 @@ EXTRA_OECONF = " --disable-hal \
                  gvfs_cv_HAVE_POSIX_ACLS=no \
 		 "
 
-FILES_${PN} += " ${libdir}/vfs ${datadir}/dbus-1/services"
-FILES_${PN}-dbg += " ${libdir}/gnome-vfs-2.0/modules/.debug"
-FILES_${PN}-dev += " ${libdir}/gnome-vfs-2.0/include"
-FILES_${PN}-doc += " ${datadir}/gtk-doc"
+FILES_${PN} += "${libdir}/vfs ${datadir}/dbus-1/services"
+FILES_${PN}-dbg += "${libdir}/gnome-vfs-2.0/modules/.debug"
+FILES_${PN}-dev += "${libdir}/gnome-vfs-2.0/include/* ${libdir}/gnome-vfs-2.0/modules/*.la"
+FILES_${PN}-staticdev += "${libdir}/gnome-vfs-2.0/modules/*.a"
+FILES_${PN}-doc += "${datadir}/gtk-doc"
 
 PACKAGES_DYNAMIC += "^gnome-vfs-plugin-.*"
 
-- 
1.8.0



