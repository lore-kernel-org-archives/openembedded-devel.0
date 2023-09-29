Return-Path: <SANJAY.CHITRODA@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511A2E810DF
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 11:27:07 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web10.14999.1695986819316833128
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 04:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: vivelmur@cisco.com)
X-CSE-ConnectionGUID: eHw51OQISyKkd2b7m8sGBQ==
X-CSE-MsgGUID: M54y+VktS2ySGjM3XDXN4Q==
X-IPAS-Result: =?us-ascii?q?A0AeAACbsxZlmJxdJa1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?QUBAQsBgy9VQEeWNJ18gg0BAQENAQE1DwQBAYwUAiY2Bw4BAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAQIBAQUBAQECAQcEFAEBAQEBAQEBHhkFDhAnhWgNhkoGMgEYAS0QI?=
 =?us-ascii?q?DEsKxmCfgGCXgMRtXeBAYMkAbAYgVKBSAGMPoMjgi8ngiiEfoEFgUYXAoIth?=
 =?us-ascii?q?XYEiUOFPgcygiaDVos4KoEICFyBaj0CDVQLC12BEYJEAgIROQ8FR1oWHQMHA?=
 =?us-ascii?q?1oqECsHBC8iBgkWLSUGUQQXFiQJExI+BIFngVEKgQY/EQ4RgkQiAj02GUuCW?=
 =?us-ascii?q?wkVQE52ECsEFBdtKG4fFR42ERIXDQMIdh0CESM8AwUDBDYKFQ0LIQVXA0cGT?=
 =?us-ascii?q?AsDAhwFAwMEgTYFDx4CEC4nAwMZTgIQFAM+AwMGAwsyAzBXSwxZAwkDBwVJQ?=
 =?us-ascii?q?AMLGA1IESw1FBsGP3MHohoDLUCCZIEOLJhRjAmCHaBAB5AQlQZNhVekCgsjm?=
 =?us-ascii?q?ASLFoJMlSdmhDACBAYFAhaBagQvgVtwgzcJSRkPjjeDYZAZJDICOQIHCwEBA?=
 =?us-ascii?q?wmLSQEB?=
IronPort-Data: A9a23:kxHC1q41RvEaV75s+yp+lwxRtKTHchMFZxGqfqrLsTDasY5as4F+v
 mJKC22GOqmDMTGjetsnaI6+8xxTupLdn941QQJq+ypgZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyKa/lH1dOG58RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wq+KUzBHf/g2QvajNOuvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95fKAWfi6Ouq7nbXUHjgmf8xCREtEqchr7Mf7WFmr
 ZT0KRgXZRyFwumx2r/+F69nh98oK4/gO4Z3VnNIlG6CS615B8GYBfyXu7e03x9o7ixKNejfe
 ccdbCd1RB/BeBZIfFwQDfrSmc/x2CKuK2QH+Az9SawfxjWP3U9P06TWasvuVd6vHvV5rmDEn
 zeTl4j+KkhKaIPAodafyVqVh6nknS79cJ0TErGi9+BnmhuYwWl7IAUbSVah5/ywkE25c8leJ
 kkZ/DFopq83nGSsVtT7UhiyrXKIsxJZV9dOHukS7ACW1rGS5B6UAGUBRDNNZNEq8sgsSlQCz
 FaL2dDpCDlHv7icSHbb/bCRxRu7OjUOMWIYNXdUZQQA6tjn5oo0i3rnVd9lEqekyNb1GC3qx
 DyDhCU/gbsUhs4Kz7799lfC6w9AvbDTRQIzow7QRG/gs0VyZZWuYMqj7l2zAet8wJixQ3me4
 SEjouml/cMNAcuHyyndW8onJeT8jxqaCwH0jVlqFpgn0j2i/X+/YIxdiA2Swm80b67onhe0P
 SfuVRNtCIx7ZyT1MPcmC26lI4F7kvi6TIWNuuX8N4IWOvBMmBm7EDaCjHN8Mkj3m0Qq1Ko4I
 5reLICnDG0RDuJsyz/eqwYhPV0DmHhWKYD7HMCTI/GbPVy2Py79pVAtawvmUwzBxPnYyDg5C
 v4GXydw9z1RUfflfg7c+pMJIFYBIBATXM6n9p0NK77YfVI5QgnN7sM9J5t/IuSJeIwLzo/1E
 o2VASe0NXKm3ySccFXWApydQOqxBcwXQY0H0dwEZAb0hCdLjXeH56YEfJx/Zqg86OFm1pZJo
 wotJa297gB0Ym2foVw1NMClxKQ7LUjDrVzVZUKNPmNgF6OMsiSUoLcIiCO1qnlXZsd23ONjy
 4CdOvTzGstaH1U+VJ2INppCDTqZ5BAgpQ67ZGOQSvE7Rakm2NECx/DZ5hPvH/wxFA==
IronPort-HdrOrdr: A9a23:847kSK5lKIuNfP8qpgPXwM/XdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstD4BmaNykCsS48izPIdeod/A==
X-Talos-CUID: 9a23:bVXQ32xBQGVaxWZ4EF5rBgUZOt94K1rk7UzBAEy0U2w2Te2OZnWprfY=
X-Talos-MUID: 9a23:ppDxoATakKGCDzirRXTJ2W1zd/lr/5/0GXsik7Bdi+W0E3BJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.03,187,1694736000"; 
   d="scan'208";a="163901786"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by alln-iport-7.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 11:26:58 +0000
Received: from sjc-ads-6897.cisco.com (sjc-ads-6897.cisco.com [10.30.218.17])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 38TBQvjf031790
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 29 Sep 2023 11:26:57 GMT
Received: by sjc-ads-6897.cisco.com (Postfix, from userid 1822629)
	id 6CBB5CC12B5; Fri, 29 Sep 2023 04:26:57 -0700 (PDT)
From: sanjay.chitroda@einfochips.com
To: openembedded-devel@lists.openembedded.org
Cc: peter.marko@siemens.com, akuster808@gmail.com, Qi.Chen@windriver.com,
        raj.khem@gmail.com, Sanjay Chitroda <sanjay.chitroda@einfochips.com>
Subject: [meta-oe][PATCH 2/2] grpc: set CVE_STATUS for CVE-2023-32732
Date: Fri, 29 Sep 2023 04:26:52 -0700
Message-Id: <20230929112652.2898181-2-sanjay.chitroda@einfochips.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20230929112652.2898181-1-sanjay.chitroda@einfochips.com>
References: <20230929112652.2898181-1-sanjay.chitroda@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.218.17, sjc-ads-6897.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105238

From: Sanjay Chitroda <sanjay.chitroda@einfochips.com>

CVE was introduced in v1.53.0 and not backported to v1.50.x branch.

NVD references PR which introduces the vulnerability:
Introduce by: https://github.com/grpc/grpc/pull/32309 (v1.53.x)

Signed-off-by: Sanjay Chitroda <sanjay.chitroda@einfochips.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
index 958992e1e..e05a0b1fb 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
@@ -30,6 +30,8 @@ SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BR
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
 
+CVE_STATUS[CVE-2023-32732] = "cpe-incorrect: CVE was introduced in v1.53.0 and not backported to v1.50.x branch"
+
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE = " \
-- 
2.35.6


