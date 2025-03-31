Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B0CC369AA
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.47777.1743412320556201685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gpy8HPdW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412323; x=1774948323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Jxb3RGO5njRSbOqzSMZy/zBq+w1jTdGDrdBvefSwKq8=;
  b=gpy8HPdW0AZ3rXcUZcCL68EEiVPFoh+K4Xv2rHWstKb7Xn/wSKYSiKib
   zCL9SwyVj6SIGGNhzP5q+XIu1xLlx9Q/iUK+B5ofTZQCtkkVO+vpNOdhM
   ZhfKXFHby0Y4MvrCKiGnVR3gjWQll3y6DkMGOSdVIuMuKZcyGva1pJnAX
   HTKHYzXMH5Uz6G842yxcJZpUwCcJH7ZEo4giKjdt5MDRe3DTjfpZSAi+N
   A/ExVIbKnqXLYAUn7qj3VN9hXkNtTswNBFg/ufdtwTI/6azgYN955Y6DU
   JYZ5hQ+3dYxgMGcUGnS1qPZa8c5QAJ7fxpP3EdFlWg/w3X4pMhzI/uyTd
   g==;
X-CSE-ConnectionGUID: +H0W2W6bQVmxdCobsr5Gog==
X-CSE-MsgGUID: TRonDqnPQ72Kxv0YWOx4aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194950083"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194950083"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 21BCCD4F55
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D1282D5086
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 922551A0078;
	Mon, 31 Mar 2025 17:11:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 06/26] python3-argcomplete: upgrade 3.6.0 -> 3.6.1
Date: Mon, 31 Mar 2025 17:11:28 +0800
Message-Id: <1743412308-21887-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116406

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.6.0.bb => python3-argcomplete_3.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.6.0.bb => python3-argcomplete_3.6.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.6.1.bb
index f87ca4d925..18befcb3b8 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "2e4e42ec0ba2fff54b0d244d0b1623e86057673e57bafe72dda59c64bd5dee8b"
+SRC_URI[sha256sum] = "927531c2fbaa004979f18c2316f6ffadcfc5cc2de15ae2624dfe65deaf60e14f"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.43.0


