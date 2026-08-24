Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDA0C61CE2
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 10:51:02 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13934.1787568658885250787
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 03:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=joxJzQEU;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1250; q=dns/txt;
  s=iport01; t=1787568658; x=1788778258;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lqOdWrwYwd3pOBv2HOe3r7SZXxTn9MS4/tuQEeXixWg=;
  b=joxJzQEURViDwN7eAQw/196SZk3swqPTpcjIRZkIuP4X4GOCvqWI5Jtx
   k/243g4e3BGfW2x+RMMMxhzfVcpmIWfwz6HxkDsyPv295U5XTaTbMvIdx
   sTdS4nP7kvvjEkYVO6TkLXpIbo6sVjC0u8Q+ahmF23KpBgsMaVnwDuvrl
   yYt6whFGN9Dm8q7Iiy4isgPupX8n/MnJQm4vwv3wN3jIvn1AJYuCtL9uX
   j3OY3EhizlSMnCNRMvV3J3OzoMhJcoUDmdUcmX5fm+m3/GUJfx49Ae384
   1ha+jucM7GLdhWmLY+9MMx4VJupsvxPZFoMyOTt+WONtDJhXZyPDYiTFA
   g==;
X-CSE-ConnectionGUID: 70yHJwUHQFuAIffA/kXzKg==
X-CSE-MsgGUID: G6vPo8ijTBGhOyTl0B6rDA==
X-IPAS-Result: =?us-ascii?q?A0AyAwC0IIxq/5EQJK1RCYJZgld0XkNJk1kBggRsoBwPA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbgImNwYOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl02ARgBLTBcRIMCAYJ0A8NjgiyBAYMoAYFU2zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6ECg15hXgEgiKBDIF4kWJIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspZAESF4EJggcCglqCBQIBS?=
 =?us-ascii?q?UMOB0ciCxgNSBEsNxQZBD5uB45eH4JHATxRgQKVUpF6oQ8KKIN2jCKVOhozq?=
 =?us-ascii?q?mwumFqkWoRpgX4mgVlwFYMiCUoZD44uFdAZJzICPQcCBw8CkXOBfgEB?=
IronPort-Data: A9a23:+CaxmqBWHlj2tRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApGxw0DFTx
 msfDziBa/aKZDbwKt0kPIyz9xtSuJLUmtViOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA//h2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEnK1/LGMpAK0h1PteIG9A3
 LsbGCIuYUXW7w626OrTpuhEj8AnKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWcHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFYrj+exboaFEjCMbeoLgH6f9
 mPEw07WAjYLCNjH42Sf3lv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:vCmCcKo/6k5glusuYUiS+DEaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:770k3W7W02B73d15l9ssqxYFOuI6T13k4mr5AkG2ICFqeK+2RgrF
X-Talos-MUID: 9a23:Aa2FmAm2RwZWejNWgpJXdnpNatlQ5PSvCnwnvpUhqvWAbQYuIRu02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="822774648"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 10:50:58 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id CC24318000773;
	Mon, 24 Aug 2026 10:50:57 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 6D28ACC12A8; Mon, 24 Aug 2026 03:50:57 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-waitress: correct CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 03:50:57 -0700
Message-Id: <20260824105057.64682-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 10:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129460

From: Devansh Patel <devanshp@cisco.com>

The current product-only "waitress" mapping emits a wildcard-vendor identity instead of the exact identities assigned to the packaged Pylons source.

Use "pylons:waitress" for the CNA affected-data identity and "agendaless:waitress" for the NVD dictionary CPE and configuration identity. This changes the generated product identity, but sbom-cve-check 1.3.3 with the pinned databases leaves the current CVE report unchanged.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
index cc705f4efe..1a30e3a058 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_3.0.2.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-CVE_PRODUCT = "waitress"
+CVE_PRODUCT = "pylons:waitress agendaless:waitress"
 
 RDEPENDS:${PN} += " \
         python3-logging \
-- 
2.35.6

