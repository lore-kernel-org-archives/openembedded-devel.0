Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B4CCA0EFD
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.15391.1755679211835707185
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=duhcLGNu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679212; x=1787215212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g8cf04f9EaVDU2Jo0eTLUYRM8RqvW63VaXTwBzRrK5k=;
  b=duhcLGNukVMRHBod9mgwCmUHb4I9njgfUGQsN4nDIJkhesgfEbpvbEt+
   PXYjxmFcX0opVCydWSrsQsHcCuRp76RIxJzTb9uDBJqOAogpeC8AmF/eX
   RewqlT4i6jS6KrL8fwi6smTPBNAgYvdGF9h5PKlyNU+XIjbgXuBNVPpv/
   iMRMcOK2h3jwlmKSyrmymtU7yuBbCUrxXqE9w1Y3fyYNIZb6u1tsu8RMw
   Wkbg07y51lc9DKtOlWC0Gm2RwKeHZKLgCFC0p+jyCIyqacH7tSfqd0165
   kD0VlvEAVkAsgtpVK5Z3EaOZurlXCpo2MDjTOBjRiom/BwQ3bYGdH5USz
   w==;
X-CSE-ConnectionGUID: fDpaYFBwQF2nlSRK1mbgmw==
X-CSE-MsgGUID: GjvRO1dpTeGiQf4ja6hWcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210584688"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="210584688"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:04 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 7D3D51000344
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:04 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 36ACA1004160
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 2A5221400BD6
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 330F91A008B;
	Wed, 20 Aug 2025 16:39:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/26] python3-anyio: upgrade 4.9.0 -> 4.10.0
Date: Wed, 20 Aug 2025 16:39:35 +0800
Message-ID: <20250820083945.802-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119039

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-anyio_4.9.0.bb => python3-anyio_4.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.9.0.bb => python3-anyio_4.10.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.9.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.10.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.9.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.10.0.bb
index 9cbe26a6d5..e552fd7eaf 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.10.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "673c0c244e15788651a4ff38710fea9675823028a6f08a5eda409e0c9840a028"
+SRC_URI[sha256sum] = "3f3fae35c96039744587aa5b8371e7e8e603c0702999535961dd336026973ba6"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.43.0


