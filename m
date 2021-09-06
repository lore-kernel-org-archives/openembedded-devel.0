Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.16859.1630890745433506233
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 18:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iGSH3C7f;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630890743; i=@fujitsu.com;
	bh=9lAImK10WkgRsmV74n04EcKmFYd+KCge+yO6Jt9+lvE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iGSH3C7fmA5yn3cn04fCu/u4dav2reZCfbLz55NksTN+ysJgT1WkoNILe4fXo7qRo
	 VwkBrpeLUqVYXgbAA/ebRMRPc0rJBuApmqpH/hMdDnw9Fbkefml3Ps5LwDzQVhSbmM
	 SXbZy+3tWUTykJeXJKVrdq0W1ghEymkeOh+FSSsilUy5ilhyc8p9HxXEU5g4MsLZHn
	 E1JykF8akeBQdAIfZFTiLcoo4G+bo6CBgN4oLlJM8FBf1wJyo4svTIDNv+RsYfWqsm
	 9wepM6iXiG5A/HyeevUpITVLkgP9jVYUbPnuVSSo5QzGR+EJiXSPLAxhirtt2YgdfK
	 IV5HxOMaHNkCQ==
Received: from [100.113.3.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 50/D2-23460-6FA65316; Mon, 06 Sep 2021 01:12:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxVfdblmm
  iwbQ1khYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bBFzkF07kr7p+6zdLAOJ2ri5GLQ0hgFpPE
  vteNrBDOcUaJ97OusnQxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO4gtLGAvseXMD
  cYuRg4OFqD4vjP1IGFeASeJAzNus4HYEgIKElMevgdr5RRwltg4cRojiC0EVLPv7nsWiHpBiZ
  Mzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MExj5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBx
  dQwMDXUNDY10jXVNDvcQq3US91FLd5NS8kqJEoKReYnmxXnFlbnJOil5easkmRmAwphQyGe9g
  vPb6g94hRkkOJiVRXg0700QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxl6UA5waLU9NSKtMwcY
  GTApCU4eJREeC9lAqV5iwsSc4sz0yFSpxh1OTbPXbqIWYglLz8vVUqc9wBIkQBIUUZpHtwIWJ
  ReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM2xoPNIUnM68EbtMroCOYgI5oe2gCckRJIkJ
  KqoHJe9HpuO/XOKKjYxdYtWu3JZ79dn/yno375WcVL1xuV/Xo0IoTK/qavB9uZfy607MzQVJz
  /pMIYdcLvMZtYp3y6qqiKqffzZkuH7XBcPmEP263enxnMatG//zfe/ry0x0Nc0VO/Ey8FV3Te
  CdmzcVZ0W/lbyzdrDTXr2LVuzeTcic9sTi0ZbeZo8mjznXiH6we7m29n/tOVaGHrfaRZ+oLw9
  TdYUILT5x7zDRhZYn05RfNITbRGn+MDoqt0Dvrcezc1nMtbw4sFQ6Pm/1xjWWK2/tA0ZhDTzV
  0Lx5du03v8YdXlXbPp+1vfZBYd25/3EYGz5zZO1eFHbDfvrvx0wWLl2VbUg5UnN9aEpzD/N99
  12wlluKMREMt5qLiRABsPaMyTQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-228.messagelabs.com!1630890742!334980!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 345 invoked from network); 6 Sep 2021 01:12:22 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 01:12:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1861CFwg013497
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 02:12:22 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 02:12:17 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cjson: upgrade 1.7.14 -> 1.7.15
Date: Mon, 6 Sep 2021 09:11:58 +0800
Message-ID: <1630890720-12064-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630890720-12064-1-git-send-email-wangmy@fujitsu.com>
References: <1630890720-12064-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Fixes:
Fix potential core dumped for strrchr, see https://github.com/DaveGamble/cJSON/pull/546
Fix null pointer crash in cJSON_CreateXxArray, see https://github.com/DaveGamble/cJSON/pull/538
Fix several null pointer problems on allocation failure, see https://github.com/DaveGamble/cJSON/pull/526
Fix a possible dereference of null pointer, see https://github.com/DaveGamble/cJSON/pull/519
Fix windows build failure about defining nan, see https://github.com/DaveGamble/cJSON/pull/518

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/cjson/{cjson_1.7.14.bb => cjson_1.7.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.14.bb => cjson_1.7.15.bb} (90%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.14.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
similarity index 90%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.14.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
index 0e33275e23..1a4e53d508 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.14.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
 SRC_URI = "git://github.com/DaveGamble/cJSON.git"
-SRCREV = "d2735278ed1c2e4556f53a7a782063b31331dbf7"
+SRCREV = "d348621ca93571343a56862df7de4ff3bc9b5667"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

