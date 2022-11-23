Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5292C43217
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 06:53:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.14356.1669186406195724172
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 22:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Qbcju5QS;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669186404; i=@fujitsu.com;
	bh=pIaoKDTFeYvnj6bbrLjSI0jv0nbegQSD7jl4X7N/QF8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Qbcju5QSvy5tRawKl0Cxtp0lN7KORaOjZzx8QL9826miOBSzQL5zisN0UdU3hGzQk
	 G3XX9vQwDzDMQX0n5ms/utH/WixvcUcpW9uNG9ZUQ2N0K1rL4h2dXKPGB8lhL3AF41
	 mdG7hSDf8KAIduzxVpkL66r3lc7bcOlSLvxA+RDJkbo0pGC5b9X4xEl8Dky46RQlh0
	 my3i0S0M78SnbxT0bERmfNdGk7GAspOhbgwW7ghPPj7u7/+Hqd5Re2Kx5L433ncVz0
	 ZN8MQsTPe2ZtQe/42DwYVS7pa9ikRAIiuZBlH662lgE3gC8MHRHZxb3CcSOo0Pt/Gv
	 qu/JlNs1wMTwQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8ORqJt8uDb
  Z4N4pXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePnqbqCI5wVm/deYmtg/MTRxcjFISTwhFFi
  w5LNrBDOdSaJGxNuATmcQM4BRokPR3lAbDYBBYmFW8+AxUUE9CWWzt7DDGILC/hLzPqxlQXEZ
  hFQlZh8YhZYnFfAXWLz8+tgtgRQ75SH76HighInZz4Bq2cWkJA4+OIFUJwDqEZRYvZ0eYjyCo
  lZs9qYIGw1iavnNjFPYOSbhaR7FpLuBYxMqxjNilOLylKLdA3N9JKKMtMzSnITM3P0Eqt0E/V
  SS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECAy6lWHHrDsYby/7oHWKU5GBSEuXV2lyb
  LMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV2cDUE6wKDU9tSItMwcY/DBpCQ4eJRHeHweA0rzFB
  Ym5xZnpEKlTjLocM7+2HWAWYsnLz0uVEuflAMaSkABIUUZpHtwIWCReYpSVEuZlZGBgEOIpSC
  3KzSxBlX/FKM7BqCTM23UIaApPZl4J3KZXQEcwAR2hZlEFckRJIkJKqoFpX3PcnLXiS32qXf6
  cMVgw4bW/zsrFkdsmSMoH+xkyTNB3SFlxXvfAG+N3/17olYsEXwo8p6AifMeraeE6LUe+b7wc
  s8uFk56vW/M+cnNFxKSftQ4zinv1Hx99/y+25OYfi1LHw0ffdNfkTmsuMwwNXf0tI8fduirxp
  +nfK7P2Mz8/03yUr7YjtMCtOGP/xv2T6hSndC6o93q9oizsy8HTH309+IsUEl135Cr8eaVbs7
  Bzcxy3i5zc7q427WT51VyfSvWN1l0Li9FN+nBaLHSaFYf/BpEj/P/nsOX3LVW2Ct2hd2KhZq1
  6a5JXiNbLH1eK2iwtvl3Z+Eo/W/kktyK3sdJux91HXeqWm+emKiixFGckGmoxFxUnAgDb5iIK
  PwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-571.messagelabs.com!1669186403!49210!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9800 invoked from network); 23 Nov 2022 06:53:23 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Nov 2022 06:53:23 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 73AFF100182
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:53:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 67E91100043
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:53:23 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 23 Nov 2022 06:53:22 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pywbemtools: upgrade 1.0.1 -> 1.1.1
Date: Wed, 23 Nov 2022 14:53:16 +0800
Message-ID: <1669186396-2989-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:53:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99695

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-pywbemtools_1.0.1.bb => python3-pywbemtools_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_1.0.1.bb => python3-pywbemtools_1.1.1.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.1.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.1.bb
index ea9d6528d..1d449cb0e 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.1.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "3fd2fec6a11992afb8a34c0181b76c8d36c6fae1b79d83fb4542ce08e0fb4127"
+SRC_URI[sha256sum] = "aacf4bfffa872bb0e3d0c19ee0630e3c0997d4f13553189b63b297787341735f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


