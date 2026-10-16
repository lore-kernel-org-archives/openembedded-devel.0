Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2B5CCF2C1
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 07:46:48 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16844.1792136805451082436
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2026 00:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SxWcSxgF;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4205; q=dns/txt;
  s=iport01; t=1792136805; x=1793346405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fk0EqlEdj1BG00hr2XipyPuE1LMIQX12VRYxGecDcZQ=;
  b=SxWcSxgFMrga/wqrOBGNTUcLrGHx1a90zICoQy4J7GfvxM4VaH3NcMQQ
   3wIVE8FEB8Vvx/Dcf4fwELYCBaIQnelcaVrbXI7RlEcDA8cGauqC+odH4
   TS4SUak1z1rOqUD+dWvtwaqj1jIufc6oseplA4bv+ZLfzJwQxmbU7VWYk
   i0MUH18pUE4OQQchIRZ4HdTOiV9MEp19gtbKOXV+wY0U6OUk2Od9KTf5y
   EidhRNq96VlTZZT/eVjNKSZsEWG4u3584/DOWXe4irrRaffSNyJazvuv+
   KSUzh65yrtLYQKHR0ATRmsL9NUIxLrOLSw5WYUF70UPje8uljF+az9v/K
   A==;
X-CSE-ConnectionGUID: B1iXqJvTTJ2QGw3OSj0TSg==
X-CSE-MsgGUID: I/474wz2RLaLP0gcHnZTNQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgAY1NFq/5L/Ja1aglmCV3VgQ0mWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQDEb0hgXkzgQGDaQJDU?=
 =?us-ascii?q?NsyAQsUAYE4hUCII10YAYR8JxsbgXKBFYNpgQWBXAEBgSeGXCIEgiKBDIFaH?=
 =?us-ascii?q?pUpSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2e?=
 =?us-ascii?q?oEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbO?=
 =?us-ascii?q?DwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegkUgAYENARMXARcJg?=
 =?us-ascii?q?UwYph2hDwoog3aMIpU6GjOFW6UUC5h9jgqWT4RpgWg8gUcLB3AVgyIJShkPj?=
 =?us-ascii?q?jkng0SBf8xbJzICCTIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:R6qew6x9nAyaN/RygYt6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUBm
 2IdUW3UM/rYMDChfIxzbt7n80tSsZLUyd8wHQA4+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGtvPL0B2PhLPUMUz
 NMHcxc2bEi/vO3jldpXSsE07igiBNPgMIVavjRryivUSK53B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPXWjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZCwa4SNJYLWFZU9ckCwh
 yWaoDjmEEsgENW78WKK+VKqtNPppHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:rPzbuqpMQq0MxZDXyyVZgFcaV5oJeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: 9a23:pljosG5/wODTlMz19dss3hcVKtkHbEHh7i3pDFDjLl1rEIGuRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A132/3g5ueYvKpz+xe7cqt86YxoxJpPjxVF8fy68?=
 =?us-ascii?q?isu28bSN7GzGvsBKOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536076488"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 07:46:44 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 6580218000238;
	Fri, 16 Oct 2026 07:46:44 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 0F56CCBF204; Fri, 16 Oct 2026 00:46:44 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][scarthgap][PATCH 4/7] ntfs-3g-ntfsprogs: fix CVE-2026-46569
Date: Fri, 16 Oct 2026 00:46:37 -0700
Message-Id: <20261016074640.3986037-5-dkelaiya@cisco.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 07:46:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131074

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1]. The NVD record
describing the vulnerability is referenced in [2].

[1] https://github.com/tuxera/ntfs-3g/commit/961ed5c2fa2f36ef6a347f04e1fa586113c97e7c
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-46569

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../files/CVE-2026-46569.patch                | 62 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46569.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46569.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46569.patch
new file mode 100644
index 0000000000..5c496159ec
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46569.patch
@@ -0,0 +1,62 @@
+From 677d21be1ac7ec0a59cfbed8e26d1ffbf0922ac1 Mon Sep 17 00:00:00 2001
+From: Rakesh Pandit <rakesh@tuxera.com>
+Date: Mon, 8 Jun 2026 10:34:38 +0300
+Subject: [PATCH] Bound tail_size in ntfs_ib_copy_tail against destination
+ capacity.
+
+A crafted source INDX block can drive tail_size past the freshly
+allocated destination's usable space and overflow the memcpy.  Add
+a capacity check (and a < 0 guard against sign-extension at
+memcpy).
+
+Thanks to Alexandro Calo' from Nozomi Networks Labs for reporting
+this issue.
+
+CVE: CVE-2026-46569
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/961ed5c2fa2f36ef6a347f04e1fa586113c97e7c]
+
+(cherry picked from commit 961ed5c2fa2f36ef6a347f04e1fa586113c97e7c)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ libntfs-3g/index.c | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/libntfs-3g/index.c b/libntfs-3g/index.c
+index 9c11a45c..347bd408 100644
+--- a/libntfs-3g/index.c
++++ b/libntfs-3g/index.c
+@@ -1193,7 +1193,7 @@ static int ntfs_ib_copy_tail(ntfs_index_context *icx, INDEX_BLOCK *src,
+ {
+ 	u8 *ies_end;
+ 	INDEX_ENTRY *ie_head;		/* first entry after the median */
+-	int tail_size, ret;
++	int tail_size, dst_capacity, ret;
+ 	INDEX_BLOCK *dst;
+ 	
+ 	ntfs_log_trace("Entering\n");
+@@ -1207,6 +1207,25 @@ static int ntfs_ib_copy_tail(ntfs_index_context *icx, INDEX_BLOCK *src,
+ 	
+ 	ies_end = (u8 *)ntfs_ie_get_end(&src->index);
+ 	tail_size = ies_end - (u8 *)ie_head;
++	dst_capacity = (int)(le32_to_cpu(dst->index.allocated_size)
++			     - le32_to_cpu(dst->index.entries_offset));
++
++	/*
++	 * src->index.entries_offset (on-disk, only required to be >=
++	 * sizeof(INDEX_HEADER) by ntfs_index_block_inconsistent) may be smaller
++	 * than dst's, which ntfs_ib_alloc fixes (40 on a 4 KiB block).  When
++	 * the median lands near the start of the source stream the gap lets
++	 * tail_size exceed dst's usable space.  The < 0 guard catches a
++	 * negative tail_size before memcpy sign-extends it into a huge size_t.
++	 */
++	if (tail_size < 0 || tail_size > dst_capacity) {
++		ntfs_log_error("Invalid tail_size %d (dst capacity %d) in "
++				"ntfs_ib_copy_tail\n", tail_size, dst_capacity);
++		free(dst);
++		errno = EIO;
++		return STATUS_ERROR;
++	}
++
+ 	memcpy(ntfs_ie_get_first(&dst->index), ie_head, tail_size);
+ 	
+ 	dst->index.index_length = cpu_to_le32(tail_size + 
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 97663fd109..4d5f88f611 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://CVE-2026-46572_CVE-2026-42617_p3.patch \
            file://CVE-2026-46571.patch \
            file://CVE-2026-46570.patch \
+           file://CVE-2026-46569.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
-- 
2.35.6


