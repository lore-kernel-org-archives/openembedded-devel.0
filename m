Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C48CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 07:46:47 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16842.1792136805358011307
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2026 00:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NXlZR28G;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3358; q=dns/txt;
  s=iport01; t=1792136805; x=1793346405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V7y8eqeYgeXcvASr2EeG1y+gvS9/0U7aOPAvO2OQBYQ=;
  b=NXlZR28GhZBy9ULvyYPSUoL7wOw2C0sLVbSD7FKOgwcFq9lUpxWeWOVv
   V9nIU5bUiJzIPy9voutt4w03QQJqZ7WvMNasCE5eMeSh+d90S8KjAzNrb
   jRb4G4WPHZuzaI+vLKlR5kAo1nZNso0BflSdjCsJCig8pysu6ynBhAPPn
   m18jk2bADJ+2IfYWbaeZCgYoqAUOPc9URT4UeG5+iisvt2mS6pYG/533A
   kFnFl3bCeyKlBuh+HZZkCXpbSa5WTjCbO2/oczkssZDLJkcnNS+xyySTp
   zzDVfnDwbFujLUhUCzQNngiq7iAsC8Crr8ymig7ac1uUwALpjP+J5KH+l
   w==;
X-CSE-ConnectionGUID: NSvOlFiKTu6+jYyj9qxfiQ==
X-CSE-MsgGUID: +pXrsNxzQXWqeOcVZOXbYw==
X-IPAS-Result: =?us-ascii?q?A0BHAgAY1NFq/47/Ja1aglmCV3VgQ0mWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQDEb0hgXkzgQGDaQJDU?=
 =?us-ascii?q?NsyAQsUAYE4hUCII10YAYR8JxsbgXKBFYNpgQWBXAEBiAMiBIIigQyBWh6VK?=
 =?us-ascii?q?UiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBC?=
 =?us-ascii?q?V6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8C?=
 =?us-ascii?q?ShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoJlgQ4BKgEggUyBDqUno?=
 =?us-ascii?q?Q8KKIN2jCKVOhozhVulFAuYfY4Klk+EaYFoPIFHCwdwFYMiCUoZD445J4NEg?=
 =?us-ascii?q?X/MWycyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:C/5A+6IBjDc4+08VFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENS3mdSy
 moaUGyFPPaPYGX8fI1xbojjoUJXsMSHyd42QAYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1IN18ROaMZ2dpqXyJMx
 O0aeSkdYBG60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBULAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME6ojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeOzbYCJI4PbLSlTtgWAl
 njd2XTrOyElLdG4wgS31UKmt/CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:LEWrea6FpmBP/+xdTwPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3Aw+urs2qAnQRiRnG6r2cbqfPmUeYebFrZ4nbzH1L?=
 =?us-ascii?q?mSmRYWb/EUE+e+Zoxxg=3D=3D?=
X-Talos-MUID: 9a23:ll4b3wmnDukYwtuutfA/dnohLPdy+IK+Gnk9rowLnMK6BwtAMQaC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536524179"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 07:46:44 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 60D9418000354;
	Fri, 16 Oct 2026 07:46:44 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 0CDF6CBF203; Fri, 16 Oct 2026 00:46:44 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][scarthgap][PATCH 3/7] ntfs-3g-ntfsprogs: fix CVE-2026-46570
Date: Fri, 16 Oct 2026 00:46:36 -0700
Message-Id: <20261016074640.3986037-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016074640.3986037-1-dkelaiya@cisco.com>
References: <20261016074640.3986037-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 07:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131071

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
index c6517581b8..97663fd109 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://CVE-2026-46572_CVE-2026-42617_p2.patch \
            file://CVE-2026-46572_CVE-2026-42617_p3.patch \
            file://CVE-2026-46571.patch \
+           file://CVE-2026-46570.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
-- 
2.35.6


