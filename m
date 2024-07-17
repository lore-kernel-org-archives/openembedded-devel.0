Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9DFC3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 06:40:02 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.9356.1721198395912958293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jul 2024 23:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GdUEMGTR;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721198396; x=1752734396;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MNDMS3qPwp/ipBbzE/inPZkDMuFcTQuS18ENhWs0ee0=;
  b=GdUEMGTRwjPoHSDRQ1anPIfdCQmN9w9tuZVfQiQ0GWN0MnJMpUvYr87d
   Vwo6XbtVVw4q77NERaulsEqNBd5lv/7Q5GCCcLv7r3TCHj+vc4NnWggIc
   f9TxVY3BLDsMgNXGFSCPNx/+RnC03g0pFstUYn8Y5qeq+AcksFh6ldg6f
   t9MoIQlJMO7MOFB5UFYu1CJuDeEHHw+4MEVpL/m7pA0wPHRXhheyPmWwO
   MIBuQpGS2L14xOFA4hhawNPxdvgEdOt/4FY3cnKt3rwmiUE62CG4ht4C8
   W+h9krYLgF3sK1UbS3nTImgcXoBlxYBJnwRu+iYp3oP6HsDYHts+iM6Mw
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="155823098"
X-IronPort-AV: E=Sophos;i="6.09,213,1716217200"; 
   d="scan'208";a="155823098"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 15:39:53 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D37CCA1E5
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 15:39:51 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C63DD4BD1
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 15:39:50 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1068)
	id 551E812E48; Wed, 17 Jul 2024 15:39:50 +0900 (JST)
From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	shin.matsunaga@fujitsu.com,
	Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Subject: [PATCH 2/2] audit: Add linux_audit to CVE_PRODUCT
Date: Wed, 17 Jul 2024 15:39:48 +0900
Message-Id: <20240717063948.18385-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 06:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111379

linux_audit is also a valid CVE_PRODUCT for audit,
e.g., https://nvd.nist.gov/vuln/detail/CVE-2015-5186.

Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
---
 meta-oe/recipes-security/audit/audit_4.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.1.bb b/meta-oe/recipes-security/audit/audit_4.0.1.bb
index bd8f8cc31..0b5857cbf 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.1.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.1.bb
@@ -102,4 +102,4 @@ do_install:append() {
     install -d -m 0700 ${D}${localstatedir}/spool/audit
 }
 
-CVE_PRODUCT = "linux:audit"
+CVE_PRODUCT = "linux:audit linux_audit"
-- 
2.25.1


