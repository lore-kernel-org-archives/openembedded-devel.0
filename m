Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B340EFD231
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42047.1772012294790787880
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qA0bFgfZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012294; x=1803548294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j1n49byGHSxWwNI/NLSucD/30hazACb+QgSzMSIG5LA=;
  b=qA0bFgfZ9fWcFbZLk0ATbauxkEsb4BqRAdaXJxkrTH3yv3aFvx1JpHqI
   OcGo5U+YmamrcxEcKuxj8Ijz1QRsuyB9pk1FVNZRA1C7nOLKgovSGEuxT
   gZpH1utB+kpgkEDhZBnOOxgeXEFjOBOdZVg2uRcuAzfRE468nfCDen7MG
   6qkPqpisyJVnCsEpptdfpktEgmxGvghcoGuufrq7hiU3Kor1IqyknqXnc
   A6bNxLu2+8xuVhsDV6TGsJv8kE3bev8olimy9GZDxvga5a0CF+ZceGtIT
   6rW47QcrHZg4sSv5u3hzb1mHBFc0MRpr6JPnl3cc+2wNvrU6mtNOcuQqe
   A==;
X-CSE-ConnectionGUID: 981Fs08WQN+gO2AE8Uy+MQ==
X-CSE-MsgGUID: FghvaCMnS2WcnYmAevRS6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="231670412"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="231670412"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 620851C000A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:13 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 1429D10001D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3EBD0101BB6B;
	Wed, 25 Feb 2026 09:38:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/33] libyang: upgrade 3.13.6 -> 4.2.2
Date: Wed, 25 Feb 2026 17:37:13 +0800
Message-ID: <20260225093727.1284-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124631

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- new SO version 4
  all the important changes mentioned in the transition manual
- major LYB binary format optimizations
- user-ordered lists diff fixes
- validation optimizations
- lots of other bugfixes and improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libyang/{libyang_3.13.6.bb => libyang_4.2.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libyang/{libyang_3.13.6.bb => libyang_4.2.2.bb} (96%)

diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb b/meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
similarity index 96%
rename from meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
rename to meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
index 822c30ba24..4b2ceaaa17 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b69fd3b2815bbf1cef5c97f0eee2519a"
 
-SRCREV = "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
+SRCREV = "3d07c3a71534a580c3960907da17568eff7e5c64"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
-- 
2.43.0


