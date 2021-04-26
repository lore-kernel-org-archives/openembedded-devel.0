Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web12.4094.1619425293780442731
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Apr 2021 01:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mfS4eNWa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619425292; i=@fujitsu.com;
	bh=y67FiVL1plkjczUmwJ0+BksSwQRt5o6VpAAhhUk4kq4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mfS4eNWaqTwnx9+BL6cnMN6JHA1ETJ6nX8mdw8BCNFCTgxs0ujws2z8TehX5Tey+P
	 7nhuLl0AeqnvrE6VZGB9687fropBjKJuS3ptzJQx8uTY8gx0rQZmgnxBZWvqQ6c4fC
	 ZDh1ZPVBj3PcWbDW94NyLTHUycLlznA+rf0OtHGJ/mftJX4Aynfla84GmhnKom6FxL
	 qpe32A049+4Q1VBc02P/pTmPpo2M7gSbkOlNObYUhAzzTzLz78+KTZmzQ7u7SUSAwx
	 RS6QSauqB3+2aAcTb0WnW02CVbwu48xyrOfr5hRVf9vAJkXuOC42CbzZYfSqpArrw+
	 ILdL2Wa+91wKQ==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 9D/81-01834-C0876806; Mon, 26 Apr 2021 08:21:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYqstd0ZZ
  gsPOMkcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFwwg+2gj2cFd9uPGJsYHzO0cXIxSEkMJtJ
  Yv3S/+xdjJxAzm5GiXvPpUFsNgFdiXOP14LFRQT0JZbO3sMMYgsL+El823eLBcRmEVCV2L7/J
  lgNr4CHxO0XG9hAbAkBBYkpD98zQ8QFJU7OfAJWzywgIXHwxQugOAdQjaLE7OnyEOWVEtunnW
  WcwMgzC0nHLCQdCxiZVjGaJxVlpmeU5CZm5ugaGhjoGhoa6RpamuqamOklVukm6qWW6panFpf
  oGuollhfrFVfmJuek6OWllmxiBIZQSsFhvR2ME9580DvEKMnBpCTKK5TdliDEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgle0FCgnWJSanlqRlpkDDGeYtAQHj5IIr3YRUJq3uCAxtzgzHSJ1ilFRS
  pzXpQwoIQCSyCjNg2uDxdAlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8KiBTeDLzSuCmvw
  JazAS0mK+uFWRxSSJCSqqBKWROn+an2mv+Tx4+TdmhY56boxO+iXH3nlMPWn+KNa8KZ7z2fNM
  OJ89rRWWbt+sdZLAQderfJFA3hX19rdXs4tZV7yUc/q6M+fV26drLWu9F9Q+Ktdnd/6zR0d30
  emp49gP3aNvVxgUi5fdkr12yVVPbrSxW/f+nnv86q5hoFX6nl1VR83kFc6/EVakHqezu+N7CE
  3F1u2Ngymz1a1Gmc5wjg1892jaH8yu7UO3pVw6t+UqMN1/YawarT54f+p/vDyvH0t1K3So/dk
  +dI+p8bo7tOw2nxv6m588eaXq9iq7IuN+7XuZlGmtA25JwxxT5DbYefl2SUzzFN+i8mMH9b/m
  PCONy/u8P9wpMmLpEiaU4I9FQi7moOBEARD7igxwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-271.messagelabs.com!1619425291!2194446!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5394 invoked from network); 26 Apr 2021 08:21:31 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-18.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Apr 2021 08:21:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13Q8LPox009618
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Apr 2021 09:21:31 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 09:21:24 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-supervisor: upgrade 4.2.1 -> 4.2.2
Date: Mon, 26 Apr 2021 16:21:14 +0800
Message-ID: <1619425274-76504-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-supervisor_4.2.1.bb => python3-supervisor_4.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-supervisor_4.2.1.bb => python3-supervisor_4.2.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-supervisor_4.2.2.bb
index 0ff4b35d90..6944ecb979 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/Supervisor/supervisor"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
 
-SRC_URI[sha256sum] = "c479c875853e9c013d1fa73e529fd2165ff1ecaecc7e82810ba57e7362ae984d"
+SRC_URI[sha256sum] = "5b2b8882ec8a3c3733cce6965cc098b6d80b417f21229ab90b18fe551d619f90"
 
 PYPI_PACKAGE = "supervisor"
 inherit pypi systemd setuptools3
-- 
2.25.1

