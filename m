Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B388C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:40 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3277.1787132133663526683
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bAv34ZNp;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132134; x=1818668134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sHFY+8XZF5cVJG3Z4K5vvT78BgrQ8tMc8KUytBH14xw=;
  b=bAv34ZNpQPBAQ6NZ/U7RSBK4YpgHzwOJY9OfgZbsD+gKSY3OV30NmeRy
   SvC8i78dxciDKZWJGE91Bnj65zB2lWg4m5uUILuFVH6HWU4AHOtWB9aYu
   63DdScWVNcSlWEMSTOTIFEmf0rJaQEOcn83SjWzSsquzW0qm1/dPp6DH4
   L2WdeXxWLzRSrYvnKeh8DndMDtDNlLE78k1ItLLmUt1yad/zVO012Vlpj
   uh5VTP7ErZtwIso86wQIYR3e9nYxRuAkiOB1AvAvlLXPTcMBUniYInych
   Ccnjn00DamTCBoSfHQu9C5SnV5DfhL9JNFwEfOqQ4+DzJH6Koe8sa0jcl
   w==;
X-CSE-ConnectionGUID: /96bMVLnTaqhzUMzfcXwcA==
X-CSE-MsgGUID: gLyRWwR5StG/DQVY0dGTrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="229586234"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="229586234"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0F876100037B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:32 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id BA7C318026DF
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B5FD11801C21;
	Wed, 19 Aug 2026 09:35:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/70] gensio: upgrade 3.0.3 -> 3.0.4
Date: Wed, 19 Aug 2026 17:34:11 +0800
Message-ID: <20260819093514.1101-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129277

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- soapysdr would not compile static.
- Some python2 APIs were converted to Python 3 for SWIG 4.5.0 compatibility.
- An ssh compatibility mode was added to gtlssh. This deals with how parameters
  are parsed. If you invoke it as gsh, parameters are parsed as ssh does. If
  invoked as gtlssh, they are parsed like gtlssh does (which is arguably more
  sane). There is also a parameter to do this. This helps when using it with git
  and rsync and such. This is described in the gtlssh man page.
- In the fsk (afskmdm) gensio, low sample rates were broken because the gain
  was not set properly in the FIR filter implementation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_3.0.3.bb => gensio_3.0.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_3.0.3.bb => gensio_3.0.4.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_3.0.3.bb b/meta-oe/recipes-connectivity/gensio/gensio_3.0.4.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/gensio/gensio_3.0.3.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_3.0.4.bb
index 0e89562452..0ddeb115ec 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_3.0.3.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_3.0.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "183b8926c7b7ffbe68e1710bf32f741dcff58f51"
+SRCREV = "e66b91f3359c432fe7e054486908d1caa22630d5"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master;tag=v${PV}"
 
-- 
2.43.0


