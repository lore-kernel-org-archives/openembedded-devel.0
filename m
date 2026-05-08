Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9703CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:28:06 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7725.1778221681691657027
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 23:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bzIBBaD5;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1044; q=dns/txt;
  s=iport01; t=1778221681; x=1779431281;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uq/sSRfqj6pEujH2w2FrcUjDNmiJwhMZxcgK3KjNtvU=;
  b=bzIBBaD5r88lKVLJe1AezOqCGaOyY0g6BmsFZNir4mFUx6vQieEFb1Dk
   Fz1POs7L6lZfhGmu/i3jno+DSyke69lffOLC6Z3xoICk1ZVUTeuG45ynL
   c+vMoZhL/+g0tpEPUNE3RnX23QjQLC4GDvxCYreIvgvlIiYb0E0aVkDW7
   +JYymj0iY/TllJj71RNtwauKQTRk6woLDKtpZjhc3b8cx/4qKdsaEuNXM
   1uHH9K2PFFjhuipc+JVVNP+yekD2L5FA4Qim0k8uZXExqtyS5wPNIfwQz
   LSGw9L0dB0lXUgic4GA1ragRIWQ0CtpcsTVSUs72HAMj6Vdigo8RLS9ph
   A==;
X-CSE-ConnectionGUID: NGgRXh5HTFGfmm2WzUS/hg==
X-CSE-MsgGUID: /Qffj1q6QE+6+8vP+Cb2gQ==
X-IPAS-Result: =?us-ascii?q?A0BiAgCfgf1p/43/Ja1aglmCV3JeQ0mTWgGOV5I2gX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQaNNAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl02AUYwUQtEgwIBgjoDNgO1YYIsgQGEfdhHDYJTAQsUAYE4hT+Ce?=
 =?us-ascii?q?oUjhW4nGxuBcoR9gh+CcYV3BIIigQ6Bfo0KSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EMGwcFgUuCOXJqgQKEYHgjLANOgQMDCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?4pHHQ+CMD03GoJpo0KCIaAdcQoog3SMHo8+hXwaM6prLphYkhKRXmmEaIFoP?=
 =?us-ascii?q?IFZcBWDIglKGQ+OX8VfJzI9AgcCBw0DC5NlAQE?=
IronPort-Data: A9a23:KXvpXK6W6dIc/wHvd4qkuAxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mYeCjrSPauCYDHye9l+YY+3o09T68XTxtIwTAZrqC4zZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2Qqaj9Mu/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eG6IXwNZ3XEFy2
 9MWLTVXUQK+vKW2z+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEWUrsUIMpWcOOAhnv2fzpegFmUvqEwpWPUyWSd1ZCya4aLK4LWGZ49ckCw4
 VvI8WagG08jGZ/BimqbyjGHjLXApHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjRCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:9pcnea6uDMfi8ssy8APXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: 9a23:iOEL1mBmJ0G1tWr6Ew9I+3QkGp0FTlPywnLVeXCqNF0uSLLAHA==
X-Talos-MUID: 9a23:xzCEOwqxabWE6fwHPi0ez3ZbOslqur3wMW1Oz9ZWpfHHHiYqNA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,223,1770595200"; 
   d="scan'208";a="734696443"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 May 2026 06:28:00 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id C6B1D18000184;
	Fri,  8 May 2026 06:28:00 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 6D95BCC1288; Thu,  7 May 2026 23:28:00 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-oe] [scarthgap] [PATCH] abseil-cpp: Add CVE_PRODUCT to support product name
Date: Thu,  7 May 2026 23:27:54 -0700
Message-Id: <20260508062754.1957643-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 06:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126820

From: Het Patel <hetpat@cisco.com>

- Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE
reporting.

Signed-off-by: Het Patel <hetpat@cisco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a428ea90c08fc93ce5e39612974323aad26d1ef3)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
index ff5aedb9c3..91d237ad9c 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
@@ -55,3 +55,6 @@ ALLOW_EMPTY:${PN} = "1"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2025-0838] = "cpe-incorrect: The current version (20240116.3) is not affected."
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "abseil:common_libraries"
-- 
2.35.6


