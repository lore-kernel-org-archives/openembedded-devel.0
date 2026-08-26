Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFA2C61DD6
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:12 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7506.1787730846057275010
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KpE8kh+L;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1390; q=dns/txt;
  s=iport01; t=1787730846; x=1788940446;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Lwjm4yU+cdWf+eI43zNX46O7dT6X7S85XWI1LtVXLFc=;
  b=KpE8kh+Lu80sIuz2yaU2XRlHECxgXTGfjp7UsjziMkAYDaww1Q3L04jO
   lF1glJKHyzKe14KjYrXA59PNgmiAVMQcNZycqD+4G2CYe+dD0Mq18hS8P
   pxnMjJqdJJaxv7LtU4kJdzoyd7pKureXVXeeHrItuis/bLGuu8JR2ftip
   qFPEV7PKI83Y/KDQZNYZP0APZ8n5iJ4AJyOCI41+3vhP1wgzlap0IGR/l
   9arv4FJDzYRVPEvgTIxu3DUV+Alg4ZM47yWgOVBceY8qDwKBDzlHjhXnF
   NRp6UwLwkXIYzwQN5oZUA0kdb8MyKX/AEoPctI3GoVGuQD+SbGEpxFa4U
   Q==;
X-CSE-ConnectionGUID: nYHATX6KQCS7kKf/6u8i5Q==
X-CSE-MsgGUID: wrjMsMVCTJOfON3LxhRwZQ==
X-IPAS-Result: =?us-ascii?q?A0DDAgDnmo5q/44QJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjUIDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GXTYBRjBcRIMCAYJ0AxG+aIIsgQGEfdswAQsUAQWBM4U/iCKFc?=
 =?us-ascii?q?icbG4FyhH6EF3mFeASCIoEMgXiRakiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylgARIXgQmCBwKCWoIFAgFJQw4HR?=
 =?us-ascii?q?z4LGA1IESw3FBkEPm4HjmsfgXxNAYENGRKBblCTa5F6oQ8KKIN2jCKVOhozh?=
 =?us-ascii?q?ASmaC6YWoJZogGEaYFqATlGgRNwFYMiCUoZD5ocxEAnMj0CBwIHDgMLk2YBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:qT67Uq2Qaicqj5msLvbD5YNwkn2cJEfYwER7XKvMYLTBsI5bpzMGn
 TNLWDrXaa7bMGune9tzOYng90xUsZSHzYcxHgdk3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGCnAWFLEopMVOKloR9
 t8Wb24QPhHevrfjqF67YrEEasULJc3vOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME6ojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOK0aISFIIzTLSlTtlmCp
 Efd2lrSPjM9Ovu5kh6V8kiztNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSvMnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:3ubMfqMG1MorOcBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:UWcT8G0Qo2HOi/0JmtkSVrxfHPEFW0HtklTpCHTnCkVnD+OIGV7NwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3Apj6aXw76uZTjgQkDGpps+IP7xox3+aaLE2Uzuqk?=
 =?us-ascii?q?knMejE3dUKzenkwaOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="821068281"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:49 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 9012A180004BA;
	Wed, 26 Aug 2026 07:53:47 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 30AE3CC12A7; Wed, 26 Aug 2026 00:53:47 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-networking][PATCH] dnsmasq: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:47 -0700
Message-Id: <20260826075347.63336-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129491

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates vendor-wildcard CPEs for the
recipe's Simon Kelley source. dnsmasq:dnsmasq is an NVD configuration
identity and CNA affected-data identity; the_kelleys:dnsmasq is an NVD
configuration identity; and thekelleys:dnsmasq is an active NVD
dictionary CPE and configuration identity with CNA affected-data records.

This changes the generated product identities. With the frozen
sbom-cve-check database, the 48-entry CVE report is unchanged, so this is
an identity correction with no CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
index e2e365e81e..551b3884d6 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
@@ -18,6 +18,8 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
 "
 SRC_URI[sha256sum] = "cc967771abdafeb43d10db18932d6b59fd4bed2c69c22acf8cb96aff6920d55f"
 
+CVE_PRODUCT = "dnsmasq:dnsmasq the_kelleys:dnsmasq thekelleys:dnsmasq"
+
 inherit pkgconfig update-rc.d systemd
 
 INITSCRIPT_NAME = "dnsmasq"
-- 
2.35.6

