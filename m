Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A0BC77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:08:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.66387.1680516527560031343
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s1ropQnL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516525; i=@fujitsu.com;
	bh=s4jLVg61FazgaUm7R7Y7NuOydLxW/H+foDtbCw08YFs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=s1ropQnLtzk+6OjGEr2Q10xsbB540f/a+PRP06SqDpqLUzGbHtkkNV3f9k4oCEDe/
	 F9G4ZvjvJxLS0g9s0aPbNV5ybhP872HSLjZ8TITGeSOFHAqx6GmefKtleOriXrol5J
	 qq+tT/HIcXRtiwIguIe4xEja8ThD27T/7nOW/sAODaRPW34lsioyF+eyCnszndbURc
	 qVL1j8uJQ8x9A9XIwF7t6YqlnVpXtCFjGHgPn5+1huISUb4D3dJE3g2GNcKYBtjnIq
	 ddvL8LP8nKyRTfgnEgQTQiiw65uf75HQei5CRWei39PXEvz5OkQbbBx/A+iqHmjfyM
	 MgWskXm8SHDbQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLt2qVa
  Kwe5DIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bSBQdYCpZwVizq3snWwHiIo4uRi0NI4CGj
  xKdJ0xkhnCtMEqsuz2SBcHYzSix5Opeti5GTg01ASuLG/f9gtoiAvsTS2XuYQWxmARWJF7972
  EFsYQEviQNdbWA1LEDx20fOsoDYvAJOEgfPfgGrkRBQkJjy8D1YL6eAs0RbfysjiC0EVNOy6h
  xUvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtConH6ISYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRtPi1KKy1CJdC72kosz0jJLcxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzU
  kk2MwOBNKWZ9s4NxW99fvUOMkhxMSqK8gvVaKUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeOctA
  soJFqWmp1akZeYAIwkmLcHBoyTCq7gAKM1bXJCYW5yZDpE6xagoJc4btwQoIQCSyCjNg2uDRe
  8lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8YouBpvBk5pXATX8FtJgJaHFrlAbI4pJEhJR
  UA5Nm4irdCONVj97VW0UnTXo5pVg1ZPoSnnOzO0Q7Z0kkLPpX9dpm2VmH24+677+oTf6s8W+C
  ZaLI1N2rF7H5JqbZGm096vR0Rkvz3oOXGsXNP1fe7F/7J/Hi33VrGgU2y0z4nLL+Vviq6X1vE
  49GH7bpmfeHj931WLxxUc3ZN9OVXn6JzVyzfsaOF4r7uQuaZYVU3scbHU0rfduek58282rV+7
  76s+sFa3Nmsm2+ypKqkhAdHhJ/3533VeiixYKrWHiMFE9/3XTy/unUGMadUyqOhJTGL/j3YJ3
  sHN/YcyyWS1j2XnwQdIh5YS+nvsKstYd/ZTwW4r6edSDiQ7Wg+JzJX4NCrxeWR8392R6tYcyn
  xFKckWioxVxUnAgASbwYYVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-591.messagelabs.com!1680516525!1460235!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14253 invoked from network); 3 Apr 2023 10:08:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:08:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E84881D0
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:08:44 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id DD7451B0
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:08:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:08:43 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rich: upgrade 13.3.2 -> 13.3.3
Date: Mon, 3 Apr 2023 18:08:07 +0800
Message-ID: <1680516490-31075-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516490-31075-1-git-send-email-wangmy@fujitsu.com>
References: <1680516490-31075-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101930

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Added Style.clear_meta_and_links

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.3.2.bb => python3-rich_13.3.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.3.2.bb => python3-rich_13.3.3.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.3.3.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.3.3.bb
index 1cb90c568..5621214b1 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.3.3.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "91954fe80cfb7985727a467ca98a7618e5dd15178cc2da10f553b36a93859001"
+SRC_URI[sha256sum] = "dc84400a9d842b3a9c5ff74addd8eb798d155f36c1c91303888e0a66850d2a15"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


