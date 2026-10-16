Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B763CCA491
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:23:36 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15656.1792131806146579952
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GascOJ6P;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1132; q=dns/txt;
  s=iport01; t=1792131806; x=1793341406;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=G0bV0whJkYdiafSMOt+3FwZ513Y95JQilErk7oqP3cg=;
  b=GascOJ6PC+PgGaBBr6CiJXod4KRVXN2GUtS6gwSBc1fJOfiqejLWAjCr
   nGqrNOz2wfcyp1LfJyjLK3k3vTm4Bkukp2swnxlrJZxJLfFEcGVfSC+PB
   9avCbMOkNzZiF1kR8R3CjuKMBbo80I+lz2cjdlU8DadElxirdBCtu56s9
   ofCbjGDUEDMbO5YEj3KEJnmZm1CFHdIq/JokITy8gL793wLe46jAOOPt4
   VLwBd/dSGyF499VnqYr7/qLw+3W9gtIaT2EK+dkFBC0VlJRGksQMZmc/n
   n+Mom49IRxCK37k5yFcBLhajhiLZSRb2JjVlZx9Tbsa9giTwNRKnPwf/q
   Q==;
X-CSE-ConnectionGUID: AiepZ07IRlCWqcweBMTrQg==
X-CSE-MsgGUID: 05i2Zc6fSp6yzx+kTulf9g==
X-IPAS-Result: =?us-ascii?q?A0DIAgBfwdFq/5X/Ja1aglmCV3VgQ0kDlCaDN50JgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZATAgEDMgEYAT1RKx0BDRmDAgGCdAMRvHOCLIEBgykBgVTZS?=
 =?us-ascii?q?oFoAQsUAYE4jWN1AYR8JxuBSUSBFYJzdoEFgVwCgi2FeASDLoF4lSlIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspY?=
 =?us-ascii?q?RAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzD?=
 =?us-ascii?q?B0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoJlgQ4sgiyldaEPhCiMIpU6GjOqb?=
 =?us-ascii?q?wsjmFqOCpZPhGmBaQE6gVkzGggbFYMiCUoZD445g2vOWicyAgwvAQEHAgcOA?=
 =?us-ascii?q?wuBaJF+AQE?=
IronPort-Data: A9a23:ILig/6/LDFSEFmjLUw/iDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WQWWTyGPanbZ2H0eosjbIyw/R8AsZ/XyYdrSAU6+H1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kfPIAAyL4oIFtK3
 sMBIy8ARDW/ndu5lefTpulE3qzPLeHxN48Z/3UlxjbDALN/G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0wn1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OW2bYSMIYbVHa25mG7A+
 2OczW+nDCoCas2N2XmGzm+oiL7AyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:e7ILIaqtBz3khMMNpZRIAbQaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AAc2D12hvOIOK5jzlUeB5aYYYJjJuW3zQ1EWIfG6?=
 =?us-ascii?q?CDU1WUbaKRHW1xLldnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxWPVvwzorigKnGrDvUOERTScTf6aqPzzCRo/mss?=
 =?us-ascii?q?IgNHaJD5geDShkTC5E4Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535613270"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:23:25 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 324F118000338
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:25 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 8FA0ACBEFBF; Thu, 15 Oct 2026 23:23:24 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 9/9] python3-pillow: CVE_STATUS for CVE-2026-55798
Date: Thu, 15 Oct 2026 23:23:23 -0700
Message-Id: <20261016062323.251925-10-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016062323.251925-1-yurade@cisco.com>
References: <20261016062323.251925-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131063

Analysis:
- The vulnerable code is WindowsViewer.get_command() constructing an
  unescaped cmd.exe command from a file path. [1]
- Linux uses UnixViewer, which quotes the path, so this Windows command
  path is not used by the target recipe. [1]
- Hence marking this CVE not applicable for the Linux target.

[1] https://github.com/python-pillow/Pillow/security/advisories/GHSA-4x4j-2g7c-83w6

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
index e5ef7b34bf..33fd1d8872 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
@@ -70,6 +70,7 @@ RDEPENDS:${PN}-ptest += " \
 "
 
 CVE_PRODUCT = "pillow"
+CVE_STATUS[CVE-2026-55798] = "not-applicable-platform: The CVE affects WindowsViewer/cmd.exe; the Linux target uses UnixViewer"
 
 
 RPROVIDES:${PN} += "python3-imaging"
-- 
2.35.6


