Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8734ECF64A2
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.49298.1727682214985480221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FnwUn9SH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682215; x=1759218215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=B3F8d+O+7T/8xqv6iKlnpmv4uq7VjIdjfIXl3v9V87M=;
  b=FnwUn9SHH64FycvK1HzlGgpLbTy4W5o9S7s/jwb0IK07HB1NZkP9u62L
   8pwXEisRm7+Hn1DPewJYt1AlrCmcVDxVRao+TRLOqPHnLk9l8vFER8aPB
   tXQdnapwnQA3ue3udm46d/gKSdlaDR0J3nwAlTaKeoVs15dqV9DiGLoCK
   YroLw6GFLZGZHEhE5oyJ5P8+ciAdcRfze/Ekf5wyHEBZlANYvkktf8kaA
   MVL621uS/lSSRGQa7tBtlJnrBUUcv5DaTx3yjIidSp2eZMsL5xn7YV+0u
   yvyoYe9OMNXtmoWpgPoE6QcVZglTBoZmeiR+JOLnMAyD1P2scnzQWhU96
   A==;
X-CSE-ConnectionGUID: +wdnugZARvKB2YPy7HtiaQ==
X-CSE-MsgGUID: 67m0JpL6T2WmcZgve89e5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="174441198"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="174441198"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:32 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 148EBC3F95
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E707CF7CF
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E2F416B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 913C41A01E9;
	Mon, 30 Sep 2024 15:43:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/40] ostree: upgrade 2024.7 -> 2024.8
Date: Mon, 30 Sep 2024 15:42:33 +0800
Message-Id: <1727682185-12664-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--18.708400-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mr5pOJHbveoeSa1J3RrCNU4pMC
	F86zb4rDs/f7wiqK9vzhIO0zf0j0ZsQeIOzgVmNsl368qSp6b55ULRRq00o2mSS30GKAkBxWoHy
	0bASrKBrg8q4Y37zKTXkwpD4VijyKuE+7i0XVHsEqy6shOlK/48OErl7FAhmI1YHpLeFUijGCBK
	BHm/4EwqUCR0L2CEdVDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4Ixtlg+v
	4Ymp6oGye0MgpC/RogAUW9+iL8IlZH0YXYnbGozFEUknJ/kEl4YSQiB0ZTudfoLR4+zsDTtAqYB
	E3k9Mpw=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112567

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- repo: NUL terminate readlinkat result
- deploy: Log to journal for boot space, not stderr
- commit/payload-link: Ensure we don't overrun target_checksum size
- sysroot: Make coverity happy with dirname+strdup
- tests: Attempt to update auto-prune test
- grub2: Show output when run in systemd by default
- lib/traverse: Fix minor memory leak
- github/workflows/tests: Update actions/upload-artifact to v4
- Redo pages workflow
- spec: %autorelease can't be resolved by COPR
- bootloader/grub2: Handle empty static configs
- workflow/docs: Fix deployments
- curl: Assert that curl_multi_assign worked
- curl: Make socket callback during cleanup into no-op

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2024.7.bb => ostree_2024.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2024.7.bb => ostree_2024.8.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.7.bb b/meta-oe/recipes-extended/ostree/ostree_2024.8.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2024.7.bb
rename to meta-oe/recipes-extended/ostree/ostree_2024.8.bb
index 8cecf5334..6ed8cb58a 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.7.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.8.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "72451efffe5a10acb4cfdd6eb849db97fa9e61a81e4113fc656eece77eb93355"
+SRC_URI[sha256sum] = "e2136e116669f114ff7349f12e299f63c0bece733451649414a8dcd85b863c3f"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.34.1


