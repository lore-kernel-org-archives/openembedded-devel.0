Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A29AC61DD7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:12 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7507.1787730849730597084
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Gac8/dWp;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1147; q=dns/txt;
  s=iport01; t=1787730849; x=1788940449;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9UUHvAmfPd+fS/q/afnwwnTgTQ2aQypWx1AzIRrHzBE=;
  b=Gac8/dWpnEhOoImwD4wJGPMK54nPdGxrJaaPOyEdMELeEDBKRl5Q+F9w
   ZSnOQwmnqnfQdvc/ExGailcWD4ONIkFVxeMVRUCJ7T1KYHoZYZ7kg4l7c
   JgmtM7N9cGanfHV+m7mnVWXf/X6WdbUHsCtnXQY6rqT0PilCRCiZqe/mN
   mcrOZlC8V4yEoLzGu267580yHOMFJ8KRoLbc2+p4tqwPP+JembXPgpq0k
   GfBkGEm2A/Pm+CTkN4AsDSFB2t2lCVZTg+lyjtS5jsYlbAFfXNXuBKYu3
   E4cKrwXZl46ghqOhp//e+ksljPL3Fl2+cQtJDCvP8JObCNqA3obDj4ty4
   g==;
X-CSE-ConnectionGUID: ox+iVuM2QFi+DS/Yg5ZxqA==
X-CSE-MsgGUID: QbqqkVhlT4moUvEcG794oA==
X-IPAS-Result: =?us-ascii?q?A0BDAgDnmo5q/48QJK1RCYJZgld0XkNJk1kBggRsnh6Bf?=
 =?us-ascii?q?g8BAQEPPRQEAQGFBY1uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8Nhl02ARgBLTBcRIMCAYJ0AxG+aIIsgQGDKAGBVNswAQsUAQWBM?=
 =?us-ascii?q?4U/iCKFcicbG4FyhH6EF3mFeASCIoEMgXiRakiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylgARIXgQmCBwKCWoIFA?=
 =?us-ascii?q?gFJQw4HRz4LGA1IESw3FBkEPm4HjmsfgkkBPFEZE5YokXqhDwoog3aMIpU6G?=
 =?us-ascii?q?jOqbC6YWqRahGmBaDxGgRNwFYMiCUoZD44uFYhPx0onMgI9BwIHDwKTcQEB?=
IronPort-Data: A9a23:NQe6l6PLETgTfpPvrR31lsFynXyQoLVcMsEvi/4bfWQNrUog0TwFx
 2QfUTuFafreYGb1eo8nPoi+9B5U78XczYdhT3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gWAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/J+T0AIIKhCw8h2Qk11s
 s0XdQIddznW0opawJrjIgVtrs0nKM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY0BPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5FwrjeKzboeFILRmQ+1slF+Bp
 VzG+1ilBxYnKvGU5mXUrnWF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMGBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:kzHGX65bMaw4nZ2pogPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AJGj6umkFiLYMJ0//tgwIj1c5b6nXOXrNj3buPmr?=
 =?us-ascii?q?iMEhoC5GuDm6fpZF0iuM7zg=3D=3D?=
X-Talos-MUID: 9a23:vDkMDgSgXGMsANhsRXTVjih7N/lo55jyDUcwj7gNlJbVaStZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="825266582"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id C3B3B180006F1;
	Wed, 26 Aug 2026 07:53:47 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 649E1CC12A9; Wed, 26 Aug 2026 00:53:47 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][PATCH] ldns: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:47 -0700
Message-Id: <20260826075347.63476-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129492

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
nlnetlabs:ldns is the active NVD dictionary CPE and configuration
identity for the packaged NLnet Labs source.

This changes the generated product identity to an exact CPE, but the
frozen sbom-cve-check database leaves the eight-entry CVE report
unchanged, with no current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb b/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
index 8b3b9bd9de..6e50cc2b1e 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
 SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
 SRC_URI[sha256sum] = "b524fa21994b6e834200ceb8c27f1b84bda5982fe35706f058196c079db94d5d"
 
+CVE_PRODUCT = "nlnetlabs:ldns"
+
 DEPENDS = "openssl"
 
 inherit autotools-brokensep
-- 
2.35.6

