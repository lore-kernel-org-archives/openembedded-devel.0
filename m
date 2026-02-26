Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D10FCE070
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:51:10 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69306.1772110268137356573
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=O161hDXi;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=805; q=dns/txt;
  s=iport01; t=1772110268; x=1773319868;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M9FRA0vgDsPNLC2ldZY5f+fW7Vk8QdXRwlBHRR6xIF0=;
  b=O161hDXiuIfJy3kO0ZlS14Ku865HGuA7wGAZjPr/XI1CjBWNVa4uYRkR
   VrxeKf3v4JvO5cus1xUfumPrzRUzZ0SKeWLGrLzwvGhLtFSDDZNRNZJ0G
   Ti4Q/LpBYzJwfi1GpOvlyNTwQIWhuxD17yVpjo/L61vjlWMTEvJrLfgYs
   V0v+E1duP2cY3rSwfjEnZ+8HbhR+/KAFYcNyScEKP0WdsdxMyiE679yIT
   oeq3bD8g46qzmYpqUMSI59Sk/QjmIxEWItcMzF3Q+UdWbn0jeC/P1J0tq
   8sK3yTDVsQnFyuYlB8AwV8llt5SveZ+ZuK1fTF04KKkTlwSvw+Kql2Gv/
   A==;
X-CSE-ConnectionGUID: X85P9xb2SgmOufARogEtng==
X-CSE-MsgGUID: 9rOm1tN6QyquQVeuYGpIaw==
X-IPAS-Result: =?us-ascii?q?A0C1CAC9QKBp/5T/Ja1aglmCSA9xX0JJk1oBoQ2Bfw8BA?=
 =?us-ascii?q?QEPNxoEAQGFB40hAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4Zchl02AUYwXESDAgGCcwIBpm2CLIEBhHzbJgELFAGBOIU8iBl0h?=
 =?us-ascii?q?HonGxuBcoR9hRCFdwSCIoEOgX+FfQaLDEiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBChsHBYYID4h0eG6BGoIEAwsYDUgRLDcUGwQ+bgeNaT+CNHQag?=
 =?us-ascii?q?mmjQoIhoQ4KKIN0jB6VOhozqmsumFikWYRogWg8gVlwFYMiCUkZD9klIjU8A?=
 =?us-ascii?q?gcLAQEDCZNnAQE?=
IronPort-Data: A9a23:6eDPt6jqfmZgMjqhwpXpdPR6X161NhEKZh0ujC45NGQN5FlHY01je
 htvDGjSOPrfYWL0c9l+btm39E5X6sWDmNJqQAQ9/CwyEC9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeGULOZ82QsaDxMsfjd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUoqrtPUHFEr
 8cXLRcQYDm5gO2b3LS0H7wEasQLdKEHPasFsX1miDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgd/5JEWxI9EglH/fiFAoU69rqss6G+Vxwt0uFToGISKJITTH54KxS50o
 EqX5UP8Ww08auWO0Ce8zH+xt8DXvCrkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:wRMbHaEEU91kDaFspLqE48eALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: =?us-ascii?q?9a23=3AErT2EWlpuKLV+7Pdv5XJtxJ8O+3XOU2NkU+BM0X?=
 =?us-ascii?q?iMmlsb6CbYGWX9454lcU7zg=3D=3D?=
X-Talos-MUID: 9a23:FzXmEgiR5JFMoCc6/FgImMMpZd1P5v2yLh40gIwbgveJKB1fIxaUk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,312,1763424000"; 
   d="scan'208";a="676012373"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Feb 2026 12:51:07 +0000
Received: from sjc-ads-4197.cisco.com (sjc-ads-4197.cisco.com [171.70.54.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 540A21800026F;
	Thu, 26 Feb 2026 12:51:07 +0000 (GMT)
Received: by sjc-ads-4197.cisco.com (Postfix, from userid 1847788)
	id EE22CCC1282; Thu, 26 Feb 2026 04:51:06 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [oe] [meta-oe] [PATCH v1] abseil-cpp: Add CVE_PRODUCT to support product name
Date: Thu, 26 Feb 2026 04:51:02 -0800
Message-Id: <20260226125105.47526-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.54.218, sjc-ads-4197.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 12:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124673

From: Het Patel <hetpat@cisco.com>

- Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE
reporting.

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
index d4475ee73a..abf736131a 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
@@ -53,3 +53,6 @@ python split_dynamic_packages() {
 ALLOW_EMPTY:${PN} = "1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "abseil:common_libraries"

