Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09616C61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:10:05 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7659.1787731800573583540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NBXmUFiT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731800; x=1819267800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QnsMIVMxhjLG8B0VdvYgMdyKkiwArwwGSpMazvUccT8=;
  b=NBXmUFiTdBeHqne8vB9Ok0fEo7tOHX4rRBa4SXbQLTfS7RzAVIiqAqKa
   DI6KmfFiY/GupsxMIOmEqMZBqBsTtXv3YFvg4Llx4u8KIPCfSftPwH3Xl
   XH1CkdZifZ+OnGj25lKCM59csXxTStXHtn6LEbUmhCtLcS6LTvQCR9c9u
   8M9Ux1b/AglfpSpoQp5E3DW4mu+ih5NtGYDkKE2ReZETVPwx8tNqnuiVv
   ZhdzO7CSdOBgTZi8m7xTYaAt08yOLtIyuq07oFCIkTVXjIBrfSPdae/vp
   LOxQgVoMMkd7UcBPJ4NP+jdsKA9EpwOhmSFaO3epM9c250mbgaEhecaVx
   g==;
X-CSE-ConnectionGUID: Oj10w9dSSoCvdMKyuPKrpA==
X-CSE-MsgGUID: vrEvSTMCQeqLxKhp5Q/JTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252189157"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252189157"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:58 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C4C541C1C71D
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:58 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 810808D29C4
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id A07B914063BE;
	Wed, 26 Aug 2026 08:09:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/23] python3-pyzmq: upgrade 27.1.0 -> 27.2.0
Date: Wed, 26 Aug 2026 16:09:20 +0800
Message-ID: <20260826080926.989-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129509

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyzmq_27.1.0.bb => python3-pyzmq_27.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_27.1.0.bb => python3-pyzmq_27.2.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_27.1.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pyzmq_27.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
index 4014879aae..606e34e69f 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_27.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
@@ -29,7 +29,7 @@ PEP517_BUILD_OPTS = "--skip-dependency-check \
 SRC_URI:append = " \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "ac0765e3d44455adb6ddbf4417dcce460fc40a05978c08efdf2948072f6db540"
+SRC_URI[sha256sum] = "54d4259d1bfae24ecdb5ca79f7acc2eac6c286a02d6a0ae617797cb45f0726d3"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest cython
 
-- 
2.43.0


