Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53E3EFD21B
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:37:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42034.1772012267355593880
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Iw5gqQsD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012266; x=1803548266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xQ0ORD9bTBwZlWbTWFbDliRd2rcEqQgZSYS2ecAx+s0=;
  b=Iw5gqQsDTCVUiYu2cfoLVqo4JTLA5dCs/CPkGpK3NsysNXYk+6R9Gwid
   HfPyylzs9NKRiuWi2k/ySfFz71ED6XUJL54IzmqEP6v8kN8a2v0adwTEZ
   oe61mU9QeO0a2EHroBLMfUzpZMLRyqA7ZnhqNCMghzOiXx1+XIwOO8Du9
   JUhY1+m5IYEzyB9Qtk496Slw4iPB6RRCslt51d74s8qvwyE26y8eQJQei
   nnpyVKHQNnDX+rNXDvSVwcFsxG+j77oNKpBnzWoYTW5Exw6euCFo8VAi0
   EioBfCulHORKrB6XRqPeLjx/kgzMnw2tdx/hVMS6bvvTOHris84nNfc4N
   g==;
X-CSE-ConnectionGUID: wh60YbQPQY6D7PgNchSarg==
X-CSE-MsgGUID: MTDb+usQQV+T3hyILep/NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="230948621"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="230948621"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 7A22E1C000A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:45 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 31C3DC00D76
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 57E5E101BB76;
	Wed, 25 Feb 2026 09:37:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/33] cmark: upgrade 0.31.1 -> 0.31.2
Date: Wed, 25 Feb 2026 17:37:00 +0800
Message-ID: <20260225093727.1284-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124618

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cmark/{cmark_0.31.1.bb => cmark_0.31.2.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cmark/{cmark_0.31.1.bb => cmark_0.31.2.bb} (83%)

diff --git a/meta-oe/recipes-support/cmark/cmark_0.31.1.bb b/meta-oe/recipes-support/cmark/cmark_0.31.2.bb
similarity index 83%
rename from meta-oe/recipes-support/cmark/cmark_0.31.1.bb
rename to meta-oe/recipes-support/cmark/cmark_0.31.2.bb
index bbbb36dace..b820d9fd65 100644
--- a/meta-oe/recipes-support/cmark/cmark_0.31.1.bb
+++ b/meta-oe/recipes-support/cmark/cmark_0.31.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/commonmark/cmark"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=81f9cae6293cc0345a9144b78152ab62"
 
-SRC_URI = "git://github.com/commonmark/cmark.git;branch=master;protocol=https"
-SRCREV = "bb3678d7a73cb02d35c8876ecd097072636200a8"
+SRC_URI = "git://github.com/commonmark/cmark.git;branch=master;protocol=https;tag=${PV}"
+SRCREV = "eec0eeba6d31189fd828314576494566d539b1e3"
 
 inherit cmake lib_package
 
-- 
2.43.0


