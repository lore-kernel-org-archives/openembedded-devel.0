Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF318C369A9
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.47545.1743412321302709087
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Rg2Jk6o4;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412321; x=1774948321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=S8ZIfW77WnbD7kPPLYmlsCV178+OX2207UeTT3u34Tk=;
  b=Rg2Jk6o4Gh9XqxtXtsscCOa6YCU4qXI4EYYQanCFAFV/Z3/aMj9DPV4Y
   1VXp601JDd0FpNhnAzav6UB7V+F+Nujp3OlpNTWIrB4F4/T+vVGF5BbcS
   MN6CS3t8+JSNLdnElxNkZ4I6jJXGh+FFZmyyzGqPA7j21BlVGRkcYdBJp
   I3tDBikp9ngAJrATAM41O0TPdTIXeid5V7aFCAf7T81vE/Wum4hg/pbgG
   o8foMlpZ7TP7mOX3vf5xkoCOXHs11FxRf4kOSXUCP8fZUDDpYLNQ4ULlY
   YIjMj19v2t7Ker9VXXpYBVbDPa5BLCODLkMiJlHciF1t1V13NZu1SsjYH
   Q==;
X-CSE-ConnectionGUID: LcyELFCuTTSMsaLYEUsjzA==
X-CSE-MsgGUID: aO962+ZaQmWl/xynfNAhvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="173876178"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="173876178"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:11:59 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A1F87E8528
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 61D6DD5086
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E8CDF1A0078;
	Mon, 31 Mar 2025 17:11:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/26] parallel: upgrade 20250222 -> 20250322
Date: Mon, 31 Mar 2025 17:11:25 +0800
Message-Id: <1743412308-21887-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116403

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20250222.bb => parallel_20250322.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250222.bb => parallel_20250322.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250222.bb b/meta-oe/recipes-extended/parallel/parallel_20250322.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250222.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250322.bb
index cb6068f6d6..8767f2946b 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250222.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250322.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "d05ab27e0dd14e3bf253dbae18e7894717ce834193336c9a8eb26081305dbbf7"
+SRC_URI[sha256sum] = "c82896e779b18c2a157527f32f35de9a6d984f8b8ebad2b41dbc78c33adbaabe"
 
 inherit autotools bash-completion
 
-- 
2.43.0


