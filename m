Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B05DC369A1
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.47777.1743412320556201685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J5Pmf7gi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412324; x=1774948324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8/Ub+pjkzlHOueJX5Xfed2+nKwd+1LlhTkeHcDiGD8E=;
  b=J5Pmf7gi32JPNnYMuZEP1ykIkug6RxAgX0k5exup2e6GEJ4X7ysgx7f1
   DjypqMITHQkWtKj66lekWCls5OPRiEEBPbZ00OSwB6Oh/PGEjB4N4cWox
   N8vewreFnTYXCPHV1O80OYwACDXWIkePlAGgucTatZKCV1t4oNBiJntcX
   uQOqo6DeNseb7J9VGgyOgt8GVA8qc/FwA25wORSFMK/wn2VEJvtLP9X+a
   pTMobg/fivGED1DIs5Bh3C51R2YqsKrzsksHeYYjz53YKUmKMkgVhtHyz
   PsNg1Fk/SvYg4W6o92OHmj0NCvDyOHc8OXIAV7BjqbiflpOlxyH8Jsdpg
   g==;
X-CSE-ConnectionGUID: 6B7ElzItQtWaRFw3kpf3rw==
X-CSE-MsgGUID: HhhLfVaeSL+JhHcIT1gtLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194950088"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194950088"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:02 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 02118E428A
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B8A49F310
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 783581A0078;
	Mon, 31 Mar 2025 17:11:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/26] python3-moteus: upgrade 0.3.76 -> 0.3.78
Date: Mon, 31 Mar 2025 17:11:37 +0800
Message-Id: <1743412308-21887-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116411

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.76.bb => python3-moteus_0.3.78.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.76.bb => python3-moteus_0.3.78.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.76.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.78.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.76.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.78.bb
index b86b0ded02..9e42e1796c 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.76.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.78.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "acc10f7ffe34b6fcb2f1e767d6fb63a1bc0107dbbbd054fca8c2ac5b499de0f7"
+SRC_URI[sha256sum] = "9cf58e748b847708e04e362991fc04c11861624a81e1a73a2773b0f1e0e11ab7"
 
 S = "${WORKDIR}/moteus-${PV}"
 
-- 
2.43.0


