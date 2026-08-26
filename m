Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0B3C61DCD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:11 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7458.1787730845210793848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DlL8mcbO;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1217; q=dns/txt;
  s=iport01; t=1787730845; x=1788940445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ozU8yKK9AQN6adEXsOzlqQaGOrbyHm0lsmlvItw7msg=;
  b=DlL8mcbOQv/C7O9FI0tlNXJbWMev08aEbC8OcvlwLcS465HqQVqxtnaR
   BxNeOzp1YvwUlqxgHE7b+K3MkNY3x+KoS+y93MkGNV1e3SwFBPYxoe+J7
   AtL/Q0Co5z9akjtZelRzCOLJxvlWGA7NUTLMbAB1rmxKGJvgVi6P/+PUz
   SQIYj7b4/KXETmhNTf+xtm4QwMpGfmmabtAFT7nF94uo+LhIAhvmwQ+FB
   jXd/TxUm/gTAUyhu4wyEBRhv117Z1YggG5XunzRg6dBQs/EZSTcV4nBwR
   STkBtCkFl522lc8P8pShCwKL5dPkrHfDPG7pwVWqfiD0YIWuQC0Gu50lG
   g==;
X-CSE-ConnectionGUID: 366nO9CPQg6kdqHSf1tisA==
X-CSE-MsgGUID: FaclWgUnSv2oc7SxdF4CHQ==
X-IPAS-Result: =?us-ascii?q?A0BCAgBqmo5q/40QJK1RCYJZgld0XkNJk1kBggRsnh6Bf?=
 =?us-ascii?q?g8BAQEPNxoEAQGFBY1uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGXTYBGAEtMFxEgwIBgnQDvwOCLIEBgygBgVTbMAELFAEFgTOFP?=
 =?us-ascii?q?4gidoR8JxsbgXKEfoQKDXmFeASCInoSk2JIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCBQIBS?=
 =?us-ascii?q?UMOB0c+CxgNSBEsNxQZBD5uB45rH4JJATxRllSReqEPCiiDdowilToaM6psL?=
 =?us-ascii?q?phapFqEaYFoPEaBE3AVgyIJShkPji4V0BknMgI9BwIHDwKRc4F+AQE?=
IronPort-Data: A9a23:vaqWd6Aio5wwJBVW/3niw5YqxClBgxIJ4kV8jS/XYbTApGwjgjdRm
 jZJWTiGb/+KZ2agKIx3bd7n9x9Su5/RnNRiOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA//hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEmKswCmZnFrUh9bh0DXhuz
 vJBNDEWR0XW7w626OrTpuhEj8AnKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWMHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFYoi+e3b4KPEjCMbetclUKnq
 V/AxHqjBRpFD8yT52au0kv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KIpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOTEIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:kVNhjKvRGv5wrDHwO0h5LbjH7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:l0yI5WH8PCU9JVM0qmI8qhASPZEOSkTSknTcOm+DBz91Saa8HAo=
X-Talos-MUID: 9a23:DILUtQpQkNQaFx95Y+Mezx9rP8NX7JmoM15Xlp5ZgNmIG3BbGw7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="821372702"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 7F24118000B7A;
	Wed, 26 Aug 2026 07:53:47 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 17FBBCC12A6; Wed, 26 Aug 2026 00:53:47 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-twisted: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:47 -0700
Message-Id: <20260826075347.63268-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129489

From: Devansh Patel <devanshp@cisco.com>

The product-only "twisted" value emits a wildcard-vendor identity
instead of the active identity assigned to the packaged Twisted source.

Use "twisted:twisted" for its NVD dictionary CPE, NVD configuration,
and CNA affected-data identities. With sbom-cve-check 1.3.3 and the
pinned database snapshots, the generated product identity changes; the
current CVE report is unchanged.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb b/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
index 7d7f5d3053..c294bd2933 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ff950f7bafa004a86f478dc9eaf8106f"
 
 SRC_URI[sha256sum] = "dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9"
 
-CVE_PRODUCT = "twisted"
+CVE_PRODUCT = "twisted:twisted"
 
 inherit pypi python_hatchling
 
-- 
2.35.6

