Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.8516.1626081911388223369
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jul 2021 02:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wAV1cFYs;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626081908; i=@fujitsu.com;
	bh=CLQgmQke3Qt0YGekpOVKkWFuaO6ZRx2ky76W4X+p0xk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wAV1cFYsLbKvvAknaBox0UOMX7AAuk+W9oerTAxwILAt/OkVM1B8P/aUtxtv7d2Ev
	 /PrAzf++eBu+47Cx9YszomNX3LJfifXXpinc3s18DlukURcvgDNHIRDmIX8snC+fAT
	 9vESg1syWyqIfk435YfSCvFNBPtvocwnWZ3U8JdiNa1UxxbtIIUZJqIADKL4LbUODJ
	 xD8uEP+pHy600FekmA9U6cSdsQp4Ft1GUKhFoZPHi/wvkxKio1RV4cEEZxcQDaVH/1
	 yq3oaUxrDteI8GdbuEIYPLw4/ygENGj4KtYDr3aUstuW5OY2oPzoBHcB70QMDt1o5O
	 godz/+bQRsq9Q==
Received: from [100.112.199.200] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 35/3F-03155-47A0CE06; Mon, 12 Jul 2021 09:25:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0S3hepN
  g8Hy7qMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvF/ynbmgtMCFfen/WduYOzm72Lk5BAS2MYk
  8WJuchcjF5B9klHid/8/VpAEm4CORMeLbhYQW0RAX2Lp7D3MILawQJrEq7v/GEFsFgFViZM7J
  4DV8Aq4SWxt3swOYksIKEhMefieGSIuKHFy5hOwGmYBCYmDL14wQ9QoSmzfeYYFwq6U2DOrn2
  kCI88sJC2zkLQsYGRaxWieVJSZnlGSm5iZo2toYKBraGika2hpoWtsoJdYpZukl1qqW55aXKJ
  rqJdYXqxXXJmbnJOil5dasokRGEQpBcfkdjD2vvmgd4hRkoNJSZRX5/LrBCG+pPyUyozE4oz4
  otKc1OJDjDIcHEoSvJ4cbxKEBItS01Mr0jJzgAENk5bg4FES4V3LDpTmLS5IzC3OTIdInWJUl
  BLnzQLpEwBJZJTmwbXBougSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeBpApPJl5JXDTXw
  EtZgJaXLjjJcjikkSElFQDU2HYh4bt7V/W/Zrc0W+9c4nJrf2LpkpIC90u/vNzVkKesvZaxg8
  /Gm+ePqW5XPOY+keLexb7N366OOmp6pNXfK4flLg2+Ac63/V/3H4w9f7MmI8+XRM52H7v6D1U
  KFsa8MbkUl6mnEz0kTdnrtTPsSlWmFdc2yXSp/L66NTPQcKK9su+RM335E4s1Dyd6+kh8+6i8
  /NPgfPKqhQZjPbUOEYtErqlZ3RBi+9daPVydlnuXwI+rq9bjdk/WuY8WHd1EvOsKr/e3JadNj
  9bMpiKBV7GOUyeFe1QXr/wC8c+ycjP6zMDi6atXFZ0+r6WzH+NSdtPyHZuk0pJnXtfVyjvfLZ
  m/Mk1E9Y9abkutuKPrxJLcUaioRZzUXEiANBCw4AdAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-285.messagelabs.com!1626081908!518628!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6007 invoked from network); 12 Jul 2021 09:25:08 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-6.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Jul 2021 09:25:08 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16C9P22L008800
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jul 2021 10:25:07 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 12 Jul 2021 10:25:01 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.10.0 -> 2.12.0
Date: Tue, 13 Jul 2021 05:24:53 +0800
Message-ID: <1626125093-4376-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Features
artifactregistry: update the api bc9a38b (a933dad)
chat: update the api eea3c5c (a933dad)
cloudasset: update the api 2e31dd0 (a933dad)
cloudbuild: update the api 3a3b420 (a933dad)
composer: update the api 78c0d8d (a933dad)
container: update the api a54737f (a933dad)
datafusion: update the api f6bf3c6 (a933dad)
dataproc: update the api 3fde9a3 (a933dad)
documentai: update the api 79c556d (a933dad)
groupssettings: update the api d537f96 (a933dad)
logging: update the api d3548c5 (a933dad)
monitoring: update the api d24af68 (a933dad)
paymentsresellersubscription: update the api cff9039 (a933dad)
redis: update the api 46102d1 (a933dad)
run: update the api db18e29 (a933dad)
slides: update the api 68634cd (a933dad)
spanner: update the api 2895121 (a933dad)
storagetransfer: update the api 24895f1 (a933dad)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...ent_2.10.0.bb => python3-google-api-python-client_2.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.10.0.bb => python3-google-api-python-client_2.12.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.10.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.12.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.12.0.bb
index b406f677d8..67d05b5dd0 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.12.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[sha256sum] = "58424d263344625dcf4dc08e7639a6714737102ab4ae83e5f043e3db08d9965f"
+SRC_URI[sha256sum] = "a5d203241a93201a770c966f8eca39de7f88b28194f9d252065b18e83bd99c4b"
 
 inherit pypi setuptools3
 
-- 
2.25.1

