Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DF6C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 09:32:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18031.1709890321046137583
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 01:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IPSmfnxR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3797c483d2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4287MoRb004446
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Mar 2024 09:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=iKwDZ
	dPp/aPhn6Y/DX9bgCIHuNlAmr/Ewr7x7YTLb4k=; b=IPSmfnxRciEeAwuRplzYY
	drtRczf+/64f3+Q+9n0Q92H2ka8m2JihkmxxOYkyGcZtr/7CEr9u/jOVXZNjZgdP
	0z6pHKOJXjJmij+ddosh/VdLDhwajwGHsmFCup+lJI2JkBfeM6PXCFxCU5Bb22on
	9M6l6AnDtolS0yanU8vnXgJDUYRWLdahKaq9v4546Ut0L1CdX0YbPlQ/7q1diyLR
	Cyk1Ivkm7+9je0HWMubBvnnFgq1DUe8+E87MvTUv66qBOP2/fJmQ3xIuZRYG6nbl
	m7ju3WUGliR3x6fAWJyjV0vRxQRSNj6ozd7wlU4FYgBQbUvJ+PqmrjpX17vL/7hY
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36e6w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 09:32:00 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 01:31:58 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 01:31:58 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-filesystems][PATCH 1/1] xfsprogs: 6.5.0 -> 6.6.0
Date: Fri, 8 Mar 2024 01:31:58 -0800
Message-ID: <20240308093158.1220442-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: V3RUXctd14xXUPlckVS2Rjq861yXt4a9
X-Proofpoint-GUID: V3RUXctd14xXUPlckVS2Rjq861yXt4a9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 09:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109228

From: Robert Yang <liezhi.yang@windriver.com>

Rebased 0005-Replace-off64_t-stat64-with-off_t-stat.patch for 6.6.0.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...place-off64_t-stat64-with-off_t-stat.patch | 40 +++++++++----------
 .../{xfsprogs_6.5.0.bb => xfsprogs_6.6.0.bb}  |  2 +-
 2 files changed, 21 insertions(+), 21 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_6.5.0.bb => xfsprogs_6.6.0.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch
index 731c001e1..940d63c01 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch
@@ -42,18 +42,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  26 files changed, 74 insertions(+), 74 deletions(-)
 
 diff --git a/copy/xfs_copy.c b/copy/xfs_copy.c
-index 79f6594..854fd7f 100644
+index 0420649..98a578a 100644
 --- a/copy/xfs_copy.c
 +++ b/copy/xfs_copy.c
-@@ -888,7 +888,7 @@ main(int argc, char **argv)
+@@ -881,7 +881,7 @@ main(int argc, char **argv)
  			}
  		} else  {
- 			char	*lb[XFS_MAX_SECTORSIZE] = { NULL };
+ 			char	*lb = memalign(wbuf_align, XFS_MAX_SECTORSIZE);
 -			off64_t	off;
 +			off_t	off;
+ 			ssize_t	len;
  
  			/* ensure device files are sufficiently large */
- 
 diff --git a/fsr/xfs_fsr.c b/fsr/xfs_fsr.c
 index ba02506..12fffbd 100644
 --- a/fsr/xfs_fsr.c
@@ -68,7 +68,7 @@ index ba02506..12fffbd 100644
  	int 		ct, wc, wc_b4;
  	char		ffname[SMBUFSZ];
 diff --git a/io/bmap.c b/io/bmap.c
-index 27383ca..0b14bb7 100644
+index 722a389..6182e1c 100644
 --- a/io/bmap.c
 +++ b/io/bmap.c
 @@ -257,7 +257,7 @@ bmap_f(
@@ -186,7 +186,7 @@ index 7db5184..bf11963 100644
  	swidth = (fsgeo->swidth * fsgeo->blocksize);
  
 diff --git a/io/io.h b/io/io.h
-index 64b7a66..5f42301 100644
+index fe474fa..68e5e48 100644
 --- a/io/io.h
 +++ b/io/io.h
 @@ -53,7 +53,7 @@ extern int stat_f(int argc, char **argv);
@@ -603,7 +603,7 @@ index 1d04919..a74b613 100644
  
  	init_cvtnum(&blocksize, &sectsize);
 diff --git a/libxfs/rdwr.c b/libxfs/rdwr.c
-index d5aad3e..0faa05b 100644
+index 0e33211..153007d 100644
 --- a/libxfs/rdwr.c
 +++ b/libxfs/rdwr.c
 @@ -576,7 +576,7 @@ libxfs_balloc(
@@ -615,8 +615,8 @@ index d5aad3e..0faa05b 100644
  {
  	int	sts;
  
-@@ -639,7 +639,7 @@ libxfs_readbufr_map(struct xfs_buftarg *btp, struct xfs_buf *bp, int flags)
- 	fd = libxfs_device_to_fd(btp->bt_bdev);
+@@ -638,7 +638,7 @@ libxfs_readbufr_map(struct xfs_buftarg *btp, struct xfs_buf *bp, int flags)
+ 
  	buf = bp->b_addr;
  	for (i = 0; i < bp->b_nmaps; i++) {
 -		off64_t	offset = LIBXFS_BBTOOFF64(bp->b_maps[i].bm_bn);
@@ -624,7 +624,7 @@ index d5aad3e..0faa05b 100644
  		int len = BBTOB(bp->b_maps[i].bm_len);
  
  		error = __read_buf(fd, buf, len, offset, flags);
-@@ -798,7 +798,7 @@ err:
+@@ -797,7 +797,7 @@ err:
  }
  
  static int
@@ -633,7 +633,7 @@ index d5aad3e..0faa05b 100644
  {
  	int	sts;
  
-@@ -864,7 +864,7 @@ libxfs_bwrite(
+@@ -863,7 +863,7 @@ libxfs_bwrite(
  		void	*buf = bp->b_addr;
  
  		for (i = 0; i < bp->b_nmaps; i++) {
@@ -643,20 +643,20 @@ index d5aad3e..0faa05b 100644
  
  			bp->b_error = __write_buf(fd, buf, len, offset,
 diff --git a/mdrestore/xfs_mdrestore.c b/mdrestore/xfs_mdrestore.c
-index 7c1a66c..bb54e38 100644
+index 8e3998d..334bdd2 100644
 --- a/mdrestore/xfs_mdrestore.c
 +++ b/mdrestore/xfs_mdrestore.c
-@@ -116,7 +116,7 @@ perform_restore(
+@@ -160,7 +160,7 @@ verify_device_size(
+ 	} else {
  		/* ensure device is sufficiently large enough */
- 
- 		char		*lb[XFS_MAX_SECTORSIZE] = { NULL };
+ 		char		lb[XFS_MAX_SECTORSIZE] = { 0 };
 -		off64_t		off;
 +		off_t		off;
  
- 		off = sb.sb_dblocks * sb.sb_blocksize - sizeof(lb);
- 		if (pwrite(dst_fd, lb, sizeof(lb), off) < 0)
+ 		off = nr_blocks * blocksize - sizeof(lb);
+ 		if (pwrite(dev_fd, lb, sizeof(lb), off) < 0)
 diff --git a/repair/prefetch.c b/repair/prefetch.c
-index 017750e..35b5013 100644
+index 78c1e39..b0dd197 100644
 --- a/repair/prefetch.c
 +++ b/repair/prefetch.c
 @@ -475,7 +475,7 @@ pf_batch_read(
@@ -669,7 +669,7 @@ index 017750e..35b5013 100644
  	int			i;
  	int			inode_bufs;
 diff --git a/scrub/spacemap.c b/scrub/spacemap.c
-index 03440d3..00bee17 100644
+index b6fd411..9cefe07 100644
 --- a/scrub/spacemap.c
 +++ b/scrub/spacemap.c
 @@ -97,11 +97,11 @@ scan_ag_rmaps(
@@ -688,7 +688,7 @@ index 03440d3..00bee17 100644
  	memset(keys, 0, sizeof(struct fsmap) * 2);
  	keys->fmr_device = ctx->fsinfo.fs_datadev;
 diff --git a/spaceman/freesp.c b/spaceman/freesp.c
-index 423568a..df878ce 100644
+index 70dcdb5..f5177cb 100644
 --- a/spaceman/freesp.c
 +++ b/spaceman/freesp.c
 @@ -62,7 +62,7 @@ static void
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.5.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.5.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb
index fd2797982..07c5e97db 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.5.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch \
            file://0005-Replace-off64_t-stat64-with-off_t-stat.patch \
            "
-SRC_URI[sha256sum] = "8db81712b32756b97d89dd9a681ac5e325bbb75e585382cd4863fab7f9d021c6"
+SRC_URI[sha256sum] = "50ca2f4676df8fab4cb4c3ef3dd512d5551e6844d40a65a31d5b8e03593d22df"
 inherit autotools-brokensep pkgconfig
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
-- 
2.42.0


