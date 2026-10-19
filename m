Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDBACCF2E9
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 05:08:00 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28001.1792386476653493246
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 22:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S/Wdb/C5;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4138; q=dns/txt;
  s=iport01; t=1792386477; x=1793596077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n72nMOKVGVYKeC+AY2WgDkEDk4eZJINskLtl4MTyUvM=;
  b=S/Wdb/C5bvlXKjnVkJdJ5JfdV0ZIWd1gh+6ppw7jy56VfocyhBY6Y/SW
   y/+nUiPI+MD0tFCv/TEWuhuOZJpKwK7vaJMMjDMKn7MIHGRl9xwMMH5D1
   SiXqYHPP8ef/G7CZpOr1e5oJ9ofFPinC3EQmfmREtDHL9YTcQGDYFH4OP
   Nqnfuu8SYy0zxOBWKZzfAi8QH+LLtPl3wbuGZe8lSUsAOLlmzItAX0cPE
   Rc+SehaPVoE4l/wrbVZ+8idEKD9AabeUZSDkoZp+E7i1YqB858G5AqACJ
   QYy2TU5VWigI4G2CrW3ThPuJXNAqxV0byLmjklqDdXYOaPo0quPStL5P0
   w==;
X-CSE-ConnectionGUID: CZ630HgZR2285x94WSyWGQ==
X-CSE-MsgGUID: lSklqiZ0S5y0b4Z2ZjRLxQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgAppdVq/5D/Ja1aglmCV3VgQ0mWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQDEb1ggXkzgQGDaQJDU?=
 =?us-ascii?q?NsyAQsUAYE4hUCII10YAYR8JxsbgXKBFYNpgQWBXAEBgSeGXCIEgiJ6EoFaH?=
 =?us-ascii?q?pU/SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2e?=
 =?us-ascii?q?oEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbO?=
 =?us-ascii?q?DwJKEEXDHMMHQVyCAINCQdNGA1IESw3FRkEPm4HkioegkUgAYENARMYFwmBT?=
 =?us-ascii?q?BimHqEPCiiDdowilToaM4VbpRQLmH2LN4JTllCEaYFoPIFHCwdwFYMiCUoZD?=
 =?us-ascii?q?445g2uBf8xJJzICCTIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:NXqZYqM17na/95/vrR31lsFynXyQoLVcMsEvi/4bfWQNrUon1DFWz
 WobDTyEM63eMWqgKo9yPdi/ox4B75Lcm9EyT3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gm8sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj695cUhpuHYIqwLwtUTxep
 KAnEyEyQSnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmGS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMHwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsi+a8b4SOJoDiqcN9mn2bo
 nvHzTzCXwBCPoCtkwiHyFa8v7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:qS6XZaC8bPVstfHlHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:poN/R2/YvSvkQfD1OsaVv2UmRJt9UnLv9i2KcxKoWDpWc6yqZmbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AUpKGEg7VOonRO49K3zUvhFU0xoxs2KeqEUE/ya5?=
 =?us-ascii?q?bqpGOaR4qCTWnqCSOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="536976344"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 05:07:55 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 9E76D1800049C;
	Mon, 19 Oct 2026 05:07:55 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 4A042CBF204; Sun, 18 Oct 2026 22:07:55 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][wrynose][PATCH 4/7] ntfs-3g-ntfsprogs: fix CVE-2026-46569
Date: Sun, 18 Oct 2026 22:07:38 -0700
Message-Id: <20261019050741.1688261-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261019050741.1688261-1-dkelaiya@cisco.com>
References: <20261019050741.1688261-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131115

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
index e17c3d2481..f4f4ccfdf1 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV}
            file://CVE-2026-46572_CVE-2026-42617_p3.patch \
            file://CVE-2026-46571.patch \
            file://CVE-2026-46570.patch \
+           file://CVE-2026-46569.patch \
 "
 SRCREV = "78414d93613532fd82f3a82aba5d4a1c32898781"
 
-- 
2.35.6


