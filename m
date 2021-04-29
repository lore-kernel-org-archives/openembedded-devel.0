Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.3027.1619678201076617875
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 23:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=X1wOUZPs;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619678199; i=@fujitsu.com;
	bh=YTmFGasxUkTTaLeMeNFRVAbIS8gbk15Zrcz4mjPHXfs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=X1wOUZPs+UK6Lya/9d81HTlI/9pXi1uVLI2VHwbEH2fVPJSRm/d/CpHPEOqP09MrR
	 Mm/ndEep0HB8boyQhE8s+EaPgqEMfnyRP3ADbb9AqIppw3/75l+YsrWgJMl0Fb8yTH
	 Ya/nBYNHbMspvSV57nN48tCI2nL65mfwqBIUiJTeu/4kQ4W+fhG6ZzyGUOxHskEtoI
	 5DKnMMuQYKhqAtzUjdUpyVE0sfsRT8cG8zb5TBImcQawTED4rbwwtciaD093xON0y+
	 M2Xdb4W5RQ48sCiXzAIlle1Ta6ZL27DruSsI54J2d0yyQgARVuNpln3mQNT5VMRrvz
	 6Dd/TjxFPH0Og==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id DD/3B-55623-6F35A806; Thu, 29 Apr 2021 06:36:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRWlGSWpSXmKPExsViZ8MxRfdbcFe
  CwYTN2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b9hrPMBas4Kg5fOsbSwHicvYuRi0NIYDaT
  xMwN91ghnOOMEld3nWbqYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFnCVmNTRxQZiswioSuyeB
  BHnFXCTWNZ1CSwuIaAgMeXhe6i4oMTJmU/A5jALSEgcfPGCGaJGUWL7zjMsEHalxPZpZxknMP
  LMQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGusa6RqaGeolVuol6qaW6yal5JUWJQFm
  9xPJiveLK3OScFL281JJNjMBQSilk/r2D8fHrD3qHGCU5mJREebd0diYI8SXlp1RmJBZnxBeV
  5qQWH2KU4eBQkuAtBQankGBRanpqRVpmDjCsYdISHDxKIryxAUBp3uKCxNzizHSI1ClGY44rq
  5YsYuZovgMkhVjy8vNSpcR5BUEmCYCUZpTmwQ2CxdslRlkpYV5GBgYGIZ6C1KLczBJU+VeM4h
  yMSsK8ASBTeDLzSuD2vQI6hQnolGXn20BOKUlESEk1MHnq237YKrDRMqih8M29B4ztywICHd2
  FHleHT9p7/8mXvOLEiNPMps/n806SKNk3K1m7yIXx0N+su0Xbdp/XWLE/KvTMotxGocMZnfkX
  VVRVsnJlZeVme885FB32pPnIxITPNv+u39rWt/tFEu+WaZfW/dvUKL4kxmix8FWnNhNvqZufN
  n3p/uPhIr6Z723ezPd33cuMtaL1drifNYjalT0h4rT/RJU0aR7xI8FJd1gcuvkqxLdXtEgbh+
  au3KkeYpasI6DTLW2p4C26fP09tiNM/qo5K80uvDyw7fLiy9c+fxBhnJ82fZYti++RWufIvKQ
  Nnprrd9nxZOr2XpkX/bxJ7Q3bw+1/MxQaXLTzlFiKMxINtZiLihMB9kMeMjIDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-24.tower-232.messagelabs.com!1619678198!11106!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28442 invoked from network); 29 Apr 2021 06:36:38 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-24.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 06:36:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13T6aS6G015325
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 07:36:38 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 07:36:26 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] babeld: upgrade 1.9.2 -> 1.10
Date: Fri, 30 Apr 2021 02:36:18 +0800
Message-ID: <1619721378-4541-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../babeld/{babeld_1.9.2.bb => babeld_1.10.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/babeld/{babeld_1.9.2.bb => babeld_1.10.bb} (94%)

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.9.2.bb b/meta-networking/recipes-protocols/babeld/babeld_1.10.bb
similarity index 94%
rename from meta-networking/recipes-protocols/babeld/babeld_1.9.2.bb
rename to meta-networking/recipes-protocols/babeld/babeld_1.10.bb
index a7d7fc81ff..5af4c31d12 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.9.2.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.10.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
 
 SRC_URI = "git://github.com/jech/babeld.git;protocol=git"
-SRCREV = "a1043879225ac205614259b480d7f577025d8bb0"
+SRCREV = "dbb8799d1b5b3bfaf4387386c92369c847704480"
 
 UPSTREAM_CHECK_GITTAGREGEX = "babeld-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1

