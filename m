Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E63E69EAE
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8203.1733185015403613953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZleC/25Y;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185015; x=1764721015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OjnsIrBP4Cmly1hYmemL2YOYodvew/xbWtBsT/PdY0I=;
  b=ZleC/25YBHJZA617Aj6lQQdExrzFvaUwluQEb0/ikf/BeHmlNI09Fsxe
   F/QDTa8T9E8nNO6sTCsfSFNhQnjkLGZNSgt5JNisJtlDVnztlfc1LwTSE
   oiGXDO5SscrX7+srWb+JTWJlO/cAS8bemmxjL65YJ4SEpsOYgh6Aq7JDM
   dDS25GRXMdjM4MTf+5WzUXKDZYV4NMbTU7NBsV8YtS7gKGQJJ7qZBZA2T
   fnomueJneQJoDJE1Y8hpi4bxmswVjBlLZJRYtnb4K76o64eg2gwtq9w7R
   L2pYrUEg+BHFZsfAvoHS7DzrvZwbGMrnW74hX7QkxNeekGVNk4xATMD7k
   g==;
X-CSE-ConnectionGUID: iMHjrw3yQveo7ZQ0eifvGA==
X-CSE-MsgGUID: Ag2tZs7vTVe+LK/ow6Y0pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="170368307"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="170368307"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:48 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C508496741
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 92957D9717
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3625120071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:46 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CA1941A0003;
	Tue,  3 Dec 2024 08:16:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/34] ctags: upgrade 6.1.20241103.0 -> 6.1.20241201.0
Date: Tue,  3 Dec 2024 08:16:08 +0800
Message-Id: <1733184999-27041-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrQrU6u0ns/XCeCXn0FOd6Dixfy3SHnE9tx03HU0BLxOaiT00FH2W6WSWpF
	i+MknFK1ge8rL++KCiXXfbOb5KsifJk1WsehusbR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114151

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../ctags/{ctags_6.1.20241103.0.bb => ctags_6.1.20241201.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20241103.0.bb => ctags_6.1.20241201.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20241103.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20241201.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20241103.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20241201.0.bb
index 5e048e1364..209a6ce329 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20241103.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20241201.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "bb4d9f5bb554d0947fc0c6e4c08bac12fc5f832b"
+SRCREV = "c828bc235e2ca2aee30f1c87248a963563353977"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


