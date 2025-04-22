Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CB0C369D7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:54 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.35403.1745311786548124159
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cJzvYO1J;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311787; x=1776847787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tCUnEcaTogTQUjXtyqHbpqf0zxdgqBA70gWkB25Mg7Y=;
  b=cJzvYO1JMomT6kt7Z4pNunlGTd5OXoqBhurh0a43ldoeO+cji6Bcca4Y
   IRQSpB3yulqtpQNSqTY+/rodyfqmRastyJv9x9AKCKZaKhvJTgNts7BXl
   d7eit6HiCwl5WqROAmEam1gPddHM6JuGsVnFPQRYVVpXpOPhUrEXqysAe
   cxbWpqyQYRk405rfLmIC8X2mt2TIQWW60fhW99LuZa3LgQCMcFkxBwt1f
   sQzhOBjvI1pgNdEOVcWDBz8unPP9+opRtKRwEr9D4EepguEucaiwDLDg1
   WtdKziP/nzXaLbHbkWaSlvCOL5QvBc+lRVn4dJz2GOOT64mN3gsnQxR8a
   w==;
X-CSE-ConnectionGUID: WOUc5xqOQRqcsE6Z9t7kxQ==
X-CSE-MsgGUID: HqqbjaS7Ro+TgztHWGyVlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="185268201"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="185268201"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:31 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DD5A96741
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DEA70D3F34
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 77C3B1A009A;
	Tue, 22 Apr 2025 16:49:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 05/30] libnftnl: upgrade 1.2.8 -> 1.2.9
Date: Tue, 22 Apr 2025 16:48:56 +0800
Message-Id: <1745311761-1912-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117047

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnftnl/{libnftnl_1.2.8.bb => libnftnl_1.2.9.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.8.bb => libnftnl_1.2.9.bb} (90%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.8.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
similarity index 90%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.8.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
index 0af64fe036..8368c9cc29 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.8.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
@@ -3,11 +3,11 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 
-SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
+SRC_URI = "git://git.netfilter.org/libnftnl;branch=master;tag=${P} \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
-SRCREV = "06e2cbec41c7cd7f2b1e660ce5e5f949912e32eb"
+SRCREV = "17190762f33f78090f5ff99a436c4cb866ac3ccd"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


