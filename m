Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA653CD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:22:51 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.914.1780413770643954230
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 08:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FI3bvSCT;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2054; q=dns/txt;
  s=iport01; t=1780413770; x=1781623370;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tX+gU8KZnDR27EbygBogaL4crlIMCx9gJPQHMWLXT38=;
  b=FI3bvSCT3OQVerrzISxS2jrYwC1NTPLQwPKgN5ViLhSfP0k3xAXLjPv+
   snaEFsety3tYpO5tLAZ6JAeow9qoU825XH2oIF2NtfP0mtLCm9DU2f+iG
   8iV5XLajk4rXxDoI+n+RBbGZ8CNTMqtxRfQgSR+9U9Y/AX029SFOwrLd+
   FxtjG/CdahkMoyhd51YSw1fsITipMLOIJ+CbPpiXo5Fs7fsYxQ3dtoiAK
   xaPJ50IF1b0VF+VWN1CO9DHaCHJaRJVg+ds/6ASm76+pG9QYNlOwEogrm
   wPFYrQRU+OT2xwhzMTIFyaELLsBp0Ps5lnSbAsrSERbO8hhnjDqQdfNvF
   Q==;
X-CSE-ConnectionGUID: tpxrQEqJTjeLAcembhZtBQ==
X-CSE-MsgGUID: iJD/63OuSm2X3f1lcMiI4g==
X-IPAS-Result: =?us-ascii?q?A0BCAgB59B5q/4v/Ja1aglmCV3JeQ0mTWgGCBIxTkjeBf?=
 =?us-ascii?q?g8BAQEPNxoEAQGFBo00AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGXTYBGAEtMFELRIMCAYI6AzYDEbM2giyBAYMoAYFU2EgNglMBC?=
 =?us-ascii?q?xQBgTiFP4J6hSN0hHsnGxuBcoR9gh+CcYV3BIIigQyBe4JliyFIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWBSoFVaoEEhRUjHwM5gReBf4Era?=
 =?us-ascii?q?WkQAwsYDUgRLDcUGwQ+bgeLbhcPgjWBDpZBE5F6oB1xCiiDdIwhjz6FfBozq?=
 =?us-ascii?q?msumFiSEpJGhGiBaDyBWXAVgyIJShkPji4VzH8nMgI7AgcCBw4DC5NlAQE?=
IronPort-Data: A9a23:8nXX3qnIPu+FHQsXeDmYebro5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcXjrQbv+CZWryedwkOt+w9UtUuMeGyNdqHQM+qno3RltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZG31GONgWYubDpKs/jb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZEA6vxOLHhsy
 f4VDBkGYxWJh9Cq6ovuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9Ausrnn9ejFfrnqepLE85C7YywkZPL3FbIqFKobUG5wL9qqej
 mPk0yOnWTYHD9nF+WGLq3ano+7uwSyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:ArA616i+WiZlQlB9lJCOi4g2FXBQXuwji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcW2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AHXHrUmhy07d2/CeRU39mh/BT3TJubmXN1k79Om2?=
 =?us-ascii?q?EC2tNYbaYTFWQyr9Oqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AqQJllg8lX5QgOV3dt9k8GyuQf8ZKz+PwU2cQqpB?=
 =?us-ascii?q?ci5KKbCh7Hja80DviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,183,1774310400"; 
   d="scan'208";a="488826616"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Jun 2026 15:22:49 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 878BB18000200;
	Tue,  2 Jun 2026 15:22:49 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 3392FCC1611; Tue,  2 Jun 2026 08:22:49 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-python] [scarthgap] [PATCH] python3-supervisor: set CVE_PRODUCT
Date: Tue,  2 Jun 2026 08:22:31 -0700
Message-ID: <20260602152241.3600220-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 15:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127365

From: Gyorgy Sarvari <skandigraun@gmail.com>

This recipe's CVEs are tracked using supervisord:supervisor CPE by nist,
so the default python:supervisor CPE doesn't match relevant CVEs.

See CVE db query (home-assisstant vendor is not relevant):
sqlite> select * from products where PRODUCT like 'supervisor';
CVE-2017-11610|supervisord|supervisor|||3.0|<=
CVE-2017-11610|supervisord|supervisor|3.1.0|=||
CVE-2017-11610|supervisord|supervisor|3.1.1|=||
CVE-2017-11610|supervisord|supervisor|3.1.2|=||
CVE-2017-11610|supervisord|supervisor|3.1.3|=||
CVE-2017-11610|supervisord|supervisor|3.2.0|=||
CVE-2017-11610|supervisord|supervisor|3.2.1|=||
CVE-2017-11610|supervisord|supervisor|3.2.2|=||
CVE-2017-11610|supervisord|supervisor|3.2.3|=||
CVE-2017-11610|supervisord|supervisor|3.3.0|=||
CVE-2017-11610|supervisord|supervisor|3.3.1|=||
CVE-2017-11610|supervisord|supervisor|3.3.2|=||
CVE-2019-12105|supervisord|supervisor|||4.0.2|<=
CVE-2023-27482|home-assistant|supervisor|||2023.03.1|<

Set the CVE_PRODUCT explicitly to match relevant CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 77ba5f31e27c5a5959563a15e793eedd4aaab5e5)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
index 06b08e78a3..b812509068 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
 
 SRC_URI[sha256sum] = "34761bae1a23c58192281a5115fb07fbf22c9b0133c08166beffc70fed3ebc12"
 
+CVE_PRODUCT = "supervisord:supervisor"
 PYPI_PACKAGE = "supervisor"
 inherit pypi systemd setuptools3
 RDEPENDS:${PN} = "\
-- 
2.44.1


