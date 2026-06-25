Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4483DCDE007
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:57 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7228.1782378111864083413
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eLQrjTdq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378112; x=1813914112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1aPdsrGy2jECgBtdWnP2BlIHJuVrSAr8SakSM9xjO1w=;
  b=eLQrjTdquYQRHUCFj0JZ/nAnTP2YQ1B+RhpFi8iBpnO4FqdmE5cLyTmD
   h71pY3rMySBEhMNEcRuGVN52mgN7GLNLxKcbQznlDEWkLL+qviekc0iMq
   0+jzCquaWZ5Cb6KxRSobZF2YbH2YaYbcJtV8Q35h2ySFe6fVRutkbTIxa
   GomSxt/eLWRw6cdOvb/mXeFJQ9QjHh0PicRP8qv7//dygC/0EPkck3+A5
   PmOJc6F+vAEGly5dEFvyF7w5cX8wB7OH15mYQPu/5O2bHE8gJcGc6RfvF
   l7bYpQTRrbwgM/4yQpvCP4PQVSk0yo7wiADocvYHPHMtOdA/skkKNO8Wa
   A==;
X-CSE-ConnectionGUID: a8k7JOJySSiFj5Ynv6OgHg==
X-CSE-MsgGUID: mV6E0FsWSuacUh9JnLGbOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="222999851"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="222999851"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:50 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2DD45730C
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:50 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D5C0810CF1D9
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 047251017325;
	Thu, 25 Jun 2026 09:01:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/47] monocypher: upgrade 4.0.2 -> 4.0.3
Date: Thu, 25 Jun 2026 17:00:52 +0800
Message-ID: <20260625090127.1563-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127744

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed timing leak vulnerability in EdDSA/Ed25519 signatures.
- Various minor documentation fixes.
- Various minor build system fixes.
- Various minor compiler warning fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../monocypher/{monocypher_4.0.2.bb => monocypher_4.0.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/monocypher/{monocypher_4.0.2.bb => monocypher_4.0.3.bb} (85%)

diff --git a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
similarity index 85%
rename from meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
rename to meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
index 178f273ae6..0c8f090cf5 100644
--- a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
+++ b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-2-Clause | CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=ff30a1c41dfd9e6fa559a9e45ee98302"
 
 SRC_URI = "https://monocypher.org/download/${BPN}-${PV}.tar.gz"
-SRC_URI[sha512sum] = "bf275d4c53ff94af6cdc723a4e002e9f080f4d1436c86c76bb37870b34807f1d7b32331d8ff8a1aeb369e946f3769021e03e63efac25b82efc5abf54dc084714"
+SRC_URI[sha512sum] = "40904ada5c7ee4f7741733e38b69a30a4b0561cbffba5ffe7c2dce16136d540251ec0d9056ff606510d3b5b708fb8a40db7e0870d4a0b2dc17ba2bfb880f8965"
 
 MIRRORS =+ "https://.*/.* https://github.com/LoupVaillant/Monocypher/releases/download/${PV}/${BPN}-${PV}.tar.gz"
 
-- 
2.43.0


