Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web11.4433.1626255244914959873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 02:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GJP0fUiX;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626255243; i=@fujitsu.com;
	bh=UKrgSzsd2+MlDN6IHy0vzvTO4Bt+P800iddziXvskYA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GJP0fUiXIdqPJIJi+ECOI0FPqbuyzEc0E9ZUg35bFtgsBWXNCCNXb3WhkDnoXpJeX
	 FfKxUnl5aaQjg7cmzkLHCLW78JMD4JviFawCguVjtSzt0xtAFraS0aWt29mUEoDLPK
	 tdc4q/QpJjlU9EjcoRb1fXunGKxN/DEDe3Rc+NMrw1V+HhjYoJEI+kamCjjNPWr61H
	 BJMO6IWVMl/KDeIMo88fx9HCv/72I7TMDUIHP8zteT7TsX48g77lmfcgBe5N+uB/YH
	 jUzUMNqvdf9jZLeX6NW53U/tgbANaSmqGJc/gZAvMaPyfk5poAKYGdKyJSYs0dxeIy
	 KEW7PsJRS4EaA==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id DB/0F-07821-A8FAEE06; Wed, 14 Jul 2021 09:34:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0e1a/y7
  B4HKzpMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHz9DzGgpOcFY+urGZvYPzC0cXIySEksI1J
  4udauS5GLiD7JKPE9VM9LCAJNgEdiY4X3WC2iIC+xNLZe5hBbGGBAImVfyYwgdgsAqoSh2fvY
  gOxeQXcJNrOfgerkRBQkJjy8D0zRFxQ4uTMJ2BzmAUkJA6+eAFVoyixfecZFgi7UmLPrH6mCY
  w8s5C0zELSsoCRaRWjRVJRZnpGSW5iZo6uoYGBrqGhka6hpbmukYmlXmKVbpJeaqlueWpxia6
  hXmJ5sV5xZW5yTopeXmrJJkZgGKUUHP25g/Hh6w96hxglOZiURHlv+LxNEOJLyk+pzEgszogv
  Ks1JLT7EKMPBoSTBy7j2XYKQYFFqempFWmYOMKRh0hIcPEoivO4gad7igsTc4sx0iNQpRkUpc
  V7vdUAJAZBERmkeXBssji4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuY9CzKeJzOvBG76K6
  DFTECLtde8BVlckoiQkmpgml8Tbuqys6F3zgOxbYwd/tYdG/5xSMRJfaqebLCrOmjzkVvLdzo
  ccXIrKEjUjdgyX5xhSuTuAjGRhA6WS38um+xlN5ds27/l5adlXukZ+UtuVH5d7dyny7PkeMQH
  aYeU/snNE7dXOm/6ODEqXWjb1KwuoexAFcH40MpJPx3bZi8NZ0h9lGcR4XQ1sFhqYarp/QOWp
  6629gSc2Ggnd/eA17FLx3i75A7d0KpPiN10MXJGxdObr14Fbmzlaeo8p7h4N+umtT1Ji7beil
  8+qcBVuPvP5MT3ffVSHI9nX1didIkpdcvyzZ/c+vLCjQ3P+zKW3DhWrnDWQr9+wozjFk7uOZG
  vnetOcqjP6Zn749p+JZbijERDLeai4kQAAzoGAR4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-287.messagelabs.com!1626255242!78897!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19529 invoked from network); 14 Jul 2021 09:34:02 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-13.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jul 2021 09:34:02 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16E9Y1MM023049
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 10:34:02 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 14 Jul 2021 10:33:59 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-configargparse: upgrade 1.5 -> 1.5.1
Date: Thu, 15 Jul 2021 05:33:53 +0800
Message-ID: <1626298433-4485-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

added get_source_to_settings_dict

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...n3-configargparse_1.5.bb => python3-configargparse_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.5.bb => python3-configargparse_1.5.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.5.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.5.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.5.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.5.1.bb
index 4da5288815..596d16fa4a 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "dded3590373b7dae6ce6d0afeb4ae3def74761fdd78730952863914d4cb4bdb5"
+SRC_URI[sha256sum] = "371f46577e76ec71a183b88378f36dd09f4b946f60fe60712f411b020f26b812"
 
 PYPI_PACKAGE = "ConfigArgParse"
 
-- 
2.25.1

