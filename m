Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.3190.1627007067511109249
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 19:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=O1Ft6+6b;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627007065; i=@fujitsu.com;
	bh=V8bI72a1byGXP8pckN+O6rrn0dEZ99dnkKiPu00WN6M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=O1Ft6+6bCVZ6NcfkyAKKAATd/qOvbu5cWFGjVXT1GULUtakRv7YlsJYJbmjZjtaWB
	 78ty1h/orvT1Rm+zy0Y1dZgzuxRm/LvFEOk25k3LQE3lVRrpmzppkXohRujXVh/HA1
	 JVb7akoCryf1HaIJLx+W/tPdKyEbhDEz9Q5NbZWw+r32czblEXcUUzH70mPvXdbuwH
	 DXAA+h2puvhi+W8tup4pjlCrtwiKbFaWHZ242ZHPIuW83uLcdBs1vPluuGoxE99Uzc
	 vE5g1AYm6tVKnBi/6O59FHn6L9nnb2BPabp+tXneoT012M9hahPANUyx6bShey5227
	 iTDfyp6vBaw0g==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 0B/91-03136-8582AF06; Fri, 23 Jul 2021 02:24:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYqhuh8Sv
  BoK9X1uLi4aXMDowe5zauYAxgjGLNzEvKr0hgzeh8sJ61YB5nxddr31gbGPdzdDFycQgJzGaS
  +NHziRHCOcEoMavpFXsXIycHm4CORMeLbhYQW0RAX2Lp7D3MILawQKjErqkNYDaLgKrErYXNr
  CA2r4CbxLLHBxlBbAkBBYkpD98zQ8QFJU7OfAI2h1lAQuLgixfMEDWKEtt3nmGBsCskZszYxj
  aBkWcWkpZZSFoWMDKtYrRMKspMzyjJTczM0TU0MNA1NDTWNdY1MjXUS6zSTdRLLdVNTs0rKUo
  EyuollhfrFVfmJuek6OWllmxiBIZSSiHz7x2Mj19/0DvEKMnBpCTKK3X4Z4IQX1J+SmVGYnFG
  fFFpTmrxIUYZDg4lCd4VMr8ShASLUtNTK9Iyc4BhDZOW4OBREuEtlQBK8xYXJOYWZ6ZDpE4xK
  kqJ8x5VA0oIgCQySvPg2mCxdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG+FCtAUnsy8Er
  jpr4AWMwEtPtX1E2RxSSJCSqqByWDljkWuq90CFzgWl69925t60yBCeKZOjrjqnfbjamyXz17
  I0zwnkZ71esLkD6Uzjp5+5GSwktG2xP/zGulLf3fxuFtf853Owbz0vrn5z3v937fGPG7NOaiq
  1TnnSsmjy9+jzrQvs5dr6r7SXp15bGGDxxQf+0Prd/7S+rxcvV3z+1Ul3/bzO6XSvm+/ZFd28
  oe13oGFtwoCVI9IS9x0ELBiYThmUKK2wmqajlKuOad8bIbd5xNrA+tvBh1YdSPMye7qHIUjYs
  eaJA7cC7ogcY/j5LvVryUZrhTLXWHdEZcvw+2osDZklSHXf0eLQxMeK+38b2Wy4rLEWruSrND
  m2swyq3V71Zj6YmZ/rJtQpMRSnJFoqMVcVJwIAAz9nlQgAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-228.messagelabs.com!1627007063!93467!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15868 invoked from network); 23 Jul 2021 02:24:24 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-3.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2021 02:24:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N2ON4b016681
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jul 2021 03:24:23 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 03:24:21 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-iso8601: upgrade 0.1.14 -> 0.1.16
Date: Fri, 23 Jul 2021 22:24:15 +0800
Message-ID: <1627050255-7192-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Add docs/ to sdist

Addresses part of #14

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-iso8601_0.1.14.bb => python3-iso8601_0.1.16.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-iso8601_0.1.14.bb => python3-iso8601_0.1.16.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.16.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb
rename to meta-python/recipes-devtools/python/python3-iso8601_0.1.16.bb
index c531fcc6d8..c72a10882b 100644
--- a/meta-python/recipes-devtools/python/python3-iso8601_0.1.14.bb
+++ b/meta-python/recipes-devtools/python/python3-iso8601_0.1.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyiso8601.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
 
-SRC_URI[sha256sum] = "8aafd56fa0290496c5edbb13c311f78fa3a241f0853540da09d9363eae3ebd79"
+SRC_URI[sha256sum] = "36532f77cc800594e8f16641edae7f1baf7932f05d8e508545b95fc53c6dc85b"
 
 inherit pypi setuptools3
 
-- 
2.25.1

