Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3447.1795171316674825848
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WNMLYJk+;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1686; q=dns/txt;
  s=iport01; t=1795171316; x=1796380916;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TxNdoi+kyODtOlrsym28qZxWF0DEwIC+YkBNXLgvBQk=;
  b=WNMLYJk+yvIiR/nNEMJPBL3tx2wVQI71EQ7+ue56KY76kDHGnJNHtPU6
   eRtmnR0mTsziXE6qnJpDnQA0+5VJaAlpHo6oEE7zIQsEWQ2Gtf4QcE+DM
   FkLKb+rX1IVm6A05T/y5A+jq0JpFKIhJi8Tatp7FFikGcqSrG5z5vhVFz
   jap/9PyfKBn+me7WRMi4/rcdXDg8Udwn29a9weMoWvHPDURFr74YN+XQP
   4pLhf7HDduPvuxGGCcMlJinZtnZOqGC9OVHkmtZ824Vnx1f+5o5JHQehf
   b6aEupUUJxkz9h3ixLgyPV3LDl2OjFkHiGMUb75/w0o6rhd5tk8s2Gn+C
   A==;
X-CSE-ConnectionGUID: unDOn1KuSLikq6tBaMBe5g==
X-CSE-MsgGUID: m1rezTvTSMa18giqKCm7ng==
X-IPAS-Result: =?us-ascii?q?A0BDAgB1IwBr/8tK/pBaglmCV3VhQkkDlkiBFp0WFIFqD?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFjiMCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBU2ARgBLTBcRIMCAYJ0AgERBrgiGzeCLIEBgykBgVTbMwELF?=
 =?us-ascii?q?AEFgTOFQogkdQGEfScbG4FygRWCdHaBBYFcAoFGZ4V5BIIigQyBcm2MDIl3S?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoX?=
 =?us-ascii?q?QEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnC?=
 =?us-ascii?q?xoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYNGA1IESw3FRkEPm4Hk?=
 =?us-ascii?q?2yDGYEOLASCKKV1oREKKIN5jCSVOhozhVulFwuYfY4KllGEaoFoPIFZcBWDI?=
 =?us-ascii?q?glKGQ+OOYIDgWjOWyM1AgEIAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:oFyHxK4n4vM5p3NAS5UrfAxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mFKUTzQO/mKZWvwcotxao+/9xkG6pXTyYNlGQo4/ygxZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOs/vawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eIIs03eAuInx10
 f0bMW4RRBmmre/rz+fuIgVsrpxLwMjDNY4F/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO0Yn1lQ/UPrSmM+hnWH2aThRsnqepLE85C7YywkZPL3FbYuLIoDTFJ49ckCwo
 zvc8nbFHC0hEdXGmTWE61GHg7DJknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:OmXABaofKqDdWLTTERFp66MaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:R9NAH28zCO0sPPDLqimVv1MSNucjK17A91PRIFbmFUxgbZeYFFDFrQ==
X-Talos-MUID: 9a23:xlW44QugiPK6tZz+5M2ngWh4OdVU/ZiVLUlUwZoHouqvMHN2NGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59604193"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:41:53 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id BDFFA1800015B;
	Fri, 20 Nov 2026 10:41:52 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 6EF62CC1634; Fri, 20 Nov 2026 02:41:51 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [meta-oe][wrynose][PATCH] cups-filters: Ignore CVE-2024-47850
Date: Fri, 20 Nov 2026 02:41:47 -0800
Message-Id: <20261120104147.2173185-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 12:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132774
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

CVE-2024-47850 affects the legacy CUPS browsing handler in
cups-browsed [2]. The daemon is a separate project in the 2.x series.
Upstream commit [1] removed cups-browsed from cups-filters.
The cups-filters 2.0.1 source tree [3] and Makefile.am [4] have no
cups-browsed source or build target, so the vulnerable code is absent
from this recipe.

References:
[1] https://github.com/OpenPrinting/cups-filters/commit/808f439f73b947eb1b376e2c3d5c576e445de543
[2] https://github.com/OpenPrinting/cups-filters/security/advisories/GHSA-rq86-c7g6-r2h8
[3] https://github.com/OpenPrinting/cups-filters/tree/2.0.1
[4] https://github.com/OpenPrinting/cups-filters/blob/2.0.1/Makefile.am

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb b/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
index 24b916a921..b9ddbabc01 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
@@ -12,6 +12,8 @@ SRC_URI = "https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.
            "
 SRC_URI[sha256sum] = "39e71de3ce06762b342749f1dc7cba6817738f7bf4d322c1bb9ab10b8569ab80"
 
+CVE_STATUS[CVE-2024-47850] = "not-applicable-config: The vulnerable cups-browsed daemon is a separate project in 2.x and is not present in cups-filters 2.0.1 sources"
+
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups-filters/releases"
 
 inherit autotools gettext pkgconfig github-releases
-- 
2.35.6

