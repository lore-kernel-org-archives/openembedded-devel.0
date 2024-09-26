Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0540ACCFA13
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 10:52:46 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.39620.1727347761824351058
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 03:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kqJNMT7V;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: s-tokumoto@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727347763; x=1758883763;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IF63iaIjItVjJ+QhMZ8BUDHG1tKzdtrqM4wS1ZUUDiY=;
  b=kqJNMT7VPgq4i5468HavfLkk6AmJy2bZkfGAf9/9TM1AsyWgL/XZYUPI
   2PAXFE/Eat/rsk03sO/GHk/pPehp+vuT4fxh+E04dTv/LcGtvZYoSFb6X
   Tc7Ky3YF/hOTIshlpLVYz9kKHnik+kAROjzOSF/tRcJnBFCWoqYOXObW5
   k1id7sotf/S73eR5Q8VXvZvebpfK6OUrJUID7qeWdxRZxUeBYf0IKIVjn
   O1G4XbszkKE4/VmSsBmaEYyTJNTEFcTSB3wC9mmPiFyzOwVsrdA8cMBBt
   KKMhF24fADYMShhZB1i7oTh/PKPqmRHkzQo4aboF9Ney8p4tA84SO9kEW
   A==;
X-CSE-ConnectionGUID: Ixx5pFP0QbWCroEYzVcHzw==
X-CSE-MsgGUID: 7JAu/3ArQ4iKAiVZ+4VIlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="174931285"
X-IronPort-AV: E=Sophos;i="6.10,155,1719846000"; 
   d="scan'208";a="174931285"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 19:49:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 09FA5DAE0A
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 19:49:17 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CF63D509D
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 19:49:16 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1002)
	id 344D0CDD6; Thu, 26 Sep 2024 19:49:16 +0900 (JST)
From: "s-tokumoto" <s-tokumoto@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: s-tokumoto@fujitsu.com
Subject: [meta-oe][PATCH] fuse: Add "fuse:fuse" to CVE_PRODUCT
Date: Thu, 26 Sep 2024 19:49:09 +0900
Message-Id: <20240926104909.29841-1-s-tokumoto@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 10:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112517

Since there are vulnerabilities that cannot be detected by the existing
CVE_PRODUCT, add "fuse:fuse" to CVE_PRODUCT.

https://nvd.nist.gov/vuln/detail/CVE-2010-0789
https://nvd.nist.gov/vuln/detail/CVE-2005-1858

Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index 6f613e9cd..fca7d42b3 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
 
-CVE_PRODUCT = "fuse_project:fuse"
+CVE_PRODUCT = "fuse_project:fuse fuse:fuse"
 
 inherit autotools pkgconfig update-rc.d systemd
 
-- 
2.35.3


