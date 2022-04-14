Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF0AC3A5A1
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.6654.1649900772546702038
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 18:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iTrnrPtF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649900770; i=@fujitsu.com;
	bh=E7+RzI48bPn4biokiifCnd0WQq0VbqxHUBxqvNmuAb4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iTrnrPtFineBvqdG+KUmFlZq0qUOloOJPTGaoTEWmdUdQkzUaNpia/o9TTW/M9prf
	 KFvdyAi89b8ppjOqXcPSzePSa/gP1ORukRw9SOso4gpZ3NXKrDTftttjUlzvhJmwk1
	 0YwRQt+Mz9HgdmkDoGppT2q3Bue2xplS8ab8ACiIloV8wrV8N3px2Ox43ctwwVxrwY
	 ggLtrJkeABYk6U1LFXT2gPOgj8T7cuV1UbRGRMVSo+IiTHpD4nNsddFVAI2ATi63cM
	 5RlePNfwL7Kxj9H65cEGHLwzpAY7X7WLcku9glmkBmjIZEgqPBNh/wnaAB7xR14ms1
	 h5wxWkxqfiqVA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqPuwJjz
  JYFmTscXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHvy2umggmcFRfPrmBvYNzN0cXIxSEk8IRR
  YtWRz+wQzgUmibaZLVDOSUaJ78sWsHQxcnKwCahLPL75mhHEFhHQl1g6ew8ziM0soCrRfXENO
  4gtLOAnsebWC7B6FqB4442pYPW8Am4SM25PAauREFCQmPLwPVAvBwengLtEc3M8SFgIqOTqs5
  ssEOWCEidnPmGBGC8hcfDFC2aIViWJEys+MkHYFRKvD1+CiqtJXD23iXkCo+AsJO2zkLQvYGR
  axWiVVJSZnlGSm5iZo2toYKBraGiqa6xraGmpl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmb
  nJOil5dasokRGMQpxczHdzBO6fupd4hRkoNJSZQ3yzA8SYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IE76kqoJxgUWp6akVaZg4womDSEhw8SiK8c/KB0rzFBYm5xZnpEKlTjIpS4rwJwDgUEgBJZJ
  TmwbXBovgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeg9VAU3gy80rgpr8CWswEtPjbqlC
  QxSWJCCmpBqZdDoef3FyS6z3tV7jWWfOumw/ON1Wu+CcmWpwp7vt18neXqph7OVeixT77dfNN
  TVvRJnhU9cQmZu9rP7LWOLqpsR1b+maGEkNOfn5mxG6TiAsSP7oUlT5zfevim/j00RoNz80dF
  zn1blTs8l0S4S7YK9h0W8zB9qiLaIDxJNUT+Tac4ozlTdOvTVh+4t6vLw3MPWUL824lpC7dq3
  x3xvsPhz/qKfkd/jnB2t5i9TTfk3w3Vq0PPLKm5mkr5z6e+AfRC9UVupczq9Ra/k298tPwsHH
  5sqV/3YSiFHVvnK0wLW1n9awM+HPZ4+HqBUlZDa2Lko7NeLkpVU5Y0Pb4JWf+eXcVeTda99td
  TJmfckiJpTgj0VCLuag4EQBWGxNRXQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1649900769!20752!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8337 invoked from network); 14 Apr 2022 01:46:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 01:46:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0C223100183
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:46:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D46BD100199
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:46:08 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 02:45:57 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.5.7 -> 1.5.8
Date: Thu, 14 Apr 2022 09:46:19 +0800
Message-ID: <1649900780-5925-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649900780-5925-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1649900780-5925-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96627

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-sentry-sdk_1.5.7.bb => python3-sentry-sdk_1.5.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.5.7.bb => python3-sentry-sdk_1.5.8.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.7.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.8.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.7.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.8.bb
index 1594fb5dd7..cf1337e2b1 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.7.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
 RDEPENDS:${PN} += "python3-urllib3"
 
-SRC_URI[sha256sum] = "aa52da941c56b5a76fd838f8e9e92a850bf893a9eb1e33ffce6c21431d07ee30"
+SRC_URI[sha256sum] = "38fd16a92b5ef94203db3ece10e03bdaa291481dd7e00e77a148aa0302267d47"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


