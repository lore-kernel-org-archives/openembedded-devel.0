Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40035C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:04:24 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.66272.1680516259031558802
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xMkq9oIc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516262; i=@fujitsu.com;
	bh=3kQrs01fulZc2cvrThrDPRTHvgWKEuydbFqOQgka4dM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xMkq9oIcZPvkcgfUjEVY6DctS+5uu4Qz7CHXjRCO3IsxgxF+0EbA7CWoxNXmzYPYt
	 XX3pw9jivkyP9M8OApZD9RYk20zba4Iwk3rNKvLCqHatAlFiMbepEQ2XAxqujrPMmE
	 uSmygYdrI9No6vplCmAIRqXYvBge282Q1MwXRQiHvZuCbfELycKhQFA0g2qaBw7CZO
	 v3+FCAckEkVveab80bfx7nYlwakJ4XkxB6lLhqkhdm54Cppx3KRhDNsFRvT9mpkn8D
	 ZwXmKoieaNOqfIKd2w/cM0p3Ci7u1Is3+SCG+HnyW6S7Ykm+6JzSCE0SXAH7/eVqe9
	 dcd8C195VejEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSXfpEq0
  Ug2OfDCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owpfWfYCxbxVux4epWtgXEyTxcjF4eQwBNG
  icc7ZrJBONeZJFpmTGOGcHYzSiy5+pOpi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGGBOImpL/6BxVmA4nf2LmMEsXkFnCQeHXsPZksIKEhMefgerIZTwFni9ozTLCC2EFDNj+
  ufoeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKN0w8xQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFacWlaUW6Rqa6iUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To
  5aWWbGIEhm9KMUv8DsZrfX/1DjFKcjApifIK1mulCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgn
  bcIKCdYlJqeWpGWmQOMJZi0BAePkgiv4gKgNG9xQWJucWY6ROoUo6KUOO9pkD4BkERGaR5cGy
  x+LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5hVbDDSFJzOvBG76K6DFTECLW6M0QBaXJCK
  kpBqYyl7q1aWozNvcvOl8lHDV3egPTmVvI+avO87t8l36fjtH/WO7NdzM4fW/e9JCypgfVSxP
  lFiy0uZ2VdD1Mwac3GKm1Yu9rRxLTbOcF+qvUz2aP1vsp9IXMYdFOgec9xm/3Ss7YZdLtl/uV
  WfZolWi2nev23NuML37NfnJrok77z5dfnrPisTy2ff6L1c5hJzhOXHouvEp3hvWm0T8+t1END
  Ud5JVfzjjFvM94186Xmx590pB6Ey1xvPVdu/z/2BeRti0TNqTUfvbU++nlOPfzg+1di3yO1fn
  ++f/8B5e2x4ntmqv+uE3YpjD7SHvCJYXvl6d+kFRhZDLNnsOa/3/aM6aPHLxWGrd2TKxoa9bd
  psRSnJFoqMVcVJwIAMCps/VaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-587.messagelabs.com!1680516261!1010586!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16581 invoked from network); 3 Apr 2023 10:04:21 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:04:21 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5F4351009B7
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:04:21 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 52B001009B2
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:04:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:04:19 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-googleapis-common-protos: upgrade 1.58.0 -> 1.59.0
Date: Mon, 3 Apr 2023 18:04:02 +0800
Message-ID: <1680516244-30936-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516244-30936-1-git-send-email-wangmy@fujitsu.com>
References: <1680516244-30936-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101916

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Features
----------
    Add overrides_by_request_protocol to BackendRule in google/api/backend.proto (77376dd)
    Add proto_reference_documentation_uri to Publishing in google/api/client.proto (77376dd)
    Add SERVICE_NOT_VISIBLE and GCP_SUSPENDED to ErrorReason in google/api/error_reason.proto (77376dd)

Documentation
--------------
    Use rst syntax in readme (77376dd)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tos_1.58.0.bb => python3-googleapis-common-protos_1.59.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.58.0.bb => python3-googleapis-common-protos_1.59.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.58.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.58.0.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.0.bb
index 27c3b9b22..49725ed32 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.58.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c727251ec025947d545184ba17e3578840fc3a24a0516a020479edab660457df"
+SRC_URI[sha256sum] = "4168fcb568a826a52f23510412da405abd93f4d23ba544bb68d943b14ba3cb44"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.34.1


