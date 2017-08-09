Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F62F77BC9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 07:38:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v797cZpJ014404
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Aug 2017 00:38:35 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 9 Aug 2017 00:38:35 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Aug 2017 03:38:30 -0400
Message-ID: <ecbc03c505eb70085477a5a5a357cb73f647e975.1502261386.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1502261386.git.hongxu.jia@windriver.com>
References: <cover.1502261386.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] libblockdev: fix a clang compiling issue
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
X-List-Received-Date: Wed, 09 Aug 2017 07:38:35 -0000
Content-Type: text/plain

[snip]
../../../git/src/plugins/fs.c:2617:26: error: missing field 'start'
initializer [-Werror,-Wmissing-field-initializers]
    PedGeometry geom = {0};
                         ^
../../../git/src/plugins/fs.c:2618:30: error: missing field 'start'
initializer [-Werror,-Wmissing-field-initializers]
    PedGeometry new_geom = {0};
[snip]

Fix typo s/enum libvk_packet_format format/enum libvk_secret secret_type/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0005-fix-a-clang-compiling-issue.patch   | 111 +++++++++++++++++++++
 .../libblockdev/libblockdev_2.10.bb                |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch

diff --git a/meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch b/meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch
new file mode 100644
index 0000000..3818936
--- /dev/null
+++ b/meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch
@@ -0,0 +1,111 @@
+From 9b4a7a4d0653b627d747e00d6b3ada2990caa1d3 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 9 Aug 2017 13:57:57 +0800
+Subject: [PATCH] fix a clang compiling issue
+
+[snip]
+../../../git/src/plugins/fs.c:2617:26: error: missing field 'start'
+initializer [-Werror,-Wmissing-field-initializers]
+    PedGeometry geom = {0};
+                         ^
+../../../git/src/plugins/fs.c:2618:30: error: missing field 'start'
+initializer [-Werror,-Wmissing-field-initializers]
+    PedGeometry new_geom = {0};
+[snip]
+
+Fix typo s/enum libvk_packet_format format/enum libvk_secret secret_type/
+
+Upstream-Status: Submitted [https://github.com/storaged-project/libblockdev/pull/266]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/plugins/crypto.c | 6 +++---
+ src/plugins/fs.c     | 4 ++--
+ src/plugins/part.c   | 4 ++--
+ src/utils/exec.c     | 2 +-
+ 4 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
+index 8fbce4f..7ee7cdc 100644
+--- a/src/plugins/crypto.c
++++ b/src/plugins/crypto.c
+@@ -881,7 +881,7 @@ gboolean bd_crypto_tc_open (const gchar *device, const gchar *name, const guint8
+     gint ret = 0;
+     guint64 progress_id = 0;
+     gchar *msg = NULL;
+-    struct crypt_params_tcrypt params = {0};
++    struct crypt_params_tcrypt params = {NULL,0,NULL,0,NULL,NULL,NULL,0,0};
+ 
+     msg = g_strdup_printf ("Started opening '%s' TrueCrypt/VeraCrypt device", device);
+     progress_id = bd_utils_report_started (msg);
+@@ -999,7 +999,7 @@ static gchar *replace_char (gchar *str, gchar orig, gchar new) {
+     return str;
+ }
+ 
+-static gboolean write_escrow_data_file (struct libvk_volume *volume, struct libvk_ui *ui, enum libvk_packet_format format, const gchar *out_path,
++static gboolean write_escrow_data_file (struct libvk_volume *volume, struct libvk_ui *ui, enum libvk_secret secret_type, const gchar *out_path,
+                                         CERTCertificate *cert, GError **error) {
+     gpointer packet_data = NULL;
+     gsize packet_data_size = 0;
+@@ -1008,7 +1008,7 @@ static gboolean write_escrow_data_file (struct libvk_volume *volume, struct libv
+     gsize bytes_written = 0;
+     GError *tmp_error = NULL;
+ 
+-    packet_data = libvk_volume_create_packet_asymmetric_with_format (volume, &packet_data_size, format, cert,
++    packet_data = libvk_volume_create_packet_asymmetric_with_format (volume, &packet_data_size, secret_type, cert,
+                                                                      ui, LIBVK_PACKET_FORMAT_ASYMMETRIC_WRAP_SECRET_ONLY, error);
+ 
+     if (!packet_data) {
+diff --git a/src/plugins/fs.c b/src/plugins/fs.c
+index c4b6ac8..647096d 100644
+--- a/src/plugins/fs.c
++++ b/src/plugins/fs.c
+@@ -2614,8 +2614,8 @@ BDFSVfatInfo* bd_fs_vfat_get_info (const gchar *device, GError **error) {
+  */
+ gboolean bd_fs_vfat_resize (const gchar *device, guint64 new_size, GError **error) {
+     PedDevice *ped_dev = NULL;
+-    PedGeometry geom = {0};
+-    PedGeometry new_geom = {0};
++    PedGeometry geom = {NULL, 0, 0, 0};
++    PedGeometry new_geom = {NULL, 0, 0, 0};
+     PedFileSystem *fs = NULL;
+     PedSector start = 0;
+     PedSector length = 0;
+diff --git a/src/plugins/part.c b/src/plugins/part.c
+index 12d2ef7..d277688 100644
+--- a/src/plugins/part.c
++++ b/src/plugins/part.c
+@@ -849,7 +849,7 @@ static PedPartition* add_part_to_disk (PedDevice *dev, PedDisk *disk, BDPartType
+         return NULL;
+     }
+ 
+-    part = ped_partition_new (disk, type, NULL, geom->start, geom->end);
++    part = ped_partition_new (disk, (PedPartitionType)type, NULL, geom->start, geom->end);
+     if (!part) {
+         set_parted_error (error, BD_PART_ERROR_FAIL);
+         g_prefix_error (error, "Failed to create new partition on device '%s'", dev->path);
+@@ -1427,7 +1427,7 @@ gboolean bd_part_set_part_flags (const gchar *disk, const gchar *part, guint64 f
+     PedPartition *ped_part = NULL;
+     const gchar *part_num_str = NULL;
+     gint part_num = 0;
+-    guint64 i = 0;
++    int i = 0;
+     gint status = 0;
+     gboolean ret = FALSE;
+     guint64 progress_id = 0;
+diff --git a/src/utils/exec.c b/src/utils/exec.c
+index 7ac44fd..0a3094c 100644
+--- a/src/utils/exec.c
++++ b/src/utils/exec.c
+@@ -354,7 +354,7 @@ gboolean bd_utils_exec_and_report_progress (const gchar **argv, const BDExtraArg
+     GIOStatus io_status = G_IO_STATUS_NORMAL;
+     guint i = 0;
+     guint8 completion = 0;
+-    GPollFD fds[2] = {{0}, {0}};
++    GPollFD fds[2] = {{0,0,0}, {0,0,0}};
+     gboolean out_done = FALSE;
+     gboolean err_done = FALSE;
+     GString *stdout_data = g_string_new (NULL);
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb
index 4806dcd..2a92354 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.10.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/rhinstaller/libblockdev;branch=master \
            file://0001-fix-configure-and-compile-failures.patch \
            file://0002-remove-python2-support.patch \
            file://0003-remove-dmraid-while-compiling-with-with-dm.patch \
+           file://0005-fix-a-clang-compiling-issue.patch \
 "
 SRC_URI_append_libc-musl = " \
            file://0004-fix-compile-failure-against-musl-C-library.patch \
-- 
2.8.1


