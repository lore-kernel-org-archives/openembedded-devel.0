Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F15EE77191
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:20 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.30502.1735032438455142389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cLVfMYW5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032440; x=1766568440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OOQrXclRrP8rGc4Hn+lOa4kPwfhrgkT41eM8ZuEoYDU=;
  b=cLVfMYW5BQz7VD1YPnXspPtST/NvzR6N4kphOfjim0e75Mvpt62O6wlX
   WuoAW6oSkXcYBkJtTGiX+Ap/5QxNMk3iYI2/kFSNjTBiolDsxoHwPBFGP
   Xcha7SY7xpuuIC8qeN50xcafYBjgqw/6nxlmk+L6+TBJT556LJ5aFyiqn
   xJUOrOlP5PA0kd98njdgz0/dJQArdRX99K6j6i/8s6Nz/FcZmQzoiEPP/
   7bTv18GB8P9M+AIeqYkz42gbzt0HXpURffuXAKaX8Z+0hCLX0hAjeSp2+
   pfh7LdUWGMTulalM4RlvjR0DJzL5WtMbVaIZO3m0maVa+PkmZEF5l37xM
   g==;
X-CSE-ConnectionGUID: O7dXPXn/TcCf2ofHMO8FCA==
X-CSE-MsgGUID: G6Q0q9OsT0CPxNbmdRMGtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="164248049"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="164248049"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 39FFFDBB84
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1373ED4C17
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A6FDB6B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4DD6F1A006C;
	Tue, 24 Dec 2024 17:27:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/67] nvmetcli: upgrade 0.7 -> 0.8
Date: Tue, 24 Dec 2024 17:25:59 +0800
Message-Id: <1735032421-13513-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.853200-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvGsuYyb68ajB9s
	SF9fYJNfeYUpRWZq07oKRuKRI67R4B77VnTa7axq/sUSFaCjTLyOhEhoAl74KAAheUymmndfM/H
	HrxBahdcUe+gTY5Xymnn0x6scqY/TIRvqkRRE3o4D2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiRGqdJrOqGirlRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs4SZf
	2K28YSonfUSqpAO5DzMLkL8gzrz6ZmW1Ok/sd4YJg+2N3mCxCVbYxDspyJ7s0eQQiPPIOrbU29J
	ymvOPiPmhvArZgaogogeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114477

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- fix common misspellings from codespell project
- nvmetcli: set up the target only after the network is configured
- nvmetcli: fixup ana groupid setting for namespaces
- Documentation: fix typo
- nvmetcli: add a tcp example json
- nvmetcli: Correct xrange usage for py3
- nvmetcli: Allow different devices for make test
- nvmetcli: Report save name correctly
- test_nvmet.py: test_invalid_input fails for py3
- nvme.py: Make modprobe work for kmod lib too
- nvme.py: Sync the containing directory
- nvme.py: Explicit close is redundant
- nvmetcli: Improve IOError handling on restore
- README: Update URL for configshell-fb
- nvmetcli: don't remove ANA Group 1 on clear

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nvmetcli/{nvmetcli_0.7.bb => nvmetcli_0.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/{nvmetcli_0.7.bb => nvmetcli_0.8.bb} (96%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.7.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
similarity index 96%
rename from meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.7.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
index ec483321b6..ad9873563f 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.7.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.8.bb
@@ -19,7 +19,7 @@ SYSTEMD_AUTO_ENABLE ?= "disable"
 
 RDEPENDS:${PN} += "python3 python3-six python3-pyparsing python3-configshell-fb"
 
-SRCREV = "0a6b088db2dc2e5de11e6f23f1e890e4b54fee64"
+SRCREV = "d323d5a3091af490502c5d025ec7361a3a2cfbd9"
 SRC_URI = "git://git.infradead.org/users/hch/nvmetcli.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


