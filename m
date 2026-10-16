Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49818CCA46D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 07:46:47 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16845.1792136805786198513
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2026 00:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EKgmzP+f;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3879; q=dns/txt;
  s=iport01; t=1792136805; x=1793346405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LMjd39s0QZKmAdU7gsOXcgN9bW0doA2aRStGVgb82ig=;
  b=EKgmzP+f/uJz2Ufytq6m836++Bm174IN2lIvl6N2L8oi/7GVg8ucrXxx
   QhTY32LUX+u02e0EB6SnLdyx4SQnsuNmu8bvlAhHKJW3bbd+6LK5dzate
   JQmlBSB759nFHirjs9k1MyCj3uGVBDUL1mEdgRHkkqdr6atKEzAnd9/m9
   QhoJASAouFVKqgIi9vkkJ4ZbNLzMSRdd0XLJGUexV0cWyYPtKN1O8JJW2
   AbmaSUKxeE4Z5BdY/PEHKhLn76ux6tl3ilAI4LGir87U92K/ic9eLoB2h
   mbI16FSjOPV/dbRlz5UJ3MS2BxEqkIJhoXe1q8OXIW9pYMMia87OZaQMO
   Q==;
X-CSE-ConnectionGUID: JKVZZfAyQiWz/o5QQFGL3Q==
X-CSE-MsgGUID: emwHT3XuRQy7IcTTAtpnjQ==
X-IPAS-Result: =?us-ascii?q?A0BGAgAh1tFq/5L/Ja1aglmCV3VgQ0mWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAzIBRhAcAwECLysjCBmDAgGCdAMRvSCCLIEBg2kCQ1DbM?=
 =?us-ascii?q?gELFAGBOIVAiCNdGAGEfCcbG4FyhH6BBYFcAQGIAyIEgiKBDIFaHpUpSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErK?=
 =?us-ascii?q?WABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXD?=
 =?us-ascii?q?HMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegkUZB4EOARMXASCBNRcBpBOCI?=
 =?us-ascii?q?aEPCiiDdowilToaM4QEgVeSQJJUC5h9jgqWT4RpgWg8gUcLB3AVgyIJShkPj?=
 =?us-ascii?q?jkng0SBf8xbJzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:mdTuH6J8f9Hm+H3pFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENSgTEGx
 mcZXW2HO/uOZ2bxfYpwbdyw/EMG78PWx9dqSQQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1ML38ED4Mx6992PnMJ8
 qEhER4iSku60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEqojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeOzb4SNJYTULSlTtkudu
 UL6pFTkOCgLa/2U9Qas7mqqhNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7IQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:yi0D5K0gykgw8pxSmXhuVgqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: 9a23:rs7W1GPRE249Bu5DegpZxnwaM9Ecc0LPi3CNGnaWJkIycejA
X-Talos-MUID: 9a23:3W3yKAtfNPqFOqTJ/82niTR9FPsz07mUMVFSsJ46h+CYLSpyAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536760706"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 07:46:44 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id B6E9018000238;
	Fri, 16 Oct 2026 07:46:44 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 16A6FCBEF8A; Fri, 16 Oct 2026 00:46:44 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][scarthgap][PATCH 6/7] ntfs-3g-ntfsprogs: fix CVE-2026-42616
Date: Fri, 16 Oct 2026 00:46:39 -0700
Message-Id: <20261016074640.3986037-7-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016074640.3986037-1-dkelaiya@cisco.com>
References: <20261016074640.3986037-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 07:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131077

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1]. The NVD record
describing the vulnerability is referenced in [2].

[1] https://github.com/tuxera/ntfs-3g/commit/dc1b682e99b6c055b0281ca543a8420b698420d1
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-42616

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../files/CVE-2026-42616.patch                | 70 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616.patch
new file mode 100644
index 0000000000..26858a3537
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616.patch
@@ -0,0 +1,70 @@
+From 96f3c15677c6aa0251798eef74a5a4c376523ee3 Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik@tuxera.com>
+Date: Fri, 24 Apr 2026 12:18:24 +0300
+Subject: [PATCH] ntfscat.c: Fix reading outside the buffer when block size >
+ buffer size.
+
+The block size may be read from the index root's 'index_block_size'
+member, and isn't guaranteed to be >= 4096 (as far as I can tell it
+could be larger). This would for MST protected records lead to storing
+data past the end of the allocated buffer.
+
+Fixed by allocating the necessary amount of buffer space for the case
+when the block size exceeds 4096.
+
+Thanks to Alexandro Calo' from Nozomi Networks Labs for reporting this
+issue.
+
+CVE: CVE-2026-42616
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/dc1b682e99b6c055b0281ca543a8420b698420d1]
+
+(cherry picked from commit dc1b682e99b6c055b0281ca543a8420b698420d1)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ntfsprogs/ntfscat.c | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/ntfsprogs/ntfscat.c b/ntfsprogs/ntfscat.c
+index b8af2503..0f711815 100644
+--- a/ntfsprogs/ntfscat.c
++++ b/ntfsprogs/ntfscat.c
+@@ -334,22 +334,17 @@ static int index_get_size(ntfs_inode *inode)
+ static int cat(ntfs_volume *vol, ntfs_inode *inode, ATTR_TYPES type,
+ 		ntfschar *name, int namelen)
+ {
+-	const int bufsize = 4096;
+ 	char *buffer;
+ 	ntfs_attr *attr;
+ 	s64 bytes_read, written;
+ 	s64 offset;
+ 	u32 block_size;
+-
+-	buffer = malloc(bufsize);
+-	if (!buffer)
+-		return 1;
++	u32 bufsize = 4096;
+ 
+ 	attr = ntfs_attr_open(inode, type, name, namelen);
+ 	if (!attr) {
+ 		ntfs_log_error("Cannot find attribute type 0x%x.\n",
+ 				le32_to_cpu(type));
+-		free(buffer);
+ 		return 1;
+ 	}
+ 
+@@ -360,6 +355,15 @@ static int cat(ntfs_volume *vol, ntfs_inode *inode, ATTR_TYPES type,
+ 	else
+ 		block_size = 0;
+ 
++	if (bufsize < block_size) {
++		bufsize = block_size;
++	}
++
++	buffer = malloc(bufsize);
++	if (!buffer) {
++		return 1;
++	}
++
+ 	offset = 0;
+ 	for (;;) {
+ 		if (!opts.raw && block_size > 0) {
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 6489ac3d27..5ecda1f66f 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://CVE-2026-46569.patch \
            file://CVE-2026-42618_p1.patch \
            file://CVE-2026-42618_p2.patch \
+           file://CVE-2026-42616.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
-- 
2.35.6


