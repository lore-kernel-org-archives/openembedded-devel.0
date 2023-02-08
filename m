Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE0AC6379F
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:13:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.3818.1675843980985689480
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AqmgRt0+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843979; i=@fujitsu.com;
	bh=xrQWlTnCfyeXL6xEEaDQYzdjWjO+t0E+hQTZ++XpWts=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AqmgRt0+zdCxVV2cI/kWgSWSUceZztB/yQrboFJ5YJ/hj0WnBaXrOWBQLfW1YvyU6
	 YNasXJHI794jVI4bS6JY/Qcf8YBMQR55W7bG418n1XjCVRY9wrhLFo8VlmH1QTOh/r
	 89qp1F6UTBjCCmPhheFH+YdH5Vel+hPRopvt0h2DUY+3hCu4omM3EyclGNyC5dxVci
	 86X9IpPIEGLRrUiGMlnig0vmnQGNTrkGrdAQRpRRUsHiXv9qSbDm4Vu0nMdu45aHU2
	 QIj16Hb/IQnFXkLwL1TVRsgdhE15MmRsf3SJDIkVOmdHTvin1yaiC5sV1AfKMkWnny
	 E5d8sH/bABFtQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSbc78nG
  ywZ65LBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bN2TPYCiZyV3xaqd/AuJ2ri5GLQ0jgCaPE
  /FWdrBDODSaJxb2z2SGcPYwSM5Z+Yupi5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWCBOYuuKfrAaFqD48YkTwGxeASeJV/83gdVLCChITHn4HszmFHCWuPu0kwXEFgKqaWr9yA
  RRLyhxcuYTFoj5EhIHX7yA6lWUmH25mQXCrpRo/fALylaTuHpuE/MERsFZSNpnIWlfwMi0itG
  sOLWoLLVI18hAL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7Vk
  EyMweFOK1V7uYJzY91fvEKMkB5OSKK+n2ONkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8EeFAO
  cGi1PTUirTMHGAkwaQlOHiURHgjgdEkxFtckJhbnJkOkTrFqCglznsgAighAJLIKM2Da4NF7y
  VGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwBYUBTeDLzSuCmvwJazAS0OET1IcjikkSElFQ
  Dk+USh4+rpkxTn/zLQ3CWI/9hs0ezfzLNj52/JVol8UOrlXzYx7+r5joI6hyOLZwjo2D1vd9G
  LihKZ6JfjLlIALNtPof7A8Oebac+TFZvOq91Ri0zYjKP5D1uz0vXws8ZCE8+MD253X+j5an8d
  4ePLV8xK3JrqlSju/qx/XYC3Uctp6W+aJlW82NZzQIls/wJN3iUlCS2fcovf6P1y+TiZ9YfH0
  /MeqF/88x0+3cCSodEpb5FvRRm2V3m0buL852mbsOc6r0fckMnPO/ZtU74X/edEz4nXA3sfvf
  GCTdemr7k7OmZbv526z5NF2CZyv/j/of357l8K5e7yfxeJNdw/+kORR51T5nvtrPTWNNOJSqx
  FGckGmoxFxUnAgA5WVkSWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1675843978!23575!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16750 invoked from network); 8 Feb 2023 08:12:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:12:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C02D81000D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:12:58 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A70F71000C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:12:58 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:12:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.72.0 -> 2.77.0
Date: Wed, 8 Feb 2023 16:12:41 +0800
Message-ID: <1675843963-11324-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843963-11324-1-git-send-email-wangmy@fujitsu.com>
References: <1675843963-11324-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100985

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.72.0.bb => python3-google-api-python-client_2.77.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.72.0.bb => python3-google-api-python-client_2.77.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.72.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.77.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.72.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.77.0.bb
index d0e94d8fb..8e5ab75d0 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.72.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.77.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "0ddf4a44256d4516635578b93a9ac0dfba7d8bd357cd896e68ef9c549a840b2f"
+SRC_URI[sha256sum] = "f18e9dbb365f0485194a8daf5d60da2cff6a80ce2c9a694efc2b279922cb3dd0"
 
 inherit pypi setuptools3
 
-- 
2.34.1


