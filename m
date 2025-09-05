Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212C8CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 15:19:48 +0000 (UTC)
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.web10.399.1757085585187448976
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Sep 2025 08:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KxHoqVFE;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1564; q=dns/txt;
  s=iport01; t=1757085585; x=1758295185;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3h6s9doQoKLrg0HY6ZmCRUKcxH0WCc+fYjfUUtKuGY8=;
  b=KxHoqVFEH0Z2aQXVU9+b+El2sE23xOp/11UaXOyR267oG9QVU0nDYLV/
   t2hpEZbQgpQgDSIhaatHg+x+cO/R3FxCHKlndeEktVkKhC9Z3BURZab7f
   SG6JqzHALcYo45rg5TiotnTU/Hv/0g/6eGAL6CW4V43NQCoJ17+QwKZp+
   3xXLniW5evXaY1t879CnFnt/moZpwOR8rLjykFSSHcUJkr3rUd6mzoRQq
   ZARYskCfsnAEeQ5vsTj4oFHNjgzsmTRo4brZX+catg6M5mLbXog4+OurD
   Ai2jn1C3FwoZgCQsVHNkkpRPa0tdNNnCoQ/CeBGQ6SH4EaHnj4iwtsZc5
   Q==;
X-CSE-ConnectionGUID: q9ofUuoHT+eVULmPN2OetQ==
X-CSE-MsgGUID: f8uyv7kOR96yVwMx0tWCiA==
X-IPAS-Result: =?us-ascii?q?A0BMAAD3/rpo/9FK/pBaHAEBAQEBAQcBARIBAQQEAQGCA?=
 =?us-ascii?q?AYBAQsBgkZ6WkJJk1QBjleSNoF/DwEBAQ83GgQBAYUHjCoCJjUIDgECBAEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8Nhl02ARgBLTBRCzwIg?=
 =?us-ascii?q?wIBgjoDNQMRsTuCLIEBgygBgVPYQQ2CW4FJAYgxhRuFZycbG4FyhH2CH4Jxh?=
 =?us-ascii?q?XcEgiKBAhSEW4cohDCCfIg6SIEeA1ksAVUTDQoLBwWBYwM1DAsuFW4yHYEnh?=
 =?us-ascii?q?Q2EHitPhQGEaiRrDwaBFYNdBoRFQAMLGA1IESw3FBsGPm4HlHmDL4EOgimTQ?=
 =?us-ascii?q?FgTkXWgIHEKKIN0jB6PPYV8GjOqay6YWJIRkkeEaYFqATk5gSBwFYMiCUkZD?=
 =?us-ascii?q?5c8tD07NQI6AgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:BZ8nfKBkiDWzBBVW/37iw5YqxClBgxIJ4kV8jS/XYbTApDp21zZRy
 mVMXj+BMvyJY2vxeIsnatu2/BxUusOHnNMxOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZuCCaF/H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357gU2thh
 fuo+5eCYA79hmYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2qRpAnwrOq0kuetJPEVLz
 dpCDz0RV0XW7w626OrTpuhEj8k5ac2uN4QFtzQ4nXfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWsHgBfoO3WjPn8bBZ8klfuogVH0ciZTrxSeoq9fD237l1ctjuezbYu9ltqiS5VIj1jHp
 UX8rjroPA4/JISD9hGE2yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVmuzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:C9xAgqELwjLqOVsZpLqE48eALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: 9a23:h/lYumHpfxbSxAazqmJ+pUkaJ90iUkGewUntB0qALzxORaGsHAo=
X-Talos-MUID: 9a23:At5PIAaxBnXiOOBTuW/xlS89N+BSsvq/Nl8ogc0ahOKFHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,241,1751241600"; 
   d="scan'208";a="33467659"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Sep 2025 15:19:43 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 05A6F180001B8;
	Fri,  5 Sep 2025 15:19:43 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 7D0BACC12B5; Fri,  5 Sep 2025 20:49:41 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe] [scarthgap] [PATCH] protobuf: set CVE_PRODUCT
Date: Fri,  5 Sep 2025 20:49:32 +0530
Message-Id: <20250905151932.3600531-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 15:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119316

From: Peter Marko <peter.marko@siemens.com>

Add all relevant products from following query.
Also remove generic "protobuf" to avoid matching golang:protobuf.

.../downloads/CVE_CHECK2$ sqlite3 nvdcve_2-2.db
sqlite> select vendor, product, count(*) from products where product like '%protobuf%' group by vendor, product;
golang|protobuf|1
google|google-protobuf|5
google|protobuf|2
google|protobuf-cpp|4
google|protobuf-java|15
google|protobuf-javalite|12
google|protobuf-kotlin|6
google|protobuf-kotlin-lite|4
google|protobuf-python|4
protobuf|protobuf|1
protobuf-c_project|protobuf-c|2
protobufjs_project|protobufjs|3
rust-protobuf_project|rust-protobuf|2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 30e585a505c025754977305f4f2dcea737cb6d44)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
index 949a3b207b..1e3eecbd38 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
@@ -21,6 +21,8 @@ SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.pa
 
 S = "${WORKDIR}/git"
 
+CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
+
 inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= ""
-- 
2.43.5


