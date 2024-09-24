Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73641CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 06:38:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.7826.1727159922833839202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 23:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kk7wiNyu;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727159923; x=1758695923;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZFa7c4iwjIzIzIc+chupnaL8JnpH+NY+UyP3gevM1PU=;
  b=kk7wiNyunTHS6pO9FCZsleO+HxCbKDAjqQNe6TZ/J1UdvuZk7X7hDkM1
   y5oB+jxzUL4Uj1f7ht4tyH7dgHQagZSpkjpZ5RSqeb+sqhvswlQxE/Yo2
   11RSeXdufL4sOvsuhxcy+ucTTJAUmS3Tqz19kICBiAXhKZ7cAIgzSR+q4
   +KWC6Il4tLKLDexZ2XKIYLJcIOxFP24JYmOiaLhu7i6w/J+zwrLn5WfH4
   JSrrCw+2eODC9KRYLOWMpEqQ+Nd3SWjpcxkrwlLh4oN43eCShpafuBw0T
   YseMudz2H1uzK7c6FbQBAj7oDRn07sqb8OaJ+26LZ7k1Tj4UZjvQFwVzz
   g==;
X-CSE-ConnectionGUID: yU6/cnxHQvCVVIGZFAkPWA==
X-CSE-MsgGUID: BcHesverQ9+sE5xXTmQYZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="161950603"
X-IronPort-AV: E=Sophos;i="6.10,253,1719846000"; 
   d="scan'208";a="161950603"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 15:38:38 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BDC6DAD30
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 15:38:36 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4EF1AD5046
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 15:38:35 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1068)
	id 0961FAAFA; Tue, 24 Sep 2024 15:38:34 +0900 (JST)
From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	shin.matsunaga@fujitsu.com
Subject: [PATCH] audit: Fix CVE_PRODUCT
Date: Tue, 24 Sep 2024 15:38:32 +0900
Message-Id: <20240924063832.18058-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 06:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112473

Fix "audit" set in CVE_PRODUCT to "linux:audit" to detect only vulnerabilities where the vendor is "linux".

Currently, CVE_PRODUCT also detects vulnerabilities where the vendor is "visionsoft",
which are unrelated to the "audit" in this recipe.
https://www.opencve.io/cve?vendor=visionsoft&product=audit

In addition, all the vulnerabilities currently detected in "audit" have the vendor of "visionsoft" or "linux".
Therefore, fix "audit" set in CVE_PRODUCT to "linux:audit".

Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
---
 meta-oe/recipes-security/audit/audit_4.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.2.bb b/meta-oe/recipes-security/audit/audit_4.0.2.bb
index d6742c9eb..6bb8a2c70 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.2.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.2.bb
@@ -99,3 +99,5 @@ do_install:append() {
     # Create /var/spool/audit directory for audisp-remote
     install -d -m 0700 ${D}${localstatedir}/spool/audit
 }
+
+CVE_PRODUCT = "linux:audit"
-- 
2.46.1


