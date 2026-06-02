Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB21CC5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:41:18 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19125.1780382469315890647
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hLiO9wgg;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=930; q=dns/txt;
  s=iport01; t=1780382469; x=1781592069;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=f2hsmWCH6gQ5PX5hKeJYwQDKJo9/iNMhPu1cZe3OAdk=;
  b=hLiO9wgge7pMKdckMnDAxo02IeMTm5LubrpujzZK+/dB6bMQfLGTlrs4
   zDSLDswgRF48zHZgtMQHJmqbY9zEUQj0XfqGiHHY5K/tZA8Lc/lFIXgPy
   DO5vnJ4zUtpP08RrgG4kNPQp5ZcB06POl12TtnnNTCAarFAqT/seZIT5a
   7YfxV4XNnHcKE3vSVmzXUet06yQYJ/mQGtEInKw12sHYvHmRm9AfrxVlV
   9WGga+A1C/FhHQ5DQOLA9zzqHPLZws22tdtN+FFSF/zxjUbKv2ii84fiP
   cDItiQBqq5zu1MqYlAtaKEjkOeNwVBdTUh3zRxihQEhEpByhu27PEHyAs
   g==;
X-CSE-ConnectionGUID: 7qAtQetbTy25Gn8LX8U/nw==
X-CSE-MsgGUID: l3Xl27HsQN6nbl1zQcMZHw==
X-IPAS-Result: =?us-ascii?q?A0BEAgC6eR5q/5P/Ja1aglmCV3JfQkmUKoIknhuBfg8BA?=
 =?us-ascii?q?QEPPRQEAQGFBgKNMgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZbAgEDMgEYAT0gMSsrGYMCAYJzAgERsk2CLIEBgygBPwJDUNsoA?=
 =?us-ascii?q?QsUAYE4hT+IHXMBhHsnGxuBcoR9gQWBXAGCLoV3BIIigQyQAUiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYFKgVVqgQSFFSMfAzmBF4F/gStsa?=
 =?us-ascii?q?RADCxgNSBEsNxQbBD5uB4tvFw+CNYEOLASoHqEOCiiDdIwhlToaM6prC5h7j?=
 =?us-ascii?q?gmVZmmEaIFoPIFHCwdwFYMiCUoZD444J4VDx2ckNQI7AQEHAgcOAwuBaJF9A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:3YIWqKAwSWS+uRVW/3niw5YqxClBgxIJ4kV8jS/XYbTApDIhhmAEz
 WsWXzqPPazeZmLxeop1adix/R8O6pDUzIA1OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH9gmYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEnOxHEHg7IYck67wqLmce0
 cxIFXcLcUXW7w626OrTpuhEnM8vKozveYgYoHwllGmfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYwBPjDS0Un1lM/E48ygeKihnDXeDxDo1XTrq0yi4TW5FAhgOa1b4OLILRmQ+1RxXac/
 D3m5F3fXBcQMIWN8DGgwFKz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:yMJ+sK0LWM3HJ97kFp+6xwqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:Aerii29oo4TWIlri6pGVvxENM9wcf2HX8GaKfmC+WUJZGIDST0DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A4+2BDgz9d4qf/YiV4g2VbTma4QyaqKD1OERXzrU?=
 =?us-ascii?q?dgu/aMyZ0YiWkhxGFYpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,182,1774310400"; 
   d="scan'208";a="488607162"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Jun 2026 06:41:08 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 832C918000273
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 06:41:08 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 2FB19CB6A93; Mon,  1 Jun 2026 23:41:08 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 2/2] python3-grpcio: set status for CVE-2026-33186
Date: Mon,  1 Jun 2026 23:39:14 -0700
Message-Id: <20260602063912.4104825-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260602063912.4104825-1-sudumbha@cisco.com>
References: <20260602063912.4104825-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 06:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127322

From: Sudhir Dumbhare <sudumbha@cisco.com>

The vulnerability only affects the Go implementation of the library,
not the Python one. Ignore this CVE due to this.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-33186

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
index eaa48a5d5c..1c41eff3f0 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
@@ -54,3 +54,5 @@ BBCLASSEXTEND = "native nativesdk"
 CCACHE_DISABLE = "1"
 
 CVE_PRODUCT += "grpc:grpc"
+
+CVE_STATUS[CVE-2026-33186] = "cpe-incorrect: the vulnerability affects only the go implementation"
-- 
2.35.6


