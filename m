Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC29DC02195
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.30506.1735032440799266974
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iefrDtRS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032440; x=1766568440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7jT3Ped38ST47xgg96Q/bI2PhMqQk5J+jzlkNvIhdLs=;
  b=iefrDtRSTu9K8Gwr1Os9UClcnlu4SDx0v4qGiKSt/XbWBnKy0YqaTuYg
   3D/He9XXkHK94/3/zm7J7zHIfsy0eXiIrnFMfeXFElAXPNZE1du7B/f2R
   6in+EEYxGXuv42lKdliCv3jdrkf3iEwQzeKBGdktFfRTeEndwADAk1Ro4
   L9d7zrmEbO9fp+TfAngnt7eQwMxWic2P9PIzETqHXK8Iub4JnDrU3SUem
   iXLVsydV6B2CMjG+NIkjH4q/Zo6K879QgPT4Wd1of6BNZkbx7Hzr6/Gbj
   6ddHgD5hgiUoB1jZ6JMbhFODuOTPrDKLfa1tRbpaQZPgp8h0B77DsPVHu
   w==;
X-CSE-ConnectionGUID: +RDu4+TtSJSI7tgvCnqS4Q==
X-CSE-MsgGUID: sKh4HB6yTUG1C1JAv9piLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="185003189"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="185003189"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:18 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 33F6DE8520
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 00E7BCFF81
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6636E6BB6B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B4EF1A0071;
	Tue, 24 Dec 2024 17:27:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/67] python3-anyio: upgrade 4.6.2 -> 4.7.0
Date: Tue, 24 Dec 2024 17:26:02 +0800
Message-Id: <1735032421-13513-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-1.022100-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrK2GKtdiFmTkvfU/riSJXkeBX
	h2z680sONxMHWZR0d8OU7Dof0FrM+WXcASw18Wa9AxFf86Rcir1ezmeoa8MJ87wHu+XsbkzRgvO
	xzjFAiwGnPbOZ38tQQ0NziVKCujClpx4mVJ23D0QD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpienmD2BglYMt4HMSQIKmdGZ4CIKY/Hg3AaZGo0EeYG97fwtq4jZ/G3iq2r
	l3dzGQ1ZEL8F720cV9FqSjyxMXL/HJ4cTkxtf1VkVlQYPxoPwwlwI+YRKwUSDJ0Bia3Ghw43taP
	OKv63FHkNE7KQUPqEBHORaQ1nNNjgHIx+/YES1tTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114485

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Updated TaskGroup to work with asyncio's eager task factories
- Added the wait_readable() and wait_writable() functions which will accept an
  object with a .fileno() method or an integer handle, and deprecated their now
  obsolete versions (wait_socket_readable() and wait_socket_writable())
- Changed EventAdapter (an Event with no bound async backend) to allow set() to
  work even before an async backend is bound to it
- Added support for wait_readable() and wait_writable() on ProactorEventLoop
  (used on asyncio + Windows by default)
- Fixed a misleading ValueError in the context of DNS failures
- Fixed the return type annotations of readinto() and readinto1() methods in the
  anyio.AsyncFile class
- Fixed TaskInfo.has_pending_cancellation() on asyncio returning false positives
  in cleanup code on Python >= 3.11
- Fixed cancelled cancel scopes on asyncio calling asyncio.Task.uncancel when
  propagating a CancelledError on exit to a cancelled parent scope1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-anyio_4.6.2.bb => python3-anyio_4.7.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.6.2.bb => python3-anyio_4.7.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.6.2.bb b/meta-python/recipes-devtools/python/python3-anyio_4.7.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.6.2.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.7.0.bb
index 231a7fb878..5f90ffbd55 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.7.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f72a7bb3dd0752b3bd8b17a844a019d7fbf6ae218c588f4f9ba1b2f600b12347"
+SRC_URI[sha256sum] = "2f834749c602966b7d456a7567cafcb309f96482b5081d14ac93ccd457f9dd48"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.43.0


