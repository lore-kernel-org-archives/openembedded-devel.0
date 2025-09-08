Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697CBCA1016
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 07:01:22 +0000 (UTC)
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.web11.6625.1757314878612236668
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Sep 2025 00:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AE95pIT6;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1328; q=dns/txt;
  s=iport01; t=1757314878; x=1758524478;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NwgqFEYsT42tNkveIucWL+8gIy8UIyM4VbClFRmpqIw=;
  b=AE95pIT69vF8oYGTQMkNsuhiAAeiP/72x7m5HE7j91mFIxtGh9NV4hVW
   TSZsuFD4e2p2ENj4A9NzbcY4qNcJSV33UXehBYV+5D6wIfEJ2ahaSml6M
   OV5cf0umWxhAJuuE9e0yclHFp8/IxaUS+WKyUWTXwn7yLJbabzt/hwRye
   gbgCZw9QXnBwu9tuVVjYY338s2FuLPHcou9EAC+EJKnlCft8hmdZkuqg9
   It3onQ/162lWQE7FM1s7wIGrHE8DeOUHUdOscckq/P+NUBvHF1N8MI8vX
   WKD0Cn1zBLN8zJun/adbO1rUY7s6Iq50W0B8gSUDPtN0K2WzEoeIGV1ys
   Q==;
X-CSE-ConnectionGUID: 35Wx5WF3T5Kzr74WMvCGQQ==
X-CSE-MsgGUID: uKN79m+ZRCuC102p1zo/zA==
X-IPAS-Result: =?us-ascii?q?A0AEAACGfr5o/9FK/pBaGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX8FAQEBAQsBgkZ6WkJJjHCncoF/DwEBAQ89FAQBAYRBRowqA?=
 =?us-ascii?q?iY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZdN?=
 =?us-ascii?q?gEYAS0wXDwIgwIBgnIDEa83giyBAYMoATEFCQJDT9sqgUkBjUxwhHcnGxuBc?=
 =?us-ascii?q?oR9gQWBXAEBgi2FdwSCIoECFJAxgnyIQEiBHgNZLAFVEw0KCwcFgWMDNQwLL?=
 =?us-ascii?q?hVuMh2BJ4UNhB4rT4UChGokaw8GgRWDXQaETkADCxgNSBEsNxQbBj5uB5R+g?=
 =?us-ascii?q?2xRLIEYgRSTJZJMoREKKIN0jB6VORozqmuZBo4IllCEaYFoPIFHCwdwFYMiC?=
 =?us-ascii?q?UkZD444g2mBf4MctGE7NQI6AgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:vAZnT60KXNgsYvL2+PbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzcHm
 mJMXW+OP/mNMWH1fdojYISwp0IH68fczYdnG1Nu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmG4E70aNANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU6
 bsen+WFYAX4g28sbTpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGVxwJLdAn1L1LXEJc7
 6NEFxUTRT+6vrfjqF67YrEEasULJcTxeYdasXZ6wHSBXbAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEWojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZi+OxaYSPJoTiqcN9g2W++
 TPDvFbDKQwxbYTF0WOX9TW+r7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++Ms0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:37pa96H+nOFdaCVOpLqE48eALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: 9a23:2bcj/mFhXTsHuK8xqmI8qXEER/8LKUGA72XKfBOHLHhCZ4SsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Al1gpsgxQYv6Cjci45H2543T35SWaqLmNLh9clNY?=
 =?us-ascii?q?0geKZHnUoYS/EnjPwUKZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,247,1751241600"; 
   d="scan'208";a="33416240"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 Sep 2025 07:01:16 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 33E601800019B;
	Mon,  8 Sep 2025 07:01:16 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 89E64CC12B5; Mon,  8 Sep 2025 12:31:14 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-oe] [scarthgap] [PATCH] protobuf 4.25.8: Mark CVE-2024-7254 as patched
Date: Mon,  8 Sep 2025 12:31:02 +0530
Message-Id: <20250908070102.72098-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 07:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119332

From: Deepak Rathore <deeratho@cisco.com>

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-7254
Type: Security Fix
CVE: CVE-2024-7254
Score: 8.7
Patch: https://github.com/protocolbuffers/protobuf/commit/850fcce9176e

Analysis:
The original fix [1] for CVE-2024-7254 is listed in the NVD security
tracker (https://nvd.nist.gov/vuln/detail/CVE-2024-7254) and was
subsequently backported to the v4.25.8 version via commit [2].
Hence, this CVE is considered patched in the current source.

Reference:
[1] https://github.com/protocolbuffers/protobuf/commit/cc8b3483a558
[2] https://github.com/protocolbuffers/protobuf/commit/850fcce9176e (v4.25.8)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
index 949a3b207b..e54dffd2cd 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
@@ -21,6 +21,8 @@ SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.pa
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS[CVE-2024-7254] = "fixed-version: The vulnerability has been addressed and the fix is included in version v4.25.8"
+
 inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= ""
-- 
2.35.6


