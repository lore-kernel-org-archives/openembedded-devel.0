Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06796C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:16 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8208.1710827168548324394
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BYpQHuKw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827169; x=1742363169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nynYaWEaE5GAQe2NoSdyXTAq4poWU0V7fEmbzxmc9Oc=;
  b=BYpQHuKwnX3+gGL0oKtCRDq8N3F0NNvDhDFsVhqMOnVEDmJPibKwHbgT
   7entzuPQ6Eu6bL+m60143dqIi7+MrapcFTmYl9JSPRnl3EwsJofpE3Vb8
   tykIMNANSt1JiAWf23twZR7tmzI+F2+FI4bSID7X5vqZZcDoNmtMlL3P1
   PXwRtj7UN9AmmlLglLrdNp0ikHvDFTSHmTHFlO0OgBTL5pDkp/8s7F2dY
   x8r2GP7b6MpGVOoNav2JNQAZW4lFPDW2DiHh2mx/Rml3GnuUtxs2RtkY1
   CUPSjXxf/Mxy6wP2O7E9U9+c4yCh6//ebNRCCrZiNj9WKHxd0xRbKezw7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152562746"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152562746"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:06 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C88AAFBD95
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 09B3FD5077
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 815842009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 29D431A006B;
	Tue, 19 Mar 2024 13:46:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/50] dialog: upgrade 1.3-20240101 -> 1.3-20240307
Date: Tue, 19 Mar 2024 13:44:52 +0800
Message-Id: <1710827139-30056-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--0.032100-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx2HZGDrssVUgWM
	hTCqBekhid9DpTMhax7X+4pjLOgXfFdjnN7rNQ8pgvmNrsT46HJxXefgn/TNQxluwBR5lxHPQiM
	ingSlKoLbRUK3i1N2TmrpSxhrLECD7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOIGQRIwjTl3iuFf+VRAZx7DVm14t84/DtOUwVfQtlDNxuNYl344rycxtJgCdXjaaOJ6ba
	/D5x6cp4vM1YF6AJbbieYV7J8ae4wtuKBGekqUpnH7sbImOEBRaiZix8eSd0XeAXcfewGZFvrOx
	SWlvjZFDWKW547gctc3jl3tO/RNru/QCNAWspMbKo82lcVTJTSNPPRX4jJp5sUeSUs0Bc4PsfZ9
	V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109419

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
+ add option --color-modes, which can be used to color the content of
  programbox, tailbox, textbox
+ updated configure script, e.g., for compiler-warning fixes.
+ amend change to formbox while revising --max-input to work with the
  form's "ilen" parameter
+ update config.guess, config.sub

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dialog/{dialog_1.3-20240101.bb => dialog_1.3-20240307.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20240101.bb => dialog_1.3-20240307.bb} (92%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20240101.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20240307.bb
similarity index 92%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20240101.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20240307.bb
index 988a8ee2b..a49717536 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20240101.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20240307.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
-SRC_URI[sha256sum] = "9419eb52b95837312a76ccb26002c5d624fab53abde0859f1c7364179dc0ebad"
+SRC_URI[sha256sum] = "339d311c6abb240213426b99ad63565cbcb3e8641ef1989c033e945b754d34ef"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.34.1


