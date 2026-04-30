Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AAFFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:52 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17249.1777546246945321106
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bvnArIF/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546249; x=1809082249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KBZv3IUII+LRiRAZhrTv9X8zobd14aoBg+TPg3amWI8=;
  b=bvnArIF/8nO+8/nmXjy8Tu5L0LN9pgjQRKuEuHeIRIkRn98k251MiAeT
   tapyfTg0qJGrBeqbOcl9FlW7GJc8TuToxp05KCYe8hOH/i/3xrDNdAOPh
   L/MEijuMoUp1ZYEIZUBtOYOAz1/UKh9Usuwn2E3fAn7FBAu3grDhWzNmm
   2XgoSWJKgDplcyy18EPb0Y2TxS+Q4+NRrCSpixTINfRgQ6SNuOnxenAIc
   RWgj27QXKUcAmAeQNlqAl7R1012NzBrarGXXDmscoYPpBpl9MDP0hCol3
   LgxPAgPY9LUlaG/i/3CBneyr2pbnAOtweZ88HNhfY0u2AIJt0dQLBkISc
   A==;
X-CSE-ConnectionGUID: zXm3xx6kS22iLSsB5Df+ng==
X-CSE-MsgGUID: B0NzWqWWRS+AH4bFYdEQyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="226101033"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="226101033"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:49 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0328142A335
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:49 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 98B50C0023E
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 14B1D1801130;
	Thu, 30 Apr 2026 10:50:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 50/64] python3-tox: upgrade 4.52.1 -> 4.53.0
Date: Thu, 30 Apr 2026 18:49:09 +0800
Message-ID: <20260430104924.1106-50-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126720

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  eat(toml): allow bare range/labeled dicts in env_list

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.52.1.bb => python3-tox_4.53.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.52.1.bb => python3-tox_4.53.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.52.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.53.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.52.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.53.0.bb
index dbac6deed8..bf3c1d3690 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.52.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.53.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "297e71ea0ae4ef3acc45cb5fdf080b74537e6ecb5eea7d4646fa7322ca10473e"
+SRC_URI[sha256sum] = "62c780e42f87d34ee60f2ea20342156253794fdcbd6885fd797d98ee05009f22"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


