Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71301C2A069
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 02:43:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36827.1767494621402658493
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jan 2026 18:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qhr4Ij6O;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767494621; x=1799030621;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uA1I/5SnXI1mY0H7TNRRsS81QQXPUSbXp+/ICL39oo4=;
  b=Qhr4Ij6O8/PEUL9eGlWN9DajQ7GrEqEZL9j7sOzq9MpjnNGhLraviWCs
   pW2MZmeY/DJufWhJrmXyVVf4BVtY8QF/aY5/+CdTFOByhFfB6EUnm5Dmc
   hPBhFhf8BqBqTHmVqq7lNd8eNoQFf7SwChtSIWbG388S+L+2yhExjo3Ko
   cM9vpRsyRsPrMWh/iA0wTKEFtyXSzQP5kdeVWxWY6T7tOm2KGbTpM622e
   yhKkjK/zDID4Fc3I+pD5DwnndmFWP3I3TubX1xPJPB+S6HS39NyVcHr2v
   IcFA4/likYd6ogzg9TrXSIn2z/TGda3Ck/1XhHW3gcIIlqlPIMETGjDMY
   g==;
X-CSE-ConnectionGUID: b5/geKz2SYe3YYYAZqkLvA==
X-CSE-MsgGUID: Gi/LlFqDTA+XnKxNAlPCeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="212586465"
X-IronPort-AV: E=Sophos;i="6.21,200,1763391600"; 
   d="scan'208";a="212586465"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 11:43:41 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 77B9F8200BD
	for <openembedded-devel@lists.openembedded.org>; Sun,  4 Jan 2026 02:43:42 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 30B0018002F9
	for <openembedded-devel@lists.openembedded.org>; Sun,  4 Jan 2026 02:43:42 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 090ED10003BD
	for <openembedded-devel@lists.openembedded.org>; Sun,  4 Jan 2026 02:43:39 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 2/2] python3-cmd2: upgrade 3.0.0 -> 3.1.0
Date: Sun,  4 Jan 2026 10:43:30 +0800
Message-ID: <20260104024330.686-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260104024330.686-1-liuyd.fnst@fujitsu.com>
References: <20260104024330.686-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 02:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123108

Changelog:
https://github.com/python-cmd2/cmd2/releases/tag/3.1.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/{python3-cmd2_3.0.0.bb => python3-cmd2_3.1.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_3.0.0.bb => python3-cmd2_3.1.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_3.0.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_3.1.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_3.1.0.bb
index 5f3ac7e98e..911d0989ff 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_3.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26efe44f9946f43292f90070d9d5590c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "f6fab21d2b344a3ab9fe174a6286c9fb4f43a185ad1dfacd13ef017a26a2c333"
+SRC_URI[sha256sum] = "cce3aece018b0b1055988adaa2b687ac9c1df38bfd2abfc29dbeb51a9707de33"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


