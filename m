Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75537CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:17:25 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32566.1792041438957995897
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ezc0mJyD;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1019; q=dns/txt;
  s=iport01; t=1792041439; x=1793251039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7qzoVuWmHF2oob0Dw1iGgPV+tI9oJzYW7bxu+2LxHTY=;
  b=Ezc0mJyDCkUwQIM8toywCh0ntOgwgnDy0cYaVCsTUs7MAWalI8bXerQv
   xrxRH3DU+Ida75c+k2WqxaRg30MS6ee1OMPqLp+06rwfPIobEzBthebWv
   Hl7XWM3S7JV6ucIVrjJktOyffyTYFAUJ65vh5f+rsnsiRlJzA+mncJjdz
   5sx+q2Xz4MC1axysryNx/2UFoTGLaSErGSE7oHZZubPt/ewDB+Yf0DT7s
   xvJezmXPn5ty3/cDNlSk+bhPLwFkVs28YlP+O6vyYSOjypGWqPKDuabja
   m4f6pRQRIEISF8VjCR7ZBrVhddk7ADk2qqYt4HNDpbNaLehVDQJ0HbSD4
   g==;
X-CSE-ConnectionGUID: kMibvrWiSqKwSy/3AEKlCg==
X-CSE-MsgGUID: wDaVpZ6SSe+XPWG8AF0Elg==
X-IPAS-Result: =?us-ascii?q?A0BFAgCSYNBq/4//Ja1aglmCV3VgQ0mWTZ4agX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQUCjhQCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBMCAQMyARgBLRAgMSsrGYMCAYJ0AxG6ZoIsgQGDKQE/AkNQ2zIBC?=
 =?us-ascii?q?xQBBYEzhUCII3UBhHwnGxuBcoR+gQWBXAGCLoV4BIIigQyXCkiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylgARAXg?=
 =?us-ascii?q?QmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0Fc?=
 =?us-ascii?q?ggCDQkNGA1IESw3FRkEPm4HkXwegmWBDiyoIqEPCiiDdowilToaM6pvC5h9j?=
 =?us-ascii?q?gqVZ2mEaYFoPIFHCwdwFYMiCUoZD445J4VDzFsnMgI7AQEHAgcOAwuBaJF+A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:Ebnu8qOlYrihyj/vrR30lsFynXyQoLVcMsEvi/4bfWQNrUom1zFVy
 zBJCzqAbqrZMDDxc9EjOoni/RwF6paDndc3TXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/ZLDUsoJ7IZwf9UHlpfs
 qcxBRMJRR/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzN3wsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEqjeayYYuNJrRmQ+1Ksk+mv
 lCYxF/0QSEiC/PP4BTd33aj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:lseYcq4WJw7favZhBgPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:WJkXf2yivB3wL9+T7N4zBgUXP8EvbGfizUzJAFCDGCEyYZC2TXSfrfY=
X-Talos-MUID: 9a23:0Zq4QQnLwcVTZNYYIJyndnp9GM5W+5bwM3sA0qU+hObUHAIoFjOS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208";a="535679904"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 05:17:18 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 1E2D11800025A;
	Thu, 15 Oct 2026 05:17:18 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id B8F64CBF201; Wed, 14 Oct 2026 22:17:17 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 2/3] python3-grpcio-tools: set status for CVE-2024-37168
Date: Wed, 14 Oct 2026 22:17:16 -0700
Message-Id: <20261015051717.573643-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261015051717.573643-1-hthakar@cisco.com>
References: <20261015051717.573643-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130916

From: Hetvi Thakar <hthakar@cisco.com>

CVE-2024-37168 affects @grpc/grpc-js, the pure JavaScript
implementation, not the gRPC core code included in grpcio-tools.
Therefore the grpc:grpc CPE association is incorrect.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-37168

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../recipes-devtools/python/python3-grpcio-tools_1.76.0.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
index 8a04fecf27..1733dd0e88 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
@@ -27,3 +27,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT += "grpc:grpc"
 CVE_STATUS[CVE-2023-33953] = "fixed-version: Fixed since 1.56.2"
+CVE_STATUS[CVE-2024-37168] = "cpe-incorrect: affects @grpc/grpc-js, not gRPC core"
-- 
2.35.6


