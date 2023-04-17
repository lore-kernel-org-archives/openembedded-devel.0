Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E29CC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:40:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.49029.1681717234835506117
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vCsKvNWO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717233; i=@fujitsu.com;
	bh=pdOj3atlumGUrsHdJejPQ6x1tLwJV+QWywzb4tbqnZQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vCsKvNWOOtnfKUb1qqHa5zs1rPBLfyjOhYhrrWR3zPAUOgCGu5A1/npdnOeT2fQWs
	 1kRi9eaaAz56Bo8+n9N59IPN9ycy4imtWcWSerkcEXI2c9+omjeJgva+Ag/G+dUKfH
	 B6smYqgXr3fGwPsL5vpf2ofNgQ47o8TlFrnygI2h7qSd7oMgVH8IbBT6yt+Qu0+6eM
	 SvJGu8u1o7VA1EzM6GiQdmcpOrHvWR4CUKcmXSFZHqpj41hViOeahttr9Au0H2tv/o
	 c2dNtevf1ibth70IceO6kQ1ejm5XZWL9U+OO0NbO3RqMmHt6buL+kgnQS4Or6xgvuc
	 yy1WAvYV5B1Qw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpPvhu02
  KQc9yI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPr+RL2goncFTO39bA0MG7n6mLk4hASeMgo
  ce3scaYuRk4g5wqTxJ12XYjEXkaJlsvbWEESbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwvESbz9thLMZhFQlTi65i4LiM0r4CRx4dJZMFtCQEFiysP3YL2cAs4SDeufAc3nAFrmJN
  HYUgpRLihxcuYTFojxEhIHX7xghmhVlJh9uRlqTKVE64dfULaaxNVzm5gnMArOQtI+C0n7Aka
  mVYymxalFZalFusZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5
  qSWbGIGBm1KsJryD8UvvX71DjJIcTEqivC9SrVOE+JLyUyozEosz4otKc1KLDzHKcHAoSfCe/
  2aTIiRYlJqeWpGWmQOMIpi0BAePkgiv8TOgNG9xQWJucWY6ROoUo6KUOK8/MPaEBEASGaV5cG
  2wyL3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3Dch2nsy8Erjpr4AWMwEtllMCW1ySiJC
  SamASsP985dnRsxMFJL1vqv85VF2RItN7s63EZzVXikDhK8FGx9cvwzbXNVl/Ul+2Lr7CZVnl
  uxZZqe1CCVcWPLL/MKMj9PGMG52ZBnceTy257XBN0L2pIcjX5qbzjGvnUzql/2tfYS3ZfsjXS
  +jTq4tTdpl9bW4+cmjOd2Fn9VbFr/837mX57KX5XsPUNN1ZOyQh7MDcyL4Pme8eCq+5VLLL4W
  0hR61EqkEGo+Od0omRm5q5WPiKnc6wf1p8vrvoclgun9antZcmmguJRkgcEFq+WGp2j8m5Ct2
  E6H92XNPT5yolu2lxzLExybaY6b94Wf+BSZJeNqfctPQF1WacZVl+dYJ+3qkqBj1BtRjV10os
  xRmJhlrMRcWJAFKR2A9XAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1681717232!406921!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16187 invoked from network); 17 Apr 2023 07:40:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:40:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 87FA41B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:40:32 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7C3ED7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:40:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:40:31 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.84.0 -> 2.85.0
Date: Mon, 17 Apr 2023 15:39:57 +0800
Message-ID: <1681717197-19108-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717197-19108-1-git-send-email-wangmy@fujitsu.com>
References: <1681717197-19108-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102111

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.84.0.bb => python3-google-api-python-client_2.85.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.84.0.bb => python3-google-api-python-client_2.85.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.84.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.85.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.84.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.85.0.bb
index f22c52702..6acac0647 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.84.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.85.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c398fd6f9ead0be23aade3b2704c72c5146df0e3352d8ff9101286077e1b010a"
+SRC_URI[sha256sum] = "07b21ef21a542dd69cd7c09817a6079b2769cc2a791981402e8f0fcdb2d47f90"
 
 inherit pypi setuptools3
 
-- 
2.34.1


