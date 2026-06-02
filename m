Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB761CD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:21:51 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.888.1780413703051167799
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 08:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h3w9GOGA;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1845; q=dns/txt;
  s=iport01; t=1780413703; x=1781623303;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lDmOcCFEargJS7d+HGRBFf1dBoQik5hQ/h3WsEV4a94=;
  b=h3w9GOGARVOsyqAGdSXsKAHANxrzNVjsFxTqP4rizxEVFfOGRqU+Mwtk
   RC8vRSl03NtN8w0ymHSDsRc8XcPZPF2nFcyO0BN930EQopSXqgDwZNZjK
   IjGLTcxvZKJ4xRZx56a1okyTiFmqezT8W2Mq4lcoOLxLrzMT7DyAxUQm4
   gTTXRPXFOBad83KpMIRlALz9g+oW3IO/NpOEkKhDkZOowtshdEVW3QG7u
   ncBSbjigqAKtGrldo+Hfa1pKcvQpNXz59XSV5XVSEoGg7dDORzxyQ1Njy
   5uOTHcpaJAwOMAC7Anfqo19Cd4FvGIyvfpGHiZUSw6jXuRyzDECoLyGAi
   Q==;
X-CSE-ConnectionGUID: vKElFHPaQ0mlKolL0TnRQA==
X-CSE-MsgGUID: pJx0LMZ6SPmV055ZPJZ9Gg==
X-IPAS-Result: =?us-ascii?q?A0BDAgB59B5q/4//Ja1aglmCGD9yXkNJk1oBggSMU5I3g?=
 =?us-ascii?q?X4PAQEBDzcaBAEBghKCdI00AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyGXTYBGAEtMFELRIMCAYI6AzYDs0eCLIEBgygBgVTYSA2CU?=
 =?us-ascii?q?wELFAGBOIU/gnqFI3SEeycbG4FyhH2CH4JxhXcEgiKBDIRgiyFIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWBSoFVaoEEhRUjHwM5gReBf4Era?=
 =?us-ascii?q?WkQAwsYDUgRLDcUGwQ+bgeLbhcPgjWBDpZBE5F6oB1xCiiDdIwhjz6FfBozq?=
 =?us-ascii?q?msumFiSEpJGK4Q9gWg8gVlwFYMiCUoZD44uFYEUAQfLYycyAjsCBwIHDgMLk?=
 =?us-ascii?q?2UBAQ?=
IronPort-Data: A9a23:H/IJ7q8KWv2ORK21iboODrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zcdW2/Sb/yMNmH0c4pwOtuzpkhQvcCGx4dhTANu+X1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4muyyHjEAX9gWAsbDpOs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2koHqAc1MZPCFgW8
 Pg7LzQpNiyFvduflefTpulE3qzPLeHxN48Z/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Yn1lQ/UPrSmM+ohHDzdDtwo1OOrq1x6G/WpOB0+OS9YIKKJILRGa25mG6Ah
 HKe20HLXCoiMeLHlGe3ylCe18DAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:3rYkxK5Ch6TI1b4NlQPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBEDjexPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: 9a23:cb3A9GHaiX7uiEmPqmJ512MQNOAde0SFyXPzJEucUVpvcoS8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A8IJ0iQwDGA1t0t65F1eKq8lml9WaqLyMGBgptKd?=
 =?us-ascii?q?YgPGBC3QtZgWlrgbmbYByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,183,1774310400"; 
   d="scan'208";a="488076634"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Jun 2026 15:21:39 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 410321800038D;
	Tue,  2 Jun 2026 15:21:39 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id E3081CC1611; Tue,  2 Jun 2026 08:21:38 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-python] [scarthgap] [PATCH] python3-priority: set CVE_PRODUCT
Date: Tue,  2 Jun 2026 08:21:21 -0700
Message-ID: <20260602152133.3598339-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 15:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127363

From: Gyorgy Sarvari <skandigraun@gmail.com>

Set CVE_PRODUCT to the value that is used to track CVEs for this
recipe in the CVE db.

See CVE db query (priority-software vendor is not relevant):
sqlite> select * from products where product like '%priority%';
CVE-2016-6580|python|python_priority_library|1.0.0|=||
CVE-2016-6580|python|python_priority_library|1.1.0|=||
CVE-2016-6580|python|python_priority_library|1.1.1|=||
CVE-2021-26832|priority-software|priority_enterprise_management_system|8.00|=||
CVE-2022-23172|priority-software|priority|||22.0|<
CVE-2022-23173|priority-software|priority|||22.0|<
CVE-2023-23459|priority-software|priority|||22.1|<
CVE-2023-23460|priority-software|priority|19.1.0.68|=||
CVE-2024-41697|priority-software|priority|||24.0|<
CVE-2024-41698|priority-software|priority|||24.0|<
CVE-2024-41699|priority-software|priority|||24.0|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 96c3818f229ed95409e2f36c395a3ab63ca130d7)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 .../python-priority/python3-priority_2.0.0.bb                   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb b/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
index 93b694c8b8..9aea7fb09e 100644
--- a/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
+++ b/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
@@ -6,4 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045"
 
 SRC_URI[sha256sum] = "c965d54f1b8d0d0b19479db3924c7c36cf672dbf2aec92d43fbdaf4492ba18c0"
 
+CVE_PRODUCT = "python:python_priority_library"
+
 inherit pypi setuptools3
-- 
2.44.1


