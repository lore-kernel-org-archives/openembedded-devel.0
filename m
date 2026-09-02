Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3642EC624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9401.1788344999262133477
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NntSfya9;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788345007; x=1819881007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MTuSI2IUwY7ND7HqSEzIeeY24r8hlbWN7QfMLobNaso=;
  b=NntSfya928B6u9aH4btsI6Fco4CS2drknSyz/I8zsww/JN/Y0fTOcvs1
   GBIDWH07Rsk0DTmKXfGExbf6L1K4Pk9xzUq55KIpsU0s1/gKPVmRWP0JA
   5BjvwGIoI+ER3QIMfhobFT8LRbkpgne+Pyoww06tO9umTNVbstNUhJsnG
   4EYfsOBCubiuoctAD/22jwurdc3yCuCJvm0CjlvOqgW3aCxKdHNX7kMl0
   +A261gV2H9YpciZYneCRPekVY9tgX7ugurM9Bm6OGbOEAxNxxXPsItdoM
   yZbN0VRiaSRASG9Q0jmRWjlzAtP2jszcVMSWsvB3Q1Gpe7DMexj9ORnNH
   A==;
X-CSE-ConnectionGUID: ZzXJxtoES0+56FZNeXpXow==
X-CSE-MsgGUID: HserSwpZSiiJjn0NSQYx+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="239767277"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="239767277"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:30:06 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5365DE44F
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:30:02 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 020011003BC4
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:30:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 13DC12000770;
	Wed,  2 Sep 2026 10:29:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 31/34] qpdf: upgrade 12.4.0 -> 12.4.1
Date: Wed,  2 Sep 2026 18:28:57 +0800
Message-ID: <20260902102900.1296-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129690

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_12.4.0.bb => qpdf_12.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_12.4.0.bb => qpdf_12.4.1.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_12.4.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_12.4.1.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_12.4.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_12.4.1.bb
index d8aa58caa0..aa35bd4725 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_12.4.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_12.4.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "babad179ce5db9a21635c8d1ac17baa59637eada"
+SRCREV = "c37f83ae468abb6cc741f43b2f6fdeb66e550ffb"
 
 inherit cmake pkgconfig gettext
 
-- 
2.43.0


