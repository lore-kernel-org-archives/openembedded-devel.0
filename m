Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F6EC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 02:27:05 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.5142.1647570421603586738
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 19:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xVtNTFtu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647570419; i=@fujitsu.com;
	bh=eAoEyeyOMybGRC6VLTnEGaBIpj2Dn798qDltwJHeomA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xVtNTFtuwoHAbH4p+4A5Nn0X68i9aWIYASyd4Hd4bMrfzLiAj/HAlMzcKu8JgISua
	 8wcwz5odaOuWfPV6N+g5Siv1JgN5ks0wa70CxfBWJXNMKuh1Vw2XKozR+QBk3lVXl3
	 rWtd6X8XpYzsKR4Dw9OxvzC2fEEn/huYtY9aOIU6wBAdkCbX6tTtyIVEohoMLAn+z8
	 2NFM5fleJQZb6v9GeYNfpgD6XLO+Ixi3bjkqJjuF2GVjcrkIlNC59Qqoa55AfqooKc
	 Jm05nNyd1fng99jo5KeuJAX7bRM6BfT2oCyOenhik3vzcRIZuThAUwu/PER75xKO2G
	 6XL+fbBmsHXIg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRWlGSWpSXmKPExsViZ8MxRffTW+M
  kgytnDSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyTv2MK7nFWnFh/iKmBsZmzi5GLQ0hgJpPE
  o4YtTBDOHkaJYwcPsHcxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPWI2wQIDEq/sfm
  UBsFgFVibt3/zCC2LwCjhKPF8wGq5EQUJCY8vA9M0RcUOLkzCcsEHMkJA6+eMEMUaMoMftyMw
  uEXSExa1Yb0wRG3llIWmYhaVnAyLSK0TapKDM9oyQ3MTNH19DAQNfQ0FTXzFLX3EQvsUo3US+
  1VDc5Na+kKBEoq5dYXqyXWlysV1yZm5yTopeXWrKJERhoKcWuXjsYj/T91DvEKMnBpCTKm3ff
  OEmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG/Wa6CcYFFqempFWmYOMOhh0hIcPEoivLeuAaV5i
  wsSc4sz0yFSpxgVpcR5bYCxIiQAksgozYNrg0XaJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjE
  rCvEteAU3hycwrgZv+CmgxE9DiRgEjkMUliQgpqQYmlr4E6ZDf39wY7vnNnZ+19t+Z+tJ+r6v
  7djxO4tP48uuPqKL/3n1r/IQ1w1iqD+jfepcQIZBk6PJy8qE1hzfL71k2Y9kBhqtZP268Cvcu
  KFpS2ejJ8Gx+3szMpmCZOwt+MSkFceS2PJY3tY+okOlf92CZeIK5w2/m1P9BlqZxbx5PV5nav
  +iD4O2jmvKOO3d91/S2KeQWiW9lDWgNPf/Qbn2A4y+rfdnbJ5050+eq9iLDdeqf9SdOJRc6hD
  tosB7o2mOhvlO38upLZv7JBmsMffyMNFOvzZV75s5ZdSK35oCM7LYfazROcyyw8Vh+OFi10Fz
  8c8WltYJfPts8l/w40Y/1wzrrRLZL8m922P9UYinOSDTUYi4qTgQAsO++9y8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-528.messagelabs.com!1647570418!6516!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11470 invoked from network); 18 Mar 2022 02:26:58 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Mar 2022 02:26:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22I2QrFw032753
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 02:26:58 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 18 Mar 2022 02:26:51 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-itsdangerous: upgrade 2.1.0 ->
 2.1.1
Date: Fri, 18 Mar 2022 10:26:40 +0800
Message-ID: <1647570401-7286-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Mar 2022 02:27:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96056

Changelog:
==========
Handle date overflow in timed unsign.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-itsdangerous_2.1.0.bb => python3-itsdangerous_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-itsdangerous_2.1.0.bb => python3-itsdangerous_2.1.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.0.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-itsdangerous_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-itsdangerous_2.1.1.bb
index 30d23c6569..ef1d7cc07b 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4cda9a0ebd516714f360b0e9418cfb37"
 
-SRC_URI[sha256sum] = "d848fcb8bc7d507c4546b448574e8a44fc4ea2ba84ebf8d783290d53e81992f5"
+SRC_URI[sha256sum] = "7b7d3023cd35d9cb0c1fd91392f8c95c6fa02c59bf8ad64b8849be3401b95afb"
 
 inherit pypi setuptools3
 
-- 
2.25.1


