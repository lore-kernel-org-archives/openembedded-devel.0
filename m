Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1931C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:18:23 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.7352.1742289495174558850
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout12.t-online.de (Postfix) with SMTP id 4F2BE142E
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 10:17:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.59]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuT52-2eYOYt0; Tue, 18 Mar 2025 10:17:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/4] gvfs: update 1.56.1 -> 1.57.2
Date: Tue, 18 Mar 2025 10:18:26 +0100
Message-ID: <20250318091827.831270-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318091827.831270-1-f_l_k@t-online.de>
References: <20250318091827.831270-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742289468-A27F25D8-3A1F97F1/0/0 CLEAN NORMAL
X-TOI-MSGID: 2f94225c-a0b4-4b6a-8ad9-234345de02e1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 09:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116053

Major changes in 1.57.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* onedrive: Use presentation id as host to adapt to the change in GOA (Ja=
n-Michael Brummer)
* onedrive: Fix incorrect include path for msgraph header (sid)
Major changes in 1.57.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* nfs: Support libnfs 6 (Jan Alexander Steffens)
* onedrive: Support Sharepoint drives (Jan-Michael Brummer)
* trash/udisks: Port from g_unix_mount_ to g_unix_mount_entry_ (Ondrej Ho=
ly)
* afp/mtp/nfs/sftp/smb: Add edit mode implementation (Ondrej Holy)
* fuse: Use edit mode when neither O_TRUNC, nor O_APPEND is used (Ondrej =
Holy)
* afp/mtp/nfs/smb: Various output stream related fixes (Ondrej Holy)
* udisks2: Update volume when setting/unsetting mount (Ondrej Holy)
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...fs-Support-libnfs-6-backport-to-1.56.patch | 278 ------------------
 .../gvfs/{gvfs_1.56.1.bb =3D> gvfs_1.57.2.bb}   |   3 +-
 2 files changed, 1 insertion(+), 280 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs/0001-nfs-Support-l=
ibnfs-6-backport-to-1.56.patch
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.56.1.bb =3D> gvfs_1.57.2.bb=
} (95%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs/0001-nfs-Support-libnfs-6=
-backport-to-1.56.patch b/meta-gnome/recipes-gnome/gvfs/gvfs/0001-nfs-Sup=
port-libnfs-6-backport-to-1.56.patch
deleted file mode 100644
index 63fb5a0e89..0000000000
--- a/meta-gnome/recipes-gnome/gvfs/gvfs/0001-nfs-Support-libnfs-6-backpo=
rt-to-1.56.patch
+++ /dev/null
@@ -1,278 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>
-Date: Sun, 19 Jan 2025 14:28:25 +0100
-Subject: [PATCH] nfs: Support libnfs 6 (backport to 1.56)
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gvfs/-/commit/=
50c0845928983830ebe12d1d2ba82a6735cec77b]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- daemon/gvfsbackendnfs.c | 79 +++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 79 insertions(+)
-
-diff --git a/daemon/gvfsbackendnfs.c b/daemon/gvfsbackendnfs.c
-index c9e9ed60b938..1b66bb040e1d 100644
---- a/daemon/gvfsbackendnfs.c
-+++ b/daemon/gvfsbackendnfs.c
-@@ -407,27 +407,33 @@ read_cb (int err, struct nfs_context *ctx, void *d=
ata, void *private_data)
-     {
-       GVfsJobRead *op_job =3D G_VFS_JOB_READ (job);
-=20
-+#ifndef LIBNFS_API_V2
-       memcpy (op_job->buffer, data, err);
-+#endif
-       g_vfs_job_read_set_size (op_job, err);
-       g_vfs_job_succeeded (job);
-     }
-   else
-     {
-       g_vfs_job_failed_from_errno (job, -err);
-     }
- }
-=20
- static gboolean
- try_read (GVfsBackend *backend,
-           GVfsJobRead *job,
-           GVfsBackendHandle _handle,
-           char *buffer,
-           gsize bytes_requested)
- {
-   GVfsBackendNfs *op_backend =3D G_VFS_BACKEND_NFS (backend);
-   struct nfsfh *fh =3D _handle;
-=20
-+#ifdef LIBNFS_API_V2
-+  nfs_read_async (op_backend->ctx, fh, buffer, bytes_requested, read_cb=
, job);
-+#else
-   nfs_read_async (op_backend->ctx, fh, bytes_requested, read_cb, job);
-+#endif
-   return TRUE;
- }
-=20
-@@ -755,29 +761,40 @@ try_append_to (GVfsBackend *backend,
- {
-   GVfsBackendNfs *op_backend =3D G_VFS_BACKEND_NFS (backend);
-=20
-+#ifdef LIBNFS_API_V2
-+  nfs_open2_async (op_backend->ctx,
-+                   filename,
-+                   O_CREAT | O_APPEND,
-+                   (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op_=
backend->umask,
-+                   append_cb, job);
-+#else
-   nfs_create_async (op_backend->ctx,
-                     filename,
-                     O_APPEND,
-                     (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op=
_backend->umask,
-                     append_cb, job);
-+#endif
-   return TRUE;
- }
-=20
- /* The following types and functions implement an asynchronous copy whi=
ch calls
-  * a callback function with a boolean success or failure.  This is used=
 in some
-  * cases for backup files when replacing. */
- #define COPY_BLKSIZE (64 * 1024)
-=20
- typedef void (*CopyFileCallback) (gboolean success, void *private_data)=
;
-=20
- typedef struct
- {
-   struct nfsfh *srcfh;
-   struct nfsfh *destfh;
-   char *dest;
-   int mode;
-   CopyFileCallback cb;
-   void *private_data;
-+#ifdef LIBNFS_API_V2
-+  char buffer[COPY_BLKSIZE];
-+#endif
- } CopyHandle;
-=20
- static void
-@@ -805,56 +822,74 @@ copy_write_cb (int err,
-   CopyHandle *handle =3D private_data;
-=20
-   if (err > 0)
-+#ifdef LIBNFS_API_V2
-+    nfs_read_async (ctx, handle->srcfh, handle->buffer, COPY_BLKSIZE, c=
opy_read_cb, handle);
-+#else
-     nfs_read_async (ctx, handle->srcfh, COPY_BLKSIZE, copy_read_cb, han=
dle);
-+#endif
-   else
-     copy_handle_complete (ctx, handle, FALSE);
- }
-=20
- static void
- copy_read_cb (int err, struct nfs_context *ctx, void *data, void *priva=
te_data)
- {
-   CopyHandle *handle =3D private_data;
-=20
-   if (err =3D=3D 0)
-     copy_handle_complete (ctx, handle, TRUE);
-   else if (err > 0)
-+#ifdef LIBNFS_API_V2
-+    nfs_write_async (ctx, handle->destfh, handle->buffer, err, copy_wri=
te_cb, handle);
-+#else
-     nfs_write_async (ctx, handle->destfh, err, data, copy_write_cb, han=
dle);
-+#endif
-   else
-     copy_handle_complete (ctx, handle, FALSE);
- }
-=20
- static void
- copy_open_dest_cb (int err,
-                    struct nfs_context *ctx,
-                    void *data, void *private_data)
- {
-   CopyHandle *handle =3D private_data;
-=20
-   if (err =3D=3D 0)
-     {
-       handle->destfh =3D data;
-=20
-+#ifdef LIBNFS_API_V2
-+      nfs_read_async (ctx, handle->srcfh, handle->buffer, COPY_BLKSIZE,=
 copy_read_cb, handle);
-+#else
-       nfs_read_async (ctx, handle->srcfh, COPY_BLKSIZE, copy_read_cb, h=
andle);
-+#endif
-     }
-   else
-     {
-       copy_handle_complete (ctx, handle, FALSE);
-     }
- }
-=20
- static void
- copy_open_source_cb (int err,
-                      struct nfs_context *ctx,
-                      void *data, void *private_data)
- {
-   CopyHandle *handle =3D private_data;
-=20
-   if (err =3D=3D 0)
-     {
-       handle->srcfh =3D data;
-+#ifdef LIBNFS_API_V2
-+      nfs_open2_async (ctx,
-+                       handle->dest, O_CREAT | O_TRUNC, handle->mode & =
0777,
-+                       copy_open_dest_cb, handle);
-+#else
-       nfs_create_async (ctx,
-                         handle->dest, O_TRUNC, handle->mode & 0777,
-                         copy_open_dest_cb, handle);
-+#endif
-       g_free (handle->dest);
-     }
-   else
-@@ -935,11 +970,19 @@ replace_backup_chown_cb (int err,
-       GVfsJobOpenForWrite *op_job =3D G_VFS_JOB_OPEN_FOR_WRITE (job);
-       GVfsBackendNfs *op_backend =3D G_VFS_BACKEND_NFS (op_job->backend=
);
-=20
-+#ifdef LIBNFS_API_V2
-+      nfs_open2_async (op_backend->ctx,
-+                       op_job->filename,
-+                       O_CREAT | O_TRUNC,
-+                       (op_job->flags & G_FILE_CREATE_PRIVATE ? 0600 : =
0666) & ~op_backend->umask,
-+                       replace_trunc_cb, handle);
-+#else
-       nfs_create_async (op_backend->ctx,
-                         op_job->filename,
-                         O_TRUNC,
-                         (op_job->flags & G_FILE_CREATE_PRIVATE ? 0600 :=
 0666) & ~op_backend->umask,
-                         replace_trunc_cb, handle);
-+#endif
-     }
-   else
-     {
-@@ -1019,11 +1062,19 @@ replace_truncate (struct nfs_context *ctx, Write=
Handle *handle)
-     }
-   else
-     {
-+#ifdef LIBNFS_API_V2
-+      nfs_open2_async (ctx,
-+                       op_job->filename,
-+                       O_CREAT | O_TRUNC,
-+                       (op_job->flags & G_FILE_CREATE_PRIVATE ? 0600 : =
0666) & ~op_backend->umask,
-+                       replace_trunc_cb, handle);
-+#else
-       nfs_create_async (ctx,
-                         op_job->filename,
-                         O_TRUNC,
-                         (op_job->flags & G_FILE_CREATE_PRIVATE ? 0600 :=
 0666) & ~op_backend->umask,
-                         replace_trunc_cb, handle);
-+#endif
-     }
- }
-=20
-@@ -1211,11 +1262,19 @@ replace_stat_cb (int err,
-               handle->tempname =3D g_build_filename (dirname, basename,=
 NULL);
-               g_free (dirname);
-=20
-+#ifdef LIBNFS_API_V2
-+              nfs_open2_async (ctx,
-+                               handle->tempname,
-+                               O_CREAT | O_EXCL,
-+                               (op_job->flags & G_FILE_CREATE_PRIVATE ?=
 0600 : 0666) & ~op_backend->umask,
-+                               replace_temp_cb, handle);
-+#else
-               nfs_create_async (ctx,
-                                 handle->tempname,
-                                 O_EXCL,
-                                 (op_job->flags & G_FILE_CREATE_PRIVATE =
? 0600 : 0666) & ~op_backend->umask,
-                                 replace_temp_cb, handle);
-+#endif
-             }
-           else
-             {
-@@ -1299,11 +1358,19 @@ try_replace (GVfsBackend *backend,
- {
-   GVfsBackendNfs *op_backend =3D G_VFS_BACKEND_NFS (backend);
-=20
-+#ifdef LIBNFS_API_V2
-+  nfs_open2_async (op_backend->ctx,
-+                   filename,
-+                   O_CREAT | O_EXCL,
-+                   (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op_=
backend->umask,
-+                   replace_create_cb, job);
-+#else
-   nfs_create_async (op_backend->ctx,
-                     filename,
-                     O_EXCL,
-                     (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op=
_backend->umask,
-                     replace_create_cb, job);
-+#endif
-   return TRUE;
- }
-=20
-@@ -1337,11 +1404,19 @@ try_create (GVfsBackend *backend,
- {
-   GVfsBackendNfs *op_backend =3D G_VFS_BACKEND_NFS (backend);
-=20
-+#ifdef LIBNFS_API_V2
-+  nfs_open2_async (op_backend->ctx,
-+                   filename,
-+                   O_CREAT | O_EXCL,
-+                   (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op_=
backend->umask,
-+                   create_cb, job);
-+#else
-   nfs_create_async (op_backend->ctx,
-                     filename,
-                     O_EXCL,
-                     (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op=
_backend->umask,
-                     create_cb, job);
-+#endif
-   return TRUE;
- }
-=20
-@@ -1372,7 +1447,11 @@ try_write (GVfsBackend *backend,
-   WriteHandle *handle =3D _handle;
-   struct nfsfh *fh =3D handle->fh;
-=20
-+#ifdef LIBNFS_API_V2
-+  nfs_write_async (op_backend->ctx, fh, buffer, buffer_size, write_cb, =
job);
-+#else
-   nfs_write_async (op_backend->ctx, fh, buffer_size, buffer, write_cb, =
job);
-+#endif
-   return TRUE;
- }
-=20
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.56.1.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.57.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.56.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.57.2.bb
index 97c83f751c..72afefb275 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.56.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.57.2.bb
@@ -18,8 +18,7 @@ DEPENDS +=3D "\
 RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
-SRC_URI +=3D "file://0001-nfs-Support-libnfs-6-backport-to-1.56.patch"
-SRC_URI[archive.sha256sum] =3D "86731ccec679648f8734e237b1de190ebdee6e4c=
8c0f56f454c31588e509aa10"
+SRC_URI[archive.sha256sum] =3D "f16bef8eca1fd6c117e85db011d21e915669790d=
55867349c5f1b291299e9585"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.48.1


