Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569B4C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:30:25 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6160.1787722219941836850
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NSg7Ey3O;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1178; q=dns/txt;
  s=iport01; t=1787722219; x=1788931819;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=raKEKUVSlOHHrhGzldQrvi2u3Aiq9BMx1I9igvDt46M=;
  b=NSg7Ey3OfKjWBftaZqZmEsD0em4kH8GfQ5IPcKJmRvTCm8oBVRXElh2X
   niUGADLf6wZ8JbQsdeZm9ySMQGtIo8Cbnuba8ZixwtlYI431x8zAPpDNg
   hQ+CNdRsSwCWyAQSR+ELf0cW+L133L5BZRibUOqK15e4EQwnIaXvW+GVm
   m8Pu5xBhVUcQzI5TBHdYhXsJZuNGKbI29Ow6v/ymjJc/SORkqK+aq9Kpb
   zI7ix7eJ1x/UzClr4gdkC3jPxzB3yPWrT6vjlNJhCmF0rJPN0mlCPkmXR
   aK6L5j9MDeQg+7u7i7sfYMDOpv4cGTbHmv/nQrM5KsWX6kikRzEeMJMng
   g==;
X-CSE-ConnectionGUID: LyFb4BQMQVu7trwvjZlXeA==
X-CSE-MsgGUID: VLTLqsHMRjS35E+Hl0NOUw==
X-IPAS-Result: =?us-ascii?q?A0BCAgB8eY5q/48QJK1QAQmCWYJXdF5DSZNZAaEOgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAMRvkWCLIEBgygBgVTbMAELFAEFgTOFP?=
 =?us-ascii?q?4gidoR8JxsbgXKEfoQWAXmFeASCIoEMgXiCTI8eSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWABEheBCYIHAoJag?=
 =?us-ascii?q?gUCAUlDDgdHPgsYDUgRLDcUGQQ+bgeOax+CSYEOqE6hDwoog3aMIpU6GjOqb?=
 =?us-ascii?q?C6YWqRahGmBaDyBWXAVgyIJShkP3lwnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:BKvrS6Bycyu6PxVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDIrhGFSz
 2sZDW6GPPrbNGb2fYsja9mx9BwDsJSEztI3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCA9n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA//hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE5+RABh0cBKghxPsoHXtR6
 /4qLAAAR0XW7w626OrTpuhEj8AnKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWEHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFcvi+GzYYONEjCMbftxomKBv
 ULjxWbCWUw3d/ybkRyiz23504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:14zlxq3GWUc424UlF1avhwqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:pPPz1WE64lKCUvSQqmJD5WAeRuocV0Tj0SjMOVCmC1RteLC8HAo=
X-Talos-MUID: 9a23:dHZeCAhh8cx5A0fSayy2tsMpCuNUx721KGU3k65d5uTHFSgoHRCgk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="836316910"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:30:19 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id E656118000247;
	Wed, 26 Aug 2026 05:30:18 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 82D85CC12A7; Tue, 25 Aug 2026 22:30:18 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][scarthgap][PATCH] python3-httplib2: correct CVE_PRODUCT mapping
Date: Tue, 25 Aug 2026 22:30:18 -0700
Message-Id: <20260826053018.51560-1-devanshp@cisco.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 05:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129482

From: Devansh Patel <devanshp@cisco.com>

The inherited "python:httplib2" mapping does not identify the packaged
project. Use "httplib2_project:httplib2" for its exact NVD dictionary
CPE and NVD configuration identity.

Backport note: master replaces a product-only mapping in version 0.32.0;
Scarthgap 0.22.0 has no recipe-local override, so this is an addition.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0a8f71a6432ff4990d11fba839bf15697bc4553b)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb
index 9318ad9182..b44f59deb4 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb
@@ -13,3 +13,5 @@ RDEPENDS:${PN} += "\
     python3-netclient \
     python3-pyparsing \
 "
+
+CVE_PRODUCT = "httplib2_project:httplib2"
-- 
2.35.6

