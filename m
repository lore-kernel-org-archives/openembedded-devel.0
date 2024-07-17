Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB71C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 06:39:22 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.9273.1721198360981047282
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jul 2024 23:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pRqiozIb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721198361; x=1752734361;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OWNJO5nnqNvD0x04HWyiN0/uVApd7E3vymtjr3qXUIQ=;
  b=pRqiozIbdZ6OVoM2pZC4rJD/4kRNgJOxZ43d5TPdr494KSIK3CbK7Irw
   Yz4fmtV5zHimg7WVqgIgjdLG/99yJlpsdzORR2tonCNKRe3FKIm1wXySz
   IxUnFG33dXk04W3paWuKbUUL/wns50rueERcHuWirJxVd1DfxKbSBX3Hz
   jgeUEIImB1O+jJbzFiNXVJL5kIBeH/89b4RMLIaoTpObnl7yVasAQJhCp
   PpX+k5TR6k8zzGICyNfRFyBeXOb5PFZ+flFKCh2D+xl9usEVgrLQpMVJY
   00vyK2OqNdkGBKsjypFUtr4fswdqjZ+r5shKruxnf12755PMBgft5datZ
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="167529166"
X-IronPort-AV: E=Sophos;i="6.09,213,1716217200"; 
   d="scan'208";a="167529166"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 15:39:18 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6785ECA1ED
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 15:39:16 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A762731AE4
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 15:39:15 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1068)
	id 65B3F1323A; Wed, 17 Jul 2024 15:39:15 +0900 (JST)
From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	shin.matsunaga@fujitsu.com,
	Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Subject: [PATCH 1/2] audit: Fix CVE_PRODUCT
Date: Wed, 17 Jul 2024 15:39:12 +0900
Message-Id: <20240717063912.18366-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 06:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111378

Fix "audit" set in CVE_PRODUCT to "linux:audit" to detect only vulnerabilities where the vendor is "linux".

Currently, CVE_PRODUCT also detects vulnerabilities where the vendor is "visionsoft",
which are unrelated to the "audit" in this recipe.
https://www.opencve.io/cve?vendor=visionsoft&product=audit

In addition, all the vulnerabilities currently detected in "audit" have the vendor of "visionsoft" or "linux".
Therefore, fix "audit" set in CVE_PRODUCT to "linux:audit".

Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
---
 meta-oe/recipes-security/audit/audit_4.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.1.bb b/meta-oe/recipes-security/audit/audit_4.0.1.bb
index c189cfea5..bd8f8cc31 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.1.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.1.bb
@@ -101,3 +101,5 @@ do_install:append() {
     # Create /var/spool/audit directory for audisp-remote
     install -d -m 0700 ${D}${localstatedir}/spool/audit
 }
+
+CVE_PRODUCT = "linux:audit"
-- 
2.25.1


