Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AABBC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:19:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.111482.1669616370559940090
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iD3VanBu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616368; i=@fujitsu.com;
	bh=AXEITCbQm2Verv4OgDiP3qgjbaGSOeR5JQg4mxu7+d0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iD3VanBud0jpfzjm4DBtXpEoueFOG+9Cn0NSBL/jD+cdK1bi6pBEg2HU+KuiiUAOc
	 2pfQuLQse/IZWpovw+REjyLlBVC+uroagoPksptJTX4WDWasFwmivlFYpL6F1ORWbe
	 7Zt6z4g2I1AaTwMAjenNsZSLjgfmILVK+IzZE0gMflWARTLrwYQsWuiGrpQsIvGWSs
	 eM8TB9dlSxc61RYt2ZYiyw9Su+3pKhHeo2hCgKsYuJRwtzojIPTwIFBklY296pX561
	 aMjpA0IWQ8nHdWz+Th8g5fN981TbEHUowM0xTWBFe7zXXK2kdWhGa31ta/0bRfz91g
	 gW51r/ZuKwTzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqPshqCX
  Z4G4/l8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtHS2Mxa8JCr4mVzXgPjS84uRi4OIYEnjBLz
  109lgnCuM0ns3drDBuHsYZR4c30yexcjJwebgJTEjfv/2UBsEQF9iaWz9zCD2MwCKhIvfveA1
  QgL+Egc2rkUyObgYBFQlfiwOwokzCvgJPGr/REriC0hoCAx5eF7sFZOAWeJNVfPs4DYQkA176
  5tYYGoF5Q4OfMJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaF6cWlSWWqRraKSXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYvCnFyXd3MHYu/6N3iFGSg0lJlPdjYEuyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QneuSA5waLU9NSKtMwcYCTBpCU4eJREeBfbA6V5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKi
  XOGwIyQwCkKKM0D24ELKovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmvQwyhSczrwRu0yu
  gI5iAjtik2ARyREkiQkqqgckvy9d67m6+V/MLtFxeM79TSG69eVBqBfdqwaazgT5xwaI9Hz/4
  B5YaHe5gePFyFdcRRpPi5ysOlJ/dKhgstz7t74ql79LvsTNcOMW44/BWqyXnn7hXWaapPuWX/
  LTs1q7va87m2r5Uyo7Pv+GeM9Eqa94nS5OYj5MTZaq6Niz1v3vCbdGnt6lfjxduz/Z4sv/Rlb
  d7CvRvm71nnxXfceOJ84PeW/l7tLcv7tJ7YS8XKVvH77xfwmtrZ7DYjA/SDd+Cn5x1Xa338t2
  nKetXTNhfVzCNryN328M1d6PPh194V83muP2Q0uYF+w1PBDJkl0oE/pXhn7FI4d2510GPWhda
  qs1uFHiks8w3bMNS31OHlFiKMxINtZiLihMBMJfcsmUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-732.messagelabs.com!1669616367!128735!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8732 invoked from network); 28 Nov 2022 06:19:28 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:19:28 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A236410019A
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:27 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 95DCC100195
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:19:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-networkx: upgrade 2.8.7 -> 2.8.8
Date: Mon, 28 Nov 2022 14:18:51 +0800
Message-ID: <1669616331-13256-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616331-13256-1-git-send-email-wangmy@fujitsu.com>
References: <1669616331-13256-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99810

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Supports Python 3.8, 3.9, 3.10, and 3.11.
NetworkX is a Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-networkx_2.8.7.bb => python3-networkx_2.8.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.8.7.bb => python3-networkx_2.8.8.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.8.7.bb b/meta-python/recipes-devtools/python/python3-networkx_2.8.8.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-networkx_2.8.7.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.8.8.bb
index 2212c2764..92883f319 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.8.7.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.8.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44614b6df7cf3c19be69d0a945e29904"
 
-SRC_URI[sha256sum] = "815383fd52ece0a7024b5fd8408cc13a389ea350cd912178b82eed8b96f82cd3"
+SRC_URI[sha256sum] = "230d388117af870fce5647a3c52401fcf753e94720e6ea6b4197a5355648885e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


