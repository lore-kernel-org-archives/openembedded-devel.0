Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913B5C61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 08:37:48 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17086.1787647059553126828
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 01:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IcW1ZAq5;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2795; q=dns/txt;
  s=iport01; t=1787647059; x=1788856659;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2HdRIVgOu3NH9O3+XWqIMLWMPjzpmS2ZbDkV9e/yU8U=;
  b=IcW1ZAq5A7+1TrUVVmDDcValGT4IB8zZ61bTmmAtAi+VPk+WHoBrShsO
   hTY9KOajtTiONgEqd61rQ1q9x6/BGXtpsfRCf522jceoglMfCXH9+7QHn
   sC1lHIz8hp1vBIMZcJ2gLr7cQjIdCKOQ0vD2qB5/zb49gOws6MFw27uSS
   4pBVPh4wY74C39T98xH4m9Y/CGNKE0ombfuaTcq0YDwPa73lfdWHtdFFK
   NEgQwH63gcMlRASvMkhS9Xc9Xdoh68az4V4o6Z6eVG3ub/g5K1xUjz2cu
   ozuACXxxOPtbkBHDf3qZ45f/Oc3Ct5RWS2UW7xb48+6G3aFSkwrybjXfx
   w==;
X-CSE-ConnectionGUID: R2Jk5FG/Q0CMurW+u9bx5g==
X-CSE-MsgGUID: IiM3RYOwR46RA+3y8Ms/GA==
X-IPAS-Result: =?us-ascii?q?A0BCAgCiU41q/4z/Ja1aglmCV3RfQkmTWQFPgiGeHoF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAZJzAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhxMBGAFdXDwIgwIBgnQDEb5zgiyBAYMoAYFU2zABCxQBgTiFP4gih?=
 =?us-ascii?q?XInGxuBcoEVg2mCYQQYghOFeASCIoEMgXiRXUiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylhEheBCYIHAoJaggUCA?=
 =?us-ascii?q?UlDDgdHIgsYDUgRLDcUGQQ+bgeOXR+CSwE9UQErBYEWYkClYqESCiiDdowii?=
 =?us-ascii?q?AQHjS8aM6lGgSaZCI4KllCEaYFoPIFZcBWDIglKGQ+XNoFdxTE8NQIJMgIHA?=
 =?us-ascii?q?gcOAwuGS40bAQE?=
IronPort-Data: A9a23:Txs1fKPI8SH9TBnvrR31lsFynXyQoLVcMsEvi/4bfWQNrUom1TUCz
 jRNXm/QMqzeMGXwfdh1aNjgp0IDvZSGyoA2HHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gWMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6880LkJrE6Jfw75cJHxUy
 r8FeTodMx/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmCS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNHwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsiuG3aIeJJIziqcN9v0e9/
 Vj32HvDXk8gHZ/E2Gqg6TWDr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:txISwayIdBG8HZR6qWP1KrPwHL1zdoMgy1knxilNoHtuA66lfq
 +V8sjzuSWYtN9zYgBCpTn/Asi9qBrnnPYfi7X5Vo3MYOCJggeVxflZjbfK8nnHBzD08PJb2O
 NLdqhzD8C1MH1B5PyKhTVR170bsb66GGfCv5a780tQ
X-Talos-CUID: 9a23:jYc9F2FyV/3bRz2kqmJdrmwXR+4KNUSF51LNOXD7FDdjWOCaHAo=
X-Talos-MUID: 9a23:bZB2YggDVcIG2rG245ZSg8MpFcZNuJ6fL183zcs8korfJHxVIHCypWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,242,1779148800"; 
   d="scan'208";a="521205468"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Aug 2026 08:37:38 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 48FDB18000596
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 08:37:38 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 5D907CC037D; Tue, 25 Aug 2026 14:07:36 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][wrynose][PATCH] samba, libldb: add package conflicts
Date: Tue, 25 Aug 2026 14:07:19 +0530
Message-Id: <20260825083721.3369187-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2026 08:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129468

From: Himanshu Jadon <hjadon@cisco.com>

samba package also installs LDB command line tools and python LDB
module. libldb package installs the same tools and pyldb module from
standalone LDB source.

pkgdata shows the conflict clearly:

  samba: /usr/bin/ldbadd
  libldb: /usr/bin/ldbadd
  samba-python3: site-packages/ldb.so
  pyldb: site-packages/ldb.so

So when both samba and libldb are added in same image, rootfs can fail
because package manager sees same files from two different packages.
Both package sets are not expected to be installed together.

Add RCONFLICTS for samba/libldb and samba-python3/pyldb. This makes the
conflict explicit during dependency resolution instead of failing later
as file install conflict.

Older meta-networking had similar conflict handling for samba/libldb in
commit: https://git.openembedded.org/meta-openembedded/commit/?id=8e641e28f630dac61a03373ad70c72a2370ad11e

This change adds the same handling again with current python3 package names.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ee1c39e595286388ffb9e793892feec7d87977d7)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.23.8.bb | 3 +++
 meta-networking/recipes-support/libldb/libldb_2.8.2.bb     | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
index fb00dd2ec1..2d72e3a23b 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
@@ -50,6 +50,9 @@ CVE_STATUS[CVE-2011-2411] = "not-applicable-platform: vulnerable only on HP NonS
 # remove default added RDEPENDS on perl
 RDEPENDS:${PN}:remove = "perl"
 
+RCONFLICTS:${PN} = "libldb"
+RCONFLICTS:${PN}-python3 = "pyldb"
+
 DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libaio libpam libtasn1 libtasn1-native jansson libparse-yapp-perl-native gnutls cmocka ngtcp2 bison-native"
 
 inherit features_check
diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.2.bb b/meta-networking/recipes-support/libldb/libldb_2.8.2.bb
index 016b649cd9..63b4885bfb 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.8.2.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.2.bb
@@ -5,6 +5,8 @@ LICENSE = "LGPL-3.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
 
 DEPENDS += "libtdb libtalloc libtevent popt cmocka"
 RDEPENDS:pyldb += "python3"
+RCONFLICTS:${PN} = "samba"
+RCONFLICTS:pyldb = "samba-python3"
 
 export PYTHONHASHSEED = "1"
 export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
-- 
2.43.7


