Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED29ACCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:44:20 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2909.1762386251563806183
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:44:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HAXWudDJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386252; x=1793922252;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r1rbyf54iP4ouEJdnBCIwRhmfB49fArQWOOMZVfNH2s=;
  b=HAXWudDJcmB74BD8WNpeqqGwvx6DObxnjScY/rhqqIhK4ihud8rT5Doa
   /JBYY/tmNhXMTDzvFMa0u9bxfClQUx1fgqIFO0tMDSUmJVRxycl4COXZu
   mzPt0GKrelm1OPP1Ztt7mZwqe9dac+JXGIaNwhDgymnpFkB+OwV/oVusA
   i45sOIxTjTJi/qSd51XYUoSodvfSGeDn07Fz8LUU8kwpYNFg6FSDLW51c
   wKm3sdYEYkC4HcukwYyOcTZ07bHICv3jUZG86O8v4J/ZPx9pvGrnEFWv7
   4mzc47tkDlKlLokscPCfH1YdiflIkQ7gbzUVw4ZEeYnSluMFaeaeVoEqd
   w==;
X-CSE-ConnectionGUID: B1T2c7ktRg+cHajHgRxnFQ==
X-CSE-MsgGUID: 5e2Y7guiR0mc7qLwyT0cqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218262718"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218262718"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:44:10 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 89631820C18
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:09 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3F7D08D206B
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C12D310001F9;
	Wed,  5 Nov 2025 23:44:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 01/12] libcrypt-openssl-rsa-perl: upgrade 0.35 -> 0.37
Date: Thu,  6 Nov 2025 07:43:51 +0800
Message-ID: <20251105234402.423-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 23:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121340

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...enssl-rsa-perl_0.35.bb => libcrypt-openssl-rsa-perl_0.37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.35.bb => libcrypt-openssl-rsa-perl_0.37.bb} (92%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.35.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.37.bb
similarity index 92%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.35.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.37.bb
index bcc57ffc09..90df019fec 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.35.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.37.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=399bd4de06d233aa49afa7c47cea8117"
 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TO/TODDR/Crypt-OpenSSL-RSA-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "5eebd55ac071634c864a8e78f5cfafbaaf43cf84c04323a09b71dd76bf025cc2"
+SRC_URI[sha256sum] = "917f7312532f8f4af4f3acbf6ba10e0151f8577d2ef1f38e1035229be86eb6f4"
 
 DEPENDS += "libcrypt-openssl-guess-perl-native openssl"
 
-- 
2.43.0


