Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1F1C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:28:44 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.7434.1663640916923297023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lA4pdiz3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640915; i=@fujitsu.com;
	bh=hrHWEiZR3LH814wzXB/yNxPno3jvlNO9LfXz1h+sMKM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lA4pdiz3JlhKsT9Mxh7WoA03ELrIVRHtExOAEF4Lk7i+pBE0z3VPRYeXWXX/46Oft
	 10Oi0txe4Abc0KenVg62+YrFnySd2YqYfQ/ubHMduFS2lmb25yloCOMHuCrwTnSyjU
	 jId/z+4vmL9RehMSCTF6558AZO2uzjFLUBOovbg84RuGiB3ZLBb09yJEpZmg7AJDeZ
	 TO3zqiGI/eHdUqmZT7UsvlbR8jJr6RvGuXAXcSDuuaFrKy+hdtC9WTyBROc8n+Au1c
	 oqA9NzmOYdrdfSQJRK1tSIN1dH6zqnNO1x6pTb7qnn2JUPbzJGnBjUk+8ZbLodaumf
	 +xV5kBAUhCyfw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORpBukqpl
  s8OiUvMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHvxT22golcFR/XrGdtYNzP2cXIxSEk8JBR
  om32GyYI5wqTxN6p16GcPYwSW1peATmcHGwCahLTb91gBbFFBPQlls7ewwxiMwuoSLz43cMOY
  gsLxElMObyYEcRmEVCV6G2dyQZi8wo4ScyZuhysV0JAQWLKw/fMEHFBiZMzn7BAzJGQOPjiBT
  NEjaLE7MvNLBB2hUTj9ENMELaaxNVzm5gnMPLPQtI+C0n7AkamVYxWSUWZ6RkluYmZObqGBga
  6hoamukDSyFgvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwLFOKGap3MP7v
  /al3iFGSg0lJlJerTiNZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvvaBmspBgUWp6akVaZg4wR
  mDSEhw8SiK8cipAad7igsTc4sx0iNQpRl2OmV/bDjALseTl56VKifNaghQJgBRllObBjYDF6y
  VGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrycykBTeDLzSuA2vQI6ggnoiBsq6iBHlCQipKQ
  amMw+Sf7/5cJ3fFmse5jnpHnGEsziLFYOG97/OlV18f3EDwLTl5mJLbhjX/Hr7kPWy9ZOSbXz
  p4antq+Ozxe+6fWfN9vDPMf51jUZoQf7421s5imtPe3iHPEva6WIz4GO8tRaUfPoedzL4+47q
  Pjq8EyIKL0Zc2fVHrYFr4Iz+vqOPHUNnhnQJKzBWyZsGcEZNenpTkXDk15xug5PeM5sUp9fsk
  z7SWh7SewF553tD1nWCr7RPZW6h2el7E9Xk4uzf/K83nWg4ZjhRy4vw7sfpd/vDd8s8HHT/x0
  uHO935k2MfWE8/XFL1hvjAg7mhW7NT98lTP/D37r55tcPoWVlvikuAe9/uL+5e76XfcdbAyWW
  4oxEQy3mouJEAGhUTyBSAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1663640914!192752!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32113 invoked from network); 20 Sep 2022 02:28:34 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:28:34 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2AD5C1AC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:28:34 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1FAAF1B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:28:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:28:32 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.60.0 -> 2.61.0
Date: Tue, 20 Sep 2022 10:27:53 +0800
Message-ID: <1663640873-27824-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:28:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98891

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.60.0.bb => python3-google-api-python-client_2.61.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.60.0.bb => python3-google-api-python-client_2.61.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.60.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.61.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.60.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.61.0.bb
index 906bb86e4c..06758a7fac 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.60.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.61.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "ca770930a1a8fce969ffdc81910844705138e8d05e040ab62d4276a4b1baddea"
+SRC_URI[sha256sum] = "de0a0cb7bb18ebff5cf7dc782b48a488a14bd7684b538799f31bedab7de2b83f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


