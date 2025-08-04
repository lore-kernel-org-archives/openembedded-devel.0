Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B484CA0EC2
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:03 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.13466.1754296435477372958
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aHxspwsm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296434; x=1785832434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NBR6B5SJfDx4KfP8H3RkieSIognwZhsRY6uw+1+YkWE=;
  b=aHxspwsmF1Gi3UM/7n/6nYtOCMnVLdAJXS8rf+SGREuJYFKQ2iZXTNnc
   mhjrIIucQUfAKd2tClAxc0PrifWbMyulLQABrPF7319ZPKdFndewgzQJa
   kb4k3wk5ADSKClYORMqvTRIsTUi9Zgp9/lpHwNEMdD+Sf2yedLfvRMhyl
   vmtFg2xmnRnzrgW0k2EFzIt0sIMMYG/D18lGCgCC6TtkLQZPkjhtS/CVj
   UL1H8xwEvINi0/rtu/HQMcLUJWXf3Qx8NxqXKWjhXIqtUnTotTpEy6xqa
   WaA/bi+ZBHLXJG4PqNir+7apqeWCT1QjhQQ118o4sHkOM0bPwhabXxhHO
   Q==;
X-CSE-ConnectionGUID: kU9DWFrBSOWk1c+e/t/phg==
X-CSE-MsgGUID: sSBChNzmSNao46W7UsNzPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="196325405"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="196325405"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:52 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C5C4D100034A
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:53 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 38C3F180033B
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 340731A0074;
	Mon,  4 Aug 2025 16:33:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/18] lvm2: upgrade 2.03.33 -> 2.03.34
Date: Mon,  4 Aug 2025 16:33:27 +0800
Message-ID: <20250804083340.1649-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118838

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 4038e83d46..2e623df45d 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "0e01a5d3ae1100a6641772ab295e0185d8d6a6b0"
-PV = "2.03.33"
+SRCREV = "f6abf8abe2bf8493806ed549e92fcc8d41ed8dfb"
+PV = "2.03.34"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.43.0


