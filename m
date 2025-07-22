Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212ABC87FD1
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.4283.1753153985181374298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B0VSB7sE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153988; x=1784689988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kZjUN2L9FCt8BcJncOw8df+yUkpeIroqFsgeFcNYH8s=;
  b=B0VSB7sEl1ZHazOk0uftEtsnLKZfu1rV1UIfq3D+9w3nuwH/V5R+IKPm
   JW6Q7lm/XrNXvAzfR3gokFl2YIXOsyyDju5oj//E6Mk46ANmUh2Re1I1T
   qj8fvfIbE2Px7t3zKOCby5BstPUnFwRmePA6EVDDhsNzvG45Q1Lj6dCCz
   CRqvBqtLojYMlXGAOUL+trpB844JkzH65I+8nqpg/eXZFZNNqzZRJSrKv
   a6XdZn5+/DUl3AWpGn2scTJNQhBYnVdl79MrBinoqX2xMVYqm8ZMB+1SU
   MTEKQK4cGsMnxu8xoBa6+0hqC2KTjgCclgayxeTCZOzNGEAhpHmGcPV8U
   Q==;
X-CSE-ConnectionGUID: DS8ECHHhRTOdJZkVJ+y4qQ==
X-CSE-MsgGUID: UCcFSAvmTMifiMLFrC0law==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="210239135"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="210239135"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:06 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7690D1C00085
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id DBCEA180050A
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:04 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C8ED31A0071;
	Tue, 22 Jul 2025 11:13:01 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 09/21] python3-grpcio-channelz: upgrade 1.72.1 -> 1.73.1
Date: Tue, 22 Jul 2025 11:12:17 +0800
Message-ID: <20250722031245.884-9-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118671

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...cio-channelz_1.72.1.bb => python3-grpcio-channelz_1.73.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.72.1.bb => python3-grpcio-channelz_1.73.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.73.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.73.1.bb
index 0792506e03..857e842b70 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.73.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "7dec124f2cefe6d2f2b9176d578496a938a8407ea196eb7a27494f4a40793a0a"
+SRC_URI[sha256sum] = "e48c5444db505d9e42ceca4399ccb9926bceb41189a8956140a94d2f95538be9"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


