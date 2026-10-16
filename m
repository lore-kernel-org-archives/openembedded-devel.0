Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9A1CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 07:46:47 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16843.1792136805446369542
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2026 00:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cqJ+QjaO;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10698; q=dns/txt;
  s=iport01; t=1792136805; x=1793346405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IYcYlcK1l9Yw9DncCsBM1UJ64PpSxBqRrLtmsau/mEQ=;
  b=cqJ+QjaOrQzJ2PuJ9oWXkH2lnEu8mIVXwvkDhV5W+++Z/ALKq9BKYgao
   pI1oU2jcF0kWLVPwmP/IPONf1uDQ7Miu8gYGwP/jmxsaCNai8DeQ3MGFO
   PXj8mMfw7bQoZ+VnoWy7klyo6qpcItNskFnoTjN77p2+54DUQom5X6sOV
   M+7a/oSuDQNd0jjnFHbueNyoAf0v/zyG5hkycO1WFk9Muuls46HBqAfCa
   mdL8R3gsQCttNfjdz0ujxXdKlMRWIUtZw4HbsH0vj6nqnBN0IfUCHRLSs
   e0EjhTZTJuXGA+Pf+vJgaIY9t/cOZxK2LXF3CDCv32rc3dPYD9WVzp2k+
   g==;
X-CSE-ConnectionGUID: mLpZf34aT2e3KGiYz+nIvw==
X-CSE-MsgGUID: BsWzvpB+RxGwVo0q4spesQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgAY1NFq/5H/Ja1aHgEBCxIMggULgld1YENJlV5sA?=
 =?us-ascii?q?54cgX4PAQEBD0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBRhAcAwECJAsrIwgZgwIBgnQDEb0hg?=
 =?us-ascii?q?XkzgQGDaQJD3AIBCxQBgTiFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAQGBJxuGQ?=
 =?us-ascii?q?SIEgiKBDIFaHpUpSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegkUZB?=
 =?us-ascii?q?wEwShMBExcBIIFNMkeSdJJHgTWfWgoog3aMIpU6GjOFW6UUC5h9jgqWT4Rpg?=
 =?us-ascii?q?Wg8gSgbBAsHcBWDIglKGQ+OKwMBCgscg0SBf8xbJzICCTIBAQcCBw4DC4Fok?=
 =?us-ascii?q?AACJgeBTwEB?=
IronPort-Data: A9a23:F1QfKa8JcGD+cRT7y1v4DrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GEfWW3TOPaJMWagetBwbIq3pxgHvJ/QxtAxHABs/C1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kzGZUq9L0rCF0U+
 Kc7BzE8fFOFpvyplefTpulE3qzPLeHxN48Z/3UlxjbDALN+EdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0An1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FbYGIIYPWFJgJ9qqej
 kjdwHbnGjtZDsyw1gSCqmvwnffChhquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:FZk+TK5BEQZfVGv7JgPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:7l8i6W3A+fBw5z9/4VMZWLxfH+Q9QHOGkH7seULjKkloea/WT36O5/Yx
X-Talos-MUID: 9a23:lITxbQZhLKTyh+BTnSTTli96HoRS84uxNkdViMkdo8SfDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535374954"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 07:46:44 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 5834218000443;
	Fri, 16 Oct 2026 07:46:44 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id F3CA4CBF201; Fri, 16 Oct 2026 00:46:43 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][scarthgap][PATCH 1/7] ntfs-3g-ntfsprogs: fix CVE-2026-46572 and CVE-2026-42617
Date: Fri, 16 Oct 2026 00:46:34 -0700
Message-Id: <20261016074640.3986037-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016074640.3986037-1-dkelaiya@cisco.com>
References: <20261016074640.3986037-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 07:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131075

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fixes shown in [1], [2], and [3].
The NVD records describing the vulnerabilities are referenced in
[4] and [5].

[1] https://github.com/tuxera/ntfs-3g/commit/2ead8a3ccf940c0219ffba587fab54e21462b3a5
[2] https://github.com/tuxera/ntfs-3g/commit/dfd1a7c6eb23a22238ec193451fa59c989b4381f
[3] https://github.com/tuxera/ntfs-3g/commit/edf2b892356684ca8f2fc5898943c7a9b90ffb80
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-46572
[5] https://nvd.nist.gov/vuln/detail/CVE-2026-42617

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../CVE-2026-46572_CVE-2026-42617_p1.patch    |  66 +++++++++++
 .../CVE-2026-46572_CVE-2026-42617_p2.patch    | 104 ++++++++++++++++++
 .../CVE-2026-46572_CVE-2026-42617_p3.patch    |  35 ++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |   3 +
 4 files changed, 208 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch
new file mode 100644
index 0000000000..47121ea9a5
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch
@@ -0,0 +1,66 @@
+From 7a3fccddc2bca7609fd6597fcb6ea8a42a258937 Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik@tuxera.com>
+Date: Fri, 24 Apr 2026 13:00:30 +0300
+Subject: [PATCH] index.c: Validate the size of data copied from root to index
+ block.
+
+If the last entry extends beyond the index block size, we could copy
+more bytes than allocated into the index block, overflowing its
+allocation. Fixed by adding a bounds check prior to the memcpy, emitting
+an error message and returning NULL with errno == EIO as this is an
+inconsistency.
+
+Thanks to Alexandro Calo' from Nozomi Networks Labs for reporting this
+issue.
+
+CVE: CVE-2026-46572 CVE-2026-42617
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/2ead8a3ccf940c0219ffba587fab54e21462b3a5]
+
+(cherry picked from commit 2ead8a3ccf940c0219ffba587fab54e21462b3a5)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ libntfs-3g/index.c | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/libntfs-3g/index.c b/libntfs-3g/index.c
+index e48d6aaf..2739594b 100644
+--- a/libntfs-3g/index.c
++++ b/libntfs-3g/index.c
+@@ -1091,14 +1091,16 @@ out:
+ 
+ static INDEX_BLOCK *ntfs_ir_to_ib(INDEX_ROOT *ir, VCN ib_vcn)
+ {
++	u32 ib_size;
+ 	INDEX_BLOCK *ib;
+ 	INDEX_ENTRY *ie_last;
+ 	char *ies_start, *ies_end;
+ 	int i;
+ 	
+ 	ntfs_log_trace("Entering\n");
+-	
+-	ib = ntfs_ib_alloc(ib_vcn, le32_to_cpu(ir->index_block_size), LEAF_NODE);
++
++	ib_size = le32_to_cpu(ir->index_block_size);
++	ib = ntfs_ib_alloc(ib_vcn, ib_size, LEAF_NODE);
+ 	if (!ib)
+ 		return NULL;
+ 	
+@@ -1110,6 +1112,18 @@ static INDEX_BLOCK *ntfs_ir_to_ib(INDEX_ROOT *ir, VCN ib_vcn)
+ 	 * as well, which can never have any data.
+ 	 */
+ 	i = (char *)ie_last - ies_start + le16_to_cpu(ie_last->length);
++
++	if (offsetof(INDEX_BLOCK, index) + le32_to_cpu(ib->index.entries_offset)
++			+ i > ib_size)
++	{
++		ntfs_log_error("Last entry in index root overflows the index "
++				"block size: %d (index block size: %lu)\n",
++				i, (unsigned long)ib_size);
++		free(ib);
++		errno = EIO;
++		return NULL;
++	}
++
+ 	memcpy(ntfs_ie_get_first(&ib->index), ies_start, i);
+ 	
+ 	ib->index.ih_flags = ir->index.ih_flags;
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch
new file mode 100644
index 0000000000..d2d40124fe
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch
@@ -0,0 +1,104 @@
+From 51475eab2d2a559e10a8d3772d56444feffc13a4 Mon Sep 17 00:00:00 2001
+From: Rakesh Pandit <rakesh@tuxera.com>
+Date: Mon, 8 Jun 2026 09:27:45 +0300
+Subject: [PATCH] Validate index entry stream while reading from disk.
+
+Add ntfs_ie_stream_inconsistent() to walk the IE stream once and verify
+every entry: header fits, length is sane and 8-byte aligned, entry fits,
+and the END entry terminates the stream exactly.  Call it from
+ntfs_attr_inconsistent() for INDEX_ROOT and from
+ntfs_index_block_inconsistent() for INDX blocks so callers can rely on
+the IE stream being well-formed.
+
+CVE: CVE-2026-46572 CVE-2026-42617
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/dfd1a7c6eb23a22238ec193451fa59c989b4381f]
+
+(cherry picked from commit dfd1a7c6eb23a22238ec193451fa59c989b4381f)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ include/ntfs-3g/index.h |  1 +
+ libntfs-3g/attrib.c     |  3 +++
+ libntfs-3g/index.c      | 37 ++++++++++++++++++++++++++++++++++++-
+ 3 files changed, 40 insertions(+), 1 deletion(-)
+
+diff --git a/include/ntfs-3g/index.h b/include/ntfs-3g/index.h
+index d001863a..1d5845d4 100644
+--- a/include/ntfs-3g/index.h
++++ b/include/ntfs-3g/index.h
+@@ -143,6 +143,7 @@ extern int ntfs_index_block_inconsistent(const INDEX_BLOCK *ib, u32 block_size,
+ 			u64 inum, VCN vcn);
+ extern int ntfs_index_entry_inconsistent(const INDEX_ENTRY *ie,
+ 			COLLATION_RULES collation_rule, u64 inum);
++extern int ntfs_ie_stream_inconsistent(const INDEX_HEADER *ih, u64 inum);
+ extern int ntfs_index_lookup(const void *key, const int key_len,
+ 		ntfs_index_context *ictx) __attribute_warn_unused_result__;
+ 
+diff --git a/libntfs-3g/attrib.c b/libntfs-3g/attrib.c
+index efb91943..ad9ebceb 100644
+--- a/libntfs-3g/attrib.c
++++ b/libntfs-3g/attrib.c
+@@ -3542,6 +3542,9 @@ int ntfs_attr_inconsistent(const ATTR_RECORD *a, const MFT_REF mref)
+ 					(long long)inum);
+ 				errno = EIO;
+ 				ret = -1;
++			} else if (ntfs_ie_stream_inconsistent(&ir->index, inum)) {
++				errno = EIO;
++				ret = -1;
+ 			}
+ 			break;
+ 		case AT_STANDARD_INFORMATION :
+diff --git a/libntfs-3g/index.c b/libntfs-3g/index.c
+index 2739594b..c9651a62 100644
+--- a/libntfs-3g/index.c
++++ b/libntfs-3g/index.c
+@@ -504,6 +504,8 @@ int ntfs_index_block_inconsistent(const INDEX_BLOCK *ib, u32 block_size,
+ 				(unsigned long long)inum);
+ 		return -1;
+ 	}
++	if (ntfs_ie_stream_inconsistent(&ib->index, inum))
++		return -1;
+ 
+ 	return (0);
+ }
+@@ -560,7 +562,40 @@ int ntfs_index_entry_inconsistent(const INDEX_ENTRY *ie,
+ 	return (ret);
+ }
+ 
+-/** 
++int ntfs_ie_stream_inconsistent(const INDEX_HEADER *ih, u64 inum)
++{
++	const u8 *ies_start = (const u8 *)ih + le32_to_cpu(ih->entries_offset);
++	const u8 *ies_end = (const u8 *)ih + le32_to_cpu(ih->index_length);
++	const u8 *ie;
++
++	ntfs_log_trace("Entering\n");
++
++	for (ie = ies_start; ie < ies_end; ) {
++		u32 len;
++		const INDEX_ENTRY *ent = (const INDEX_ENTRY *)ie;
++
++		if ((size_t)(ies_end - ie) < sizeof(INDEX_ENTRY_HEADER))
++			goto err;
++		len = le16_to_cpu(ent->length);
++		if (len < sizeof(INDEX_ENTRY_HEADER) || (len & 7))
++			goto err;
++		if ((size_t)(ies_end - ie) < len)
++			goto err;
++		if (ent->ie_flags & INDEX_ENTRY_END) {
++			/* END must terminate the stream exactly. */
++			if (ie + len != ies_end)
++				goto err;
++			return 0;
++		}
++		ie += len;
++	}
++err:
++	ntfs_log_error("Corrupt index entry stream in inode %lld\n",
++			(long long)inum);
++	return -1;
++}
++
++/**
+  * Find a key in the index block.
+  * 
+  * Return values:
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch
new file mode 100644
index 0000000000..54bce4f95e
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch
@@ -0,0 +1,35 @@
+From c8630e735204fd4ed4b49c4dc315716664b965c1 Mon Sep 17 00:00:00 2001
+From: Rakesh Pandit <rakesh@tuxera.com>
+Date: Mon, 8 Jun 2026 09:57:11 +0300
+Subject: [PATCH] Validate INDEX_ROOT.index_block_size from disk.
+
+Reject INDEX_ROOT attributes whose index_block_size is smaller than
+NTFS_BLOCK_SIZE or not a power of two. Same rule the driver already
+applies at libntfs-3g/dir.c.
+
+Thanks to Alexandro Calo' from Nozomi Networks Labs for the report.
+
+CVE: CVE-2026-46572 CVE-2026-42617
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/edf2b892356684ca8f2fc5898943c7a9b90ffb80]
+
+(cherry picked from commit edf2b892356684ca8f2fc5898943c7a9b90ffb80)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ libntfs-3g/attrib.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libntfs-3g/attrib.c b/libntfs-3g/attrib.c
+index ad9ebceb..cfc2446e 100644
+--- a/libntfs-3g/attrib.c
++++ b/libntfs-3g/attrib.c
+@@ -3528,6 +3528,10 @@ int ntfs_attr_inconsistent(const ATTR_RECORD *a, const MFT_REF mref)
+ 			if (a->non_resident
+ 			    || (le32_to_cpu(a->value_length)
+ 				< offsetof(INDEX_ROOT, index.reserved))
++			    || (le32_to_cpu(ir->index_block_size)
++				< NTFS_BLOCK_SIZE)
++			    || (le32_to_cpu(ir->index_block_size)
++				& (le32_to_cpu(ir->index_block_size) - 1))
+ 			    || (le32_to_cpu(ir->index.entries_offset)
+ 				< sizeof(INDEX_HEADER))
+ 			    || (le32_to_cpu(ir->index.index_length)
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 37a8106bb0..8995807d95 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
+           file://CVE-2026-46572_CVE-2026-42617_p1.patch \
+           file://CVE-2026-46572_CVE-2026-42617_p2.patch \
+           file://CVE-2026-46572_CVE-2026-42617_p3.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
-- 
2.35.6


