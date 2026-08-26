Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68434C61DD2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:30:26 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6159.1787722219506740273
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OeTu/iun;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1418; q=dns/txt;
  s=iport01; t=1787722219; x=1788931819;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PhzJtxamdnZmXuJpSAsW4DX6pJSha4hlm69tYYXDTHs=;
  b=OeTu/iun3EilFhZLBrv5AJsobZtIDg4o5hdIXnj6vkOpWcPURaqc2cZ0
   0/PU+srw7sKpTY7y9N+6i2FzFhDgAfS+22Q/9GCKEK3+R8rWAPabQ1Zfz
   koiQdP0Ud9v778wpua+KR2RYm0iEnX2JF23Dr6lEa/pyu7Ol4H9k6W5wT
   UAEFkiAenJauzmcy7gxxiy/kJNQ5vDUZGFr4O9MqDWR1j7zeLWS/mHaN7
   yhkGeNd5B1DckDVJ4etGEbTQw08dqh/bKuoTeeFxEMJv76erd1j2xjKhh
   Lk5VGEu7H65pHc/gzd2EFPufY2TAkUmuZ0ur5dk2+VVxEOdZcafZ8Mnl2
   Q==;
X-CSE-ConnectionGUID: AKlUcCTfS/2pk+qdqF28Mw==
X-CSE-MsgGUID: Fn139zu+TIa4xNCUr5kGKA==
X-IPAS-Result: =?us-ascii?q?A0BCAgBDeI5q/5QQJK1RCYJZgld0XkNJk1kBoQ6BegQPA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZdNgEYAS0wXESDAgGCdAO+Z4IsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwTFBsbgXKEfoQXeYV4BIIiehKBeHiQckiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylgARIXgQmCBwKCWoIFA?=
 =?us-ascii?q?gFJQw4HRz4LGA1IESw3FBkEPm4Hjmsfgkk9UYEfpy+hDwoog3aMIpU6GjOFW?=
 =?us-ascii?q?6URLphapFqEaYFoPIFZcBU7gmcJShkPji4ViUTGVScyAjsCBwIHDgMLk2YBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:nehH5KOoD0hs653vrR30lsFynXyQoLVcMsEvi/4bfWQNrUog1mYOy
 GQWCz2FPqyCMGv0Kt1/YYTjpktTvJbRx9YxSnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gWAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69xNCHw9FrEWwaEtGWIN7
 PABBmpdSw/W0opawJrjIgVtrs0nKM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY/BPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5FwogeGwYYWOJ7RmQ+17mB/D9
 3DbvFjYC00KEvei02eG3VGF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++NukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:nJ53uasx/bOJv93Bs6Hg0WsR7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AKPLwjmhBqWbw0nhGjRzrVEiPjjJuW17Z8Xz7H0G?=
 =?us-ascii?q?DTjxxS/6MRUa+ovNBjJ87?=
X-Talos-MUID: 9a23:q1vVYQpYzYCDj3Slb8Aezx9kbZw58bntNGEEzYUgkPSeaC9fGB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819159735"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:30:18 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 985CE180001F6;
	Wed, 26 Aug 2026 05:30:18 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 3953CCC12A9; Tue, 25 Aug 2026 22:30:18 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][scarthgap][PATCH] python3-web3: add CVE_PRODUCT mapping
Date: Tue, 25 Aug 2026 22:30:18 -0700
Message-Id: <20260826053018.51389-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 05:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129480

From: Devansh Patel <devanshp@cisco.com>

The current inherited "python:web3" mapping does not match the web3.py
identities used by NVD and CVE List V5, so its source-aligned CVE is
missed.

Use "ethereum:web3.py" for the CNA affected-data identity and
"apeworx:web3.py" for the NVD dictionary CPE and NVD configuration
identity.

Backport note: Scarthgap has web3.py 6.17.0 rather than 7.16.0;
CVE-2026-40072 applies to this release and is reported as unpatched.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 19ecb40f50cb5c93eb2830b10c4a5b02e367e4e7)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-web3_6.17.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb
index f1be4dcf4d..80b14d6360 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.17.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
 SRC_URI[sha256sum] = "1b535272a40da3d8d2b120856edb53b84b0c08bcc8fe1a5bbd5f816fd72f4ec6"
 
+CVE_PRODUCT = "ethereum:web3.py apeworx:web3.py"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-- 
2.35.6

