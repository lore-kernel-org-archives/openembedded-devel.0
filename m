Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.24927.1627264071899687493
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jul 2021 18:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wgHLE5d9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627264069; i=@fujitsu.com;
	bh=wmLFNB1SRMnIANhZYnbB/dTXtbodTSb3mrY9jGvuQJY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wgHLE5d9owHkMmgZaMBRBAd/lDOcgFcvXbgDaWfIR1sNzCOisw4h9MrVFEZvhR0jk
	 R2h3DI1U+JzmxV1+XGFRO+is9h0hyon5r5+y2Y8bP5oQnKV/HleuSy/xCTcoIr05oF
	 Ea5fGSe12qCnnm3ZFHu8rbCXWF77wuBTpMA1mVonRdRI1B5BlpvxExOvgxcFDRkxH8
	 FEHN2RdNcz3PNofzvXw4X2nZPwThrcP9J7I0fjPJSXWiTT98uEjg5TOcudhNaiQIdL
	 naHRLPRZbQ9Ae8rrPlIXagOIMZqz/nTChqM7nvv4g6RUhw4zb/UPmi1USno/L8QCEj
	 AOa/BoQNjJU4A==
Received: from [100.113.6.138] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id D5/F5-25437-4441EF06; Mon, 26 Jul 2021 01:47:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYousi8i/
  B4O1sGYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNnzRGmgsWcFTt/tTI3MJ7g6GLk4hASmM0k
  0dTWzQTh7GGUaFh9irmLkZODTUBX4tzjtewgtoiAvsTS2XuA4hwcwgJhElumZoKEWQRUJa5c3
  sIOEuYVcJdoXmkDEpYQUJCY8vA92BReAUGJkzOfsIDYzAISEgdfvACbIiGgKDF7ujxEeYXE68
  OXmCcw8sxC0jELSccCRqZVjJZJRZnpGSW5iZk5uoYGBrqGhsa6prpGJoZ6iVW6SXqppbrJqXk
  lRYlAWb3E8mK94src5JwUvbzUkk2MwCBKKWT9uIPx0OsPeocYJTmYlER5+9b+SRDiS8pPqcxI
  LM6ILyrNSS0+xCjDwaEkwWsp9C9BSLAoNT21Ii0zBxjQMGkJDh4lEd4IXqA0b3FBYm5xZjpE6
  hSjopQ4b74wUEIAJJFRmgfXBouiS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEed1ApvBk5p
  XATX8FtJgJaHFw/V+QxSWJCCmpBiZpdWUtt7/VPltX1Do63O27w1NS9eHFGa2ku6l33HLmG3Y
  c26f9Se2Q3cyp7x4265xIuhrysLfwVHWrwTVBTSWFh2sdLnSn3t3A9TrJ/cjsBavmfpW32rdc
  cZHWiaWBczPdwnrM9878Yncgc0GDSrDGZCf18AsuO358Wvr4R/01y6lHWzh8nR27V1w69d1ue
  ivD7DhFH5tzXVILxQ0UDpS88LzHIRYT4zHjfCt35QmD4h3LhBbOf1sbLL5f0/7ExOJVj1Pn++
  t6LQw4s930b9yF7u/Gvbqya9WWRl6wb7PYvrh8XfSXNW47Mp6I32oWuxdZbmx86ujnbz/0LDy
  ffo44k7DxQAffc6t7dbW6m2crsRRnJBpqMRcVJwIA5NNIgh0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-248.messagelabs.com!1627264067!378095!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18301 invoked from network); 26 Jul 2021 01:47:48 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Jul 2021 01:47:48 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16Q1lloN016742
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 02:47:47 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 26 Jul 2021 02:47:46 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.2.0 -> 1.3.0
Date: Mon, 26 Jul 2021 18:47:41 +0800
Message-ID: <1627296461-3860-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

1.3.0
Add support for Sanic versions 20 and 21 #1146

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-sentry-sdk_1.2.0.bb => python3-sentry-sdk_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.2.0.bb => python3-sentry-sdk_1.3.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.2.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.0.bb
index e86ff46be4..ce62dedd79 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
 RDEPENDS_${PN} += "python3-urllib3"
 
-SRC_URI[sha256sum] = "9907adbdd30a55b818914512cc143e6beae0bb3ba78b2649f4b079752eb0e424"
+SRC_URI[sha256sum] = "5210a712dd57d88d225c1fc3fe3a3626fee493637bcd54e204826cf04b8d769c"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1

