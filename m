Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219D5C5B567
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:51:11 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1687.1786513861690909239
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hH878XQ3;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1196; q=dns/txt;
  s=iport01; t=1786513861; x=1787723461;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qv0RAx6TzsO4eIFOT6hWsEFrVhFBTKGjvSCcDA6bkKA=;
  b=hH878XQ3tUrXNiExLcVSNuM2/yfgeQp6sRBdLo/FTYT/YW3Y+MZU7T+c
   7dosr7QgK+j0xlh2NzNa3mNiG54jlFzloeSKKh0o60yt4a9bsu+vSQfzd
   l6gwUTAueL9F+JX3/BKry6ZgJtkUZ78m31pV7zNbKeuTnsdF+mOO9zxz6
   Q+6Rh1xA/R5+H7IvekhQIV5xIAjn8hhhj160mLKowWl2J73OCWiwj5gkd
   /qQw2ltRXX0y3zjUkrQkKeLAYfZhv1x/8p4iu40ZFiW5vAu+V5giGjXgI
   81lZjEWjdcPDJF8mxe38FClcS6dJLokXS8RVEh5Em8hTuDeo1MmAUR0JJ
   w==;
X-CSE-ConnectionGUID: +qzHVgTYS4mt60aYEVFYMQ==
X-CSE-MsgGUID: lH1ax+40QK+0KBqdVejRKQ==
X-IPAS-Result: =?us-ascii?q?A0BDAgBRCHxq/48QJK1aglmCV3ReQ0mTWQGOV5I3gX4PA?=
 =?us-ascii?q?QEBDzcaBAEBgXEBgxONaQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4Zchl02ARgBLTBRC0SDAgGCOgM3A8IvgiyBAYMoAdoeDYJYAQsUA?=
 =?us-ascii?q?QWBM4U/gn6FI3aEfCcbG4FyhH6CH4JxhXgEgiKBDJMnSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIRoIxk2fIEJYYErKmUBEheBCYI0A?=
 =?us-ascii?q?oJ2gS1iAgEeCxgNSBEsNxQZBD5uB44wIIJGgQ6WQYJ5jxSgHnEKKIN2jCGPP?=
 =?us-ascii?q?oV8GjOqbC6YWpITkkeEaYFoPIFZcBWDIglKGQ/eXCcyAjsCBwIHDgMLk2YBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:d8V5h60Ow8CtLdLCTfbD5alwkn2cJEfYwER7XKvMYLTBsI5bpzEPz
 WdJDGHVOqvYYWWgc9Bwad6+oEIPupLSnddgTVZr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24tazpKg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGT1gkHbMXxtdMXWRSq
 6QRGR0zQCGmvrfjqF67YrEEasULJc3vOsYb/3pn1zycVahgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME+ojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOCxaYOIJoTWLSlTtkK4/
 2vWvDihOzJZbP+10Da7/3CWpdaayEsXX6pXTtVU7MVCmlSRgG8TBRg+Wl6yoP3/gUm7M/pEK
 EUS9isht6Ev8mSkS9D8W1uzp3vslhkEVtxdFuc35A2Axu/Y7hiUAkAATyVdc5ohrMIwSDkg2
 1OFkt+vAiZg2IB5UlqU8rOS6Df3Mi8PICpaO2kPTBAO5J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjQxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:AXI+hauAWN3JKoAzSZZtKtjU7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AMBYxZGgB3HEmxN8r4wIfd8KL2DJuMWTP7EnfH36?=
 =?us-ascii?q?DVWN1FuWceHKu1pJBqp87?=
X-Talos-MUID: 9a23:eVbeDQXiLXDXn1rq/DvM3Thyd5sw2oftUGMniJk4tsu+FhUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,218,1779148800"; 
   d="scan'208";a="804115404"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Aug 2026 05:51:00 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id BC3B818000258;
	Wed, 12 Aug 2026 05:51:00 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 61D14CC12A6; Tue, 11 Aug 2026 22:51:00 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Devansh Patel <devanshp@cisco.com>
Subject: [meta-python][scarthgap][PATCH] python3-httpx: set CVE_PRODUCT
Date: Tue, 11 Aug 2026 22:50:58 -0700
Message-Id: <20260812055058.1491633-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2026 05:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128928

From: Gyorgy Sarvari <skandigraun@gmail.com>

The relevant CVEs are tracked in the CVE db with encode:httpx CPE
instead of the default python:httpx. Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%httpx%';
CVE-2021-41945|encode|httpx|||0.23.0|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8627277b502bd01e0ac1d856032efe7ae049a249)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-httpx_0.27.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-httpx_0.27.0.bb b/meta-python/recipes-devtools/python/python3-httpx_0.27.0.bb
index e4d3cbeee8..f16edceac1 100644
--- a/meta-python/recipes-devtools/python/python3-httpx_0.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx_0.27.0.bb
@@ -7,6 +7,8 @@ inherit pypi python_hatchling
 
 SRC_URI[sha256sum] = "a0cb88a46f32dc874e04ee956e4c2764aba2aa228f650b06788ba6bda2962ab5"
 
+CVE_PRODUCT = "encode:httpx"
+
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
 "
-- 
2.35.6

