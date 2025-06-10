Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC70C61CE8
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.78447.1749526442820210475
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S1VH+Boc;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526442; x=1781062442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iKTEtk0F0LOhJDXrKre8ZBvsGsR1edQ92jQrqyNfSKs=;
  b=S1VH+Boc9p5paZ/o0NUTCHFa6ZZE2xQ1ghl1+kyUtC5RLrtHKxWs823s
   HHmJbTWfFLpfVqFOqhKzTdTSg/jjyfOhMZ6DAHYJD2TmSbll49ys1+eZ2
   e54knB4LaO8f4ywHcQmAQtLtvrU43LbYpdZf3PzLTIukBfR4sBwvFQZTQ
   emsxV+uu7QRFITwJs01PMR3za45ugTMwyIGoqMQnb8KVq5htgf1eoim84
   V/3KbNSZwX+cdebPSBfLEfFWZKjcpI+zCd1cnX53yVOanKA70dyJOLYYD
   MSbd/3aaHosOSACHy1rDJu6TTYonEbiKRd2xUo+wV8ba0h7ca4oyqHguO
   w==;
X-CSE-ConnectionGUID: 4nljME0iSRGhh0V947LNZQ==
X-CSE-MsgGUID: ruC7Y7rtR/6sP755lzm6Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190662515"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190662515"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:34:00 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BA2DD5004
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1150511C7F
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:58 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3A3321A009B;
	Tue, 10 Jun 2025 11:33:57 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 63/64] wireguard-tools: upgrade 1.0.20210914 -> 1.0.20250521
Date: Tue, 10 Jun 2025 11:33:29 +0800
Message-ID: <20250610033330.924-63-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117856

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rd-tools_1.0.20210914.bb => wireguard-tools_1.0.20250521.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_1.0.20210914.bb => wireguard-tools_1.0.20250521.bb} (94%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20250521.bb
similarity index 94%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20250521.bb
index c12b8abd5d..8fb86bc31e 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20250521.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "3ba6527130c502144e7388b900138bca6260f4e8"
+SRCREV = "e2ecaaa739144997ccff89d6ad6ec81698ea6ced"
 SRC_URI = "git://github.com/WireGuard/wireguard-tools.git;branch=master;protocol=https"
 
 inherit bash-completion systemd pkgconfig
-- 
2.43.0


