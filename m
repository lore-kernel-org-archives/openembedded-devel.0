Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F0CCCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 05:07:59 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28002.1792386477035233401
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 22:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Oq2Azy2l;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6875; q=dns/txt;
  s=iport01; t=1792386477; x=1793596077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pBft9lFwyrHPK6v4gP+hGYgl9mgS9VqDUkqTX3URLzE=;
  b=Oq2Azy2l/+JCVUxJArhvtUYKLSfRDioCDnGdWjZflUcehjgbtjFLUVg8
   LA2zCtiifq4K6Xltw3xgf5hfkvnX/LOFFMlBSdclsRxLD6D9y2J6drOyB
   YcFy9L3eN5hNEpMozParIMiYH/PhXl4EN92CszP7r79H5amqqhB6hxjaN
   3XilPuKJ1mQiwHTYpxxj1ec94fyB/dxjKUcEoTwug7aowNM/m8z+1oIcz
   2fuiWHJ8/CkQ9UsC74RD615kA583ruwfmWNF7PP1FgBc5TQyH4gS2uULK
   /sOvpj5Hx1wlsn9N4VIrDenHg3e0UaCyS9QU0i7eaN8UT/5cPfKdl5nDG
   Q==;
X-CSE-ConnectionGUID: rrv0fgd2TyWTgZ++bmaM9w==
X-CSE-MsgGUID: OXSH4rYcTO6vV0rjUIsV1w==
X-IPAS-Result: =?us-ascii?q?A0BHAgAspNVq/5P/Ja1aglmCV3VgQ0mWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQDEb1fgXkzgQGDaQJDU?=
 =?us-ascii?q?NsyAQsUAYE4hUCII10YAYR8JxsbgXKBFYNpgQWBXAEBgTeGTCIEgiJ6EoFaH?=
 =?us-ascii?q?pU/SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2e?=
 =?us-ascii?q?oEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbO?=
 =?us-ascii?q?DwJKEEXDHMMHQVyCAINCQdNGA1IESw3FRkEPm4HkioegkUZB3sTAQcMGCAvf?=
 =?us-ascii?q?ggXAaQUgiGhDwoog3aMIpU6GjOEBIFXkkCSVAuYfYs3glOVc12EaYFoPIFHC?=
 =?us-ascii?q?wdwFYMiCUoZD445g2uBf8xVJzICCTIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:aEh1LaLNAJeyDeayFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENS1GMDm
 mofWTiFaa6INGCnL9h3Oo/g/RsDusTdyYRjTgsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2clajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN10Fl9uM4IUoNpmPl1Bx
 79bIjUES0Gc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEuojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeOyaoKMIIPSLSlTtmGon
 UKa5VXyPjZEKuLH0zi402mS3/CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:FX17XKGF388f4ygkpLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:wjKieW5+T6sg6Yd9d9ss7lQKQs4qfifh3UjsLH37SmxsQZjEVgrF
X-Talos-MUID: 9a23:lSCtQArW0RkAlUrUJa8ezxZSD+c0+ZWlNGdTj6teocu5FDdOYijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="537201270"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 05:07:56 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 05D2F18000267;
	Mon, 19 Oct 2026 05:07:56 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 57EC7CBEF8A; Sun, 18 Oct 2026 22:07:55 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][wrynose][PATCH 6/7] ntfs-3g-ntfsprogs: fix CVE-2026-42616
Date: Sun, 18 Oct 2026 22:07:40 -0700
Message-Id: <20261019050741.1688261-7-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261019050741.1688261-1-dkelaiya@cisco.com>
References: <20261019050741.1688261-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131112

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1]. The NVD record
describing the vulnerability is referenced in [3].

The follow-up in [2] is included to close the opened attribute when
malloc fails and use a common cleanup path for the attribute and
buffer.

[1] https://github.com/tuxera/ntfs-3g/commit/dc1b682e99b6c055b0281ca543a8420b698420d1
[2] https://github.com/tuxera/ntfs-3g/commit/8cd4718cad4941ef49ea5b3af8cd9ec68a46af7a
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-42616

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../files/CVE-2026-42616_p1.patch             | 70 ++++++++++++++++
 .../files/CVE-2026-42616_p2.patch             | 79 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616_p2.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616_p1.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616_p1.patch
new file mode 100644
index 0000000000..26858a3537
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616_p1.patch
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
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616_p2.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616_p2.patch
new file mode 100644
index 0000000000..68cdd1dd0c
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616_p2.patch
@@ -0,0 +1,79 @@
+From 8cd4718cad4941ef49ea5b3af8cd9ec68a46af7a Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik@tuxera.com>
+Date: Thu, 20 Aug 2026 15:52:23 +0300
+Subject: [PATCH] ntfscat.c: Fix missing cleanup of opened attribute on malloc
+ error.
+
+Reported as github issue #212. Impact is limited to non-existent as
+'malloc' doesn't fail in modern general-purpose operating systems.
+Additionally even if it does fail, process teardown will clean up any
+remaining resources allocated to the attribute, but it is technically a
+memory leak.
+
+CVE: CVE-2026-42616
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/8cd4718cad4941ef49ea5b3af8cd9ec68a46af7a]
+
+(cherry picked from commit 8cd4718cad4941ef49ea5b3af8cd9ec68a46af7a)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ntfsprogs/ntfscat.c | 23 +++++++++++++++--------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/ntfsprogs/ntfscat.c b/ntfsprogs/ntfscat.c
+index 0f711815..2bf5a2aa 100644
+--- a/ntfsprogs/ntfscat.c
++++ b/ntfsprogs/ntfscat.c
+@@ -334,8 +334,9 @@ static int index_get_size(ntfs_inode *inode)
+ static int cat(ntfs_volume *vol, ntfs_inode *inode, ATTR_TYPES type,
+ 		ntfschar *name, int namelen)
+ {
+-	char *buffer;
+-	ntfs_attr *attr;
++	int ret = 0;
++	ntfs_attr *attr = NULL;
++	char *buffer = NULL;
+ 	s64 bytes_read, written;
+ 	s64 offset;
+ 	u32 block_size;
+@@ -345,7 +346,8 @@ static int cat(ntfs_volume *vol, ntfs_inode *inode, ATTR_TYPES type,
+ 	if (!attr) {
+ 		ntfs_log_error("Cannot find attribute type 0x%x.\n",
+ 				le32_to_cpu(type));
+-		return 1;
++		ret = 1;
++		goto out;
+ 	}
+ 
+ 	if ((inode->mft_no < 2) && (attr->type == AT_DATA))
+@@ -361,7 +363,8 @@ static int cat(ntfs_volume *vol, ntfs_inode *inode, ATTR_TYPES type,
+ 
+ 	buffer = malloc(bufsize);
+ 	if (!buffer) {
+-		return 1;
++		ret = 1;
++		goto out;
+ 	}
+ 
+ 	offset = 0;
+@@ -389,10 +392,14 @@ static int cat(ntfs_volume *vol, ntfs_inode *inode, ATTR_TYPES type,
+ 		}
+ 		offset += bytes_read;
+ 	}
+-
+-	ntfs_attr_close(attr);
+-	free(buffer);
+-	return 0;
++out:
++	if (buffer) {
++		free(buffer);
++	}
++	if (attr) {
++		ntfs_attr_close(attr);
++	}
++	return ret;
+ }
+ 
+ /**
+-- 
+2.35.6
+
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 85f355ca64..3ba45438bd 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -17,6 +17,8 @@ SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV}
            file://CVE-2026-46569.patch \
            file://CVE-2026-42618_p1.patch \
            file://CVE-2026-42618_p2.patch \
+           file://CVE-2026-42616_p1.patch \
+           file://CVE-2026-42616_p2.patch \
 "
 SRCREV = "78414d93613532fd82f3a82aba5d4a1c32898781"
 
-- 
2.35.6


