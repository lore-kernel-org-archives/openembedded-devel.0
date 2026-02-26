Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EC4FCE074
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:51:10 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69308.1772110268392825666
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=auT/IjEg;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=860; q=dns/txt;
  s=iport01; t=1772110268; x=1773319868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VwO3kv7w/98HeDwg6pBnkiUHNAYOtnz9Z3SYVOIbJJI=;
  b=auT/IjEgbxF9+yC3NKnSwnZBH5ErI1jOei71g3E+GNnJHUfsUCf9svQb
   b1WkipiOd/aSrD2+Z36Rhg8W8htwL/XLYugNxxFimURErBjhZ9Os0RWOo
   h51GxLbDx/0BH26Z35CApYKOMMrPRvVOQgHrUABawUglucAE5Vs3qMjfW
   eXG1f9z4dSqiK75dfPQP8zO2BSs85U4XwUe5hBtrI0Z0eV0W7RYxSMQzH
   95BvT0uXR+8Guh4Ts9Bsf41HncS/t9gOuWiqz36rH0fYgy96gvo4hOP9N
   iR+dnZxknsy87PRhA3PQvAJYsJzo7RAyxQ+t0Xl7An+OJJotcPrACiQKd
   Q==;
X-CSE-ConnectionGUID: +wCPe1X4RLiboswtr1FJhQ==
X-CSE-MsgGUID: 3MT+QuWCR8m1W6PEZ5jbMQ==
X-IPAS-Result: =?us-ascii?q?A0A0BwBFQKBp/47/Ja1aglmCSA9xX0JJlk6eGoF/DwEBA?=
 =?us-ascii?q?Q83GgQBAYUHAo0fAiY2Bw4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZchlsCAQMyARgBLRAgMSsrGYMCAYJzAgGmbYIsgQGDKAGBU9smA?=
 =?us-ascii?q?QsUAYE4hTyIGXSEeicbG4FyhH2FEIV3BIIigQ6Bf4V9BosMSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4EKGwcFhggPiHR4boEaggQDCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB41pP4I0dBqCaaNCgiGhDgoog3SMHpU6GjOqay6YWKRZhGiBbworOYEgc?=
 =?us-ascii?q?BWDIglJGQ/ZMyI1AjoCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:gcIMT6reDMzV5HZ1LGOmpOEs2nNeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnXaPmJajOne40nYdnk8EtT65fUy9JlQVRurSs0FiMWp+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgbNNwJcaDpOtfrZ8k035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0qVoKllDr
 MxEEhQMZBeYmP6smZyZStA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Xo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUvrSn8/w7pX7Wz1VtEqcuYI84nPYy0p6172F3N/9JIPVHpsNxxjBz
 o7A1z/cPlIjKeO082qAq03yvsL9wCHxfbtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YcLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:wwGcYay+frFy3Ymn3wiBKrPwK71zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+EZyTNB/L/HCM7SKadH/OW6
X-Talos-CUID: 9a23:vPxo5W3FTptwTgnA52HAQbxfWd8OSnCE/CvqB06yDn12VKfMZ32QwfYx
X-Talos-MUID: 9a23:oC+bBgTPXqS295E/RXS3oQ0hDdpXyJ7+DRkyz60riZSGPwlJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,312,1763424000"; 
   d="scan'208";a="677360161"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Feb 2026 12:51:07 +0000
Received: from sjc-ads-4197.cisco.com (sjc-ads-4197.cisco.com [171.70.54.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 69F021800021A;
	Thu, 26 Feb 2026 12:51:07 +0000 (GMT)
Received: by sjc-ads-4197.cisco.com (Postfix, from userid 1847788)
	id 09E4FCC1286; Thu, 26 Feb 2026 04:51:07 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [oe] [meta-oe] [PATCH v1] googletest: Add CVE_PRODUCT to support product name
Date: Thu, 26 Feb 2026 04:51:05 -0800
Message-Id: <20260226125105.47526-4-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260226125105.47526-1-hetpat@cisco.com>
References: <20260226125105.47526-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.54.218, sjc-ads-4197.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 12:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124675

From: Het Patel <hetpat@cisco.com>

- Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE
reporting.

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta-oe/recipes-test/googletest/googletest_1.17.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb b/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
index c8ed80053d..242f0ac7da 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
@@ -35,3 +35,6 @@ do_configure:prepend() {
     # there isn't python in HOSTTOOLS so "env python" fails
     sed -i 's@^#!/usr/bin/env python$@#!/usr/bin/env python3@g' ${S}/googlemock/test/*py ${S}/googletest/test/*py
 }
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "google:google_test"

