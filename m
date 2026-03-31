Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F2CFF60F8
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 09:27:09 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16192.1774949225166948820
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 02:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qmd6ms7p;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774949225; x=1806485225;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mL7ajRqfpVTnH1V3zirgOqSmwkpMn9AIRaJxvhAYPQo=;
  b=qmd6ms7p6Bk3lnrQtF4SuQklps4FCdAFUhVSsquyYZK5X80Ov/EtK4zZ
   5YYdMzGXPMHkPgg2tGuqkSj8mghHEcNACl3DYB8EHyk0dMKQt2/Ojw/Qe
   bOXfy3EGzfUc+kiBSbxJ3upIrbJhUFa/Czscs0wY4YJjrbhCpW2V2bKUE
   7BfHI5WtVCW4GfrRaOAMPeMdWoNDwO8JUqNUQg9BF3ORZw+sI6jRVpQSO
   AKxQD95ULEclQIVuU4MAJ0qe64cItmipAFpwgsf53pphzbZt6cYOCI9MI
   tWamsDNA456n8fY+FrVIx8dQGDUMOt4/NLBRAwdYpfYKqZW+tLS9N7lFe
   w==;
X-CSE-ConnectionGUID: 1xnzaV8lTJuQ67kq3/aQTw==
X-CSE-MsgGUID: vYd4y80ZSH+uklhhuWOVPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="222743337"
X-IronPort-AV: E=Sophos;i="6.23,151,1770562800"; 
   d="scan'208";a="222743337"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:27:03 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A6FA51C1C70B
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:27:03 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5FCE5145AF8F
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:27:03 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3BDE41800B89
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:27:00 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] libfaketime: upgrade 0.9.11 -> 0.9.12
Date: Tue, 31 Mar 2026 17:26:57 +0800
Message-ID: <20260331092657.12442-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125882

Since 0.9.11:
    - Improved macOS compatibility (@usertam)

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{libfaketime_0.9.11.bb => libfaketime_0.9.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/libfaketime/{libfaketime_0.9.11.bb => libfaketime_0.9.12.bb} (93%)

diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.11.bb b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.12.bb
similarity index 93%
rename from meta-oe/recipes-test/libfaketime/libfaketime_0.9.11.bb
rename to meta-oe/recipes-test/libfaketime/libfaketime_0.9.12.bb
index 55a4cabe81..ea922309c3 100644
--- a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.11.bb
+++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.12.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "6714b98794a9e8a413bf90d2927abf5d888ada99"
+SRCREV = "3ccdd344aadf1e317156fa5fb7c881f2c4404778"
 
 SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;tag=v${PV};protocol=https \
            file://0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch \
-- 
2.43.0


