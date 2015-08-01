Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 55666765A6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Aug 2015 16:23:57 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so89627247wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Aug 2015 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MKAcjbSqRXHnzrFjTKpODIREIZG1tUGwx8lIeCazlVM=;
	b=ST8YESP8l2Z4GHsqJfGI12LQAtPC5k/ZZz4I0flOhdy0B4Ywqs/V8iogFaA+IGT2uC
	FykufMjikHQxUrQh83VzHrr7LqAHI1d/g1DXWvbLbStCeIdso1StytVw1djSEmsgKXUs
	Ug9o1X5Dc9PR+nLDNdLE/Myf+snb9AqH2RbpGe29uE9VWDyER5Ltv3RkDB59jAzgW837
	uTMS0glAMteIJI9QF4uwIme29mx4m5c5jAnBy4g50l+DZ1N/2lDSRv1sr1njH94ye86l
	Q3VTIECsTZqP3b/oOlsmQI9Yp0MIyAXG87+OxzPbCCkCWUC8qKau4D1jjV+XS+j1CFA9
	0B9g==
X-Received: by 10.180.83.101 with SMTP id p5mr17533638wiy.52.1438446237298;
	Sat, 01 Aug 2015 09:23:57 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	pn6sm13172340wjb.36.2015.08.01.09.23.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Aug 2015 09:23:56 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Aug 2015 18:23:18 +0200
Message-Id: <1438446199-20081-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-gnome][PATCH 1/2] gvfs: backport patch to build with gphoto 2.5 api
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
X-List-Received-Date: Sat, 01 Aug 2015 16:24:00 -0000

With the update of gphoto to a version with the 2.5 API gvfs do_compile
failes with:
gvfs-1.10.1/daemon/gvfsbackendgphoto2.c:1648:35: error: request for member 'name' in something not a structure or union
|    DEBUG ("  '%s' '%s' '%s'",  info.name, info.path, info.library_filename);
and others.

This backports the upstream fix.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 .../gphoto_build_with_libgphoto_2.5_API.patch      | 78 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gvfs/files/gphoto_build_with_libgphoto_2.5_API.patch

diff --git a/meta-gnome/recipes-gnome/gvfs/files/gphoto_build_with_libgphoto_2.5_API.patch b/meta-gnome/recipes-gnome/gvfs/files/gphoto_build_with_libgphoto_2.5_API.patch
new file mode 100644
index 0000000..25d44b0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gvfs/files/gphoto_build_with_libgphoto_2.5_API.patch
@@ -0,0 +1,78 @@
+Upstream-Status: Backport
+https://git.gnome.org/browse/gvfs/commit/daemon/gvfsbackendgphoto2.c?id=259a09183f7c96b5fb0f6453bb4b0bcf92e3eaa2
+
+Signed-off-by: Max Krummenacher <max.oss.09 at gmail.com>
+
+From 259a09183f7c96b5fb0f6453bb4b0bcf92e3eaa2 Mon Sep 17 00:00:00 2001
+From: Cosimo Cecchi <cosimoc@gnome.org>
+Date: Wed, 8 Aug 2012 13:14:19 +0200
+Subject: gphoto: build with libgphoto 2.5 API
+
+Patch taken from the Fedora package
+Author: Jindrich Novy <jnovy@redhat.com>
+
+http://pkgs.fedoraproject.org/cgit/gvfs.git/commit/?id=cd0c6218df85bf3de101402c1aa9d79aae7c3019
+
+diff --git a/configure.ac b/configure.ac
+index 3215694..3280666 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -436,6 +436,9 @@ if test "x$enable_gphoto2" != "xno" -a \( "x$msg_hal" = "xyes" -o "x$msg_gudev"
+   if test "x$msg_gphoto2" = "xyes"; then
+     if test "x$use_gphoto2" = "xyes"; then
+       AC_DEFINE(HAVE_GPHOTO2, 1, [Define to 1 if gphoto2 is available])
++      PKG_CHECK_MODULES(GPHOTO2, libgphoto2 >= 2.5.0,
++         AC_DEFINE(HAVE_GPHOTO25, 1, [Define to 1 if libgphoto2 2.5 is available])
++      )
+     else
+       if test "x$enable_gphoto2" = "xyes"; then
+         AC_MSG_ERROR([Cannot build with gphoto2 support. Need OS tweaks in hal volume monitor.])
+diff --git a/daemon/gvfsbackendgphoto2.c b/daemon/gvfsbackendgphoto2.c
+index 0d2c594..75b4b02 100644
+--- a/daemon/gvfsbackendgphoto2.c
++++ b/daemon/gvfsbackendgphoto2.c
+@@ -1647,7 +1647,9 @@ do_mount (GVfsBackend *backend,
+       return;
+     }
+ 
++#ifndef HAVE_GPHOTO25
+   DEBUG ("  '%s' '%s' '%s'",  info.name, info.path, info.library_filename);
++#endif
+   
+   /* set port */
+   rc = gp_camera_set_port_info (gphoto2_backend->camera, info);
+@@ -2590,7 +2592,11 @@ do_slow_file_rename_in_same_dir (GVfsBackendGphoto2 *gphoto2_backend,
+         }
+     }
+ 
++#ifdef HAVE_GPHOTO25
++  rc = gp_camera_folder_put_file (gphoto2_backend->camera, dir, new_name, GP_FILE_TYPE_NORMAL, file_dest, gphoto2_backend->context);
++#else
+   rc = gp_camera_folder_put_file (gphoto2_backend->camera, dir, file_dest, gphoto2_backend->context);
++#endif
+   if (rc != 0)
+     goto out;
+ 
+@@ -3222,14 +3228,18 @@ commit_write_handle (GVfsBackendGphoto2 *gphoto2_backend, WriteHandle *write_han
+   if (rc != 0)
+     goto out;
+ 
+-  gp_file_set_type (file, GP_FILE_TYPE_NORMAL);
+   gp_file_set_name (file, write_handle->name);
+   gp_file_set_mtime (file, time (NULL));
+   gp_file_set_data_and_size (file, 
+                              dup_for_gphoto2 (write_handle->data, write_handle->size), 
+                              write_handle->size);
+   
++#ifdef HAVE_GPHOTO25
++  rc = gp_camera_folder_put_file (gphoto2_backend->camera, write_handle->dir, write_handle->name, GP_FILE_TYPE_NORMAL, file, gphoto2_backend->context);
++#else
++  gp_file_set_type (file, GP_FILE_TYPE_NORMAL);
+   rc = gp_camera_folder_put_file (gphoto2_backend->camera, write_handle->dir, file, gphoto2_backend->context);
++#endif
+   if (rc != 0)
+     {
+       gp_file_unref (file);
+-- 
+cgit v0.10.2
+
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
index c516a40..f9798e9 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
@@ -16,6 +16,7 @@ SRC_URI += " \
     file://0003-Adapt-to-glib-mutex-API-changes.patch \
     file://0004-Adapt-to-glib-thread-API-changes.patch \
     file://0005-client-gdaemonfile.c-replace-g_memmove-by-memmove.patch \
+    file://gphoto_build_with_libgphoto_2.5_API.patch \
 "
 
 EXTRA_OECONF = "--with-archive-includes=${STAGING_INCDIR} \
-- 
1.9.3


