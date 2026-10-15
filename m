Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91356CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:17:25 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32567.1792041439071371386
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E3lfFQAW;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=898; q=dns/txt;
  s=iport01; t=1792041439; x=1793251039;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zoNvbBDRiHfAGfTzh4TEhq5SqaELx9gxPHMLVSKxKJM=;
  b=E3lfFQAW+aWMkdYtGsGVQtKPtiVeZX3gMXC5yDfK1gQxJYZNDX+WSfXV
   PWg8bOc6OJlMyhEZTcuMi0y42oNVKL7NjH8o5ns4LEfH0PsFJ7t6kjPhR
   2u9kasr0M1euGfd1Mq7rt+6iNOB0yZ0B4dnfx/gLtuD9q1hPIrK7FgP0s
   ivrYtNfXiq1RWQq0Fwid2WqAJ51YAm2TN3qLn7JDcRTrGhW8U2/Byza9O
   YWi7GtIeVMrlkPHOPYqKdkWvAGcn79AtJ+JWzBbd/emmwYamEkSykgRyM
   E7AjRwpvyiqZFB6cfN9Skqc5KC2GmcZAM4Pd12p0VVNQk/XT5cQqwEQGp
   A==;
X-CSE-ConnectionGUID: UTZKnwLiTeSHb+d9nYJFmw==
X-CSE-MsgGUID: 868mQJ22QneHoVvpu/NCFQ==
X-IPAS-Result: =?us-ascii?q?A0BBAgAQYdBq/5T/Ja1aglmCV3VgQ0m0Z4F+DwEBAQ89F?=
 =?us-ascii?q?AQBAYUFjhYCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8NkBU2ARgBLTBcRIMCAYJ0AxG6aIIsgQGDKQE/AkNQ2zIBCxQBBYEzhUCII?=
 =?us-ascii?q?3UBhHwnGxuBcoEVg2mBBYFcAYIuhXgEgiKBDJcKSIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUg?=
 =?us-ascii?q?gACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQ0YD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeRfB6CZYEOLKgioQ8KKIN2jCKVOhozqm8LmH2OCpZQhGmBa?=
 =?us-ascii?q?DyBRwsHcBWDIglKGQ+OOSeFQ8xbJzICOwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:ld2FhagYlIMSOVyRnPZpiRP5X161MREKZh0ujC45NGQN5FlHY01je
 htvWWmEaK6OZGqnKdF+Pd7n9U5SuZOAnN9lSAY4/iAyFyxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/ve8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUlxtRUB35q9
 MAVExAHLRzSgdOU7rekH7wEasQLdKEHPasFsX1miDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgd/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIIYDVFZ0JxRnwS
 mTurzqpByg4boamzzel9UyynvKIuwjVYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:2MLIBK7Psb7xxiE8KgPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:7Mc4W29xwbU1ftLMw7GVv3MoKOMjbVnc8HrrA0X7BTdveZ+7TEDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AHiu51QxIke6SJDZgDQmDc435+OeaqPTwWEU0s89?=
 =?us-ascii?q?cgs+JFStOJS+AyxKcbLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208";a="534780437"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 05:17:18 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 1BAF018000147;
	Thu, 15 Oct 2026 05:17:18 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id B5E47CC1611; Wed, 14 Oct 2026 22:17:17 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH 1/3] python3-grpcio-tools: set status for CVE-2023-33953
Date: Wed, 14 Oct 2026 22:17:15 -0700
Message-Id: <20261015051717.573643-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130917

From: Hetvi Thakar <hthakar@cisco.com>

CVE-2023-33953 is fixed since 1.56.2 per [1].
FKIE sets "defaultStatus": "unknown" so it needs to be set explicitly.

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-33953

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../recipes-devtools/python/python3-grpcio-tools_1.76.0.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
index 29bf02f786..8a04fecf27 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
@@ -26,3 +26,4 @@ do_compile:prepend() {
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT += "grpc:grpc"
+CVE_STATUS[CVE-2023-33953] = "fixed-version: Fixed since 1.56.2"
-- 
2.35.6


