Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0B6C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:30 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.16494.1747731324020787489
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cBxRQhFl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731323; x=1779267323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fUvPPGYjgeANI7xWVouWgg4wb8jVP3RosG4iFDJ63aA=;
  b=cBxRQhFld6sFKkf+hJXsKoO9HcJVHUrmevvm80zj7JYjNZWH99O5lFbc
   LQMT5Oba69ZN6e/PyNeNqQT14YeTThbNIZpmjka0jDkH7YZKDWsLa0wRu
   hq83Z11c70XI4pEYwUP4c63OPD3eL5YLqqnxRkv5rNyNTxG80fc/HinWE
   3ax1+cNOk+pTgJKE7HOqMynzIdjkx7Zk8k7oq7THpKwJzWn3g1Welna9Y
   fLaJuPlwG+snt93YSzmSlzBkMDBDYWhYNFRQKrmkV0R23hU6O8tDuB3jE
   mYhY7OK2I4kZnkD7uIDj1AgOvgBwAr5lfJuOBzBMuovxXSnXq9K6umSXK
   g==;
X-CSE-ConnectionGUID: lnWvsS7aS0eaJNEwimfvag==
X-CSE-MsgGUID: df7xMJWrRYeQgCb4vunDpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="188022186"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="188022186"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:21 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 04197D8FD0
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AEA2CBF4B5
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4421F1A0078;
	Tue, 20 May 2025 16:55:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 25/27] thingsboard-gateway: upgrade 3.7.2 -> 3.7.4
Date: Tue, 20 May 2025 16:54:57 +0800
Message-Id: <1747731299-20448-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117509

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hingsboard-gateway_3.7.2.bb => thingsboard-gateway_3.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.7.2.bb => thingsboard-gateway_3.7.4.bb} (96%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
similarity index 96%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.2.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
index 6b440e00f2..57e162cabd 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "b0d1df1af62afe36f5bc9c6cc13604ccba48a7bba1c33fe7288fc5ce72496d1e"
+SRC_URI[sha256sum] = "5811a3c5a2334e41776f249df20c1d6a0def62a6e11e77bf2abeaa02f2725260"
 
 inherit pypi setuptools3
 
-- 
2.43.0


