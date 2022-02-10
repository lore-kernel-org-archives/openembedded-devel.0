Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D5BC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 10:25:16 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.8398.1644488714964063945
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 02:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=N4J5WmJa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644488713; i=@fujitsu.com;
	bh=koyB/8TiLIAx0f39PpPf1cQNO6RMRLoH9dN1kI9ib1g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=N4J5WmJacwLk88qmgderBSfavC2NsmTiFHG5hzTnJP2C/0E35czPqEJUZ7wHwX16t
	 tNLc0HXZ5hpE/78toAIqBZdqiEXeHHkwjI/veyc7ImhCttJziKqoeRomYPB5k2UoNX
	 ftSbSztVckmt4OO1SgcHsklEbuD4NZqatOaQ9U9+5/imST0qR+v4wGk4o3/ZmWYeJd
	 QHKJJJV6QPbaENZtz2cHrRLYm+2lgcWB5Zuv6g7YhGZJRDAdU35Vg6KYKfuhDwRu8Q
	 3F6ElRklw7F/PVCmLsF/sOiCoXtgi6J8N495KqR1Cd/zZBbMwy/xVzAXoH3Oig8fDv
	 DOzwvsUf5asHQ==
Received: from [100.115.2.98] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 78/16-00700-808E4026;
 Thu, 10 Feb 2022 10:25:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSZfjBUu
  SwdE/ihYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZFedZCp4KVnQ1HGNpYPzF38XIxSEk8IRR
  4uebc8wQzgUmiZU/vjBCOCcZJfqnnmTrYuTkYBNQl3h88zUjiC0ioC+xdPYeZhCbWUBVovviG
  nYQW1ggRmLO6bMsIDYLUPz9sQesIDavgJvEng9bweISAgoSUx6+B+vlFHCXmPv2H9h8IaCax9
  u+skHUC0qcnPmEBWK+hMTBFy+YIXqVJE6s+MgEYVdIvD58CSquJnH13CbmCYyCs5C0z0LSvoC
  RaRWjVVJRZnpGSW5iZo6uoYGBrqGhqS6QNDLWS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxN
  zknRy0st2cQIDOOUYobqHYz/e3/qHWKU5GBSEuUNOseSJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mCd94FoJxgUWp6akVaZg4wpmDSEhw8SiK8r28DpXmLCxJzizPTIVKnGBWlxHm3PgNKCIAkMk
  rz4NpgcXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvDMgUnsy8Erjpr4AWMwEt3jadCWR
  xSSJCSqqBSSFSY+/U3mdc76cy7jpezVHt5+uW8+k0Y1j1hqmvXxwt2LtsZ5Yul65azTxbnVV+
  tQlB1abzrzNPsFuutsP9H1Mn57WNsg2bVK7eY32/9dVGsUKtTy0vtQJ+PXU1n1Ixu+/mv755f
  9uZcyRU6+bLLvj11unV3u/Ts/ME5wjabpp4sKFziuTu2EWfT0teMpBVDNjxMf77h+Yt8xWWTV
  55si3/fv3BNxyzN4nF9dkZXX9Yf0+Uw+19gtac/SJ2WWKTF07L+CEmcvpDpaNgxP8tN/nz9A9
  8THm0cepK7vArRw18PQ8qdG5W0V4dZZ+xtPPP+idudm+uX3d3jJy4xrAhP9hnsrqC3Nc/xfu/
  2ZxyiFNiKc5INNRiLipOBABTmlrjXgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1644488712!6260!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5499 invoked from network); 10 Feb 2022 10:25:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Feb 2022 10:25:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0E8D210045E
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 10:25:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 015F9100455
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 10:25:12 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Thu, 10 Feb 2022 10:25:05 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/5] [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade
 1.4.29 -> 1.4.31
Date: Thu, 10 Feb 2022 18:25:36 +0800
Message-ID: <1644488739-3593-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644488739-3593-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1644488739-3593-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 10:25:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95280

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Update:
year updated to 2022

changelog:
===============================================================================
-orm
Fixed issue in Session.bulk_save_objects() where the sorting that takes place
when the preserve_order parameter is set to False would sort partially on
Mapper objects, which is rejected in Python 3.11.

-postgresql
Fixed regression where the change in #7148 to repair ENUM handling in
PostgreSQL broke the use case of an empty ARRAY of ENUM, preventing rows
that contained an empty array from being handled correctly when fetching results.

-mysql
Fixed regression in asyncmy dialect caused by #7567 where removal of the
PyMySQL dependency broke binary columns, due to the asyncmy dialect not being
properly included within CI tests.

-mssql
Added support for FILESTREAM when using VARBINARY(max) in MSSQL.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...hon3-sqlalchemy_1.4.29.bb => python3-sqlalchemy_1.4.31.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.29.bb => python3-sqlalchemy_1.4.31.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.29.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.31.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.29.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.31.bb
index b535951c00..510bb7d9e4 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.29.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.31.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "fa2bad14e1474ba649cfc969c1d2ec915dd3e79677f346bbfe08e93ef9020b39"
+SRC_URI[sha256sum] = "582b59d1e5780a447aada22b461e50b404a9dc05768da1d87368ad8190468418"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


