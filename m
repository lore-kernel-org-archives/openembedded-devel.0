Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B584DC71153
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.78427.1749526419816519734
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g3yv5DKN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526420; x=1781062420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3JzSlIOpOkJ+Y5LSVxPt7EaLQhjIogQVyo3CawiNuLY=;
  b=g3yv5DKNZVs8+Nr0RFpjxWlk1YyAL+mtB/RiCN5ixHFXU9Ci/tDk+yy6
   vX3Ta/6gh0LodxSBsR1v91aINoWSS8Rzx284FK5kVqeBFLiijs/WaYyqu
   YAp08/t/Ioj3VuwjHUozuWlGCsmiwlKDyFykc+arstP8Cf9ByZxmvTw4t
   iECxYafCdqptwmruJrdX0PRcMBHDLD+l7SZF+bUQ8F4YXnLu4RTYjM9io
   X4XeRC9XBiP+aoGt36oOAg81LoBEQO0VKDc2VUk6OjUPUjMgYrtlxWikY
   Mtxj9wVl0AQ0aXj4wr5r+NqZ7OBFa+0aifMnhTXWMFRmQ5fNHvOei/q7z
   g==;
X-CSE-ConnectionGUID: sbpE+72LS6Sq5DWvxsRo+w==
X-CSE-MsgGUID: V8FqA6w0SVie3lPAboy3Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="189594975"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="189594975"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:39 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C4D68C68FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EFDED5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:36 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E443E1A00A1;
	Tue, 10 Jun 2025 11:33:35 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/64] evolution-data-server: upgrade 3.56.1 -> 3.56.2
Date: Tue, 10 Jun 2025 11:32:32 +0800
Message-ID: <20250610033330.924-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117797

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Handle changed server pool in WebDAV collection sources
- CamelDataWrapper: Correct return value of size calculate functions
- GOA EWS: Fallback to likely EWS host URL when autodicovery fails

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index d737de054a..54eb593e5f 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -11,5 +11,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 GNOMEBASEBUILDCLASS = "cmake"
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "646cc0037da3f9f295794c637d95394ad76f8c9bee2268be2c4183e27720c137"
-PV = "3.56.1"
+SRC_URI[archive.sha256sum] = "df4ec29950f29a76eac6fbe0f814c48d2cef7d3fdb905002a4a883dd761ce93c"
+PV = "3.56.2"
-- 
2.43.0


