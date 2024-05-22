Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E3EC41513
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 08:49:09 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.5302.1716367743370245012
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 May 2024 01:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GGp+VRco;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716367744; x=1747903744;
  h=from:to:cc:subject:date:message-id;
  bh=I0vvjXxAPJNAurXJlQPegWQS3+1CVbGouy1tBt2R9Ik=;
  b=GGp+VRco/iho71uzWqUIR+gvD3TSyZdVWyh6c5RvONackLQ0xlgREkMC
   K8YRUELnhlCjpr3VokNvRaKDhrg5PQKFn68XOooT4VGt8/bvQqtPQDB4Q
   UoSJcDjAwX0KoKq9KiHIYikml5T42mVtDLDtRbjM9BAlzV4qFkqpHb9c7
   WI64El/3IFQXrFrwcwy6rTvVqvcAEkY5Dr9BVK5K/cj/TXYNyaM6a/Rce
   86wGUwnXeDC3yqP8A7btHqdI8qVP+1lU38TihBX43M5dchJZQsVR6VYjK
   i0IPITnHFVUZ1facZ+CHRtAj1HwE+ndRNLsQPy9+wAz0rCDwt2l6gCLBX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="138464316"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="138464316"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 17:48:58 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B9D27CA1E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 17:48:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EC6D5D53E6
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 17:48:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E4EF2239C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 17:48:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 17EA81A000B;
	Wed, 22 May 2024 16:48:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nana: Fix buildpaths warning.
Date: Wed, 22 May 2024 16:48:45 +0800
Message-Id: <1716367726-22329-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--2.073000-10.000000
X-TMASE-MatchedRID: UFgEnSY5dUXAFd4412saSDz6L+U/pejxfrTt+hmA5bKysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLy9zcRSkKatQnbQnr9fWNSngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDVCA7drgc/SiFdiLsDfWZ5rBPxXbMsKsrjJ9OQJUR693IcsBT8EgQNNTFm5T9Ca5diLbp
	/xmsVZ/zjyLVhi0B06QVBwXYtx99eZbXP29aXx5lPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 08:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110481

From: Wang Mingyu <wangmy@fujitsu.com>

WARNING: nana-2.5+git-r0 do_package_qa: QA Issue: File /usr/bin/nana-c++lg in package nana contains reference to TMPDIR
File /usr/bin/nana-clg in package nana contains reference to TMPDIR
File /usr/bin/nana in package nana contains reference to TMPDIR [buildpaths]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/nana/nana_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-extended/nana/nana_git.bb b/meta-oe/recipes-extended/nana/nana_git.bb
index 7c748bc49..d292bb882 100644
--- a/meta-oe/recipes-extended/nana/nana_git.bb
+++ b/meta-oe/recipes-extended/nana/nana_git.bb
@@ -42,3 +42,9 @@ do_configure:prepend:class-nativesdk() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install:append() {
+    sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' ${D}${bindir}/nana-c++lg
+    sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' ${D}${bindir}/nana-clg
+    sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' ${D}${bindir}/nana
+}
-- 
2.34.1


