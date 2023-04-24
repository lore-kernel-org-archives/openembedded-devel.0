Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E70C77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:19:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.43073.1682306383747317401
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pBbuHYUa;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306382; i=@fujitsu.com;
	bh=dHMS6MjdTVtKvftHT9LDQXgIw81D7KvGXoCQ8nASTWI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pBbuHYUaxM5q8E2rDAC8wTWXnz4yM2yNJPUbPxJ5NY5r6SXetp+4lD+Pjz3+Ve5HS
	 DSyf0tmlIWBz0QtM6q4kaymKosoN5ZkkQGhJoJUBoD21avsfw8TUkaVG2GucbTqho7
	 47sKHkG6v3WZwW6o4M8cSU2oe0GOaoRzpm1VUgGkejMv27X+P8cxW3BcmZxn+du75M
	 sxGq4XRqmiwq+YwozlkncUMZ9gauGcxBVKtWKNsExGpiqCfpirxrEORnReM1UJZxOH
	 rYc/MGt6fjNFXG/pLhBQPT/2QDmxscL68b0DoctU97Euc3g76eIvArhwbZMiA3sgbW
	 miqdRo0z7nN2Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8OxWdf3q2u
  Kwe073BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b7txUFlzgqTi9dztLAeJS9i5GTQ0jgIaPE
  ubkCXYxcQPZVJokX5z4zQjh7GSV2nT4EVsUmICVx4/5/NhBbREBfYunsPcwgNrOAisSL3z1gN
  cICdhL73/wAs1kEVCVeflsFZvMKOEls6LnMCmJLCChITHn4HqiXg4NTwFnibX8GxBFOEleWvW
  KGKBeUODnzCQvEeAmJgy9eMEO0KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaFqcWlSWWqRrppdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5da
  sokRGLYpxYqaOxg/7Pyrd4hRkoNJSZR3yQaXFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvEWfX
  FOEBItS01Mr0jJzgDEEk5bg4FES4V32BSjNW1yQmFucmQ6ROsWoy3H1ypW9zEIsefl5qVLivI
  EgRQIgRRmleXAjYPF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr+QHoCk8mXklcJteAR3
  BBHTELm4XkCNKEhFSUg1MJzOYlv/R/ni35/of926eFS+3REeelVl6KV2u74GqGnvjz5VPPdVT
  e8P4PlZnWvy4eldur3xBZPJnh5a606bfo7c5Ct1kkQ5ZOvulV0LWE6s4JrboJX6P1xxZOXfzf
  9tcSYOET/MfZ/x5pcapKMGmdJy78N/FjTLmKzgqc64tUJGX+OzAYfyz733BCd1v5csPNC3YWL
  hxz4kHM9/0iC32fVoStz953tIPgdH/4l64l+s+XMyYZPOld4bv9C9LdPJUWPez5H3Q/Sp/eOM
  u8f+SZQ9vH00KCPi2YY9l5rbNSR1Hvs5IepvRPZ9lk+HbP2Lt7k8mt5y9ej82YUJ0sMZT7mM7
  Tn3a7G0736T3ksv/BUosxRmJhlrMRcWJAEQGw91iAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-565.messagelabs.com!1682306381!215142!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16100 invoked from network); 24 Apr 2023 03:19:41 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-22.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:19:41 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E22D4155
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:19:40 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D5BE8142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:19:40 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:19:39 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.6.2 -> 2.6.4
Date: Mon, 24 Apr 2023 11:19:09 +0800
Message-ID: <1682306351-11741-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306351-11741-1-git-send-email-wangmy@fujitsu.com>
References: <1682306351-11741-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102151

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.6.2.bb => gensio_2.6.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.6.2.bb => gensio_2.6.4.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.6.4.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.6.4.bb
index 4aca6fee5..c61adb1df 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.6.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "c1e878f5710bafb17aca5ece7d9079e73a78c554"
+SRCREV = "a96805508864a46b8a7977aaf131c28742cddd11"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


