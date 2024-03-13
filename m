Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC25C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 08:50:10 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.11737.1710319808069161267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 01:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=akGBQQlG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710319808; x=1741855808;
  h=from:to:cc:subject:date:message-id;
  bh=+enGlTWXBLHqH4cN3O9A7WvFUOlj1FfavXYUxs1Kywg=;
  b=akGBQQlGqqlWaSJrlIMIhl5iHMTT1bWzgDizt3YnZq+1kic8xL9fa2uf
   x1fbtsmhC7RAhErQYSLGO/1va1969hoB+uZnyBnh6S+Wo6QVKxBu5Tvfw
   goOcsSpvG76A+cjvhbDFwT8s9+QBssBfS0ZgheTlcCehI6Z7+IG1mHQxu
   eCvXa/O80H8gePXrk4Ab6n1ZcYqpvGvQhuVkakECq1YaOSZeu1D1R7Lxp
   YfysUPSb1+r1AqVqjhzAE7Ej0xoQ7rvsSANvN9DCsZMmAM9PPYax7W1x5
   8kz2yKunfsaV3xk7l3w+KO51eBP4fZCIXpOcRPSUp6Q7ewUOpZf4/J2rc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="152161533"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="152161533"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 17:50:06 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 93382E5E8C
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 17:50:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D6C33D3F1E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 17:50:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5368320097CF6
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 17:50:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 00AC11A006B;
	Wed, 13 Mar 2024 16:50:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnf-plugin-tui: upgrade 1.3 -> 1.4
Date: Wed, 13 Mar 2024 16:49:52 +0800
Message-Id: <1710319792-13181-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.005
X-TMASE-Result: 10-0.817800-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpO1fW
	IQC27i4v4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0548SiwizsgluQ1vZ
	7s3YIVDI3lq3YEgY6JtUyJifTba1F8Km+1ClbgWlqD/+OJa6Hg64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipco2HY2EEUEtB5uKQRMkFRNOQy1S1CPwJsepKa
	4IfERWNrK/j8zEhFOSkoacCwN9YqAGGxS1HcNznFKw0n9W9lxmaPpVpvUH3W/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 08:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109291

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 fix the bug of syntax error when poky updated to scarthgap.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{dnf-plugin-tui_git.bb => dnf-plugin-tui_1.4.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/dnf-plugin-tui/{dnf-plugin-tui_git.bb => dnf-plugin-tui_1.4.bb} (96%)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
similarity index 96%
rename from meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
rename to meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
index 8db456b99..479b98d44 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_1.4.bb
@@ -4,8 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
-SRCREV = "baac322a8a6d57e62c703f6ed523152baec18b4f"
-PV = "1.3"
+SRCREV = "ad48d934c54ab01026634c90f47f151f148b8147"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
 
-- 
2.34.1


