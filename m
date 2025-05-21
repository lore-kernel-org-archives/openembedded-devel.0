Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FABFC5B553
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6740.1747817996379290218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O8AFQnFB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817996; x=1779353996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xev/6fohxVyWgtYUFW9GdbZsmpbsf9DgSe9HJzNZfCE=;
  b=O8AFQnFB1qp0Etm1werpvw348CxX/15WMp3Qnt4ERbwLCoXKaP2Xfn+w
   J0sSa23WoB09jjwh30zSyBT6sUaGizjtB7z1zfUpgWqGOUfYkMWLRBZFX
   xarKuRdAeiNYmgurxmP9ZqwWyUv2zG0nfK0xlH2bjMaMveGqSqgp7Omf0
   +VT0t42AMfxmVsB80eYUEsGcEuingqaGUXic3GHh2GzuDU2H+Qi0j4IN7
   Bk/wsJzrz4yzLgV9K6p1FloLIZzLpiMBBTvLWF/4bhQxw+ToytlSkd01W
   oLipEJYe0iKYs2sEbBJ0axz3oJov4d0wP+CLJHScqr5X0N0Q3529b4eHy
   A==;
X-CSE-ConnectionGUID: dkVOtoKkRAukrXpzfF5NmA==
X-CSE-MsgGUID: DX+njyf9T4CkZxTzmsDI5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200161109"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200161109"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:54 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C64AD4C46
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DCFED8B94
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BFB0B1A009A;
	Wed, 21 May 2025 16:59:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 06/43] python3-cachecontrol: upgrade 0.14.2 -> 0.14.3
Date: Wed, 21 May 2025 16:58:55 +0800
Message-Id: <1747817972-28874-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117532

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Drop support for Python 3.8.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-cachecontrol_0.14.2.bb => python3-cachecontrol_0.14.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.14.2.bb => python3-cachecontrol_0.14.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.2.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.14.2.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.bb
index 6a239c06ed..0ea263b8b5 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/CacheControl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6572692148079ebbbd800be4b9f36c6d"
 
-SRC_URI[sha256sum] = "7d47d19f866409b98ff6025b6a0fca8e4c791fb31abbd95f622093894ce903a2"
+SRC_URI[sha256sum] = "73e7efec4b06b20d9267b441c1f733664f989fb8688391b670ca812d70795d11"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


