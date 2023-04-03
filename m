Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25279C77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:07:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.66319.1680516433997105929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qKuYqViO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516432; i=@fujitsu.com;
	bh=NSeXZYUF/ayBO61lsT/7U9lkCX85evkLGg5N4zceiYI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qKuYqViOE52BTgRjHeu8zz8HRhFVXCF2FOQYamy7L48bsApiGXgsXTwmYgO+O4z2O
	 Cl1huFp4bKYijpv39XFVQKiSeie4n8awkazsC/ZU7G1n7j6z/D+k7OCx3Wn/m2YN6r
	 7ctgfW6kDQQBccS884qCdtbTA55eJv5l3lAr0iAJ+cUYWiCcqduHKOA3n5q8cWWMy3
	 uB1SXA008j7GHQzEMsmgW57DZYIkzyxrhZk+Abfjsxtlcq7ahNK7yhAJvaJ4l5+zIu
	 dpIqHICziD5jy+ujxyJacKuxOF3ZQ8YKIeWs7uJB7O4DBl5o/lt0T1wNrP+TipgsGE
	 nAMbTDQZW0Oig==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSTdgqVa
  KwcoWDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP/xsvMBXs5Kzav/8zawHiHo4uRi0NI4Amj
  xMcPsxkhnOtMEk0H/7FCOLsZJWbMPMXcxcjJwSYgJXHj/n82EFtEQF9i6ew9YHFmARWJF7972
  EFsYYEgiSkLr7OA2CxA8dOPjwHVcHDwCjhJfPxcBxKWEFCQmPLwPVgrp4CzxPbDr1lBbCGgkp
  51n8FsXgFBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hUTj9ENMELaaxNVzm5gnMArOQtI+C0n
  7AkamVYymxalFZalFuoZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIGhm1KsPHEH44rev3qHGCU5mJREeQXrtVKE+JLyUyozEosz4otKc1KLDzHKcHAoS
  fDOWwSUEyxKTU+tSMvMAcYRTFqCg0dJhFdxAVCat7ggMbc4Mx0idYpRUUqcN24JUEIAJJFRmg
  fXBovdS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEecUWA03hycwrgZv+CmgxE9Di1igNkMU
  liQgpqQamUNf1myx+rWoWEZQSjlvA2+Jws+MYn/if6Vv/MLV5rZDj4YrY9P3p3nMssqsMuP/e
  vnw1pcLLY9eLZvZ24V7LP8r+or1vt0+55L6VTUkzptntkiTTK6nJnLOfLLwYuXLK3G5H9vS72
  9/M+17HZluwwW1V3LlK3p+hFaUXI8PeLT45+Taba07m56R1eZNXmCnO2vwkJXDrXO8DL3bavg
  r5O1llS36+Mt+kR1orOrfxGi7Q/Lv89nfufY4sF1k/qb44YhfQv21xt+GF6dtOhLfqXckOLpn
  y0bVop8nbf67+r9MqW279OSmzJO/b6UiH0KxrlR+TA5tCVEWEOdV+Nud3s3BsvpOy/N2sesfH
  +3y+KrEUZyQaajEXFScCAF5uWshYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1680516431!1037733!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31884 invoked from network); 3 Apr 2023 10:07:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:07:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CC6691009B6
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:07:11 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BF88B1009B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:07:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:07:10 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.169.2 -> 2.4.169.3
Date: Mon, 3 Apr 2023 18:06:53 +0800
Message-ID: <1680516416-31035-2-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101925

From: Wang Mingyu <wangmy@fujitsu.com>

Fix:
- Invalid check if taxo is enabled.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pymisp_2.4.169.2.bb => python3-pymisp_2.4.169.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.169.2.bb => python3-pymisp_2.4.169.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.2.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.169.2.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.169.3.bb
index fd78306cf..4f8a13051 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.169.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "9e2712bb1da00c7bd3559f978c6316ca0287d453"
+SRCREV = "39f5acf1f618cde6cb14dd815cbff5297a8af25a"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


