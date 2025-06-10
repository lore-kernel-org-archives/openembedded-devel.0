Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A20C71135
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.78437.1749526428786846206
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uA7TqURc;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526428; x=1781062428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gVRs4D/rUx0eyqcydDT4JSnPmwX5GGOURHjKMLhaAyE=;
  b=uA7TqURc4rgLuH5EOvXDVQuAe5ezhIyzYcS94mmMRrtvxyb9comzJXlw
   QXfmj8X2wXuMpF5gXr1A/NiuHD/6W851GPt5EFo0WAFxNn27uVmLQ0aoU
   jNOJIQrlSkn49FRKMy3bCveDRWLYVJfLTFNLSNjK1DOXXB977uHtnVibP
   bjNKaWyxtwAPPOdM+4QhtAjIfCBZlctt0K4nRi2sndq28oQxcKJtKrvXm
   4dSG7gCRNQVEOKNX81RSxWJiWtPLzjT1OkdX91H/HXXyrhwrnYxEp0dn8
   B3VSdfPtPs2yub3oWwv3GUe0aPLVGaqhoJCsCh3/0tbT62ZRRLnWiZ7/i
   w==;
X-CSE-ConnectionGUID: XzDEePg9Tje5sk8LbAt82A==
X-CSE-MsgGUID: wJGj3+BHS7mseRgR/EjMQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190662468"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190662468"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:46 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E460E0ABD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4364FBF3C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:44 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C09D21A0071;
	Tue, 10 Jun 2025 11:33:43 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 27/64] parallel: upgrade 20250422 -> 20250522
Date: Tue, 10 Jun 2025 11:32:53 +0800
Message-ID: <20250610033330.924-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117818

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20250422.bb => parallel_20250522.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250422.bb => parallel_20250522.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250422.bb b/meta-oe/recipes-extended/parallel/parallel_20250522.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250422.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250522.bb
index 88d1cf040b..79ea168675 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250422.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250522.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "10f0a7b7fbed87edcbd63a403fdc0ee1a1f86c241a3605f33162b4b9aff248dd"
+SRC_URI[sha256sum] = "b4b28f475f8cff8bb6ed4b03cc5a67041f18fc73fa256923b23181b56afdb2cb"
 
 inherit autotools bash-completion
 
-- 
2.43.0


