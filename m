Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADB9C41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.12848.1716860959826723854
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lh++7YOe;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860960; x=1748396960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dYJIX/iaWDuQWhEmkoYXqQapjuMofPnvI2YbGrdlC40=;
  b=lh++7YOen2w/l5ROWdW40QqZaD92KKmMcYIc818QeAzmigDLvdvOrBOr
   N/goICmwuuGdCzwLwB/0FSndC5GMsD7P6YIGokz7SiPs3uQZeC5W1li7t
   oBFJ9B27RTlz+C4QS2lwdmGWcqjE/utWCZLmqrA2I++Vc7kq/dV25k3Vy
   NP70CTviZOwAoCbuk2Kw/+sLTTJ6BYzTQzGmhh+WS/8OVccG1ZDDIRLA5
   i4QgCocDwbxEXvlP9m0NOkB0/V5FfdNj+nMG0zDt772fwlSCm48cb4/At
   EmQBj9I7B5oeKq8PMeq49dbZxnzCy6otz1UP01Imw3HEfHrQXrefiNkg2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="147886203"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="147886203"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:17 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E8D0D4F57
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 98A93D7B68
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F8EE411AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C25701A000A;
	Tue, 28 May 2024 09:49:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/40] libdevmapper: upgrade 2.03.22 -> 2.03.24
Date: Tue, 28 May 2024 09:47:50 +0800
Message-Id: <1716860901-863-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-1.778500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4BN5dqZcIK7Vgg9R3V8qg5xNb2
	e7N2CFQyUUJNrrF6kU+hgqRXf9ZDmi/7QU2czuUNlXePXNM4FjOR1LeQ+VpnJdW0pkpPR1DaDuh
	hx8YYGQ8X0jceDJtHITKHYLsR4q0LHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w71/w
	vXov5kzUJ0vVPw9demt8b9zKmWlS56ixNC4dCq2kOYo0/M2Qozhez4IZyTargr4/QKx8VRN4SU/
	vhFHd1vRlbxz+jJAFuCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110543

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lvm2/{libdevmapper_2.03.22.bb => libdevmapper_2.03.24.bb}   | 0
 meta-oe/recipes-support/lvm2/lvm2.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.22.bb => libdevmapper_2.03.24.bb} (100%)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.24.bb
similarity index 100%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.24.bb
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index d95366f97..0351eb6b3 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -19,7 +19,7 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "016e469caf856f1eb8dde39df0d1aa2e74225aed"
+SRCREV = "90ec2cd92f6367c431dd8dae55d0cbe7e196734f"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
-- 
2.34.1


