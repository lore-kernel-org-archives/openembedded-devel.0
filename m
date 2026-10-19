Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BE1CCF2E0
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 05:07:58 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27954.1792386476550505389
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 22:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JgO+Ww23;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10703; q=dns/txt;
  s=iport01; t=1792386476; x=1793596076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9l+oJADNvXMs2JQd0XK6Sb/P1j2XlxGDNWURn4i1AYQ=;
  b=JgO+Ww23yx3ONUlw71fP4ZUXLTh+5pqTOt7Kiy7UJb8bQtgNOGvXE99X
   LUtF99sn+juylfezRiMOSp33zWC4cDFwr+dMewHNuhMUpKNf6CjB5u9lF
   IFopu7V/OWAF8DxJo0l/99TNNYN3HManmbiLZ4i5oJGNK0qovc4mT9VlS
   cqEYsXV+Nanfwhy4nzBiulbv0P2TFRw5ykhy4X9BTdZoW2SjWz0eQReWm
   ArjrP10CihupOapI3xGb/LdHH8VKMQjn5B2RMMMMW2FSyJ0vD39ShQMlv
   BLFuFRFajACJLeIwjC5WN/C8kVnA+unyzVYoEzMfUrM8eGQK+azSfbreJ
   w==;
X-CSE-ConnectionGUID: fOGJ3e/DRBStiDiFhQwhbg==
X-CSE-MsgGUID: wgfkJaQ8TwOiGGc24vSGnA==
X-IPAS-Result: =?us-ascii?q?A0BHAgCipNVq/4z/Ja1aHgEBCxIMggULgld1YENJlV5sA?=
 =?us-ascii?q?54cgX4PAQEBD0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBRhAcAwECLysjCBmDAgGCdAMRvWCBe?=
 =?us-ascii?q?TOBAYNpAkPcAgELFAGBOIVAiCNdGAGEfCcbG4FygRWDaYEFgVwBAYEnG4ZBI?=
 =?us-ascii?q?gSCInoSgVoelT9IgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSC?=
 =?us-ascii?q?QETGjALgRs4PAkoQRcMcwwdBXIIAg0JB00YDUgRLDcVGQQ+bgeSKh6CRRkHA?=
 =?us-ascii?q?TBKEwETGCCBTTJHknSSSIE1n1oKKIN2jCKVOhozhVulFAuYfYs3glOWUIRpg?=
 =?us-ascii?q?Wg8gSgbBAsHcBWDIglKGQ+OKwMBCgscg0SBf8xJJzICCTIBAQcCBw4DC4Fok?=
 =?us-ascii?q?AACJgeBTwEB?=
IronPort-Data: A9a23:i9/l86iOledCTGM+sV+vNR5KX161MBEKZh0ujC45NGQN5FlHY01je
 htvCjuOOPvcYGvxfdwiYdjk8EJU6sPXydMyGQVqrCFkQyhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vS8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUW3clVWmwJ2
 cYyEywMQhGth9upwLi0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg9/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4fVHJgJwR7Dz
 o7A13v2DBI4PeXP9SWi812DjbWTgxjUXqtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YaLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:xJv5qKjb/vXQq9b/fg/+yQgbUHBQXvgji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: 9a23:3JeNqGCmB2xNRNX6EydA22xPF4cJSFfm0Hb8ImG4MHlpQrLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A2OmiLg0wsO64SrlL/MFRVFQMMjUj/KugC2IEqMU?=
 =?us-ascii?q?6pO6FGgN7YWuDtxuxa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="537154703"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 05:07:55 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 9619F180001EB;
	Mon, 19 Oct 2026 05:07:55 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3AE24CBF201; Sun, 18 Oct 2026 22:07:55 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][wrynose][PATCH 1/7] ntfs-3g-ntfsprogs: fix CVE-2026-46572 and CVE-2026-42617
Date: Sun, 18 Oct 2026 22:07:35 -0700
Message-Id: <20261019050741.1688261-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261019050741.1688261-1-dkelaiya@cisco.com>
References: <20261019050741.1688261-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131111

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
index 3a7dd783b9..4ed47ff53a 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV} \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
            file://0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch \
+           file://CVE-2026-46572_CVE-2026-42617_p1.patch \
+           file://CVE-2026-46572_CVE-2026-42617_p2.patch \
+           file://CVE-2026-46572_CVE-2026-42617_p3.patch \
 "
 SRCREV = "78414d93613532fd82f3a82aba5d4a1c32898781"
 
-- 
2.35.6


