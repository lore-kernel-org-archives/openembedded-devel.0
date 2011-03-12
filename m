Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyUVF-0004jB-WF
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 20:29:30 +0100
Received: by mail-yi0-f47.google.com with SMTP id 13so1589758yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 11:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=2skNHqlUfY3cgu/m+acQUCr9k+FeNRxHWxnEX3kQiJ8=;
	b=QCY9kWC/amAF6BEZusTcOigNNoJ2fjMDPrZR+nUCSOU+EuUJchXP0s6wyltIwTaDrW
	VZMpj20oMoBeW//N9BqtmltVqPqNgRHM1cWU3zHvK0Gs4QbK28kFSJvh09UZxr/ODomZ
	CMX2pn21G/xdlUhDJAhH6abgcaoJRPGlB8RbI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=QNYX+nWHbvtth71Hyt+/586p8m1DrJJyTnochPflCe/LD6nCr+iMjC1drzDeq/hKJY
	YV4i9NMEb6jXOV0hywFrwiVC8kwchwJduq9a0w38Fn7VxyR5Hn0is9ja4fNPrZjkk/SX
	fJ+J1kK0AcKpl6eISB4reXTtAB3SbJcK6XtGk=
Received: by 10.91.84.9 with SMTP id m9mr1439488agl.149.1299958072833;
	Sat, 12 Mar 2011 11:27:52 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c38sm4812832anc.38.2011.03.12.11.27.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 11:27:51 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 19:27:16 +0000
Message-Id: <1299958038-25216-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 09/11] libarchive: add
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
X-List-Received-Date: Sat, 12 Mar 2011 19:29:30 -0000

This library provides C library and command-line tools for reading and
writing tar, cpio, zip, ISO, and other archive formats.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../0001-Patch-from-upstream-revision-1990.patch   |   45 ++++++++++++++
 .../0002-Patch-from-upstream-revision-1991.patch   |   34 ++++++++++
 .../0003-Patch-from-upstream-rev-2516.patch        |   65 ++++++++++++++++++++
 .../0004-Patch-from-upstream-rev-2514.patch        |   35 +++++++++++
 .../0005-Patch-from-upstream-rev-2520.patch        |   33 ++++++++++
 .../0006-Patch-from-upstream-rev-2521.patch        |   30 +++++++++
 ...YS-error-when-setting-up-xattrs.-Closes-5.patch |   33 ++++++++++
 recipes/libarchive/libarchive_2.8.4.bb             |   20 ++++++
 8 files changed, 295 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch
 create mode 100644 recipes/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch
 create mode 100644 recipes/libarchive/libarchive/0003-Patch-from-upstream-rev-2516.patch
 create mode 100644 recipes/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch
 create mode 100644 recipes/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch
 create mode 100644 recipes/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch
 create mode 100644 recipes/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch
 create mode 100644 recipes/libarchive/libarchive_2.8.4.bb

diff --git a/recipes/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch b/recipes/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch
new file mode 100644
index 0000000..3b8607d
--- /dev/null
+++ b/recipes/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch
@@ -0,0 +1,45 @@
+From 76210f42f52bb3e08fcbc9d78a7f92217762839c Mon Sep 17 00:00:00 2001
+From: Andreas Henriksson <andreas@fatal.se>
+Date: Thu, 25 Feb 2010 22:29:49 +0100
+Subject: [PATCH 1/7] Patch from upstream (revision 1990)
+
+---
+ libarchive/archive_read_disk_entry_from_file.c |   15 +++++++++++++--
+ 1 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_read_disk_entry_from_file.c b/libarchive/archive_read_disk_entry_from_file.c
+index 7473c50..27671df 100644
+--- a/libarchive/archive_read_disk_entry_from_file.c
++++ b/libarchive/archive_read_disk_entry_from_file.c
+@@ -163,15 +163,26 @@ archive_read_disk_entry_from_file(struct archive *_a,
+ 
+ #ifdef HAVE_READLINK
+ 	if (S_ISLNK(st->st_mode)) {
+-		char linkbuffer[PATH_MAX + 1];
+-		int lnklen = readlink(path, linkbuffer, PATH_MAX);
++		size_t linkbuffer_len = st->st_size + 1;
++		char *linkbuffer;
++		int lnklen;
++
++		linkbuffer = malloc(linkbuffer_len);
++		if (linkbuffer == NULL) {
++			archive_set_error(&a->archive, ENOMEM,
++			    "Couldn't read link data");
++			return (ARCHIVE_FAILED);
++		}
++		lnklen = readlink(path, linkbuffer, linkbuffer_len);
+ 		if (lnklen < 0) {
+ 			archive_set_error(&a->archive, errno,
+ 			    "Couldn't read link data");
++			free(linkbuffer);
+ 			return (ARCHIVE_FAILED);
+ 		}
+ 		linkbuffer[lnklen] = 0;
+ 		archive_entry_set_symlink(entry, linkbuffer);
++		free(linkbuffer);
+ 	}
+ #endif
+ 
+-- 
+1.7.1
+
diff --git a/recipes/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch b/recipes/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch
new file mode 100644
index 0000000..f3e4758
--- /dev/null
+++ b/recipes/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch
@@ -0,0 +1,34 @@
+From 2ec43cc0e6f7d39a1570a7daf02a23aec8015626 Mon Sep 17 00:00:00 2001
+From: Andreas Henriksson <andreas@fatal.se>
+Date: Thu, 25 Feb 2010 22:30:06 +0100
+Subject: [PATCH 2/7] Patch from upstream (revision 1991)
+
+---
+ libarchive/archive_write_disk.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_write_disk.c b/libarchive/archive_write_disk.c
+index caf958e..60699e0 100644
+--- a/libarchive/archive_write_disk.c
++++ b/libarchive/archive_write_disk.c
+@@ -434,7 +434,7 @@ _archive_write_header(struct archive *_a, struct archive_entry *entry)
+ 		if (ret != ARCHIVE_OK)
+ 			goto done;
+ 	}
+-#ifdef HAVE_FCHDIR
++#if defined(HAVE_FCHDIR) && defined(PATH_MAX)
+ 	/* If path exceeds PATH_MAX, shorten the path. */
+ 	edit_deep_directories(a);
+ #endif
+@@ -866,7 +866,7 @@ archive_write_disk_new(void)
+  * object creation is likely to fail, but any error will get handled
+  * at that time.
+  */
+-#ifdef HAVE_FCHDIR
++#if defined(HAVE_FCHDIR) && defined(PATH_MAX)
+ static void
+ edit_deep_directories(struct archive_write_disk *a)
+ {
+-- 
+1.7.1
+
diff --git a/recipes/libarchive/libarchive/0003-Patch-from-upstream-rev-2516.patch b/recipes/libarchive/libarchive/0003-Patch-from-upstream-rev-2516.patch
new file mode 100644
index 0000000..efb6f06
--- /dev/null
+++ b/recipes/libarchive/libarchive/0003-Patch-from-upstream-rev-2516.patch
@@ -0,0 +1,65 @@
+From 07cefd4d6db82e53b7bcf096be1e5e29c09de3c6 Mon Sep 17 00:00:00 2001
+From: Andreas Henriksson <andreas@fatal.se>
+Date: Thu, 1 Jul 2010 15:28:25 +0200
+Subject: [PATCH 3/7] Patch from upstream (rev 2516)
+
+Fix Issue 100:  Allow a zero for the Type M Path Table Location, since
+WinISO (and probably other programs) set it this way.
+
+http://code.google.com/p/libarchive/source/detail?r=2516
+---
+ libarchive/archive_read_support_format_iso9660.c |   20 +++++++++++++-------
+ 1 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index 0c640c8..fdef3fb 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -714,11 +714,13 @@ isSVD(struct iso9660 *iso9660, const unsigned char *h)
+ 	if (location <= SYSTEM_AREA_BLOCK+2 || location >= volume_block)
+ 		return (0);
+ 
+-	/* Location of Occurrence of Type M Path Table must be
+-	 * available location,
++	/* The Type M Path Table must be at a valid location (WinISO
++	 * and probably other programs omit this, so we allow zero)
++	 *
+ 	 * > SYSTEM_AREA_BLOCK(16) + 2 and < Volume Space Size. */
+ 	location = archive_be32dec(h+SVD_type_M_path_table_offset);
+-	if (location <= SYSTEM_AREA_BLOCK+2 || location >= volume_block)
++	if ((location > 0 && location <= SYSTEM_AREA_BLOCK+2)
++	    || location >= volume_block)
+ 		return (0);
+ 
+ 	/* Read Root Directory Record in Volume Descriptor. */
+@@ -790,7 +792,8 @@ isEVD(struct iso9660 *iso9660, const unsigned char *h)
+ 	 * available location,
+ 	 * > SYSTEM_AREA_BLOCK(16) + 2 and < Volume Space Size. */
+ 	location = archive_be32dec(h+PVD_type_m_path_table_offset);
+-	if (location <= SYSTEM_AREA_BLOCK+2 || location >= volume_block)
++	if ((location > 0 && location <= SYSTEM_AREA_BLOCK+2)
++	    || location >= volume_block)
+ 		return (0);
+ 
+ 	/* Reserved field must be 0. */
+@@ -865,11 +868,14 @@ isPVD(struct iso9660 *iso9660, const unsigned char *h)
+ 	if (location <= SYSTEM_AREA_BLOCK+2 || location >= volume_block)
+ 		return (0);
+ 
+-	/* Location of Occurrence of Type M Path Table must be
+-	 * available location,
++	/* The Type M Path Table must also be at a valid location
++	 * (although ECMA 119 requires a Type M Path Table, WinISO and
++	 * probably other programs omit it, so we permit a zero here)
++	 *
+ 	 * > SYSTEM_AREA_BLOCK(16) + 2 and < Volume Space Size. */
+ 	location = archive_be32dec(h+PVD_type_m_path_table_offset);
+-	if (location <= SYSTEM_AREA_BLOCK+2 || location >= volume_block)
++	if ((location > 0 && location <= SYSTEM_AREA_BLOCK+2)
++	    || location >= volume_block)
+ 		return (0);
+ 
+ 	/* Reserved field must be 0. */
+-- 
+1.7.1
+
diff --git a/recipes/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch b/recipes/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch
new file mode 100644
index 0000000..b933966
--- /dev/null
+++ b/recipes/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch
@@ -0,0 +1,35 @@
+From 178c9df2941d0c01afc44ca1e6ae795716e3b9fd Mon Sep 17 00:00:00 2001
+From: Andreas Henriksson <andreas@fatal.se>
+Date: Thu, 1 Jul 2010 18:12:22 +0200
+Subject: [PATCH 4/7] Patch from upstream (rev 2514)
+
+Enable version stripping code in joliet extension support for iso9660.
+
+http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=587316
+---
+ libarchive/archive_read_support_format_iso9660.c |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index fdef3fb..8dcfeb4 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -1755,7 +1755,6 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
+ 		}
+ 		*wp = L'\0';
+ 
+-#if 0 /* untested code, is it at all useful on Joliet? */
+ 		/* trim trailing first version and dot from filename.
+ 		 *
+ 		 * Remember we where in UTF-16BE land!
+@@ -1775,7 +1774,6 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
+ 		/* Chop off trailing '.' from filenames. */
+ 		if (*(wp-1) == '.')
+ 			*(--wp) = L'\0';
+-#endif
+ 
+ 		/* store the result in the file name field. */
+ 		archive_strappend_w_utf8(&file->name, wbuff);
+-- 
+1.7.1
+
diff --git a/recipes/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch b/recipes/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch
new file mode 100644
index 0000000..e9bd861
--- /dev/null
+++ b/recipes/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch
@@ -0,0 +1,33 @@
+From bf4a8ba5a2f7a72d73765b95540acf56b0180990 Mon Sep 17 00:00:00 2001
+From: Andreas Henriksson <andreas@fatal.se>
+Date: Thu, 1 Jul 2010 18:13:46 +0200
+Subject: [PATCH 5/7] Patch from upstream (rev 2520)
+
+Fix version/dot stripping code in joliet extension of iso9660.
+---
+ libarchive/archive_read_support_format_iso9660.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index 8dcfeb4..2d3a855 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -1766,13 +1766,13 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
+ 		 *       *, /, :, ;, ? and \.
+ 		 */
+ 		/* Chop off trailing ';1' from files. */
+-		if (*(wp-2) == ';' && *(wp-1) == '1') {
++		if (*(wp-2) == L';' && *(wp-1) == L'1') {
+ 			wp-=2;
+ 			*wp = L'\0';
+ 		}
+ 
+ 		/* Chop off trailing '.' from filenames. */
+-		if (*(wp-1) == '.')
++		if (*(wp-1) == L'.')
+ 			*(--wp) = L'\0';
+ 
+ 		/* store the result in the file name field. */
+-- 
+1.7.1
+
diff --git a/recipes/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch b/recipes/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch
new file mode 100644
index 0000000..412ee79
--- /dev/null
+++ b/recipes/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch
@@ -0,0 +1,30 @@
+From 911c241d6d0d569074ecf05136dfd5cb9694876e Mon Sep 17 00:00:00 2001
+From: Andreas Henriksson <andreas@fatal.se>
+Date: Fri, 2 Jul 2010 09:41:10 +0200
+Subject: [PATCH 6/7] Patch from upstream (rev 2521).
+
+Disable dot stripping code since it's still broken
+and noone has been able to figure it out (yet).
+---
+ libarchive/archive_read_support_format_iso9660.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index 2d3a855..8661532 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -1771,9 +1771,11 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
+ 			*wp = L'\0';
+ 		}
+ 
++#if 0 /* XXX: this somehow manages to strip of single-character file extensions, like '.c'. */
+ 		/* Chop off trailing '.' from filenames. */
+ 		if (*(wp-1) == L'.')
+ 			*(--wp) = L'\0';
++#endif
+ 
+ 		/* store the result in the file name field. */
+ 		archive_strappend_w_utf8(&file->name, wbuff);
+-- 
+1.7.1
+
diff --git a/recipes/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch b/recipes/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch
new file mode 100644
index 0000000..4a272fd
--- /dev/null
+++ b/recipes/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch
@@ -0,0 +1,33 @@
+From 8ad947aea083aad383eed753390bd6bff71f0cb6 Mon Sep 17 00:00:00 2001
+From: Andreas Henriksson <andreas@fatal.se>
+Date: Thu, 15 Jul 2010 13:32:56 +0200
+Subject: [PATCH 7/7] Ignore ENOSYS error when setting up xattrs. (Closes: #588925)
+
+Modestas Vainius found out that HPPA returns errno ENOSYS
+on listxattrs. Currently, ENOTSUP is ignored so we'll do the
+same for ENOSYS as well.
+
+For full debug info about this see Modestas Vainius awesome
+report at:
+
+http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=588925#10
+---
+ libarchive/archive_read_disk_entry_from_file.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/libarchive/archive_read_disk_entry_from_file.c b/libarchive/archive_read_disk_entry_from_file.c
+index 27671df..c49e755 100644
+--- a/libarchive/archive_read_disk_entry_from_file.c
++++ b/libarchive/archive_read_disk_entry_from_file.c
+@@ -398,7 +398,7 @@ setup_xattrs(struct archive_read_disk *a,
+ 		list_size = listxattr(path, NULL, 0);
+ 
+ 	if (list_size == -1) {
+-		if (errno == ENOTSUP)
++		if (errno == ENOTSUP || errno == ENOSYS)
+ 			return (ARCHIVE_OK);
+ 		archive_set_error(&a->archive, errno,
+ 			"Couldn't list extended attributes");
+-- 
+1.7.1
+
diff --git a/recipes/libarchive/libarchive_2.8.4.bb b/recipes/libarchive/libarchive_2.8.4.bb
new file mode 100644
index 0000000..551746b
--- /dev/null
+++ b/recipes/libarchive/libarchive_2.8.4.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "C library and command-line tools for reading and writing tar, cpio, zip, ISO, and other archive formats"
+HOMEPAGE = "http://code.google.com/p/libarchive/"
+SECTION = "devel"
+LICENSE = "BSD"
+PR = "r0"
+
+SRC_URI = "http://libarchive.googlecode.com/files/${PN}-${PV}.tar.gz \
+           file://0001-Patch-from-upstream-revision-1990.patch \
+           file://0002-Patch-from-upstream-revision-1991.patch \
+           file://0003-Patch-from-upstream-rev-2516.patch \
+           file://0004-Patch-from-upstream-rev-2514.patch \
+           file://0005-Patch-from-upstream-rev-2520.patch \
+           file://0006-Patch-from-upstream-rev-2521.patch \
+           file://0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch \
+           "
+
+inherit autotools lib_package
+
+SRC_URI[md5sum] = "83b237a542f27969a8d68ac217dc3796"
+SRC_URI[sha256sum] = "86cffa3eaa28d3116f5d0b20284026c3762cf4a2b52b9844df2b494d4a89f688"
-- 
1.7.2.3



