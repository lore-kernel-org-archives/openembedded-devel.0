Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A21EC7113E
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.77952.1749526427157953106
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hFjybq2e;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526427; x=1781062427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d822Pv9EB8VVnhpnS6djLsnO/wchUw9eJcGZNEb2HUQ=;
  b=hFjybq2ertDrn/VRQlPdi88tyyJ7PD/1c7Ueu7EBbS7Ekl2Mt03EXPXX
   Yyh9cSq/+mMZaTo8RNcxZp1S312bCG5b2a7XMonV/8saBOchJmggoYrh7
   r7fjn+nv6khDe/EZEwADDxTK+mrF2JslhVlqeu/+QEbXHZ6PLq7u5gl2z
   9/iwLkY7efg+74nHyeAGEOylRrrsEqdT3+l6tO+aTS6kCKm/OpPXJKc06
   JGzNcFJw6zg2WKEQIEPcfd3FuqF9oLBmm61O166UUJyYOIBkpSJNCthAp
   g/SEcZfATDdLo2vWVUbtIIzKsJnSQov/dWGESyz4sO8SkRPqIVUQre69q
   g==;
X-CSE-ConnectionGUID: +TzOysl/TUyfEaFKf8qu3g==
X-CSE-MsgGUID: ecADJkjRQrmikiFnNU7nLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="201453594"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="201453594"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:45 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B1A5D4C24
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BC23CD765C
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:42 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 46CA31A0071;
	Tue, 10 Jun 2025 11:33:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 23/64] nbdkit: upgrade 1.43.9 -> 1.43.11
Date: Tue, 10 Jun 2025 11:32:49 +0800
Message-ID: <20250610033330.924-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117813

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.43.9.bb => nbdkit_1.43.11.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.43.9.bb => nbdkit_1.43.11.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.9.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.43.9.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
index e71bfdac35..2a122ec282 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.9.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "f443cbd3cff1d66db038e2afb9301d51224c7f09"
+SRCREV = "2d0f232b590f4001881dd0819f55af72b88c4b2f"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


