Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.8454.1619071138731120625
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BWBuYWng;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619071137; i=@fujitsu.com;
	bh=piK00g4UP84EPBuCT6k5Ifpgyt7lfZdYqCjUBiz74LQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BWBuYWngF5o2ZQkg/YZKRWXfKwk4+4w8usqSZ7ZwEmnRjs/HsbzmgNBuyYzf17HhV
	 FawwV8KI73Ax2SJjqm7zxHbO5sHmU58pWa531GinKi7eE+SSrjwXJgTRK5lLTbgSeK
	 +RDFvvFEIDoiyxal2bl9oJSpd9tbEGbVQsR+Q6uACB9GWuzCKGWVutPKuhm/cFggd8
	 O53JLyPGHiulJyfax34kufVNXpK2f8vUuVB6yE/wCcCywvdRtkDAnej31hnnVIB2/o
	 co7rvIm9LffeC5r7z/JTkaDfVa8kx07nbo0vLjTS9uAb4Ndm4ygsNkOzYGUxq94ZHX
	 QN3Y8YKAYe9ig==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 2E/F7-53635-1A011806; Thu, 22 Apr 2021 05:58:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRortAoDH
  B4PsiDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPnyjbWgoWcFS9br7A0MK7j6GLk4hASmM0k
  cfn4JBYI5zijxMrTMxm7GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBSwlfsz4yQ5iswioSnz51
  wVWzyvgJnF+22JWEFtCQEFiysP3zBBxQYmTM5+AzWEWkJA4+OIFM0SNosT2nWdYIOxKie3Tzj
  JOYOSZhaRlFpKWBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tjXSNDEz0Eqt0E/VSS3XLU4t
  LdA31EsuL9Yorc5NzUvTyUks2MQIDKaXgwJkdjKdef9A7xCjJwaQkyruQrzFBiC8pP6UyI7E4
  I76oNCe1+BCjDAeHkgTvEZCcYFFqempFWmYOMKhh0hIcPEoivL95gdK8xQWJucWZ6RCpU4y6H
  KsOTF/FLMSSl5+XKiXOuxNkhgBIUUZpHtwIWIRdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqC
  TMexZkCk9mXgncpldARzABHaE9pRbkiJJEhJRUA1OsjWDNDdGeo1Lrfq+285ifM42drVTPT/e
  +xIYpXWFV1prte3dXFc1e9oXB70n+p9LAK/Mfz+XYmu5pe+TWHaP1Vh5iFYmd9mc5Jbx9Okp4
  1i53s8me57fQryNDeEvgq5Ir9883MG+vOHH3f6tv+oujklKs2cXTn+vMCj//UOnwKxbN3tbdI
  lPrtFz8XC/ze3CmMvFs9uFNjNvbusPE29F0zhydpxF1WrrT3hyxytuXIDDR9/LjZnP2/IkhZz
  t0hZ0CvszVNvu5PC7mU4g9e/W1q1eVK6/9bGgSLppRsqFxtmIaf++nPhvZh7wqR84tW7Qy+X3
  LHPEN0ULzBTL3fWfacnxNZyx7pemCE9OilFiKMxINtZiLihMBYw5R6SsDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-271.messagelabs.com!1619071136!1925265!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30642 invoked from network); 22 Apr 2021 05:58:56 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 05:58:56 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M5wuib032490
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:58:56 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 06:58:54 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nss: upgrade 3.63 -> 3.64
Date: Fri, 23 Apr 2021 01:58:48 +0800
Message-ID: <1619114328-5000-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.63.bb => nss_3.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.63.bb => nss_3.64.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.63.bb b/meta-oe/recipes-support/nss/nss_3.64.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.63.bb
rename to meta-oe/recipes-support/nss/nss_3.64.bb
index b7192a46d1..ff90d2caf9 100644
--- a/meta-oe/recipes-support/nss/nss_3.63.bb
+++ b/meta-oe/recipes-support/nss/nss_3.64.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "182d2fef629102ae9423aabf2c192242b565cf5098e82c5a26cf70c5e4ea2221"
+SRC_URI[sha256sum] = "d3175427172e9c3a6f1ebc74452cb791590f28191c6a1a443dbc0d87c9df1126"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.25.1

