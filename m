Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1705BFD533C
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:00 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92431.1772187230131260221
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kvCyfz7x;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187229; x=1803723229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6wSxChKXALxlFDiAXNo9XQX3/DymPHNFd/IC8z2wt+k=;
  b=kvCyfz7xOGTfp3kzxtdMX3nilnFFs7MAoTodbezQo5uFXs6Nv/rKCGnj
   Hxj89fkza4r35QIG2s3eS25v055JKD+jFDr2WsuUTeniuQ6iqAOjdexqM
   eSAqd0ByRzKuGRdLaEDmBz4kgtNJCkCA0uecjba1K4ByNibt7Cn29QfvZ
   oJzJj1Ktea2prgbeyr1bfrGs/oWgid9Y2hONRxOZRjTeTHfDTeus1BmPo
   6pU3M9A6jZZ4+mbRGWVfqOaGVqP27fg9PgeRDN4Ri1+HLJYDgV390rMid
   PWER4JS70rYvuWVmCUt07MBoo5uUb9Lj5iRiAb8UZU8g7gat6P4Dvbh2t
   Q==;
X-CSE-ConnectionGUID: cKTxz+3iTmSC3udiF+fUng==
X-CSE-MsgGUID: 8BJODx9DSUeNOZxzNmMxww==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231325449"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231325449"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id 67C711C1C706
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:48 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 19D4918002CB
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2DDB618005A1;
	Fri, 27 Feb 2026 10:13:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/52] python3-drgn: upgrade 0.0.33 -> 0.1.0
Date: Fri, 27 Feb 2026 18:12:41 +0800
Message-ID: <20260227101327.1432-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124706

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drgn/{python3-drgn_0.0.33.bb => python3-drgn_0.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/drgn/{python3-drgn_0.0.33.bb => python3-drgn_0.1.0.bb} (97%)

diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.33.bb b/meta-oe/recipes-kernel/drgn/python3-drgn_0.1.0.bb
similarity index 97%
rename from meta-oe/recipes-kernel/drgn/python3-drgn_0.0.33.bb
rename to meta-oe/recipes-kernel/drgn/python3-drgn_0.1.0.bb
index b15af42f36..c2b4d9404e 100644
--- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.33.bb
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.1.0.bb
@@ -6,7 +6,7 @@ LICENSE = " LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c83d30e99508d6b790eacdd3abab846"
 
 SRC_URI = "git://github.com/osandov/drgn.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "781a21cb057ce07f17fd6edf0ffd299426abcbf7"
+SRCREV = "26dd4435315e6735cfa7f4ab0713bb1533a94750"
 
 
 DEPENDS = "\
-- 
2.43.0


