Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBD5CE8D5D
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11282.1726716761429403162
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SW4Telkx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716761; x=1758252761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gg+TmYrvbv6uKgj8fPPwz7mc4/RhzNCHDKgH+ulO8xg=;
  b=SW4TelkxY2xTioRwR9RgVDmohOrXxi8KoHrsb5ybQAPCvZ98tDpQ1fSV
   GA4wiQgr2wZM7+GKaNVzLqvaanELu40aa9t/eczKha+iJywX4X127tf9c
   kQS2TCGmFCARG9Iyk2D7P6HCAsFH/s3AX9GtnCzziPc8/+wN3YUifdaUJ
   zX4EqteeiFIOqTf3wqrBZnX8sMRz0pYqsB8tSUV4GQvMEGLsLSnRxwRy6
   +vcio7ag4JXw0NGumT2xKUyd5zQ41ryEEy1VWo+NYnrZEgVpr2gjCmVSz
   fMUFcnsfHJ0Z30vC9vBofiMFn/HHzxGL4ZIMsWIDIbGa0uvczMIXSMd89
   g==;
X-CSE-ConnectionGUID: 3vtdqRD7TxOmSlJ92bbFYA==
X-CSE-MsgGUID: OM1SKpwqQVm/fkviCfw+hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="161515759"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="161515759"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:39 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C096D4250
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 92935BF3E2
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 29FE021FC6A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CA24A1A000A;
	Thu, 19 Sep 2024 11:32:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/28] python3-rich: upgrade 13.8.0 -> 13.8.1
Date: Thu, 19 Sep 2024 11:32:06 +0800
Message-Id: <1726716733-14548-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-1.786700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwg8a+/GjoiAqr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Hf7mdD84mFnYZ5
	BcymZVqji8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFH5FAKIfjp/CIOxDN+BQ9YDHyh
	W9duZCjXgwvsF9P3JEkK4bu3qzGs9BkBP9+HXIaB3moPA2RvcB0l7fQAFtUt3AifPx1vpvKex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112380

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added support for Python 3.13
- Fixed infinite loop when appending Text to same instance

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.8.0.bb => python3-rich_13.8.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.8.0.bb => python3-rich_13.8.1.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.8.0.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.8.1.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.8.0.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.8.1.bb
index ee66c3554..10ce1987b 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.8.0.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.8.1.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "a5ac1f1cd448ade0d59cc3356f7db7a7ccda2c8cbae9c7a90c28ff463d3e91f4"
+SRC_URI[sha256sum] = "8260cda28e3db6bf04d2d1ef4dbc03ba80a824c88b0e7668a0f23126a424844a"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


