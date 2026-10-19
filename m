Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F56DCCF2DF
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 05:07:58 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28001.1792386476653493246
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 22:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GFJm3uRu;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3291; q=dns/txt;
  s=iport01; t=1792386476; x=1793596076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MRIJJzscUGGMuqH2hmWH7OOzG57Ot9BGe0QCwF7ceW0=;
  b=GFJm3uRuQqVKoxAl5Lv8xwYmvwkMQeEkk/JBaGMgWzFTn1F6GWsEJU0x
   r/ViIeJoPaGehojRUWTSB4R8dkPdy4+Yj+zqZ7ePdjBnT3ZaTALSl5bnu
   6l+4xyktnbxlbwP3eEoE3GQ5A/Y2KYsD8+xkhBd+LdTmya65K46rGfPeY
   SLaDNxBT4sFYh1JNzWP4xmPXQVK/9/RJzRyhwn2CWwoSAVq+Qpm67t7HV
   2YSwfKgHHU3zN34RcBj29+cdDRHSS2NEEXVZgXR0y+37hAARl3I55atNL
   KgAESTD9jXrUyl6L+jvgqcFEEeUiDsuMcENLtA8F3VaBzDPpJtN/aaK8A
   w==;
X-CSE-ConnectionGUID: RZsuxFRUTUSB+cLQV2b65Q==
X-CSE-MsgGUID: V2i7AkalReSwEp/DZpVJaQ==
X-IPAS-Result: =?us-ascii?q?A0BGAgAppdVq/5D/Ja1aglmCV3VgQ0mWTZ4cgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBIBAgEDJwsBRhAcAwECLysjCBmDAgGCdAMRvWCBeTOBAYNpAkNQ2?=
 =?us-ascii?q?zIBCxQBgTiFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAQGIAyIEgiJ6EoFaHpU/S?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJX?=
 =?us-ascii?q?oErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJK?=
 =?us-ascii?q?EEXDHMMHQVyCAINCQdNGA1IESw3FRkEPm4HkioegmWBDgErIIFMgQ6lKKEPC?=
 =?us-ascii?q?iiDdowilToaM4VbpRQLmH2LN4JTllCEaYFoPIFHCwdwFYMiCUoZD445g2uBf?=
 =?us-ascii?q?8xJJzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:y1C/2a1ilpZT2MO0XvbD5YNwkn2cJEfYwER7XKvMYLTBsI5bp2RUy
 DMfW2qAa/fbM2DwLYp2bd6+pk8AusXUzocyTldt3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtYzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNnMtIJ02wNtLPFpkt
 vc8EQ5XZE7evrfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OW2bouKJIfWHq25mG6m/
 GOZ1mfwBisXD8Oy0X2pwGqSpOb2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:8NfO9a6/YObkBVPb4wPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:9+zNj2C+ymaHoQf6ExNV71MENPoYTkDm5jTbB3aGU2w3FYTAHA==
X-Talos-MUID: 9a23:chWqRAoNpE493jDKp6gezw84NZhB4K2qMk02jrge/OW2LRJSMg7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="536976343"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 05:07:55 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 9B7E4180003DC;
	Mon, 19 Oct 2026 05:07:55 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 44232CBF203; Sun, 18 Oct 2026 22:07:55 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][wrynose][PATCH 3/7] ntfs-3g-ntfsprogs: fix CVE-2026-46570
Date: Sun, 18 Oct 2026 22:07:37 -0700
Message-Id: <20261019050741.1688261-4-dkelaiya@cisco.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131110

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1]. The NVD record
describing the vulnerability is referenced in [2].

[1] https://github.com/tuxera/ntfs-3g/commit/5ab37421ebbcbf33bf96876c7a034393bda05a25
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-46570

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../files/CVE-2026-46570.patch                | 42 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46570.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46570.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46570.patch
new file mode 100644
index 0000000000..fb76bc80b1
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46570.patch
@@ -0,0 +1,42 @@
+From bb4da656cab16325002eaf785ca967d426510e94 Mon Sep 17 00:00:00 2001
+From: Rakesh Pandit <rakesh@tuxera.com>
+Date: Mon, 8 Jun 2026 14:24:54 +0300
+Subject: [PATCH] Cap B tree depth in ntfs_index_walk_down to MAX_PARENT_VCN.
+
+ntfs_index_walk_down() incremented ictx->pindex and wrote into
+ictx->parent_pos[] / parent_vcn[] (both sized MAX_PARENT_VCN) without
+checking the bound.  A B+tree deeper than MAX_PARENT_VCN levels then
+overflowed both arrays and since parent_vcn[32] overlaps the pindex
+field the OOB write gave an attacker control over the next iteration's
+offset and value.
+
+Thanks to Alexandro Calo' from Nozomi Networks Labs for reporting this
+issue.
+
+CVE: CVE-2026-46570
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/5ab37421ebbcbf33bf96876c7a034393bda05a25]
+
+(cherry picked from commit 5ab37421ebbcbf33bf96876c7a034393bda05a25)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ libntfs-3g/index.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libntfs-3g/index.c b/libntfs-3g/index.c
+index c9651a62..9c11a45c 100644
+--- a/libntfs-3g/index.c
++++ b/libntfs-3g/index.c
+@@ -2105,6 +2105,13 @@ static INDEX_ENTRY *ntfs_index_walk_down(INDEX_ENTRY *ie,
+ 			/* down from non-zero level */
+ 			
+ 			ictx->pindex++;
++			if (ictx->pindex >= MAX_PARENT_VCN) {
++				errno = EOPNOTSUPP;
++				ntfs_log_perror("Index is over %d level deep",
++						MAX_PARENT_VCN);
++				entry = (INDEX_ENTRY*)NULL;
++				break;
++			}
+ 		}
+ 		ictx->parent_pos[ictx->pindex] = 0;
+ 		ictx->parent_vcn[ictx->pindex] = vcn;
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 1e1b5bc54a..e17c3d2481 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV}
            file://CVE-2026-46572_CVE-2026-42617_p2.patch \
            file://CVE-2026-46572_CVE-2026-42617_p3.patch \
            file://CVE-2026-46571.patch \
+           file://CVE-2026-46570.patch \
 "
 SRCREV = "78414d93613532fd82f3a82aba5d4a1c32898781"
 
-- 
2.35.6


