Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42257C369A6
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.42484.1744017453068265870
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YKwbL40b;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017453; x=1775553453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yGV8H2C33DUEGYohAKfaNy8WXm7Oja6yZZh9u5MNCWo=;
  b=YKwbL40bHl7Cc/xu0D2ExoCK4anDbP5zMdVnLyTL2seS8LjPCARz9lRO
   BwnE95Qg/l2b46b6h8zOli57gaAfS2S4TNcjcAIQKDqzBeEz3t1fjDGL9
   xEEkdjQwXxlHdklASfYCrM1yNwCYBZG6Ed0pQx6YeP1qA+ALoVF3orL1Z
   Xdta2i6ftlSAtIjZSM52enMpjgtcS2GGUl1TYnNBWHkJ//aq+k1+1JbCB
   hH/CdnGi5zM6D5QhXmAAa0CJ9RAe+HYdSG8VfXPfjLic9KpMtA06Cqf6X
   xDKgUlES2muWJ14CqlD8nqzI0IC0seOSOU7P/w9/66xHZ5Shn67TaZYnj
   w==;
X-CSE-ConnectionGUID: IHuKYLKGRnqxKCAkoEvwHg==
X-CSE-MsgGUID: Az8JdgnjRUOaTb63373NpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="175116331"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="175116331"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1E5EEAC07
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id ABB8EBF49B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EA48A1A009A;
	Mon,  7 Apr 2025 17:17:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/30] python3-rich: upgrade 13.9.4 -> 14.0.0
Date: Mon,  7 Apr 2025 17:17:06 +0800
Message-Id: <1744017431-22217-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116652

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.9.4.bb => python3-rich_14.0.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.9.4.bb => python3-rich_14.0.0.bb} (88%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb b/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
similarity index 88%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
index 1512672435..95c0fd8a75 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "439594978a49a09530cff7ebc4b5c7103ef57baf48d5ea3184f21d9a2befa098"
+SRC_URI[sha256sum] = "82f1bc23a6a21ebca4ae0c45af9bdbc492ed20231dcb63f297d6d1021a9d5725"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


