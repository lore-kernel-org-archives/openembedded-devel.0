Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F615CCF2D3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 05:07:58 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28004.1792386477168280524
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 22:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BcZUU5dA;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13412; q=dns/txt;
  s=iport01; t=1792386477; x=1793596077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qfMPH0g2ysjWEIFYxk12kIHbCYr8bGe1QNsi5zH6/80=;
  b=BcZUU5dA7mt2Xxoxd9jV7LyxCek01/f0e6S8owrVaxICZN3BxHIIMchQ
   Dz0cMFSNljgsha/zeG5O7TAeKfH1ukR6poCKl+zmr3MLfVuDoeh/iDlMr
   UkLpEJnncyYjlJPPF2DqXfLOj/dPLCSKai4XD9x3hGZecR/kpo5051Hx0
   KIHX6shTbjwKwRGkZ0w8G/kvWiwKHdasAVS6rubfCCB85dg7EC5UoTjvi
   H5QpU6GgENHSdtdwYaFnoYg/Tzi9659S8MkkWXtLtFEe5iVQax5vFRP4G
   hjYVroi5zewnVlG4uDZ3sj/mUGWI+RU4L33opurJlhCpws7vGkShuq65V
   g==;
X-CSE-ConnectionGUID: auhFLYsNTfS/klVwbftUNg==
X-CSE-MsgGUID: u31sLa1aR+2D7O/CvhC+Uw==
X-IPAS-Result: =?us-ascii?q?A0AnAACipNVq/4v/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWAOBE5A3jFIUgWoPAQEBD0QNBAEBhQUCjhUCJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDMgFGEBwDAQIvK?=
 =?us-ascii?q?yMIGYMCAYJ0AxG9YIIsgQGDaQJDUNsyAQsUAYE4AYU/iCNdGAGEfCcbG4Fyg?=
 =?us-ascii?q?RWCc3aBBYFcAQGBGC6GPSIEgiJ6EoFaHpU/SIEeA1ksAVUTDQoLBwWBaAM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQdNGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4HkioegkUfAQEVFwQMPhMBKxcJZRM1FwhikwwRkjeBNZ4cgT4KK?=
 =?us-ascii?q?IN2jCKVOhozhASBV5JAklQLmH2CWYheglOVZxoSPYRpgWg8gSgcAwsHcBWDI?=
 =?us-ascii?q?glKGQ+OKw4Lg2CBf8xJJzICCTIBAQcCBw4DC4FokAIPFweBTwEB?=
IronPort-Data: A9a23:PWjN6apa5uvy0WjvqHw14svYKaVeBmJIZBIvgKrLsJaIsI4StFCzt
 garIBnTbPrfNGLzctFxPdu0pEsO68LUzdIwGwU/qH83RilAo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8UI35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0u9qAU9qx
 Oc+FD42KROHuf28zq6GbOY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Qo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWfrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXHpoJwx7B+
 zOuE2LRH0pDL/iWkDO/sSiA2ciItj37c8EvC+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMIZgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:5sFk2KzrlUldhtD8duH4KrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: =?us-ascii?q?9a23=3AAgGIF2szHyNci1OhfU9k6vJy6Issb33z6EbLBXO?=
 =?us-ascii?q?2MiFqTIOKQ1GMxYVrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AziVw0A320dd//1ko8T3Rfb9dMzUj/v/3E2QEyJw?=
 =?us-ascii?q?8+JOoags3ECmdp3eKXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="537450159"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 05:07:56 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 0492F18000347;
	Mon, 19 Oct 2026 05:07:56 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 526FBCBF21E; Sun, 18 Oct 2026 22:07:55 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][wrynose][PATCH 5/7] ntfs-3g-ntfsprogs: fix CVE-2026-42618
Date: Sun, 18 Oct 2026 22:07:39 -0700
Message-Id: <20261019050741.1688261-6-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261019050741.1688261-1-dkelaiya@cisco.com>
References: <20261019050741.1688261-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131114

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fixes shown in [1] and [2]. The NVD
record describing the vulnerability is referenced in [3].

[1] https://github.com/tuxera/ntfs-3g/commit/e021cbe3d7a42963110e4561f2a1327614c20a00
[2] https://github.com/tuxera/ntfs-3g/commit/6aa66d98980ac1d966d7977c7b079f4fe380eb42
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-42618

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../files/CVE-2026-42618_p1.patch             |  53 +++++
 .../files/CVE-2026-42618_p2.patch             | 221 ++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |   2 +
 3 files changed, 276 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42618_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42618_p2.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42618_p1.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42618_p1.patch
new file mode 100644
index 0000000000..15aad65234
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42618_p1.patch
@@ -0,0 +1,53 @@
+From fbc829df733e7aa960780e0c60d26a0b63786a38 Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik@tuxera.com>
+Date: Fri, 24 Apr 2026 12:06:24 +0300
+Subject: [PATCH] compress.c: Fix incorrect comparison in destination bounds
+ check.
+
+When checking whether 'dest' was at or past the end of the destination
+buffer we were checking if 'dest' was larger then 'dest_sb_end', however
+'dest_sb_end' is already past the end of the destination buffer since
+it is constructed with 'dest + dest_size', i.e. dereferencing
+'dest_sb_end' is invalid. Fixed by using '>=' instead of '>'.
+
+Thanks to Alexandro Calo' from Nozomi Networks Labs for reporting this
+issue.
+
+CVE: CVE-2026-42618
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/e021cbe3d7a42963110e4561f2a1327614c20a00]
+
+Backport Changes:
+- Upstream e021cbe3 follows the indentation changes in 6c67a098.
+  Apply its two bounds checks to the original ntfs_decompress() layout
+  in libntfs-3g/compress.c from NTFS-3G 2022.10.3.
+- Preserve both upstream dest >= dest_sb_end checks so the tag and
+  token paths stop before accessing the end of the destination buffer.
+
+(cherry picked from commit e021cbe3d7a42963110e4561f2a1327614c20a00)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ libntfs-3g/compress.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libntfs-3g/compress.c b/libntfs-3g/compress.c
+index 390b2d97..5f4df0ea 100644
+--- a/libntfs-3g/compress.c
++++ b/libntfs-3g/compress.c
+@@ -546,7 +546,7 @@ do_next_tag:
+ 		goto do_next_sb;
+ 	}
+ 	/* Check we are still in range. */
+-	if (cb > cb_sb_end || dest > dest_sb_end)
++	if (cb > cb_sb_end || dest >= dest_sb_end)
+ 		goto return_overflow;
+ 	/* Get the next tag and advance to first token. */
+ 	tag = *cb++;
+@@ -557,7 +557,7 @@ do_next_tag:
+ 		u8 *dest_back_addr;
+ 
+ 		/* Check if we are done / still in range. */
+-		if (cb >= cb_sb_end || dest > dest_sb_end)
++		if (cb >= cb_sb_end || dest >= dest_sb_end)
+ 			break;
+ 		/* Determine token type and parse appropriately.*/
+ 		if ((tag & NTFS_TOKEN_MASK) == NTFS_SYMBOL_TOKEN) {
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42618_p2.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42618_p2.patch
new file mode 100644
index 0000000000..92db9bb78c
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42618_p2.patch
@@ -0,0 +1,221 @@
+From 8221131a1dea1a06e7a8134a04b0a68975f58829 Mon Sep 17 00:00:00 2001
+From: Rakesh Pandit <rakesh@tuxera.com>
+Date: Thu, 30 Apr 2026 19:33:52 +0300
+Subject: [PATCH] compress.c: Harden LZNT1 sub-block decompression bounds
+ checks.
+
+ntfs_decompress() could continue decoding tokens after the current
+4 KiB destination sub-block was already full.  If the next token was a
+symbol token, the decoder wrote one byte at dest_sb_end, outside the
+valid destination range.
+
+Finish the current compressed sub-block when either its compressed input
+is exhausted or its output sub-block is full.  If the output fills
+first, skip the remaining bytes in that compressed sub-block so they are
+not interpreted as more tags or tokens.
+
+While here, read the sub-block header only after verifying that two
+input bytes remain, reuse the decoded header value, and reject truncated
+phrase tokens before reading their two-byte compressed word.
+
+Also fix the function comment to match the userspace return convention:
+return 0 on success, or return -1 with errno set to EOVERFLOW on
+malformed compressed input.
+
+Thanks to Alexandro Calo' from Nozomi Networks Labs for reporting this
+issue.
+
+CVE: CVE-2026-42618
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/6aa66d98980ac1d966d7977c7b079f4fe380eb42]
+
+Backport Changes:
+- Upstream 6aa66d98 follows the formatting changes in 6c67a098.
+  Apply its ntfs_decompress() changes in libntfs-3g/compress.c to
+  the original 2022.10.3 layout, omitting the three extra scopes and
+  loop indentation introduced by that formatting commit.
+- Retarget the end-of-block and phrase-token comment edits to the
+  original wrapping. This adds three comment lines that are unchanged
+  context in upstream's patch.
+- The older conditions, sub-block end expression, comments and debug
+  strings occupy four fewer removed lines than the upstream layout.
+  Together these wrapping differences change the patch statistics
+  from +65/-37 upstream to +68/-33 here; decoder logic is unchanged.
+
+(cherry picked from commit 6aa66d98980ac1d966d7977c7b079f4fe380eb42)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ libntfs-3g/compress.c | 101 ++++++++++++++++++++++++++++--------------
+ 1 file changed, 68 insertions(+), 33 deletions(-)
+
+diff --git a/libntfs-3g/compress.c b/libntfs-3g/compress.c
+index 5f4df0ea..e32c2288 100644
+--- a/libntfs-3g/compress.c
++++ b/libntfs-3g/compress.c
+@@ -459,7 +459,8 @@ static unsigned int ntfs_compress_block(const char *inbuf, const int bufsize,
+  * @cb_start is a pointer to the compression block which needs decompressing
+  * and @cb_size is the size of @cb_start in bytes (8-64kiB).
+  *
+- * Return 0 if success or -EOVERFLOW on error in the compressed stream.
++ * Return 0 on success.  On error in the compressed stream, set errno to
++ * EOVERFLOW and return -1.
+  */
+ static int ntfs_decompress(u8 *dest, const u32 dest_size,
+ 		u8 *const cb_start, const u32 cb_size)
+@@ -479,23 +480,29 @@ static int ntfs_decompress(u8 *dest, const u32 dest_size,
+ 	/* Variables for tag and token parsing. */
+ 	u8 tag;			/* Current tag. */
+ 	int token;		/* Loop counter for the eight tokens in tag. */
++	u16 hdr;		/* Current sub-block header. */
+ 
+ 	ntfs_log_trace("Entering, cb_size = 0x%x.\n", (unsigned)cb_size);
+ do_next_sb:
+ 	ntfs_log_debug("Beginning sub-block at offset = %d in the cb.\n",
+ 			(int)(cb - cb_start));
+ 	/*
+-	 * Have we reached the end of the compression block or the end of the
+-	 * decompressed data?  The latter can happen for example if the current
+-	 * position in the compression block is one byte before its end so the
+-	 * first two checks do not detect it.
++	 * Have we reached the end of the compression block or the end
++	 * of the decompressed data?
++	 *
++	 * Check dest == dest_end before reading the next two-byte sub-
++	 * block header.  The compressed pointer can legally be near the
++	 * end of the buffer when the requested output has already been
++	 * produced.
+ 	 */
+-	if (cb == cb_end || !le16_to_cpup((le16*)cb) || dest == dest_end) {
+-		if (dest_end > dest)
+-			memset(dest, 0, dest_end - dest);
+-		ntfs_log_debug("Completed. Returning success (0).\n");
+-		return 0;
+-	}
++	if (cb == cb_end || dest == dest_end)
++		goto complete;
++	/* A sub-block header is two bytes. */
++	if ((size_t)(cb_end - cb) < 2)
++		goto return_overflow;
++	hdr = le16_to_cpup((le16*)cb);
++	if (!hdr)
++		goto complete;
+ 	/* Setup offset for the current sub-block destination. */
+ 	dest_sb_start = dest;
+ 	dest_sb_end = dest + NTFS_SB_SIZE;
+@@ -503,16 +510,15 @@ do_next_sb:
+ 	if (dest_sb_end > dest_end)
+ 		goto return_overflow;
+ 	/* Does the minimum size of a compressed sb overflow valid range? */
+-	if (cb + 6 > cb_end)
++	if ((size_t)(cb_end - cb) < 6)
+ 		goto return_overflow;
+ 	/* Setup the current sub-block source pointers and validate range. */
+ 	cb_sb_start = cb;
+-	cb_sb_end = cb_sb_start + (le16_to_cpup((le16*)cb) & NTFS_SB_SIZE_MASK)
+-			+ 3;
++	cb_sb_end = cb_sb_start + (hdr & NTFS_SB_SIZE_MASK) + 3;
+ 	if (cb_sb_end > cb_end)
+ 		goto return_overflow;
+ 	/* Now, we are ready to process the current sub-block (sb). */
+-	if (!(le16_to_cpup((le16*)cb) & NTFS_SB_IS_COMPRESSED)) {
++	if (!(hdr & NTFS_SB_IS_COMPRESSED)) {
+ 		ntfs_log_debug("Found uncompressed sub-block.\n");
+ 		/* This sb is not compressed, just copy it into destination. */
+ 		/* Advance source position to first data byte. */
+@@ -532,22 +538,18 @@ do_next_sb:
+ 	/* Forward to the first tag in the sub-block. */
+ 	cb += 2;
+ do_next_tag:
+-	if (cb == cb_sb_end) {
+-		/* Check if the decompressed sub-block was not full-length. */
+-		if (dest < dest_sb_end) {
+-			int nr_bytes = dest_sb_end - dest;
+-
+-			ntfs_log_debug("Filling incomplete sub-block with zeroes.\n");
+-			/* Zero remainder and update destination position. */
+-			memset(dest, 0, nr_bytes);
+-			dest += nr_bytes;
+-		}
+-		/* We have finished the current sub-block. */
+-		goto do_next_sb;
+-	}
+ 	/* Check we are still in range. */
+-	if (cb > cb_sb_end || dest >= dest_sb_end)
++	if (cb > cb_sb_end || dest > dest_sb_end)
+ 		goto return_overflow;
++	/*
++	 * Finish this compressed sub-block when either its
++	 * compressed input is exhausted or its 4 KiB output
++	 * slot is full.  If output becomes full first, skip the
++	 * remaining compressed bytes in this sub-block instead
++	 * of interpreting them as more tags/tokens.
++	 */
++	if (cb == cb_sb_end || dest == dest_sb_end)
++		goto finish_compressed_sb;
+ 	/* Get the next tag and advance to first token. */
+ 	tag = *cb++;
+ 	/* Parse the eight tokens described by the tag. */
+@@ -557,8 +559,10 @@ do_next_tag:
+ 		u8 *dest_back_addr;
+ 
+ 		/* Check if we are done / still in range. */
+-		if (cb >= cb_sb_end || dest >= dest_sb_end)
+-			break;
++		if (cb > cb_sb_end || dest > dest_sb_end)
++			goto return_overflow;
++		if (cb == cb_sb_end || dest == dest_sb_end)
++			goto finish_compressed_sb;
+ 		/* Determine token type and parse appropriately.*/
+ 		if ((tag & NTFS_TOKEN_MASK) == NTFS_SYMBOL_TOKEN) {
+ 			/*
+@@ -570,11 +574,21 @@ do_next_tag:
+ 			continue;
+ 		}
+ 		/*
+-		 * We have a phrase token. Make sure it is not the first tag in
+-		 * the sb as this is illegal and would confuse the code below.
++		 * We have a phrase token. Make sure it is not
++		 * the first token in the sb as this is illegal
++		 * and would confuse the code below.
+ 		 */
+ 		if (dest == dest_sb_start)
+ 			goto return_overflow;
++		/*
++		 * A phrase token is a two-byte compressed word.
++		 * The generic token check above only proves
++		 * that at least one byte remains, which is
++		 * enough for a symbol token but not for a
++		 * phrase token.
++		 */
++		if ((size_t)(cb_sb_end - cb) < 2)
++			goto return_overflow;
+ 		/*
+ 		 * Determine the number of bytes to go back (p) and the number
+ 		 * of bytes to copy (l). We use an optimized algorithm in which
+@@ -626,6 +640,27 @@ do_next_tag:
+ 	}
+ 	/* No tokens left in the current tag. Continue with the next tag. */
+ 	goto do_next_tag;
++finish_compressed_sb:
++	/* Check if the decompressed sub-block was not full-length. */
++	if (dest < dest_sb_end) {
++		size_t nr_bytes = dest_sb_end - dest;
++
++		ntfs_log_debug("Filling incomplete sub-block with zeroes.\n");
++		/* Zero remainder and update destination position. */
++		memset(dest, 0, nr_bytes);
++		dest += nr_bytes;
++	}
++	/*
++	 * If the output sub-block filled before the compressed sub-block input
++	 * was exhausted, skip the remaining compressed bytes in this sub-block.
++	 */
++	cb = cb_sb_end;
++	goto do_next_sb;
++complete:
++	if (dest_end > dest)
++		memset(dest, 0, dest_end - dest);
++	ntfs_log_debug("Completed. Returning success (0).\n");
++	return 0;
+ return_overflow:
+ 	errno = EOVERFLOW;
+ 	ntfs_log_perror("Failed to decompress file");
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index f4f4ccfdf1..85f355ca64 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -15,6 +15,8 @@ SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV}
            file://CVE-2026-46571.patch \
            file://CVE-2026-46570.patch \
            file://CVE-2026-46569.patch \
+           file://CVE-2026-42618_p1.patch \
+           file://CVE-2026-42618_p2.patch \
 "
 SRCREV = "78414d93613532fd82f3a82aba5d4a1c32898781"
 
-- 
2.35.6


