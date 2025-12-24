Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B242E75436
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:13:40 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117294.1766567617427127447
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:13:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LWMhyUMj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567616; x=1798103616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mBeB5Kf67PXXi5tGTee9mELjO8ZSVRvn9Kl9uaZiJzA=;
  b=LWMhyUMjc7DcQ8xqja5toJvUQpKnApQo7lTyHq28SnjdgK/IOkgnb4L+
   Vwt6/sFaZv/2FCx88T/xlbMcQOj8aMazev1Nxukwy6UK8i9GhgU4M+f+c
   T144UNANuV6Wo2BMHk89SpbBNd6DaRHznIKPsdX8RkoRnynF4zMFJcG1a
   nDOtUb5niYdQE94LjRTNyCEB2/aFUnWHiVoCScpO1NhSj3YzntuTCgaYZ
   cXRXbeJsX8CI+sc4ynWvCjiz0k63XWoHbhcThua7K0/iCSCWEmhZyP5Iw
   Gi9d0WhegzkpbNp2kSKoi7x0hHiwQbjnr2JyMoLHe2W9WbuiRm5gC4pcX
   w==;
X-CSE-ConnectionGUID: xRPXIFc1Qm+v75rw9IUVoQ==
X-CSE-MsgGUID: LyEP+uB6Q7GSdMf+d69xEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="223774417"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="223774417"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:13:34 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id BE2331C1C726
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:35 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7154818000BC
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id A5CE02000766;
	Wed, 24 Dec 2025 09:13:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/28] liblogging: upgrade 1.0.6 -> 1.0.8
Date: Wed, 24 Dec 2025 17:12:42 +0800
Message-ID: <20251224091304.974-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122856

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- build fix with newer compilers
- builds again on Solaris
- some code cleanup, which prevented build with newer compilers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liblogging/{liblogging_1.0.6.bb => liblogging_1.0.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/liblogging/{liblogging_1.0.6.bb => liblogging_1.0.8.bb} (90%)

diff --git a/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb b/meta-oe/recipes-extended/liblogging/liblogging_1.0.8.bb
similarity index 90%
rename from meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
rename to meta-oe/recipes-extended/liblogging/liblogging_1.0.8.bb
index 1b7f95d57f..54c3f357d4 100644
--- a/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
+++ b/meta-oe/recipes-extended/liblogging/liblogging_1.0.8.bb
@@ -12,7 +12,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=63fe03535d83726f5655072502bef1bc"
 SRC_URI = "http://download.rsyslog.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "338c6174e5c8652eaa34f956be3451f7491a4416ab489aef63151f802b00bf93"
+SRC_URI[sha256sum] = "6449b7bb75dc282ec6bf1b98a753c950746ea5b190ec9aee097881e4dc5c4bf1"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


