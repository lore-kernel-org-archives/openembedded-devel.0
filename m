Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.5295.1625794243610722251
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 18:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TNgrCK0m;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625794241; i=@fujitsu.com;
	bh=Obf27lLp1Hbq2cq7UImREYk+G8rPZYcqlO3UolwdkJw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TNgrCK0mJeRAFMuYKKNQqNX6izL/phXe4ZRNGeeidEdtE6+OzP4+RpBkAeKRLn/IJ
	 Cel0joqB5nyLW4gc9gzDYyRyfyVEXepIWyxDg5HsrXa4zZABZWRauiIaWoynb1gryr
	 quVT6t5DsqDOsZnlB+S+U0uUfiveznJdBwUixTC++pKtnb8q8xSq8+mIrfInRtnU3P
	 CeD59mt4aAhpqe+9ikESyjQhqaBHFqIlYUO9FnYgsHSbhgiGF/s5y+eitjnCIoJJtP
	 l/kb9jFmHC7LTaU3nm6Q8Jw1sOCQsXH2TFC4am8EpcrSIrNYZkJpgtHsKEz2iP6yZt
	 tigjKhbiz8TZQ==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id CE/3C-07211-0C6A7E06; Fri, 09 Jul 2021 01:30:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1T2w7Hm
  Cwf+/ghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bPf/eZC85zV8y5PZO1gXEjVxcjF4eQwCwm
  iVf3HzNBOLsZJV5ev8fYxcjJwSagK3Hu8Vp2EFtEQF9i6ew9zCC2sICbxNO2fywgNouAisSPv
  h9sIDavgKfE9m0fwHolBBQkpjx8zwwRF5Q4OfMJWD2zgITEwRcvgOIcQDWKErOny0OUV0jMmL
  GNbQIjzywkHbOQdCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKxroGtkaqSXWKWbqJdaqpucmld
  SlAiU1UssL9YrrsxNzknRy0st2cQIDKSUQoY/OxhXv/mgd4hRkoNJSZRXa8bzBCG+pPyUyozE
  4oz4otKc1OJDjDIcHEoSvEeWAOUEi1LTUyvSMnOAQQ2TluDgURLh5VwElOYtLkjMLc5Mh0idY
  lSUEufVXAqUEABJZJTmwbXBIukSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHe6yBTeDLzSu
  CmvwJazAS0mOHwU5DFJYkIKakGpp6/rTPb+xYpcn+OdWiZUO7epTFnjsTH3kvOJiHLKzfWuVb
  z7g2X53NZ0nW8so11j4Ppsx0n0xaes54lmfdYc9Wp1uLVvrOmJmY0JYduWxEnukNund6sEwvk
  HpQ4Hfp3q/uysBV7yN2/3THc13hVdqy6dJjzvNHsbx8v2xvc+Fq0XK27tLqVec0jW+0sBsf4b
  cyS2eH/+yO0+WZcclJexPEh48St9Ncz56hHZjFO396m8bK01tlczXLxwhzppjVRIW0Kx5izsm
  Os3m9rm7H80fMG+YVb1H29T7DZeV6o2D5V4t6ylyzNhk/DJ988cubR7cjdKwv3bnKYt3b5eoP
  9PaoSTmUl4r5nni7RCN1SqsRSnJFoqMVcVJwIAIh5v+UfAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-228.messagelabs.com!1625794239!348160!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22942 invoked from network); 9 Jul 2021 01:30:40 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-15.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jul 2021 01:30:40 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1691UWb0003964
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jul 2021 02:30:39 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 9 Jul 2021 02:30:30 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-qrcode: upgrade 6.1 -> 7.1
Date: Fri, 9 Jul 2021 09:30:18 +0800
Message-ID: <1625794218-102785-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

7.1 (1 July 2021)
=================

- Add --ascii parameter to command line interface allowing to output ascii when stdout is piped

- Add --output parameter to command line interface to specify output file

- Accept RGB tuples in fill_color and back_color

- Add to_string method to SVG images

- Replace inline styles with SVG attributes to avoid CSP issues

- Add Python3.10 to supported versions

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-qrcode_6.1.bb => python3-qrcode_7.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qrcode_6.1.bb => python3-qrcode_7.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_6.1.bb b/meta-python/recipes-devtools/python/python3-qrcode_7.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-qrcode_6.1.bb
rename to meta-python/recipes-devtools/python/python3-qrcode_7.1.bb
index df99d403d1..329bf3e4fa 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_7.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
 
 PYPI_PACKAGE = "qrcode"
-SRC_URI[sha256sum] = "505253854f607f2abf4d16092c61d4e9d511a3b4392e60bff957a68592b04369"
+SRC_URI[sha256sum] = "59ba630fa2adb637b06571e6ceec1bb0ecf372c458c4447ceba763061bd3af72"
 
 inherit pypi setuptools3
 
-- 
2.25.1

