Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.3413.1620958343740725060
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 19:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=POTJWIjk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958342; i=@fujitsu.com;
	bh=mQqyQ/DD2gwvu7KqMbJFFq9XNHw4/Z0WwzL991iPsOo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=POTJWIjkEigIO10qdajTmiK3ecjA+Pwqea0D2fQshFGaymcLEgrjCEXjDQgeV0KKm
	 M8l6TitAinHRGbL9ilWEI3Nqf7BOj5Qy6jLecSKAtUXo1ADiU++wBJbh6CiStLbArP
	 8uHraapX9wc7AEGwDN38DrCMQwJNFq15afV4YYDgkkQ2DZaeMhuFoAoMrufxO3hPxw
	 v2zkHnwm0IDCLalFCu8DqkQmlmkDoGMHi9FJscngdyiXlZ2CVdSlJ6GVQMb5hGu79M
	 nBhVBLr2bE9yqExYlyCkcMZRH8HcPZYjGhEB6duZtkLZmU4K3z+7FIQ2pgJeKi+DZG
	 zpIEbO7/K5lbQ==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 5D/6D-57985-48CDD906; Fri, 14 May 2021 02:12:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MxVbflztw
  Eg303VS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyJl9+zFBzmqOjZfYGtgfE5excjF4eQwGwm
  ifWz37FCOMcZJQ5M7WXqYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFnCXWPzuByOIzSKgKrG44
  TEriM0r4CbRtWIOWFxCQEFiysP3zBBxQYmTM5+AzWEWkJA4+OIFM0SNosT2nWdYIOwKiRkztr
  FNYOSZhaRlFpKWBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2NdU11jUwM9RKrdJP0Ukt1k1PzSoo
  SgbJ6ieXFesWVuck5KXp5qSWbGIGhlFLI+nEH46HXH/QOMUpyMCmJ8p70nJ0gxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYL3+625CUKCRanpqRVpmTnAsIZJS3DwKInw/gFJ8xYXJOYWZ6ZDpE4xh
  nO8WbtkETPHWzDZdu8ukGwHkzMXHFzNzDELTN5vPwQkH4BIIZa8/LxUKXFe4dtA4wRAxmWU5s
  Etg8XtJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvFdBjuLJzCuBu+kV0LlMQOfemD4L5Ny
  SRISUVANTxZ5XS31vK03/uGoqi9vT+hjt9Zm1xz5u0HO+9UCP857oo33WwjlO0Wd8ip/OOHld
  6c2sW888wt3Pf3LNDz7svefq0l5HJ/9XDOmpkytOreqo2u38xS23WtyRJUNN6o1b3yRJv793l
  d7IBTVbvJa4y7ln5vGKc7Hf/yy88rNh7sWPZyamOV1m+MGgwFTT7Bp4PWX3GbUbL+LW2wuEVw
  owBvcZ/uRy7EuQMtxmsbBk9+2zB/veLTxxpSOtt1tsV/TNNcwLe5a/c/73WUO620ZmzgXjupm
  RG9lkExSvWR5dv0LM477txt5Lh/dZHK/WO6WVdv7RVf23n5stgyc7n7OYPNXsvH6+8oPrXRO8
  2G6/UmIpzkg01GIuKk4EAMU5owhWAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-248.messagelabs.com!1620958340!351479!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14208 invoked from network); 14 May 2021 02:12:20 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:12:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2CCBK027412
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 03:12:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:12:16 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] ifenslave: upgrade 2.11 -> 2.12
Date: Fri, 14 May 2021 10:12:09 +0800
Message-ID: <1620958329-7791-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../ifenslave/{ifenslave_2.11.bb => ifenslave_2.12.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ifenslave/{ifenslave_2.11.bb => ifenslave_2.12.bb} (93%)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb
similarity index 93%
rename from meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
rename to meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb
index 0db9e8a0a7..db2d3a9648 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.12.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=acc89812938cf9ad6b1debc37cea0253
 inherit manpages
 MAN_PKG = "${PN}"
 
-SRCREV = "c26e9310f552e69d0d44eb48746e02c9ae4b4f6f"
+SRCREV = "88410a7003c31993e79471e151b24662fc2a0d64"
 SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

