Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web08.3571.1625121447778277518
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jun 2021 23:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yOu9K0oW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625121446; i=@fujitsu.com;
	bh=+65GhQVChUnnLAP7Es4imbJsqtHz455B930tSNaqweU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yOu9K0oW3Wvq5JxS9igieaVfQGB5itgnvVt1A90Bv7JP9Cm7EQ4aNf124v/daTcjf
	 iJxvgoGFBC3ubvnAmgjfuFF4mEcrkwts39raxQMe4AKwr6j8SC7FEN/PzcRkFdL9l5
	 2hLCRiVx1NR/W8TBfflMKFyGRYNVi+N/h9HQYyvLEqnDNLB7JfLndSLy2kuZ/K+Ncb
	 Uumc/109Nkjxd5j0NslgFwRrPivsZBZg9riRITuEg4urI17ogWsvWlWKSMR8OvHo0j
	 pqLTyiMURhzYoSbsOe1cfXI9VEbXG1YprdmEFVdxGOpj5aj1MCiZDag88V64bD0MoH
	 BCz6h3Vl1juqw==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id E5/7E-45811-5A26DD06; Thu, 01 Jul 2021 06:37:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MxVXdp0t0
  Eg9vHpSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owZB+YwF3TwVjy/2sPewPiGu4uRi0NIYBaT
  xNSdkxi7GDmBnN2MEocbrEBsNgFdiXOP17KD2CIC+hJLZ+9hBrGFBXwlnm3bDRZnEVCR2HtvE
  SuIzSvgIXHz/EwmEFtCQEFiysP3zBBxQYmTM5+wgNjMAhISB1+8AIpzANUoSsyeLg9RXiExY8
  Y2tgmMPLOQdMxC0rGAkWkVo3lSUWZ6RkluYmaOrqGBga6hoZGuoaWpromZXmKVbqJeaqlueWp
  xia6hXmJ5sV5xZW5yTopeXmrJJkZgCKUUHNbbwTjhzQe9Q4ySHExKorzvou4mCPEl5adUZiQW
  Z8QXleakFh9ilOHgUJLgbU8AygkWpaanVqRl5gDDGSYtwcGjJML7KAIozVtckJhbnJkOkTrFq
  Mvx7ufiRcxCLHn5ealS4rxtiUBFAiBFGaV5cCNgsXWJUVZKmJeRgYFBiKcgtSg3swRV/hWjOA
  ejkjCvLcgUnsy8ErhNr4COYAI6YtGTmyBHlCQipKQamFRmmut2Z4uszDqdUMOXOuGw7sU1Fo8
  WLN8+NbDToYDDxyreN9RDsEh97h1xzYbDvB3N4Z+8fT5Oe3tKQ/1bxssV7z9yHulRd1k0ddHR
  fTKLvcTeLYgzWHZyesXi0mlZO10tPBtWdx5dMO3inF5XHRFRo9+vki7aevqbbiiyvSn9nCHwn
  fsGqz/RAocDj/kFdyr9izU/Mlfu6b4dLz64O5X2nW+rcpdetI9zbcZ2tXscNYIJil9WC//oe8
  WkqeN1eodA4S32wjDB3r3MoSJs/wM6FbdYWFlr7Zl1Y8O5S6Vppz6mWxzc9vqJ/5/2v4/mK92
  W9JJ4/Zq/Z3PMBsdMhS8zBKttKr9edTgcpDTPR4mlOCPRUIu5qDgRAEF+77MoAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-271.messagelabs.com!1625121445!59927!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12020 invoked from network); 1 Jul 2021 06:37:25 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-17.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Jul 2021 06:37:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1616bOA2018798
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Jul 2021 07:37:25 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 1 Jul 2021 07:37:22 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-urllib3: upgrade 1.26.5 -> 1.26.6
Date: Thu, 1 Jul 2021 14:37:16 +0800
Message-ID: <1625121436-86814-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

1.26.6 (2021-06-25)
-------------------

* Deprecated the ``urllib3.contrib.ntlmpool`` module. urllib3 is not able to support
  it properly due to `reasons listed in this issue <https://github.com/urllib3/urllib3/issues/2282>`_.
  If you are a user of this module please leave a comment.
* Changed ``HTTPConnection.request_chunked()`` to not erroneously emit multiple
  ``Transfer-Encoding`` headers in the case that one is already specified.
* Fixed typo in deprecation message to recommend ``Retry.DEFAULT_ALLOWED_METHODS``.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-urllib3_1.26.5.bb => python3-urllib3_1.26.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.5.bb => python3-urllib3_1.26.6.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.6.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.6.bb
index f2fb33c6dd..f9b49fe692 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "a7acd0977125325f516bda9735fa7142b909a8d01e8b2e4c8108d0984e6e0098"
+SRC_URI[sha256sum] = "f57b4c16c62fa2760b7e3d97c35b255512fb6b59a259730f36ba32ce9f8e342f"
 
 inherit pypi setuptools3
 
-- 
2.25.1

