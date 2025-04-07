Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27C7C369B7
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.42479.1744017448596296065
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TuBy4ejj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017450; x=1775553450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UMk+YIqShvhvwO7tDVdct3IERnYQgcgB/ly/5RAEP50=;
  b=TuBy4ejjboKa4wp9Jr/+ngQgHXlJz4wNNGJ49HAWJjdF+7lrygeiAGaC
   ynAanjRmkLOFla+LyrbtyE7jQ9VgfFAoJwx1/HryQvIi9tG4DBhpMSz3b
   Xn2LZQQYbww+1ynSOxnsM4AYSBlLTYjJjL7OrpSpaEtAo0oZnnYEg4m4f
   XhK2lK1SsTHHMGDAilzRh5TYJyQtHwScyP2NXM5tUpwkHjR6GbOxUXf3n
   kEOxNdpxuWC+yaReM4suhIn/pRjVFg5ErJW3b5cceljah+hdofqr5DB4D
   48o/HQdn5Dx3CSa7l6jcNiw22iTqRCLYJO7x8TB/vz/lggW6VzQv4jCVp
   A==;
X-CSE-ConnectionGUID: pyufbr2iRk2WBLW9dSJpGw==
X-CSE-MsgGUID: FEPDy8gsQyiK9t9wHd/+Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195640985"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195640985"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D028E3E19
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E377F143DD
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 678AA1A009A;
	Mon,  7 Apr 2025 17:17:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/30] python3-argcomplete: upgrade 3.6.1 -> 3.6.2
Date: Mon,  7 Apr 2025 17:16:50 +0800
Message-Id: <1744017431-22217-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116635

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.6.1.bb => python3-argcomplete_3.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.6.1.bb => python3-argcomplete_3.6.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.1.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.6.1.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb
index 18befcb3b8..abad776d8c 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "927531c2fbaa004979f18c2316f6ffadcfc5cc2de15ae2624dfe65deaf60e14f"
+SRC_URI[sha256sum] = "d0519b1bc867f5f4f4713c41ad0aba73a4a5f007449716b16f385f2166dc6adf"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.43.0


