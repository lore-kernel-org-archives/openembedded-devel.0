Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9219ECCA47F
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 00:22:04 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.32478.1656634915091744760
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 17:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nhVlINnI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656634913; i=@fujitsu.com;
	bh=7AEd31OG1z7iA4FvlmYM8niZmx5tUX0e3iRghd0Um/0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nhVlINnISEY9lmqpe8y5WVrUVpYwMTtjtcZg+hvnc/bWk0YZ3jzrT/ui9fIF0tRaG
	 9w7aF6lCaJdeaNAtTrBlZcjTE5+183tgY+tbM9znZtnTQBysWb4w6pXjvDz4EmB+vA
	 nYoZOyfEUM7p8SiD6AYx7DhYT5kdAg3engdHKtyk2/fxrpDIldwBNS7E9DiIsI1TH1
	 vytYGN3n/96oYB53CUI00JzhhzR0HYf3zgLdecPzrCkGsv7QvvBKYTXPv7YDVCh1bb
	 b27XA9sxpfoF62JZmeF3ytslzQCcH1Hx99PIyXBMwu4Jc+5C3G0IjVijtw6cIWwO43
	 Pev4qC3oVbIoA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxSVfBbl+
  SwRJti4uHlzI7MHqc27iCMYAxijUzLym/IoE1Y+KReUwFPdwVL9+JNDBO4+pi5OIQEnjCKPFs
  zks2COc6k0T3/43MEM5uRolNa6eydzFycrAJqElMv3WDFcQWEdCXWDp7DzOIzSygIvHidw9Yj
  bBAnMSuJdfAbBag+Olz71lAbF4BJ4lHjXuZQGwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgixfMED
  WKErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIGRfxaS9llI2hcwMq1itEkqykzPKMlNzMzRNTQw0DU
  0NNW1NNM1tDTWS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAzLlOKEgzsY
  V+z7pXeIUZKDSUmUN/Lc3iQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryiNvuShASLUtNTK9Iyc
  4AxApOW4OBREuEtA0nzFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqcNwqkSACkKKM0D24ELF
  4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmzQOZwpOZVwK36RXQEUxAR+yctgfkiJJEhJR
  UA1ObbIVbXqjyTLGaea+Xn58g/PTB42+7Zn37HXg+vHTX0j0hSzsfthwUNo7bpGIsJmvRseF7
  m6rICoW6WVHF4tGpguJfV4jl1fNrtb90cvomqeMt8cTPt+G1+0/9+0qqoRrdYhqtie0OXOFJP
  pbBC8v//+KOszgax3zf74YQz/GECzNnpN3cca4+0vVCl4Wzx4P7Xqr9kwz2O1p55e6dq/s84+
  Hn7Z9tpMNeKR20+DTnR8bZy5vnuonvr3jkmzytWsxjpbLIqTz7Xr5rYf6tPEIz3PS+ft3kcyi
  uV2ea1N4JPSvsfmtO/d8ZznIww+mHc0LVloP6H04umb2qiGFrpTd3nfH8RFm7P/t2VOnfVGIp
  zkg01GIuKk4EAEAl8xVSAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1656634911!137337!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28353 invoked from network); 1 Jul 2022 00:21:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 00:21:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6C3B2100078
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Jul 2022 01:21:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5F719100077
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Jul 2022 01:21:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 01:21:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-googleapis-common-protos: upgrade
 1.56.2 -> 1.56.3
Date: Fri, 1 Jul 2022 08:21:23 +0800
Message-ID: <1656634887-17192-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 00:22:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97645

Changelog:
=========
Bug Fixes

    deps: allow protobuf < 5.0.0 (#112) (67b0231)

Documentation

    fix changelog header to consistent size (#108) (d315b9f)


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tos_1.56.2.bb => python3-googleapis-common-protos_1.56.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.56.2.bb => python3-googleapis-common-protos_1.56.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.2.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.2.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.3.bb
index 78b899ef1..95823ea48 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.2.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b09b56f5463070c2153753ef123f07d2e49235e89148e9b2459ec8ed2f68d7d3"
+SRC_URI[sha256sum] = "6f1369b58ed6cf3a4b7054a44ebe8d03b29c309257583a2bbdc064cd1e4a1442"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.25.1


