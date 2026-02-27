Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82F3FD5326
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:43:09 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91722.1772185385343680324
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 01:43:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ismt+UCi;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1430; q=dns/txt;
  s=iport01; t=1772185385; x=1773394985;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VdJVAu0fmVkT/1FEBHBdqW/8nwAOVNTe/4wkA9i3HIQ=;
  b=ismt+UCij94Q8Tqra8ny5Aj8cWM+DsDwuWyZBg7UevEB/hxmkUsCnuD1
   aGdPZNSjerdZGGN/qxzy0TZyMzZJwMEQFTUioKsMi98gcXSqGpsIkzYGm
   slHnNUt6zbNmijWXrq+k3WH/zqV5aCgruFF1/wcLbvDudxxHcJsl5T5pd
   luNkgV3CluK0rPGO9f6yXeSfFidMvSRB8fCEtRzic0ztY19F5ENG0OfFx
   RfdM7KioAWoGVeD2BpX/rZKrS+kYEpIcioEUvoGzV0uJ5LyoQ7aZZGOxN
   FTA0o+9FeNCwZg6cGkm0Bbe2tYtBUIXgYljlNXDgw9eem/QflkwAI39N/
   Q==;
X-CSE-ConnectionGUID: hvItyCjvT4Sb15sq6BEF6A==
X-CSE-MsgGUID: tWXuXhP1Q++txNu5y5gBpg==
X-IPAS-Result: =?us-ascii?q?A0CsCACYZqFp/43/Ja1aglmCSA9xX0JJk1oBoQ2Bfw8BA?=
 =?us-ascii?q?QEPRA0EAQGFB40hAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZdNgEYAS0wXESDAgGCcwIBEaYmgiyBAYMoAYFT2yYBCxQBg?=
 =?us-ascii?q?TiFPIgZdIR6JxsbgXKEfYJhAQMYghOFdwSCIoEOgX+LDIYLSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhXwPiHR2boETghwDCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB41uP4I0UzsslhWPaqMvCiiDdIwelToaM6prLphYjgmWUIRogWg8OQ2BA?=
 =?us-ascii?q?QsHcBU7gmcJSRkPjl+FQcQDQzUCOgIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:4AFHkKM9djxJyKLvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUol1TFRm
 GNODTvSM6zcNmfyKo93YIq+8kpXvpKHmtJmHXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVrlV
 e/a+ZWFZgf/gWAsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/VwLV0nFo8GxrpMCzgT7
 uVGAh0jMDnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmFS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNXwsYDUXUrsTIJIzgP+hmlH0ciZTrxSeoq9fD237klwrjee2aYCOEjCMbdlqrluop
 lqfxie6HgE8KYGOlDWv6n3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KIpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOH9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:vA2VhqF+1l2Sq3Y1pLqE48eALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90cu7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: =?us-ascii?q?9a23=3AOj7Tl2r1XZ6grZm46bP09ZzmUcA7U2HM53XOHxO?=
 =?us-ascii?q?DAz80U6TLY3K+pooxxg=3D=3D?=
X-Talos-MUID: 9a23:BmtNNwpApEy74608jj4ezy1dBNpY45z3MQNOjYUgppSVaCNaIzjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,313,1763424000"; 
   d="scan'208";a="682573123"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Feb 2026 09:43:04 +0000
Received: from sjc-ads-4197.cisco.com (sjc-ads-4197.cisco.com [171.70.54.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 64A5C1800019D;
	Fri, 27 Feb 2026 09:43:04 +0000 (GMT)
Received: by sjc-ads-4197.cisco.com (Postfix, from userid 1847788)
	id 0DDF8CC1282; Fri, 27 Feb 2026 01:43:04 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [oe] [meta-oe] [PATCH v2] [PATCH] googletest: set CVE_PRODUCT to align with NVD CPE
Date: Fri, 27 Feb 2026 09:43:02 +0000
Message-ID: <20260227094302.60264-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.54.218, sjc-ads-4197.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124699

From: Het Patel <hetpat@cisco.com>

Set CVE_PRODUCT to "google:google_test" to match the product name
defined in the NVD CPE database for Googletest.

Reference CPE:
  cpe:2.3:a:google:google_test
  https://nvd.nist.gov/products/cpe/detail/5806549A-1DCE-4225-80C6-7099B53A0F77?namingFormat=2.3

Full list of available CPEs for google_test:
  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=google_test

Currently, no CVEs are reported for Googletest. However, the source code
is already mapped to this CPE in NVD. Defining CVE_PRODUCT ensures that
future CVEs reported against this CPE will be correctly detected and
attributed during CVE checking.

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

