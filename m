Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C166DCD3439
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 15:53:15 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15565.1778169192364767296
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 08:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QPUTIBkq;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1875; q=dns/txt;
  s=iport01; t=1778169192; x=1779378792;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/E1otBwIZ00EeU2zgt5LnxCqVfNPXfHfD8p89WZW1pU=;
  b=QPUTIBkqLcYGpm+POTXoGCtkbWPyR98umTgjaQamdDsfd72u1Ul3C4be
   j1qr6YtE5rYFxy7vzIRZMGQ9vD1kEEnuS1VxkQUj0QlMMlEgQ43MuCjZU
   sRqQtgP0tO1jGQ4eSX+pBjcMisx679qDR0o26L17IxAzkGYiiaOmR03UE
   owYg+1mYmGI1KpP1ewDRYQNkbDw/meODowbnaXCZWAt60/emfNv4cwtPS
   z/oyZtgyakExwahrwsimj8/33XOm6osy1Bt0Y4NIfzssNMfSPXnyK2QB/
   tlJg+wcD9bFA6g/X7L0DkaXu6Hv6XKREZo63UXGgSdRWQAjx3NSarfnzL
   w==;
X-CSE-ConnectionGUID: XvYQr/20RUqsPjLI6LlAOw==
X-CSE-MsgGUID: Xee4SVDIR1e8KtiycpqZWg==
X-IPAS-Result: =?us-ascii?q?A0BDAgAbtPxp/4z/Ja1agjQQGoJTcl5DSZNaAY5XkjaBf?=
 =?us-ascii?q?w8BAQEPNxoEAQGFBo00AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4Zchl02ARgBLTBRC0SDAgGCOgM2AxG2UIIsgQGDKAGBVLIqDYJTA?=
 =?us-ascii?q?QsUAYE4hT+CeoUjhW4nGxuBcoR9gh+CcYV3BIIigQ6FW4krSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgUuCOXJqgQKEYHgjLANOewMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPm4HikUdD4IwgQ+WQBOReKAdcQoog3SMHo8+hXwaM6prmQaSEpJHh?=
 =?us-ascii?q?GiBaDyBWXAVgyIJShkPjl/KBCcyAjsCBwIHDQMLk2UBAQ?=
IronPort-Data: A9a23:PRF8vqD8LNgx/BVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApGgmgjNSz
 zAXDW2BbPiDMWCgfdtzPNmy/E8G78DTytFjOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCKB+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAL9hGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE8+tfNVtxZ9Uix/9sOWNq1
 KI8LBkqcUXW7w626OrTpuhEnM8vKozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY3BPjDS0Un1lM/CJA3kOCurnL+aDZf7lmSoMLb5kCMkVYpjemzbIW9ltqidchYwn2mi
 kP8pmmpIQ0bJdeH0Ai6/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvGS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:HVmpu67pbjEbN65zHgPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: =?us-ascii?q?9a23=3A1BZyhWnPpLHJU1mck2Ee55ybIuvXOU3D/U7KZBX?=
 =?us-ascii?q?gM1twU4WXbX7O3KdNtNU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A/09rJQ8EKhfHva8aSGoHHcSQf/dl7viVNmwsq8w?=
 =?us-ascii?q?L6+qYND17Iy6vszviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,221,1770595200"; 
   d="scan'208";a="752059647"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 May 2026 15:53:11 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 2E32B180001D0;
	Thu,  7 May 2026 15:53:11 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id C6830CC1288; Thu,  7 May 2026 08:53:10 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-python] [scarthgap] [PATCH] python-grpcio(-tools): add grpc:grpc to cve product
Date: Thu,  7 May 2026 08:53:01 -0700
Message-Id: <20260507155301.956004-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 15:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126814

From: Peter Marko <peter.marko@siemens.com>

These grpc python modules contain parts of grpc core.
Each CVE needs to be assessed if the patch applies also to core parts
included in each module.

Note that so far there was never a CVE specific for python module, only
for grpc:grpc and many of those needed to be fixed at leasts in grpcio:

sqlite> select vendor, product, count(*) from products where product like '%grpc%' group by vendor, product;
grpc|grpc|21
grpck|grpck|1
linuxfoundation|grpc_swift|9
microsoft|grpconv|1
opentelemetry|configgrpc|1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f993cb2ecb62193bcce8d3d0e06e180a7fef44b8)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 .../recipes-devtools/python/python3-grpcio-tools_1.62.2.bb      | 2 ++
 meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
index 5b8bbe681a..7f842c01a9 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
@@ -21,3 +21,5 @@ do_compile:prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT += "grpc:grpc"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
index 3581991a56..29c09675ef 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
@@ -51,3 +51,5 @@ CLEANBROKEN = "1"
 BBCLASSEXTEND = "native nativesdk"
 
 CCACHE_DISABLE = "1"
+
+CVE_PRODUCT += "grpc:grpc"
-- 
2.35.6


