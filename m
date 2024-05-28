Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBE7C25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.12689.1716860973809280849
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TT8p08F9;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860973; x=1748396973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=neFcdPrv/I6hjf2rHq+XpixhezDR6W9ahsqbaA0bvMY=;
  b=TT8p08F9cY9IyHCuYzdvGaYOAc+9bKtiFiHHThBH3pGX+XRwSO+SM902
   i9NOQ75x9BWHpZe4Neq/H7PD3BUmY+ZdOEarnxMyq6lsCbZDE9UC+TUbY
   hKriA1x1APWl1zPF3R2lqJ4/NmsbcF1ajeAlGjRhYS/EhIpVwxedcBt5T
   L+ag3UANofvy9aZRN7WM+oV4xUeu5FnckCZ1Fy1EdQxouCbaJlPbJ8lWX
   bYCFf9oWSO/SjipD/gIrE9sjDe3nYFYA8/wXzo6kJxhfPK9Ke3JlLyPwL
   dO3VJJlWRhQoTK3T7LRerTN9ZpzzFu0bJQzz2lkNXzRPjSV/dYJpeEQRJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="148784753"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="148784753"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:31 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EDAED424F
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A65C4D4F4
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E851D41063
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 968341A000A;
	Tue, 28 May 2024 09:49:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/40] python3-astroid: upgrade 3.2.0 -> 3.2.2
Date: Tue, 28 May 2024 09:47:54 +0800
Message-Id: <1716860901-863-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-1.471100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrDcK8n+cR7XKU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFDr0p3stvDTnijMVSMxqpEcI8p
	W3dIynFfwGKCs+jpsSvHnKmDGlKzhUCbWmXYQnj9DL3A1Xqf0nPV8I6oxtsiS1lvBDdF8NO+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110548

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Improve inference for generic classes using the PEP 695 syntax (Python 3.12).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.2.0.bb => python3-astroid_3.2.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.2.0.bb => python3-astroid_3.2.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.2.0.bb b/meta-python/recipes-devtools/python/python3-astroid_3.2.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.2.2.bb
index e97494fd9..d7e7f5698 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.2.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "f7f829f8506ade59f1b3c6c93d8fac5b1ebc721685fa9af23e9794daf1d450a3"
+SRC_URI[sha256sum] = "8ead48e31b92b2e217b6c9733a21afafe479d52d6e164dd25fb1a770c7c3cf94"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


