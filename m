Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CBA677D68C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 11:56:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44yykR5jM5z63
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 13:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557230191;
	bh=8USbwgHLsvWBpo4lfJAbqIyziehnCRNKedGhSjYxVZo=;
	h=From:To:Subject:Date:From;
	b=g0M5s65ARkiI35ILP3WVJ78zPahADRTUj79phVMH4X+72k3A4yGjHj0Y+MR6Kk0km
	wt3gFj2G5PHmpiapAnt0DZcCTKOfLw2Ps+0aWBeIUTa2Obnvu4yQHOzn82TtLjPcSA
	YvsmoZpaQy/ZZQNURnVjr2Xj6+iic8p0UdQtXzKc6XmwYE5ThGj/HC+J+pY1CLnH4L
	ZQcF+KfXJY8u9wOb5QUxsDOaKayu7iPggJjJT/qmOxWb6PfMCxTXJKCDqHLBYPL/Bq
	GwxQ9n3MZ8XgfIPdHzMwKjgVhhjoD9sBUQZJbEWN5LiKYtnS+pnYSKm33ezDXgS94j
	drY7Tk2TkWps/jo/VCWX3ycfFL3iQaTX7F4jktZAsNHhDZ1KUe/+9+jyVC3FVgjpCX
	xkwLt01ukE9J4QKo0Gf/cjVd49FEjQE6pFC7tLqjyR25yP0IzJIzekEQEAhHMY+U/M
	g/c1JuGI/YwUNoHnoGOVa/2+Sqt9xCH1q/EJ/lAXFiyhOWrecEu3ZcLVtgIc77oVSn
	+uSPFWg6gQZJVmTA5f38/F1g9otMy1cmdeds1qgqeQny+cZSQtdWuiWUYeQuIjogPl
	Dqf2diLi0chtymGLcsN3MQY+42lW51T6lSuc0QwTZ1zckBTMLUAQVnBIRritQv5lhC
	mo/MMOXIuEimESYyzPJdsCzI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 14:56:20 +0300
Message-Id: <20190507115630.30368-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] grub: Use -Wno-error instead of doing this on a per-warning basis
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
X-List-Received-Date: Tue, 07 May 2019 11:56:32 -0000

In practice the warnings were disabled individually instead of fixes added,
so just make all warnings non-fatal to achieve the same.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../disable-address-of-packed-member.patch    | 262 ------------------
 .../grub/files/fix.build.with.gcc-7.patch     |  39 ---
 .../grub/files/fix.build.with.squashfs.patch  |  24 --
 meta/recipes-bsp/grub/grub-efi_2.02.bb        |   4 -
 meta/recipes-bsp/grub/grub2.inc               |   5 +-
 5 files changed, 2 insertions(+), 332 deletions(-)
 delete mode 100644 meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch
 delete mode 100644 meta/recipes-bsp/grub/files/fix.build.with.gcc-7.patch
 delete mode 100644 meta/recipes-bsp/grub/files/fix.build.with.squashfs.patch

diff --git a/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch b/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch
deleted file mode 100644
index 415f52ebe3..0000000000
--- a/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch
+++ /dev/null
@@ -1,262 +0,0 @@
-Disable address-of-packed-member warnings with gcc9
-
-gcc9 has turned this warning into error when -Werror is used, lets paper
-it over by turning it into a warning for now
-
-Fixes
-    error: taking address of packed member of 'struct head' may result in an unaligned pointer value [-Werror=address-of-packed-member]
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/grub-core/commands/lsacpi.c
-+++ b/grub-core/commands/lsacpi.c
-@@ -26,6 +26,9 @@
- #include <grub/dl.h>
- 
- #pragma GCC diagnostic ignored "-Wcast-align"
-+#if __GNUC__ >= 9
-+#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
-+#endif
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
---- a/grub-core/commands/lspci.c
-+++ b/grub-core/commands/lspci.c
-@@ -26,6 +26,9 @@
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-+#if __GNUC__ >= 9
-+#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
-+#endif
- struct grub_pci_classname
- {
-   int class;
-@@ -171,7 +174,7 @@ grub_lspci_iter (grub_pci_device_t dev,
- 
- 	  if (space == 0)
- 	    continue;
--	 
-+
- 	  switch (space & GRUB_PCI_ADDR_SPACE_MASK)
- 	    {
- 	    case GRUB_PCI_ADDR_SPACE_IO:
-@@ -195,13 +198,13 @@ grub_lspci_iter (grub_pci_device_t dev,
- 			       (space & GRUB_PCI_ADDR_MEM_MASK),
- 			       space & GRUB_PCI_ADDR_MEM_PREFETCH
- 			       ? "prefetchable" : "non-prefetchable");
--		 
-+
- 		}
- 	      else
- 		grub_printf ("\t32-bit memory space %d at 0x%016llx [%s]\n",
- 			     (unsigned) ((reg - GRUB_PCI_REG_ADDRESSES)
- 			      / sizeof (grub_uint32_t)) - 1,
--			     (unsigned long long) 
-+			     (unsigned long long)
- 			     (space & GRUB_PCI_ADDR_MEM_MASK),
- 			     space & GRUB_PCI_ADDR_MEM_PREFETCH
- 			     ? "prefetchable" : "non-prefetchable");
---- a/grub-core/fs/cpio_common.c
-+++ b/grub-core/fs/cpio_common.c
-@@ -26,7 +26,9 @@
- #include <grub/archelp.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
--
-+#if __GNUC__ >= 9
-+#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
-+#endif
- struct grub_archelp_data
- {
-   grub_disk_t disk;
-@@ -108,7 +110,7 @@ grub_cpio_get_link_target (struct grub_a
-   if (!ret)
-     return NULL;
- 
--  err = grub_disk_read (data->disk, 0, data->dofs, data->size, 
-+  err = grub_disk_read (data->disk, 0, data->dofs, data->size,
- 			ret);
-   if (err)
-     {
---- a/grub-core/fs/hfs.c
-+++ b/grub-core/fs/hfs.c
-@@ -32,6 +32,9 @@
- #include <grub/fshelp.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
-+#if __GNUC__ >= 9
-+#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
-+#endif
- 
- #define	GRUB_HFS_SBLOCK		2
- #define GRUB_HFS_EMBED_HFSPLUS_SIG 0x482B
-@@ -882,7 +885,7 @@ grub_hfs_iterate_dir_it_dir (struct grub
- {
-   struct grub_hfs_catalog_key *ckey = rec->key;
-   struct grub_hfs_iterate_dir_node_found_ctx *ctx = hook_arg;
--  
-+
-   /* Stop when the entries do not match anymore.  */
-   if (ckey->parent_dir != ctx->dir_be)
-     return 1;
-@@ -1076,7 +1079,7 @@ macroman_to_utf8 (char *to, const grub_u
- 	{
- 	  *optr++ = ':';
- 	  continue;
--	}	
-+	}
-       if (!(*iptr & 0x80))
- 	{
- 	  *optr++ = *iptr;
-@@ -1093,7 +1096,7 @@ utf8_to_macroman (grub_uint8_t *to, cons
-   grub_uint8_t *end = to + 31;
-   grub_uint8_t *optr = to;
-   const char *iptr = from;
--  
-+
-   while (*iptr && optr < end)
-     {
-       int i, clen;
-@@ -1103,7 +1106,7 @@ utf8_to_macroman (grub_uint8_t *to, cons
- 	  *optr++ = '/';
- 	  iptr++;
- 	  continue;
--	}	
-+	}
-       if (!(*iptr & 0x80))
- 	{
- 	  *optr++ = *iptr++;
-@@ -1164,7 +1167,7 @@ lookup_file (grub_fshelp_node_t dir,
-   *foundnode = grub_malloc (sizeof (struct grub_fshelp_node));
-   if (!*foundnode)
-     return grub_errno;
--  
-+
-   (*foundnode)->inode = grub_be_to_cpu32 (fdrec.dir.dirid);
-   (*foundnode)->fdrec = fdrec;
-   (*foundnode)->data = dir->data;
-@@ -1265,7 +1268,7 @@ grub_hfs_dir (grub_device_t device, cons
-       .hook_data = hook_data
-     };
-   grub_fshelp_node_t found = NULL;
--  
-+
-   grub_dl_ref (my_mod);
- 
-   data = grub_hfs_mount (device->disk);
-@@ -1294,7 +1297,7 @@ grub_hfs_open (struct grub_file *file, c
- {
-   struct grub_hfs_data *data;
-   grub_fshelp_node_t found = NULL;
--  
-+
-   grub_dl_ref (my_mod);
- 
-   data = grub_hfs_mount (file->device->disk);
---- a/grub-core/fs/hfsplus.c
-+++ b/grub-core/fs/hfsplus.c
-@@ -19,7 +19,7 @@
- 
- /* HFS+ is documented at http://developer.apple.com/technotes/tn/tn1150.html */
- 
--#define grub_fshelp_node grub_hfsplus_file 
-+#define grub_fshelp_node grub_hfsplus_file
- #include <grub/err.h>
- #include <grub/file.h>
- #include <grub/mm.h>
-@@ -34,6 +34,9 @@
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-+#if __GNUC__ >= 9
-+#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
-+#endif
- /* The type of node.  */
- enum grub_hfsplus_btnode_type
-   {
-@@ -145,7 +148,7 @@ grub_hfsplus_read_block (grub_fshelp_nod
- {
-   struct grub_hfsplus_btnode *nnode = 0;
-   grub_disk_addr_t blksleft = fileblock;
--  struct grub_hfsplus_extent *extents = node->compressed 
-+  struct grub_hfsplus_extent *extents = node->compressed
-     ? &node->resource_extents[0] : &node->extents[0];
- 
-   while (1)
-@@ -461,7 +464,7 @@ grub_hfsplus_cmp_extkey (struct grub_hfs
- 
-   if (extkey_a->type < extkey_b->type)
-     return -1;
--  
-+
-   akey = grub_be_to_cpu32 (extkey_a->start);
-   if (akey > extkey_b->start)
-     return 1;
-@@ -548,7 +551,7 @@ grub_hfsplus_btree_search (struct grub_h
- 			   struct grub_hfsplus_key_internal *key,
- 			   int (*compare_keys) (struct grub_hfsplus_key *keya,
- 						struct grub_hfsplus_key_internal *keyb),
--			   struct grub_hfsplus_btnode **matchnode, 
-+			   struct grub_hfsplus_btnode **matchnode,
- 			   grub_off_t *keyoffset)
- {
-   grub_uint64_t currnode;
---- a/grub-core/fs/jfs.c
-+++ b/grub-core/fs/jfs.c
-@@ -28,6 +28,9 @@
- #include <grub/i18n.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
-+#if __GNUC__ >= 9
-+#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
-+#endif
- 
- #define GRUB_JFS_MAX_SYMLNK_CNT	8
- #define GRUB_JFS_FILETYPE_MASK	0170000
---- a/grub-core/kern/efi/efi.c
-+++ b/grub-core/kern/efi/efi.c
-@@ -29,6 +29,9 @@
- #include <grub/mm.h>
- #include <grub/loader.h>
- 
-+#if __GNUC__ >= 9
-+#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
-+#endif
- /* The handle of GRUB itself. Filled in by the startup code.  */
- grub_efi_handle_t grub_efi_image_handle;
- 
-@@ -201,7 +204,7 @@ grub_efi_set_variable(const char *var, c
- 
-   r = grub_efi_system_table->runtime_services;
- 
--  status = efi_call_5 (r->set_variable, var16, guid, 
-+  status = efi_call_5 (r->set_variable, var16, guid,
- 		       (GRUB_EFI_VARIABLE_NON_VOLATILE
- 			| GRUB_EFI_VARIABLE_BOOTSERVICE_ACCESS
- 			| GRUB_EFI_VARIABLE_RUNTIME_ACCESS),
---- a/grub-core/loader/efi/chainloader.c
-+++ b/grub-core/loader/efi/chainloader.c
-@@ -41,6 +41,9 @@
- #endif
- 
- GRUB_MOD_LICENSE ("GPLv3+");
-+#if __GNUC__ >= 9
-+#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
-+#endif
- 
- static grub_dl_t my_mod;
- 
---- a/grub-core/commands/usbtest.c
-+++ b/grub-core/commands/usbtest.c
-@@ -63,6 +63,10 @@ static const char *usb_devspeed[] =
-     "High"
-   };
- 
-+#if __GNUC__ >= 9
-+#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
-+#endif
-+
- static grub_usb_err_t
- grub_usb_get_string (grub_usb_device_t dev, grub_uint8_t index, int langid,
- 		     char **string)
diff --git a/meta/recipes-bsp/grub/files/fix.build.with.gcc-7.patch b/meta/recipes-bsp/grub/files/fix.build.with.gcc-7.patch
deleted file mode 100644
index f35df97bfc..0000000000
--- a/meta/recipes-bsp/grub/files/fix.build.with.gcc-7.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-* e.g. with gentoo gcc-7.1 they define _FORTIFY_SOURCE by default with:
-  https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo/src/patchsets/gcc/7.1.0/gentoo/10_all_default-fortify-source.patch?view=markup
-  which results in following error while building grub-efi-native:
-  ./config-util.h:1504:48: error: this use of "defined" may not be portable [-Werror=expansion-to-defined]
-               || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
-                                                  ^~~~~~~~~~~~~~~
-  this part comes from gnulib and it's used only for Apple and BSD,
-  so we can ignore it, but we cannot add -Wno-error=expansion-to-defined
-  because this warning was introduced only in gcc-7 and older gcc
-  will fail with:
-  cc1: error: -Werror=expansion-to-defined: no option -Wexpansion-to-defined
-  use #pragma to work around this
-
-Upstream-Status: Pending (should be fixed in gnulib which is then rarely updated in grub)
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-diff -uNr grub-2.02.old/m4/extern-inline.m4 grub-2.02/m4/extern-inline.m4
---- grub-2.02.old/m4/extern-inline.m4	2016-02-28 15:22:21.000000000 +0100
-+++ grub-2.02/m4/extern-inline.m4	2017-08-22 19:26:45.213637276 +0200
-@@ -39,6 +39,10 @@
-    OS X 10.9 has a macro __header_inline indicating the bug is fixed for C and
-    for clang but remains for g++; see <http://trac.macports.org/ticket/41033>.
-    Assume DragonFly and FreeBSD will be similar.  */
-+#pragma GCC diagnostic push
-+#if __GNUC__ >= 7
-+#pragma GCC diagnostic ignored "-Wexpansion-to-defined"
-+#endif
- #if (((defined __APPLE__ && defined __MACH__) \
-       || defined __DragonFly__ || defined __FreeBSD__) \
-      && (defined __header_inline \
-@@ -50,6 +52,7 @@
-                 && defined __GNUC__ && ! defined __cplusplus))))
- # define _GL_EXTERN_INLINE_STDHEADER_BUG
- #endif
-+#pragma GCC diagnostic pop
- #if ((__GNUC__ \
-       ? defined __GNUC_STDC_INLINE__ && __GNUC_STDC_INLINE__ \
-       : (199901L <= __STDC_VERSION__ \
diff --git a/meta/recipes-bsp/grub/files/fix.build.with.squashfs.patch b/meta/recipes-bsp/grub/files/fix.build.with.squashfs.patch
deleted file mode 100644
index 2c2d2ea0b1..0000000000
--- a/meta/recipes-bsp/grub/files/fix.build.with.squashfs.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-When squashfs support is enabled, the build fails with:
-
-../grub-2.02/grub-core/fs/squash4.c: In function 'direct_read':
-../grub-2.02/grub-core/fs/squash4.c:868:10: error: 'err' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-       if (err)
-          ^
-cc1: all warnings being treated as errors
-Makefile:7272: recipe for target 'grub-core/fs/libgrubmods_a-squash4.o' failed
-
-Upstream-Status: Pending (should be fixed in gnulib which is then rarely updated in grub)
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
---- grub-2.02/grub-core/fs/squash4.c	2019-03-10 20:00:14.070468728 +0000
-+++ grub-2.02.fixed/grub-core/fs/squash4.c	2019-03-10 19:58:31.382477818 +0000
-@@ -746,7 +746,7 @@
- 	     struct grub_squash_cache_inode *ino,
- 	     grub_off_t off, char *buf, grub_size_t len)
- {
--  grub_err_t err;
-+  grub_err_t err = 0;
-   grub_off_t cumulated_uncompressed_size = 0;
-   grub_uint64_t a = 0;
-   grub_size_t i;
diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 6dbd23a3c7..0028a9b6eb 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -41,10 +41,6 @@ inherit deploy
 CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
 EXTRA_OECONF += "--enable-efiemu=no"
 
-# ldm.c:114:7: error: trampoline generated for nested function 'hook' [-Werror=trampolines]
-# and many other places in the grub code when compiled with some native gcc compilers (specifically, gentoo)
-CFLAGS_append_class-native = " -Wno-error=trampolines"
-
 do_mkimage() {
 	cd ${B}
 	# Search for the grub.cfg on the local boot media by using the
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index c6994723f9..7d8c280b3f 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -17,12 +17,9 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://autogen.sh-exclude-pc.patch \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
-           file://fix.build.with.gcc-7.patch \
            file://gcc8.patch \
            file://0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch \
            file://0001-grub-setup-Debug-message-cleanup.patch \
-           file://disable-address-of-packed-member.patch \
-           file://fix.build.with.squashfs.patch \
 "
 SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
 SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
@@ -63,6 +60,8 @@ BUILD_CFLAGS = ""
 BUILD_CXXFLAGS = ""
 BUILD_LDFLAGS = ""
 
+CFLAGS_append = "-Wno-error"
+
 do_configure_prepend() {
 	# The grub2 configure script uses variables such as TARGET_CFLAGS etc
 	# for its own purposes. Remove the OE versions from the environment to
-- 
2.17.1


