Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B4DEA3C37
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:33:50 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128825.1775730823814704168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PHXLnOqy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730828; x=1807266828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kq8RPl0ZnOprTQ3/1qGEzumYWfNBnYtXLfqDlfuCudU=;
  b=PHXLnOqyKNlo42945Wt7/RTWsVw0Qmpwuqe3UA2IMNXmu7gOBo1WWIrI
   xsGa/ZabWGLcql6ZaaDvjOpzww9noxtWVeF4VYERgu997NOlM1rjLDFtJ
   Sh9PxjtQnzVQAtGZSYBJjwlJiDQmJJnmBa+h/WpQxsEQvg4tBpIe0XmF9
   JELIcakHYw7710lZyBvOwnvpSwGue3xKMTSblgnhWfUcZ09uSJq/WWs54
   HSnsRM31/RIWypTCelnEWLGGmv8FCr+n3THa4a4k3EEwbdZyREKYNx589
   wz6sl5kAYSgGrAfaBGxNVqnsp5mVgRkNaCe3Zf7diN3SL8hYtmgSERJY8
   g==;
X-CSE-ConnectionGUID: cP7kGhiNTKmzNso3HbyMNQ==
X-CSE-MsgGUID: PK2tU6XdQneRSaZJZ1Q4Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="235843778"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="235843778"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:47 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2B0C21002BB9
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:49 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 95CCFC0080C
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 19295403B5E;
	Thu,  9 Apr 2026 10:33:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/37] python3-asyncinotify: upgrade 4.4.0 -> 4.4.2
Date: Thu,  9 Apr 2026 18:32:01 +0800
Message-ID: <20260409103223.1574-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126164

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_4.4.0.bb => python3-asyncinotify_4.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_4.4.0.bb => python3-asyncinotify_4.4.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.0.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.4.2.bb
index 115e88cedf..bdda38734d 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f75d2927d3c1ed2414ef72048f5ad640"
 
-SRC_URI[sha256sum] = "438bdc0715f4f959e6e0af70e76cea198b4e28e5933c7cbf1e9987b50394afb3"
+SRC_URI[sha256sum] = "52ad97aa5332dd78592ab9c64171f2953447d98f9170b9bd440c5d19b17d0416"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


