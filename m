Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A40C44501
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:29:40 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9487.1768994971316256688
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OFDv9DIP;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768994971; x=1800530971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KLrHILnTaD7sOOgGhXZVs4DGca03uazC8GO7GB1Fha0=;
  b=OFDv9DIP/Z5rmhiQ+d+qBOb21DS+Gj6wix5tjzd+f0orq+dTM40DDZBc
   kVRJDDT+S0RK8NgI68qrz2LCGUTklnMqO9np/2hVW/0ukyAD3kgv5Jt4V
   tGTS4u+roZPPKz1J39sDudTUPOjskGDBo4c52TwiHNZzkxbVMonwuLiS+
   10ViSXetqc/Q1sVg4QMPj0xKrorryDi1wb6mIYykD6g8gtA5OAlwOIeUt
   oUlPZwKbKUF7TX1ytlhp3+Ai/1VdPeWsZ2vLMAAE9flskkIa5mlntZOwz
   B0SD/UVhkmfEjJ3XBFHxAlPX4Gs9CnQWWsDzvpQ5kaVHZkesQBPwJ3maJ
   w==;
X-CSE-ConnectionGUID: M/mdDgJnRhmWEuyioTynfA==
X-CSE-MsgGUID: UcQj56f1QNex6DR7s0vCcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="215159136"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="215159136"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:29:29 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id B45A2146F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:29 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7087FC01804
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id D5A3F1401D61;
	Wed, 21 Jan 2026 11:29:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/30] mcelog: upgrade 208 -> 210
Date: Wed, 21 Jan 2026 19:28:53 +0800
Message-ID: <20260121112921.857-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123693

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_208.bb => mcelog_210.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_208.bb => mcelog_210.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_208.bb b/meta-oe/recipes-support/mcelog/mcelog_210.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_208.bb
rename to meta-oe/recipes-support/mcelog/mcelog_210.bb
index 4a72cd4d66..c0ddf323e6 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_208.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_210.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "2965a540ac2fbf1e0a992afd17c01747d6fd66aa"
+SRCREV = "357b136f95be23be1dda2c5e220e0430e9b20765"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.43.0


