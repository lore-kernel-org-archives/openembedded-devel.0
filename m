Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1AFC369A9
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.42481.1744017450044790475
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bqmLj517;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017453; x=1775553453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8bobhy+5qNe15aZ7VTT7z+7KtKJaEGEtg3GSn8lUsnQ=;
  b=bqmLj517/1IXNQeyS5noFBhakRj98E/tHd+sju7hQWgzqs8ebaj/MZTU
   bpEK2aEP8GfLgnDdTCMydZjyIKIbjX/QF1A4so5yLJB4Uv1NEzDxqafKC
   8CGK/fx9PAeOXOx1PAnfJ5mNJpZv82tJwGZTnQ6g/03XeffKnw8STASIi
   kz9BtQk8abwCRlT82+cYQxIEuYRocdVU1OP4LinRRVatkRxdSc2RxdvCe
   /Fc90RwHb4/UmOR69C2ut5fEdw3+ZC7cJLmF403NL1uNCQGd2Plp30Z5k
   5REM90smy3wwBpj3l4rAkPlc1QGWwC1mRTRk5zrb0vtgyDOCH2jjgDIBG
   Q==;
X-CSE-ConnectionGUID: 1QoOQr2PRxG201ZszdgOkA==
X-CSE-MsgGUID: isFudqf3TKu6LAonTOwLyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195668938"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195668938"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:31 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3B59E8520
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 65C21CFA5C
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E588F1A0071;
	Mon,  7 Apr 2025 17:17:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/30] python3-pyflakes: upgrade 3.3.1 -> 3.3.2
Date: Mon,  7 Apr 2025 17:17:02 +0800
Message-Id: <1744017431-22217-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116646

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyflakes_3.3.1.bb => python3-pyflakes_3.3.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_3.3.1.bb => python3-pyflakes_3.3.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_3.3.1.bb b/meta-python/recipes-devtools/python/python3-pyflakes_3.3.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyflakes_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_3.3.2.bb
index 4051ec6802..68509a5073 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_3.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyCQA/pyflakes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "8752eee11d4ef3a4be642d774863047864b47406cba906fabf8dd892cf98d5b3"
+SRC_URI[sha256sum] = "6dfd61d87b97fba5dcfaaf781171ac16be16453be6d816147989e7f6e6a9576b"
 
 inherit pypi setuptools3
 
-- 
2.43.0


