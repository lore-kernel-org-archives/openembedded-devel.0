Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0F3CFC515
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.50331.1728896158775621089
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WY3JrrXW;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896159; x=1760432159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8TK4POUsv8W55LKCgC7Iy1mHcSTzi5ujoaF1LMwZLuE=;
  b=WY3JrrXWOkqqJHVnMOVaBhPQck3lsGIZCkbc/zVVW9ge1rNdbEEMjl2Y
   kAFEjuM2H/9vj6qbTfUaoBS+uzHPDrUXXQ4XzfQlT5pSBktUQ44EKw+28
   fqFRGUB4HNDOAjGyI7xp0YdPwX+B+/0wVE67FpCaW47b8GWranKajgCFG
   sxMfMCOCY+HtLBzlSOvlEQwSLAErkKEPk7csCYFwtYvwIovsjdsCEUHoF
   aTsKLEU8g4z1ladAFTImJUHadq2ACEeoRySmiNRGvN5w3kiJLDDiWcOXG
   L64HXZoohgjcA/Ekf8123RKnURDPgSxo5F++M40w5DhZx4Voepobm/M8B
   g==;
X-CSE-ConnectionGUID: LdOkj7U4SQCrsUSkEYOnhg==
X-CSE-MsgGUID: O/JWXPLIRcW6KRSfeyvQQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="155665588"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="155665588"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:56 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BE94D4334
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id ABA6DBF3C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 385A06B4D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D8A161A01E9;
	Mon, 14 Oct 2024 16:55:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/54] dool: upgrade 1.3.2 -> 1.3.3
Date: Mon, 14 Oct 2024 16:54:24 +0800
Message-Id: <1728896115-2944-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--6.254900-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzIgofMgahPrbBd
	HcA4CvhkzFzAoAIAqP4EE2WBGwi7GMc7x4DEI6P2KsurITpSv+NZ+CK+BxQ9ky99T+uJIleR3sQ
	cC5EB/BQ8X8UnZedZPFDcJTnzGcP/tOedlyVAU7NJcjGePBisFDeXamXCCu1YMHDHnR8cUQIhS0
	ofkAkz2SL637QCIVpi8vc3EUpCmrVPB4rXagQZ+54CIKY/Hg3AaZGo0EeYG95UMLUJu4leYyq2r
	l3dzGQ1v+giGqHZLNdAYJiNlbAkP7dx7wRE95sVL8A6hfved0aSheb+raZVgQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112854

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Package plugins in PIP
- Add some emojis to README
- Allow the --io plugin to read from symlinks like /dev/disk-by-uuid
- Removed old examples directory that was not relevant anymore
- Fix the --noupdate option and make dool work better for non-tty connections
- General code clean-up and best practices
- Comments added to code to make parsing simpler for future Scott
- Add team members to README
- More internal dstat -> dool name changes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/dool/{dool_1.3.2.bb => dool_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/dool/{dool_1.3.2.bb => dool_1.3.3.bb} (93%)

diff --git a/meta-oe/recipes-support/dool/dool_1.3.2.bb b/meta-oe/recipes-support/dool/dool_1.3.3.bb
similarity index 93%
rename from meta-oe/recipes-support/dool/dool_1.3.2.bb
rename to meta-oe/recipes-support/dool/dool_1.3.3.bb
index f7e403018..ba75a632e 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.2.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.3.bb
@@ -12,7 +12,7 @@ RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell pyth
 SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=https \
           "
 
-SRCREV = "b2862905be841232c9e36ce1e059d3fe34ef0cdf"
+SRCREV = "e42e8c73043127283762eb52a2e31b7ab0aac177"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


