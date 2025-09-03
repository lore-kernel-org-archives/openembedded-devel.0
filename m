Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03861CA100C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8059.1756890229088344278
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jvoJ5XOv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890230; x=1788426230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pIabuMVoRaKXRV2Ki+4z0EEzekks2hBj+dJNnVEx3T4=;
  b=jvoJ5XOvUbaPbUhnfIkZyqVjWsR0WmRxmaJ5vN/aLPGVEcNX+nyKIUl8
   jKjIpkJvKlUuWAKhVXHIGkaxEMXukYjUx80WxyANx5jSLT9CWOWjfmXyc
   bhwEDQhGzds3dw8RnqkMecShPuvxek8TmoQ4AkSvKrH/quPPcFmyWBinl
   px8F3ehkXWjyEtD59XlpX64Lqi7wPx1aE1lwYBDb4LT8cWIuarl4nrrS0
   6Z1d0oM78Usqi2mbLR6zwdDWU4EEyQ2/4Ycid2HOuTMW6LLloNcY8FABB
   +pr8Ggafn7fDY3DgURVtXZl7seu+iQ9nJSLYglGLwIQkYv1nu6XBAM7q9
   g==;
X-CSE-ConnectionGUID: Jzh0o4V3ToynMVWN4Gqjsg==
X-CSE-MsgGUID: vwKcVm7JTeiJM44SM0A95A==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211549680"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211549680"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:48 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 986BD1C000BF
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:47 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 544DE115071A
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:47 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 502342005D22
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1846C1A0078;
	Wed,  3 Sep 2025 17:03:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/56] python3-alembic: upgrade 1.16.4 -> 1.16.5
Date: Wed,  3 Sep 2025 17:02:42 +0800
Message-ID: <20250903090317.2002-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119218

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.16.4.bb => python3-alembic_1.16.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.16.4.bb => python3-alembic_1.16.5.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.16.4.bb b/meta-python/recipes-devtools/python/python3-alembic_1.16.5.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.16.4.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.16.5.bb
index f6df3131ed..e3abce84a9 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.16.4.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.16.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "efab6ada0dd0fae2c92060800e0bf5c1dc26af15a10e02fb4babff164b4725e2"
+SRC_URI[sha256sum] = "a88bb7f6e513bd4301ecf4c7f2206fe93f9913f9b48dac3b78babde2d6fe765e"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


