Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7D5C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:24:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.16706.1673414663655039786
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RlYy8Iqs;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414661; i=@fujitsu.com;
	bh=rRfQoePloIDSW87l4yBe3hIzoO79/njG3VfgRNjrr9U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RlYy8IqsOwvFZvDXq9brYxHRxcSdCM5v7sjeaW4/YBBETjsiG3yfS+sg5mYrJ5yqI
	 44ABGzSbwJrKfPPMTEU9Y0vX9QtQYsPsWQqDdCn27RdmdJNvkDT3Vpylej84CCa2PO
	 HuO8dcBUowS/3pSfpro0nETpSvrk6ASW2pkLQTjM+Lz1VphsMKe0EbAtto7Nn72swQ
	 0CjV1+G4PlF0yCixDktg/TpwBHBAgTuow4Vsalq3mOvXp1hAVcqJ93OC96ZURrpBWl
	 fk0j1Z3IreepYsHbpElBLqZxk7tHzyhCSY1cLofpdJw+J7eW0ed27ImX1QDkpPKitq
	 XtxqpQEg9vp2Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqMvqsS/
  ZYPERZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP9m3tMBb/CKpoPPWNrYFzp1cXIxSEk8IRR
  Yv2dGUwQzg0mib83DzBCOHuBMu1bWLoYOTnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCUuHrhFVANBweLgKrE77USIGFeASeJPVO/g5VICChITHn4nhkiLihxcuYTFogxEhIHX7
  xghqhRlJh9uZkFwq6UaP3wC8pWk7h6bhPzBEb+WUjaZyFpX8DItIrRrDi1qCy1SNfQRC+pKDM
  9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMBhTitlW7WD8teyP
  3iFGSQ4mJVHePIl9yUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeFVcgXKCRanpqRVpmTnAyIBJS
  3DwKInw1joCpXmLCxJzizPTIVKnGC051jYc2MvMcfXKFSC5aV/XAWYhlrz8vFQpcV5nd6AGAZ
  CGjNI8uHGw6L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiX2RloCk9mXgnc1ldABzEBHXS
  4ay/IQSWJCCmpBqbcUDOln/LJSgvrOfVmPPZ6ENAZLml2a6eAjlJRguFuo3UnRFbe3z25Lmyy
  5xsJUUXXak/dg4wx3n4mFtsPWhrduf05/oGTU8b1H/qiknOSPL9Vcr14lXbD9e7X7LtbWEsj9
  VmvH6mOPtjdJtbiYLi+9sCpY1xzZOqWaqQHsrXn3emcX1N3vlxil53xZP2P3ObxyiflxVKkbC
  7fCfxoM//eTs3LkuGBqZqhuydGG0ltn6orZaf/ZZVtkpFEl8ty9tvxnN4H57sXRnsYqv36OrP
  /VMxhKz4Oj6bJnLu0NSLOTRWZbTtLK6XFTP6qbMC2eetfJD5UyHFY/Gq/mNPV7/6/Ob6lnHGp
  21Yj2syuxFKckWioxVxUnAgAdRKP9FkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1673414660!499219!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10947 invoked from network); 11 Jan 2023 05:24:21 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:24:21 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A5FB2100182
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:20 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 98D7F100043
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:24:18 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfsprogs: upgrade 6.0.0 -> 6.1.0
Date: Wed, 11 Jan 2023 13:24:02 +0800
Message-ID: <1673414646-13721-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100523

From: Wang Mingyu <wangmy@fujitsu.com>

0005-Replace-off64_t-stat64-with-off_t-stat.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...place-off64_t-stat64-with-off_t-stat.patch | 65 ++++++++++---------
 .../{xfsprogs_6.0.0.bb => xfsprogs_6.1.0.bb}  |  2 +-
 2 files changed, 34 insertions(+), 33 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_6.0.0.bb => xfsprogs_6.1.0.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch
index e10364a20e..731c001e14 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch
@@ -1,4 +1,4 @@
-From 1ff0d95604c406ddfc764c97ed2cb147d155f608 Mon Sep 17 00:00:00 2001
+From f260099fc45f0653aa4758d1d581e07f5b9c6a54 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 21 Dec 2022 17:43:07 -0800
 Subject: [PATCH] Replace off64_t/stat64 with off_t/stat
@@ -11,6 +11,7 @@ needed
 
 Upstream-Status: Submitted [https://lore.kernel.org/linux-xfs/20221222015327.939932-1-raj.khem@gmail.com/T/#t]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  copy/xfs_copy.c           |  2 +-
  fsr/xfs_fsr.c             |  2 +-
@@ -41,7 +42,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  26 files changed, 74 insertions(+), 74 deletions(-)
 
 diff --git a/copy/xfs_copy.c b/copy/xfs_copy.c
-index 79f65946..854fd7f4 100644
+index 79f6594..854fd7f 100644
 --- a/copy/xfs_copy.c
 +++ b/copy/xfs_copy.c
 @@ -888,7 +888,7 @@ main(int argc, char **argv)
@@ -54,7 +55,7 @@ index 79f65946..854fd7f4 100644
  			/* ensure device files are sufficiently large */
  
 diff --git a/fsr/xfs_fsr.c b/fsr/xfs_fsr.c
-index ba02506d..12fffbd8 100644
+index ba02506..12fffbd 100644
 --- a/fsr/xfs_fsr.c
 +++ b/fsr/xfs_fsr.c
 @@ -1148,7 +1148,7 @@ packfile(char *fname, char *tname, int fd,
@@ -67,7 +68,7 @@ index ba02506d..12fffbd8 100644
  	int 		ct, wc, wc_b4;
  	char		ffname[SMBUFSZ];
 diff --git a/io/bmap.c b/io/bmap.c
-index 27383ca6..0b14bb7b 100644
+index 27383ca..0b14bb7 100644
 --- a/io/bmap.c
 +++ b/io/bmap.c
 @@ -257,7 +257,7 @@ bmap_f(
@@ -91,7 +92,7 @@ index 27383ca6..0b14bb7b 100644
  			swidth = (fsgeo.swidth * fsgeo.blocksize) / BBSIZE;
  		}
 diff --git a/io/copy_file_range.c b/io/copy_file_range.c
-index d154fa76..422e691a 100644
+index d154fa7..422e691 100644
 --- a/io/copy_file_range.c
 +++ b/io/copy_file_range.c
 @@ -54,7 +54,7 @@ copy_file_range_cmd(int fd, long long *src_off, long long *dst_off, size_t len)
@@ -113,7 +114,7 @@ index d154fa76..422e691a 100644
  		sz = copy_src_filesize(fd);
  		if (sz < 0 || (unsigned long long)sz > SIZE_MAX) {
 diff --git a/io/cowextsize.c b/io/cowextsize.c
-index f6b134df..00e40c6f 100644
+index f6b134d..00e40c6 100644
 --- a/io/cowextsize.c
 +++ b/io/cowextsize.c
 @@ -50,10 +50,10 @@ static int
@@ -131,7 +132,7 @@ index f6b134df..00e40c6f 100644
  		return 0;
  	}
 diff --git a/io/fadvise.c b/io/fadvise.c
-index 60cc0f08..0966c41b 100644
+index 60cc0f0..0966c41 100644
 --- a/io/fadvise.c
 +++ b/io/fadvise.c
 @@ -39,7 +39,7 @@ fadvise_f(
@@ -144,7 +145,7 @@ index 60cc0f08..0966c41b 100644
  
  	while ((c = getopt(argc, argv, "dnrsw")) != EOF) {
 diff --git a/io/fiemap.c b/io/fiemap.c
-index f0c74dfe..b41f71bf 100644
+index f0c74df..b41f71b 100644
 --- a/io/fiemap.c
 +++ b/io/fiemap.c
 @@ -234,9 +234,9 @@ fiemap_f(
@@ -161,7 +162,7 @@ index f0c74dfe..b41f71bf 100644
  	struct stat	st;
  
 diff --git a/io/fsmap.c b/io/fsmap.c
-index 9dd19cc0..dfdaa1b4 100644
+index 7db5184..bf11963 100644
 --- a/io/fsmap.c
 +++ b/io/fsmap.c
 @@ -170,7 +170,7 @@ dump_map_verbose(
@@ -185,7 +186,7 @@ index 9dd19cc0..dfdaa1b4 100644
  	swidth = (fsgeo->swidth * fsgeo->blocksize);
  
 diff --git a/io/io.h b/io/io.h
-index 64b7a663..5f423016 100644
+index 64b7a66..5f42301 100644
 --- a/io/io.h
 +++ b/io/io.h
 @@ -53,7 +53,7 @@ extern int stat_f(int argc, char **argv);
@@ -226,7 +227,7 @@ index 64b7a663..5f423016 100644
  extern void		attr_init(void);
  extern void		bmap_init(void);
 diff --git a/io/madvise.c b/io/madvise.c
-index bde31539..6e9c5b12 100644
+index bde3153..6e9c5b1 100644
 --- a/io/madvise.c
 +++ b/io/madvise.c
 @@ -39,7 +39,7 @@ madvise_f(
@@ -239,7 +240,7 @@ index bde31539..6e9c5b12 100644
  	void		*start;
  	int		advise = MADV_NORMAL, c;
 diff --git a/io/mincore.c b/io/mincore.c
-index 67f1d6c4..24147ac2 100644
+index 67f1d6c..24147ac 100644
 --- a/io/mincore.c
 +++ b/io/mincore.c
 @@ -17,7 +17,7 @@ mincore_f(
@@ -252,7 +253,7 @@ index 67f1d6c4..24147ac2 100644
  	size_t		blocksize, sectsize;
  	void		*start;
 diff --git a/io/mmap.c b/io/mmap.c
-index 7114404b..128a2c06 100644
+index 7114404..128a2c0 100644
 --- a/io/mmap.c
 +++ b/io/mmap.c
 @@ -64,11 +64,11 @@ print_mapping(
@@ -306,11 +307,11 @@ index 7114404b..128a2c06 100644
  	void		*start;
  	char		*sp;
 diff --git a/io/pread.c b/io/pread.c
-index 458a78b8..89fab81d 100644
+index 0f1d8b9..79990c6 100644
 --- a/io/pread.c
 +++ b/io/pread.c
 @@ -116,7 +116,7 @@ alloc_buffer(
- void
+ static void
  __dump_buffer(
  	void		*buf,
 -	off64_t		offset,
@@ -404,7 +405,7 @@ index 458a78b8..89fab81d 100644
  	long long	count, total, tmp;
  	size_t		fsblocksize, fssectsize;
 diff --git a/io/pwrite.c b/io/pwrite.c
-index 467bfa9f..8d134c56 100644
+index 467bfa9..8d134c5 100644
 --- a/io/pwrite.c
 +++ b/io/pwrite.c
 @@ -54,7 +54,7 @@ pwrite_help(void)
@@ -489,7 +490,7 @@ index 467bfa9f..8d134c56 100644
  	unsigned int	zeed = 0, seed = 0xcdcdcdcd;
  	size_t		fsblocksize, fssectsize;
 diff --git a/io/reflink.c b/io/reflink.c
-index 8e4f3899..b6a3c05a 100644
+index 8e4f389..b6a3c05 100644
 --- a/io/reflink.c
 +++ b/io/reflink.c
 @@ -98,7 +98,7 @@ dedupe_f(
@@ -511,7 +512,7 @@ index 8e4f3899..b6a3c05a 100644
  	char		*infile = NULL;
  	int		condensed, quiet_flag;
 diff --git a/io/seek.c b/io/seek.c
-index 6734ecb5..ffe7439c 100644
+index 6734ecb..ffe7439 100644
 --- a/io/seek.c
 +++ b/io/seek.c
 @@ -63,8 +63,8 @@ static void
@@ -535,7 +536,7 @@ index 6734ecb5..ffe7439c 100644
  	int		c;
  	int		current;	/* specify data or hole */
 diff --git a/io/sendfile.c b/io/sendfile.c
-index a003bb55..2ce569c2 100644
+index a003bb5..2ce569c 100644
 --- a/io/sendfile.c
 +++ b/io/sendfile.c
 @@ -34,12 +34,12 @@ sendfile_help(void)
@@ -563,7 +564,7 @@ index a003bb55..2ce569c2 100644
  	size_t		blocksize, sectsize;
  	struct timeval	t1, t2;
 diff --git a/io/stat.c b/io/stat.c
-index b57f9eef..e8f68dc3 100644
+index b57f9ee..e8f68dc 100644
 --- a/io/stat.c
 +++ b/io/stat.c
 @@ -21,7 +21,7 @@ static cmdinfo_t stat_cmd;
@@ -576,7 +577,7 @@ index b57f9eef..e8f68dc3 100644
  {
  	struct stat	st;
 diff --git a/io/sync_file_range.c b/io/sync_file_range.c
-index 94285c22..2375a060 100644
+index 94285c2..2375a06 100644
 --- a/io/sync_file_range.c
 +++ b/io/sync_file_range.c
 @@ -30,7 +30,7 @@ sync_range_f(
@@ -589,7 +590,7 @@ index 94285c22..2375a060 100644
  	size_t		blocksize, sectsize;
  
 diff --git a/io/truncate.c b/io/truncate.c
-index 1d049194..a74b6131 100644
+index 1d04919..a74b613 100644
 --- a/io/truncate.c
 +++ b/io/truncate.c
 @@ -16,7 +16,7 @@ truncate_f(
@@ -602,10 +603,10 @@ index 1d049194..a74b6131 100644
  
  	init_cvtnum(&blocksize, &sectsize);
 diff --git a/libxfs/rdwr.c b/libxfs/rdwr.c
-index 20e0793c..0e67b7b0 100644
+index d5aad3e..0faa05b 100644
 --- a/libxfs/rdwr.c
 +++ b/libxfs/rdwr.c
-@@ -568,7 +568,7 @@ libxfs_balloc(
+@@ -576,7 +576,7 @@ libxfs_balloc(
  
  
  static int
@@ -614,7 +615,7 @@ index 20e0793c..0e67b7b0 100644
  {
  	int	sts;
  
-@@ -631,7 +631,7 @@ libxfs_readbufr_map(struct xfs_buftarg *btp, struct xfs_buf *bp, int flags)
+@@ -639,7 +639,7 @@ libxfs_readbufr_map(struct xfs_buftarg *btp, struct xfs_buf *bp, int flags)
  	fd = libxfs_device_to_fd(btp->bt_bdev);
  	buf = bp->b_addr;
  	for (i = 0; i < bp->b_nmaps; i++) {
@@ -623,7 +624,7 @@ index 20e0793c..0e67b7b0 100644
  		int len = BBTOB(bp->b_maps[i].bm_len);
  
  		error = __read_buf(fd, buf, len, offset, flags);
-@@ -790,7 +790,7 @@ err:
+@@ -798,7 +798,7 @@ err:
  }
  
  static int
@@ -632,7 +633,7 @@ index 20e0793c..0e67b7b0 100644
  {
  	int	sts;
  
-@@ -856,7 +856,7 @@ libxfs_bwrite(
+@@ -864,7 +864,7 @@ libxfs_bwrite(
  		void	*buf = bp->b_addr;
  
  		for (i = 0; i < bp->b_nmaps; i++) {
@@ -642,7 +643,7 @@ index 20e0793c..0e67b7b0 100644
  
  			bp->b_error = __write_buf(fd, buf, len, offset,
 diff --git a/mdrestore/xfs_mdrestore.c b/mdrestore/xfs_mdrestore.c
-index 7c1a66c4..bb54e382 100644
+index 7c1a66c..bb54e38 100644
 --- a/mdrestore/xfs_mdrestore.c
 +++ b/mdrestore/xfs_mdrestore.c
 @@ -116,7 +116,7 @@ perform_restore(
@@ -655,7 +656,7 @@ index 7c1a66c4..bb54e382 100644
  		off = sb.sb_dblocks * sb.sb_blocksize - sizeof(lb);
  		if (pwrite(dst_fd, lb, sizeof(lb), off) < 0)
 diff --git a/repair/prefetch.c b/repair/prefetch.c
-index 017750e9..35b50134 100644
+index 017750e..35b5013 100644
 --- a/repair/prefetch.c
 +++ b/repair/prefetch.c
 @@ -475,7 +475,7 @@ pf_batch_read(
@@ -668,7 +669,7 @@ index 017750e9..35b50134 100644
  	int			i;
  	int			inode_bufs;
 diff --git a/scrub/spacemap.c b/scrub/spacemap.c
-index 03440d3a..00bee179 100644
+index 03440d3..00bee17 100644
 --- a/scrub/spacemap.c
 +++ b/scrub/spacemap.c
 @@ -97,11 +97,11 @@ scan_ag_rmaps(
@@ -687,7 +688,7 @@ index 03440d3a..00bee179 100644
  	memset(keys, 0, sizeof(struct fsmap) * 2);
  	keys->fmr_device = ctx->fsinfo.fs_datadev;
 diff --git a/spaceman/freesp.c b/spaceman/freesp.c
-index 423568a4..df878ce8 100644
+index 423568a..df878ce 100644
 --- a/spaceman/freesp.c
 +++ b/spaceman/freesp.c
 @@ -62,7 +62,7 @@ static void
@@ -709,7 +710,7 @@ index 423568a4..df878ce8 100644
  	unsigned long long	freeblks = 0;
  	unsigned long long	freeexts = 0;
 diff --git a/spaceman/trim.c b/spaceman/trim.c
-index e9ed47e4..727dd818 100644
+index e9ed47e..727dd81 100644
 --- a/spaceman/trim.c
 +++ b/spaceman/trim.c
 @@ -26,7 +26,7 @@ trim_f(
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.0.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.0.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.0.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.0.bb
index bb8c55d9d5..13467630d0 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.0.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch \
            file://0005-Replace-off64_t-stat64-with-off_t-stat.patch \
            "
-SRC_URI[sha256sum] = "b77cec2364aab0b8ae8d8c67daac7fdb3801e0979f1d8328d9c3469e57ca9ca0"
+SRC_URI[sha256sum] = "eceb9015c4ebefa56fa85faff756ccb51ed2cf9c39ba239767f8e78705e85251"
 inherit autotools-brokensep pkgconfig
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
-- 
2.25.1


