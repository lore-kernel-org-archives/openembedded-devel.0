Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE273CD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:20:51 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.911.1780413642689562513
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 08:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jPhk3u6V;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1926; q=dns/txt;
  s=iport01; t=1780413642; x=1781623242;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6kmvb94QBeHl3l42M94NY3p0oR00kFbtv73RTEUbRqs=;
  b=jPhk3u6VFyixmCNbghObLVWuV+0exqXogrB8JJK7PXN7njnjswJvdOwf
   i3a0/oZibRi5bjsdJ9p4TW/cJbfcTdZtOEPdlnlCsJ6WUn2eH1VjZ6ctt
   Wo0KrnWxKsLkudr72/i1GiE6CI5Z2h1vcl+aIWbkJbnuglnLrlsasLyB8
   t5JBYPhcvXklYQLCsCxhfjDxncZIHnOaPXtIBNCY1H19BbOI2D0EShjej
   qUm5y+Gz4tIuMj9oRQDbI+7oi9V0YBRV3KY9yYeCXWqgAaFGjnzBAHsJF
   rBKuw9F0x4mU51Xz8QjqVSdC+l7SQiJSAk1S4kaQ6LbiNceYrRylpDAGY
   A==;
X-CSE-ConnectionGUID: EPWunmSMR4O5ZSfIX1Jbmw==
X-CSE-MsgGUID: kudPXOPtTfivbal8OYQ1Nw==
X-IPAS-Result: =?us-ascii?q?A0BCAgB59B5q/47/Ja1aglmCV3JeQ0mTWgGOV5I3gX4PA?=
 =?us-ascii?q?QEBDzcaBAEBgXGDFY00AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGXTYBGAEtMFELRIMCAYI6AzYDs0eCLIEBgygBgVTYSA2CUwELF?=
 =?us-ascii?q?AGBOIU/gnqFI3SEeycbG4FyhH2CH4JxhXcEgiKBDIF7jgZIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQsbBwWBSoFVaoEEhRUjHwM5gReBf4EraWkQA?=
 =?us-ascii?q?wsYDUgRLDcUGwQ+bgeLbhcPgjWBDpZBkg2gHXEKKIN0jCGPPoV8GjOqay6YW?=
 =?us-ascii?q?JISkkaEaIFoPIFZcBWDIglKGQ/bQicyAjsCBwIHDgMLk2UBAQ?=
IronPort-Data: A9a23:u6L3HK0WhpnYdaZ7w/bD5YVwkn2cJEfYwER7XKvMYLTBsI5bpzQGz
 mYbC2GHafmKNDf2KIslaI/g8E1X6sLQn4RlTwM63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AsaDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGIXkJIIsdwcNNXUYTx
 8cWCQBUTBqGmLfjqF67YrEEasULNsLnOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiaC/FMEg9/5JYWnOWhin75WzZZs1mS46Ew5gA/ySQtgOi8bYaLK43iqcN9nVuUn
 lLhx3jFDBAEPtWbmR20yyuKmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1vfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:NIqqs6tvJFOuctngmp9Yah4t7skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: 9a23:aaztPWPqf6UdJu5DdRFY6UgRIeUfLlqA/kzeAn/hK2xsV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AO6i2xA6m8JLTT4H7/BY9ZT3Hxoxr/qiWOGc1jak?=
 =?us-ascii?q?IuteOPCggHAak1RKoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,183,1774310400"; 
   d="scan'208";a="488954699"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Jun 2026 15:20:41 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id C107418000225;
	Tue,  2 Jun 2026 15:20:41 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 65A5ECC1611; Tue,  2 Jun 2026 08:20:41 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-python] [scarthgap] [PATCH] python3-paramiko: set CVE_PRODUCT
Date: Tue,  2 Jun 2026 08:20:17 -0700
Message-ID: <20260602152033.3597098-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 15:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127362

From: Gyorgy Sarvari <skandigraun@gmail.com>

Set correct CVE_PRODUCT for paramiko. The default python:paramiko value
doesn't match CVEs, because the product has its own set of CPEs associated
with CVEs.

See CVE db query:
sqlite> select * from products where PRODUCT = 'paramiko';
CVE-2008-0299|python_software_foundation|paramiko|1.7.1|=||
CVE-2018-1000805|paramiko|paramiko|1.17.6|=||
CVE-2018-1000805|paramiko|paramiko|1.18.5|=||
CVE-2018-1000805|paramiko|paramiko|2.0.8|=||
CVE-2018-1000805|paramiko|paramiko|2.1.5|=||
CVE-2018-1000805|paramiko|paramiko|2.2.3|=||
CVE-2018-1000805|paramiko|paramiko|2.3.2|=||
CVE-2018-1000805|paramiko|paramiko|2.4.1|=||
CVE-2018-7750|paramiko|paramiko|||1.17.6|<
CVE-2018-7750|paramiko|paramiko|1.18.0|>=|1.18.5|<
CVE-2018-7750|paramiko|paramiko|2.0.0|>=|2.0.8|<
CVE-2018-7750|paramiko|paramiko|2.1.0|>=|2.1.5|<
CVE-2018-7750|paramiko|paramiko|2.2.0|>=|2.2.3|<
CVE-2018-7750|paramiko|paramiko|2.3.0|>=|2.3.2|<
CVE-2018-7750|paramiko|paramiko|2.4.0|=||
CVE-2022-24302|paramiko|paramiko|||2.10.1|<
CVE-2023-48795|paramiko|paramiko|||3.4.0|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e22d2a7ba6e96c1312c368b4a6448bea5b6559da)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta-python/recipes-devtools/python/python3-paramiko_3.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.4.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.4.0.bb
index 0d32d361cf..937b9ee5b1 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.4.0.bb
@@ -18,3 +18,5 @@ RDEPENDS:${PN} += " \
     python3-pynacl \
     python3-unixadmin \
 "
+
+CVE_PRODUCT = "paramiko:paramiko python_software_foundation:paramiko"
-- 
2.44.1


