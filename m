Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5408AC7EE32
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:47 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.6204.1684997863447273621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117891543"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117891543"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6405CD772C
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:37 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A7D7FCF7E1
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id E88072FC8EBE;
	Thu, 25 May 2023 15:57:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ostree: upgrade 2023.2 -> 2023.3
Date: Thu, 25 May 2023 14:57:20 +0800
Message-Id: <1684997851-2098-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10--14.734100-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yUIIxwDaU5mrC//1TMV5chNqTj+cW75OILsC
	XMNCW5EbcOtn+q1R+a4PApQTwj4/1s4svDGUw7k972Rb2bEJC+0XivwflisSrCgohUwkDUYp/PF
	+DohmUWU67N42Y4YqcxVBojHInYej4LNHCv9qbsk8o3fwIs8rQWvaomg0i4KNEnQhKdygGi9qo/
	uKZXLnn/xOFrLlWrPt6q73Zcfo6JrcfstxMAb2q1sR9R7NmhgBlwT0XposETWdvIILGGRj1b6px
	bTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74ACtGYG0znilNdfE/FsH7rVnptr
	8PnHpyni8zVgXoAltsIJ+4gwXrEtIAcCikR3vq9VH2MCPCB810+2RFLD2gaVl5KpwxZ489X3sD8
	qtzvsJjn1wtNoHsCT
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102821

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  configure: post-release version bump
  treegen: Require at least one mutation
  ci: Turn off errors for deprecated-declarations
  ci: Drop workaround for fedora-release-container
  rust: Bump MSRV to 1.64
  build-sys: Squash automake conditional warning re '.PHONY'
  Add clang formatting infrastructure
  lib: clang-format 'ostree.h'
  tree-wide: Fix various include ordering issues
  lib: Fix one include
  clang-format: Don't align backslashes
  tree-wide: Run clang-format
  ci: Validate clang-format
  tests/inst: Add xshell and use it in one place
  tests: Ensure real GIO backends aren't used
  ci: Add test configuration with soup3
  fetcher/soup3: Rewrite without threads
  fetcher: add libsoup3 backend
  lib/sysroot-cleanup: Convert bootdir listing to dfd-relative
  lib/sysroot-cleanup: Make some static utility functions global
  lib/sysroot-cleanup: Drop dead code
  lib/sysroot-cleanup: Factor out bootfs cleanup
  lib/sysroot-cleanup: Make bootfs cleanup function global
  libotutil: add utility functions for calculating directory size
  lib/sysroot-deploy: Nuke 'finalize-failure.stamp' on successful finalization
  tests/kola: delete unused .gitignore
  tests/kolainst: Add 'make localinstall'
  lib/sysroot-deploy: Add experimental support for automatic early prune
  configure: post-release version bump
  lib/fetcher: Add some debugging messages to the libsoup request path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2023.2.bb => ostree_2023.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2023.2.bb => ostree_2023.3.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.2.bb b/meta-oe/recipes-extended/ostree/ostree_2023.3.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2023.2.bb
rename to meta-oe/recipes-extended/ostree/ostree_2023.3.bb
index 7eeb77474..3129dc114 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.2.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.3.bb
@@ -23,7 +23,7 @@ SRC_URI = " \
     ${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "ceb0788755a0bff5738d44543552fbf883cf71df481baa3ca7288da7a402bb85"
+SRC_URI[sha256sum] = "9c575a094da2c307769f0aee15de95470c3b5550cbff211fbbc4f6fc75f333b1"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.34.1


