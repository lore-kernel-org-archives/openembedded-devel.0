Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F986C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:42:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.49050.1681717314636844301
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uL2Miqis;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717312; i=@fujitsu.com;
	bh=BKdBCz3dYwo6i1FajSnjNe66c1Pq0+iWIiB7eD0kgzI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uL2MiqisPPEHvdM4EkqaY/t1FGHOhP0eFNHfZltW579Lyh6DugY8wM2KKKZotZ0jq
	 IuBWfmRB8N8LsO4uv0yKi9pEGRfdA9eGoCU5DTMV+z0GqnTjt3A+FTfqscN7y4EkXH
	 rVMoGTiqGJ1hQi1Uw44XNNrOxwVz30QwIUeNf5QIAQuL++EkXF2a8jLnMShQu2O8fu
	 LJPfA8oFmEXR/XEU1pMAPL6pFiOyprxMZhyskpq0no40fGC4uHF9nXgjiPpO0+M2TK
	 VVYA+QuolWgc7LkDF9psTiKLLSIeCXZ02EbWiUgH6iFMPWcdQ5iUYWPs8Y7JO+/vS+
	 cwZ6ehob+HEgg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqOvwwyb
  FYEU/n8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtFz/RpbwXrOinknnjA1MJ7k6GLk4hASeMIo
  MW3nNTYI5waTxOa776CcvYwSF48cZu5i5ORgE5CSuHH/PxuILSKgL7F09h6wOLOAisSL3z3sI
  LawgJfE+/l7wWwWAVWJY5NvsILYvAJOEm/XPmMCsSUEFCSmPHwP1ssp4CyxYuFvsBohoJpJC9
  8wQtQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQvTi0qSy3SNTTUSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknR
  y0st2cQIDOCU4rTjOxhf9v3VO8QoycGkJMr7ItU6RYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  /lvNilCgkWp6akVaZk5wGiCSUtw8CiJ8Bo/A0rzFhck5hZnpkOkTjEqSonz+n8HSgiAJDJK8+
  DaYBF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7xuQ7TyZeSVw018BLWYCWiynBLa4JBE
  hJdXA1GXpHlf5VOrqzlmh3Pom4nHTjpyyMs4uCQthWCEV6WPqwX1Q5dnsNYt8C3cvvTd1/WaH
  +IRVOysebtLicqgSTNJOFfmxezMf/7y4zyEhV0xnyIfsXfWqxZQ1fGKQp2fblyNxB67MOjblQ
  InjnVKNI7f7GTgcnCVbRdZfW3ziZundPV1XtRe37PSsXfLtuU3kEf3cvTsmB4ctPZDioTdz4T
  +nCc4lOYE/o9jLFrZMEmDs/yaYL2emcXx684LpZufub5wupvvqs1/ejwbTlx4p7Fz7fCKeMIt
  blX0UYch+HuN3x/KUqt4ej0//3s1Q/yhhcbP1X/MVf0Of8kKRa0HTcqrvGf1sFp56KPD3mZ+n
  lViKMxINtZiLihMByTIAwFsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-732.messagelabs.com!1681717311!220049!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5431 invoked from network); 17 Apr 2023 07:41:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:41:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A6F001001A1
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:41:51 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9A8211001A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:41:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:41:50 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rich: upgrade 13.3.3 -> 13.3.4
Date: Mon, 17 Apr 2023 15:41:31 +0800
Message-ID: <1681717292-19167-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717292-19167-1-git-send-email-wangmy@fujitsu.com>
References: <1681717292-19167-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102115

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed for is_terminal ignoring FORCE_COLOR

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.3.3.bb => python3-rich_13.3.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.3.3.bb => python3-rich_13.3.4.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.3.3.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.3.4.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.3.3.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.3.4.bb
index 5621214b1..2a832f171 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.3.3.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.3.4.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "dc84400a9d842b3a9c5ff74addd8eb798d155f36c1c91303888e0a66850d2a15"
+SRC_URI[sha256sum] = "b5d573e13605423ec80bdd0cd5f8541f7844a0e71a13f74cf454ccb2f490708b"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


