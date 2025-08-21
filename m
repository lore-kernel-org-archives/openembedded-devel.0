Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F924CA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.4721.1755766810879754818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dErUqBmh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766812; x=1787302812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CQ6XqC6ySg47NHZaK1TD25KpaWWk39+0G9LfhWb9uvY=;
  b=dErUqBmhVHz+9oHEc7/+joxczmXSvlC4P1Y4XcIModc4GoNImgSxJaGU
   pCwOXjlkq+R+bQyEPG+O3kGa+pcwx7tnISuCL8shmvmosf/0e4AIrgbmo
   n3oAM1WwyIKdpNK1E7F0B2YUfWTbRPWg4Xis1IsdZYH3Gq8Pzg3BjFjsG
   KAlyfNV/yDuLVm090VZLSZLMJB+MUJnECCGi4+mHag0F8yGnen/ZUaGdq
   MEh7jZ5pN7ZcN8gBbXkjOHQA7TXx+Iz5zj8zxt7Xdr/pz8+FAaWYH20T/
   seWZPFouu/d+RlHSgl+m3ZIFN5e0LN61UvMPxL90Ld7o6MJq0N+29WQIU
   w==;
X-CSE-ConnectionGUID: 4dc+j2p7SVeem5SXRUHG3w==
X-CSE-MsgGUID: tTJ/+T1kR02cE4d2DZMudA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210120514"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="210120514"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:10 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 067C61002B97
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:09 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id B0B70C08A62
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 8F8AD10023C7
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 16F0A1A0071;
	Thu, 21 Aug 2025 17:00:03 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 02/21] python3-gnupg: upgrade 0.5.4 -> 0.5.5
Date: Thu, 21 Aug 2025 16:59:35 +0800
Message-ID: <20250821085954.2056-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119052

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Handle fetching GPG version when not the first item in the configuration.
- Capture uid info in a uid_map attribute of ScanKeys/ListKeys.
- Improve handling of exceptions raised in background threads.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gnupg_0.5.4.bb => python3-gnupg_0.5.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gnupg_0.5.4.bb => python3-gnupg_0.5.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.5.4.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.5.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gnupg_0.5.4.bb
rename to meta-python/recipes-devtools/python/python3-gnupg_0.5.5.bb
index 5de9a7be0e..38e5b99341 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.5.5.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dabe659eadd6d97325b1582e41cfc11"
 
 PYPI_PACKAGE = "python-gnupg"
-SRC_URI[sha256sum] = "f2fdb5fb29615c77c2743e1cb3d9314353a6e87b10c37d238d91ae1c6feae086"
+SRC_URI[sha256sum] = "3fdcaf76f60a1b948ff8e37dc398d03cf9ce7427065d583082b92da7a4ff5a63"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


