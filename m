Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C006C0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 07:34:01 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.60320.1738481638458920882
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Feb 2025 23:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout03.t-online.de (Postfix) with SMTP id 5985B120
	for <openembedded-devel@lists.openembedded.org>; Sun,  2 Feb 2025 08:33:53 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.16]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1teUUK-1lUlQP0; Sun, 2 Feb 2025 08:33:52 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gvfs: add backport patch to add support for libnfs6
Date: Sun,  2 Feb 2025 08:34:20 +0100
Message-ID: <20250202073420.52856-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1738481632-DCFF6939-554FE79A/0/0 CLEAN NORMAL
X-TOI-MSGID: 452b9e46-089b-469e-8846-4e3c37828662
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 07:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115217

This is fixed in gvfs 1.57

Add a backport patch from archlinux:
https://gitlab.archlinux.org/archlinux/packaging/packages/gvfs/-/blob/mai=
n/0001-nfs-Support-libnfs-6-backport-to-1.56.patch?ref_type=3Dheads

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...fs-Support-libnfs-6-backport-to-1.56.patch | 278 ++++++++++++++++++
 meta-gnome/recipes-gnome/gvfs/gvfs_1.56.1.bb  |   2 +-
 2 files changed, 279 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs/0001-nfs-Support-l=
ibnfs-6-backport-to-1.56.patch

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs/0001-nfs-Support-libnfs-6=
-backport-to-1.56.patch b/meta-gnome/recipes-gnome/gvfs/gvfs/0001-nfs-Sup=
port-libnfs-6-backport-to-1.56.patch
new file mode 100644
index 0000000000..63fb5a0e89
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs/0001-nfs-Support-libnfs-6-backpo=
rt-to-1.56.patch
@@ -0,0 +1,278 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>
+Date: Sun, 19 Jan 2025 14:28:25 +0100
+Subject: [PATCH] nfs: Support libnfs 6 (backport to 1.56)
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gvfs/-/commit/=
50c0845928983830ebe12d1d2ba82a6735cec77b]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ daemon/gvfsbackendnfs.c | 79 +++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 79 insertions(+)
+
+diff --git a/daemon/gvfsbackendnfs.c b/daemon/gvfsbackendnfs.c
+index c9e9ed60b938..1b66bb040e1d 100644
+--- a/daemon/gvfsbackendnfs.c
++++ b/daemon/gvfsbackendnfs.c
+@@ -407,27 +407,33 @@ read_cb (int err, struct nfs_context *ctx, void *d=
ata, void *private_data)
+     {
+       GVfsJobRead *op_job =3D G_VFS_JOB_READ (job);
+=20
++#ifndef LIBNFS_API_V2
+       memcpy (op_job->buffer, data, err);
++#endif
+       g_vfs_job_read_set_size (op_job, err);
+       g_vfs_job_succeeded (job);
+     }
+   else
+     {
+       g_vfs_job_failed_from_errno (job, -err);
+     }
+ }
+=20
+ static gboolean
+ try_read (GVfsBackend *backend,
+           GVfsJobRead *job,
+           GVfsBackendHandle _handle,
+           char *buffer,
+           gsize bytes_requested)
+ {
+   GVfsBackendNfs *op_backend =3D G_VFS_BACKEND_NFS (backend);
+   struct nfsfh *fh =3D _handle;
+=20
++#ifdef LIBNFS_API_V2
++  nfs_read_async (op_backend->ctx, fh, buffer, bytes_requested, read_cb=
, job);
++#else
+   nfs_read_async (op_backend->ctx, fh, bytes_requested, read_cb, job);
++#endif
+   return TRUE;
+ }
+=20
+@@ -755,29 +761,40 @@ try_append_to (GVfsBackend *backend,
+ {
+   GVfsBackendNfs *op_backend =3D G_VFS_BACKEND_NFS (backend);
+=20
++#ifdef LIBNFS_API_V2
++  nfs_open2_async (op_backend->ctx,
++                   filename,
++                   O_CREAT | O_APPEND,
++                   (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op_=
backend->umask,
++                   append_cb, job);
++#else
+   nfs_create_async (op_backend->ctx,
+                     filename,
+                     O_APPEND,
+                     (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op=
_backend->umask,
+                     append_cb, job);
++#endif
+   return TRUE;
+ }
+=20
+ /* The following types and functions implement an asynchronous copy whi=
ch calls
+  * a callback function with a boolean success or failure.  This is used=
 in some
+  * cases for backup files when replacing. */
+ #define COPY_BLKSIZE (64 * 1024)
+=20
+ typedef void (*CopyFileCallback) (gboolean success, void *private_data)=
;
+=20
+ typedef struct
+ {
+   struct nfsfh *srcfh;
+   struct nfsfh *destfh;
+   char *dest;
+   int mode;
+   CopyFileCallback cb;
+   void *private_data;
++#ifdef LIBNFS_API_V2
++  char buffer[COPY_BLKSIZE];
++#endif
+ } CopyHandle;
+=20
+ static void
+@@ -805,56 +822,74 @@ copy_write_cb (int err,
+   CopyHandle *handle =3D private_data;
+=20
+   if (err > 0)
++#ifdef LIBNFS_API_V2
++    nfs_read_async (ctx, handle->srcfh, handle->buffer, COPY_BLKSIZE, c=
opy_read_cb, handle);
++#else
+     nfs_read_async (ctx, handle->srcfh, COPY_BLKSIZE, copy_read_cb, han=
dle);
++#endif
+   else
+     copy_handle_complete (ctx, handle, FALSE);
+ }
+=20
+ static void
+ copy_read_cb (int err, struct nfs_context *ctx, void *data, void *priva=
te_data)
+ {
+   CopyHandle *handle =3D private_data;
+=20
+   if (err =3D=3D 0)
+     copy_handle_complete (ctx, handle, TRUE);
+   else if (err > 0)
++#ifdef LIBNFS_API_V2
++    nfs_write_async (ctx, handle->destfh, handle->buffer, err, copy_wri=
te_cb, handle);
++#else
+     nfs_write_async (ctx, handle->destfh, err, data, copy_write_cb, han=
dle);
++#endif
+   else
+     copy_handle_complete (ctx, handle, FALSE);
+ }
+=20
+ static void
+ copy_open_dest_cb (int err,
+                    struct nfs_context *ctx,
+                    void *data, void *private_data)
+ {
+   CopyHandle *handle =3D private_data;
+=20
+   if (err =3D=3D 0)
+     {
+       handle->destfh =3D data;
+=20
++#ifdef LIBNFS_API_V2
++      nfs_read_async (ctx, handle->srcfh, handle->buffer, COPY_BLKSIZE,=
 copy_read_cb, handle);
++#else
+       nfs_read_async (ctx, handle->srcfh, COPY_BLKSIZE, copy_read_cb, h=
andle);
++#endif
+     }
+   else
+     {
+       copy_handle_complete (ctx, handle, FALSE);
+     }
+ }
+=20
+ static void
+ copy_open_source_cb (int err,
+                      struct nfs_context *ctx,
+                      void *data, void *private_data)
+ {
+   CopyHandle *handle =3D private_data;
+=20
+   if (err =3D=3D 0)
+     {
+       handle->srcfh =3D data;
++#ifdef LIBNFS_API_V2
++      nfs_open2_async (ctx,
++                       handle->dest, O_CREAT | O_TRUNC, handle->mode & =
0777,
++                       copy_open_dest_cb, handle);
++#else
+       nfs_create_async (ctx,
+                         handle->dest, O_TRUNC, handle->mode & 0777,
+                         copy_open_dest_cb, handle);
++#endif
+       g_free (handle->dest);
+     }
+   else
+@@ -935,11 +970,19 @@ replace_backup_chown_cb (int err,
+       GVfsJobOpenForWrite *op_job =3D G_VFS_JOB_OPEN_FOR_WRITE (job);
+       GVfsBackendNfs *op_backend =3D G_VFS_BACKEND_NFS (op_job->backend=
);
+=20
++#ifdef LIBNFS_API_V2
++      nfs_open2_async (op_backend->ctx,
++                       op_job->filename,
++                       O_CREAT | O_TRUNC,
++                       (op_job->flags & G_FILE_CREATE_PRIVATE ? 0600 : =
0666) & ~op_backend->umask,
++                       replace_trunc_cb, handle);
++#else
+       nfs_create_async (op_backend->ctx,
+                         op_job->filename,
+                         O_TRUNC,
+                         (op_job->flags & G_FILE_CREATE_PRIVATE ? 0600 :=
 0666) & ~op_backend->umask,
+                         replace_trunc_cb, handle);
++#endif
+     }
+   else
+     {
+@@ -1019,11 +1062,19 @@ replace_truncate (struct nfs_context *ctx, Write=
Handle *handle)
+     }
+   else
+     {
++#ifdef LIBNFS_API_V2
++      nfs_open2_async (ctx,
++                       op_job->filename,
++                       O_CREAT | O_TRUNC,
++                       (op_job->flags & G_FILE_CREATE_PRIVATE ? 0600 : =
0666) & ~op_backend->umask,
++                       replace_trunc_cb, handle);
++#else
+       nfs_create_async (ctx,
+                         op_job->filename,
+                         O_TRUNC,
+                         (op_job->flags & G_FILE_CREATE_PRIVATE ? 0600 :=
 0666) & ~op_backend->umask,
+                         replace_trunc_cb, handle);
++#endif
+     }
+ }
+=20
+@@ -1211,11 +1262,19 @@ replace_stat_cb (int err,
+               handle->tempname =3D g_build_filename (dirname, basename,=
 NULL);
+               g_free (dirname);
+=20
++#ifdef LIBNFS_API_V2
++              nfs_open2_async (ctx,
++                               handle->tempname,
++                               O_CREAT | O_EXCL,
++                               (op_job->flags & G_FILE_CREATE_PRIVATE ?=
 0600 : 0666) & ~op_backend->umask,
++                               replace_temp_cb, handle);
++#else
+               nfs_create_async (ctx,
+                                 handle->tempname,
+                                 O_EXCL,
+                                 (op_job->flags & G_FILE_CREATE_PRIVATE =
? 0600 : 0666) & ~op_backend->umask,
+                                 replace_temp_cb, handle);
++#endif
+             }
+           else
+             {
+@@ -1299,11 +1358,19 @@ try_replace (GVfsBackend *backend,
+ {
+   GVfsBackendNfs *op_backend =3D G_VFS_BACKEND_NFS (backend);
+=20
++#ifdef LIBNFS_API_V2
++  nfs_open2_async (op_backend->ctx,
++                   filename,
++                   O_CREAT | O_EXCL,
++                   (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op_=
backend->umask,
++                   replace_create_cb, job);
++#else
+   nfs_create_async (op_backend->ctx,
+                     filename,
+                     O_EXCL,
+                     (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op=
_backend->umask,
+                     replace_create_cb, job);
++#endif
+   return TRUE;
+ }
+=20
+@@ -1337,11 +1404,19 @@ try_create (GVfsBackend *backend,
+ {
+   GVfsBackendNfs *op_backend =3D G_VFS_BACKEND_NFS (backend);
+=20
++#ifdef LIBNFS_API_V2
++  nfs_open2_async (op_backend->ctx,
++                   filename,
++                   O_CREAT | O_EXCL,
++                   (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op_=
backend->umask,
++                   create_cb, job);
++#else
+   nfs_create_async (op_backend->ctx,
+                     filename,
+                     O_EXCL,
+                     (flags & G_FILE_CREATE_PRIVATE ? 0600 : 0666) & ~op=
_backend->umask,
+                     create_cb, job);
++#endif
+   return TRUE;
+ }
+=20
+@@ -1372,7 +1447,11 @@ try_write (GVfsBackend *backend,
+   WriteHandle *handle =3D _handle;
+   struct nfsfh *fh =3D handle->fh;
+=20
++#ifdef LIBNFS_API_V2
++  nfs_write_async (op_backend->ctx, fh, buffer, buffer_size, write_cb, =
job);
++#else
+   nfs_write_async (op_backend->ctx, fh, buffer_size, buffer, write_cb, =
job);
++#endif
+   return TRUE;
+ }
+=20
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.56.1.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.56.1.bb
index 9c1e77ac25..97c83f751c 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.56.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.56.1.bb
@@ -18,7 +18,7 @@ DEPENDS +=3D "\
 RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
-
+SRC_URI +=3D "file://0001-nfs-Support-libnfs-6-backport-to-1.56.patch"
 SRC_URI[archive.sha256sum] =3D "86731ccec679648f8734e237b1de190ebdee6e4c=
8c0f56f454c31588e509aa10"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
--=20
2.47.1


