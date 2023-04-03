Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263C4C77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:07:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.66356.1680516453834993798
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C6s9e7pl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516452; i=@fujitsu.com;
	bh=lXFgWRVDeCtKUC3sAj8wQeZO3Mb2omfJSjX3pOZcCb0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=C6s9e7plBzkAQvo0PRmFkAk+1iXxx/jfBpFpHnMfMrj/F06DjFg8RLIp2u94FcTAZ
	 LdvsfKBGrjEaO33iQlqL5zv9kUiJ6x5GiqnlbHxxOzdWzAIubt/qrrVwuUntoaa0E8
	 ciQJtuShF7gSc2Z57sYAB7+i1xH42HEH2b17ARMCA07sSIrF3B56Z1NPYgSRU8dNYw
	 c3r7NP5lDU0YBVSaBxuPmnetS4Zwy7Eo4gRAe5BGUbG8E4h3vzfItqldGh/TSEwiVP
	 jeJETjIO6eD4k3sSfmtNU+NHpemJdkBCVlyUuTYEdoF3+80SR9+bRiqiH/CFYrK4tW
	 3lv2NQhGM+xRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpJuyVCv
  FYN5+JouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPu60uMBU85K3au+8DcwNjH2cXIxSEk8JBR
  YuvJnUwQzmUmiR3LH7JDOLsZJV5s6GHpYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAX+LP5StgcRag+Nq+I2BxXgEniY6N/8DmSAgoSEx5+B6shlPAWWL74desILYQUE3Pus
  +sEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZeboeZUSDROP8QEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka2ikl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvinFKsk7GL/1/dU7xCjJwaQkyitYr5UixJeUn1KZkVicEV9UmpNafIhRhoNDSYJ33
  iKgnGBRanpqRVpmDjCWYNISHDxKIryKC4DSvMUFibnFmekQqVOMilLivHFLgBICIImM0jy4Nl
  j8XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzCu2GGgKT2ZeCdz0V0CLmYAWt0ZpgCwuSUR
  ISTUwceXIFdx4JWjf+Gre/lMRauLlS8/IPer6lGvWKV4mu/lq/9WPNflG03bEKpU/ig+8XZW4
  5ejyA3vzrrH4P5NNmGt/aGG0yjQRyePvXrqbtnbc7zXS/SJflTxzS9TLm1oPbBiL/efNzw+b8
  4f34UrvDoWV21TOdaRVsfA6TBOa4vP/YvrJnwHfFslwSxeGzm6eIp/OlC+7y2DiQZmCz2kKFv
  xtk+61PZDaHa/RctNs24Z9X+wsQwrVPvxtq79ZKVFcf2adxVTuZ+HzP9uxWjw0k5mndi9ylty
  N9WEHOoqOzFmqdY77vcCvf6sX35rZxHhU50HKkSCxslvT87znSl9lX1r4QEVzmnl6345XJed5
  lFiKMxINtZiLihMBhoniQVoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-565.messagelabs.com!1680516451!192297!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28867 invoked from network); 3 Apr 2023 10:07:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:07:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BA9BF1B0
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:07:31 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AF9597B
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:07:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:07:30 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pywbemtools: upgrade 1.1.1 -> 1.2.0
Date: Mon, 3 Apr 2023 18:06:55 +0800
Message-ID: <1680516416-31035-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516416-31035-1-git-send-email-wangmy@fujitsu.com>
References: <1680516416-31035-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101927

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pywbemtools_1.1.1.bb => python3-pywbemtools_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_1.1.1.bb => python3-pywbemtools_1.2.0.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.1.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb
index 1d449cb0e..5a56d0056 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.1.1.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.2.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "aacf4bfffa872bb0e3d0c19ee0630e3c0997d4f13553189b63b297787341735f"
+SRC_URI[sha256sum] = "921fb57ea2ae3ae2806e18895bb0457697f27221b345c8b05afa4cb304a7f939"
 
 inherit pypi setuptools3
 
-- 
2.34.1


