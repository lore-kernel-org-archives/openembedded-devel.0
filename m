Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F05C32773
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:24:22 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.24167.1660703050451105164
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jelJyZ5D;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703053; i=@fujitsu.com;
	bh=6K8BXu+7tDmX+VT1b2Xgz/waFG01hgDVMMS43rUtSAA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jelJyZ5Dup6yu+5qflKeH6mKuQz3uuTw8cwDg+Deg84VyPdanZFBTVQMIU+aNvovH
	 ZLPX8o/5kps5aUFFQ7f8OfKBhEfEodEAg7+LL7TZ8qzzqWK2ICsTsdJW48NkmVlIk2
	 qaryyw+wZeGE3bdXIcrQa5Y70UmFrLtga94GM5W6jdtoBUBY8D+nwFNHg+8XlRa81O
	 1NzhWhzGAuEJ8XpaGYrwW9abuVFmeMY1+B4StlQkXPhBvYYBXoai0u4YY/EJjK9Qw5
	 hWWmPMQcWPOYQE/HtTWrDtG7Qz0CbwXNAnfXrTVbyPbdRvgcL2jCUEvqfw8Rl9bc2V
	 w0Sv75zmHrq5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqOsb+Cf
  J4OIaIYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP7r+UsBYc5K/ZM+cTUwHiLo4uRi0NI4Amj
  xKvudawQznUmiU2dhxm7GDmBnJOMEgd7uUFsNgF1icc3X4PFRQT0JZbO3sMMYjMLqEp0X1zDD
  mILC/hK3Hs6hQ3EZgGKX9s4g6WLkYODV8BdYvsNS5CwhICCxJSH78FaOQU8JNatPsIGscpd4v
  LLkywgNq+AoMTJmU9YIMZLSBx88YIZoldJ4sSKj0wQdoXE68OXoOJqElfPbWKewCg4C0n7LCT
  tCxiZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6gJJI2O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3i
  ytzknBS9vNSSTYzAEE4pZqjewfi/96feIUZJDiYlUd5+pj9JQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR47/kD5QSLUtNTK9Iyc4DxBJOW4OBREuGVDQBK8xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS
  8/L1VKnPetD1CRAEhRRmke3AhYbF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7zxtoCk9
  mXgncpldARzABHXHs4m+QI0oSEVJSDUyRZRxP7ikp1U/rM/gn9sVSeLv8O4YZCgrPG39dOsfj
  v9zo39fkMzPXrWliMly9yfhQr6a19+kz7TaN65XTfz3Rr9N9IXKU6cGG7d1B+ze8L6/d2xV66
  bKL9g6FO0oNe0WDllx7Xhqhu3P7x0vS1ezc15qaqvPkLswRnsP5IEms68mDmrnBbo/438WnNv
  2t7LjGfqLUvTNq9/NVKca/yvXEMyt9V0h/uDOh/qnw7TfHvWc7Li6XYWWtueX/7bFm91rvA/v
  jI/fdYJLLM9Y6rrmt4o7/G8mJjcp3xH0eTtB4dmfp0qLTS6Kd575/ccHM6P7uY4/cPnX0n8+W
  6j3zJP315rrc+UfWnTr2/8AE/iuXlViKMxINtZiLihMBxQE1xGgDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1660703053!1186245!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15585 invoked from network); 17 Aug 2022 02:24:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:24:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E6ED0100192
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:24:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DB2DC100043
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:24:12 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:24:11 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.21.0 -> 2.21.1
Date: Wed, 17 Aug 2022 10:25:17 +0800
Message-ID: <1660703120-15786-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660703120-15786-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1660703120-15786-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:24:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98267

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Fix
------
    Seeking to last frame caused EoF in pyav

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-imageio_2.21.0.bb => python3-imageio_2.21.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.21.0.bb => python3-imageio_2.21.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.21.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.21.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.21.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.21.1.bb
index 21a8c4f37a..5c792a5db8 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.21.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "a5d19c3c787d5b4920356d85999a24fcff32be8941950dc2409ec1513993952d"
+SRC_URI[sha256sum] = "5f0278217c1cf99d90ef855dab948f93d9fce0ab7ab388e13a597c706b7ec4e5"
 
 inherit pypi setuptools3
 
-- 
2.25.1


