Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97961D44013
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.37266.1731922212311143748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hmao5X8U;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922212; x=1763458212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zyoxP34nbxpyDWSp/5sbuXmE3C9CuZZcoNSjT/wRSNc=;
  b=Hmao5X8ULJxfSoqEaqqDL/c/b4cCGiQHzfDdFkpslX8vbVgQcxqMZ5Aj
   QWn/gHW5L58JXGg6Z9Va33AmNPOhxW86xfJ9ekwNtMUigDgUuN9hjXj74
   Emq1q/erZW2VkVMGJ6oOrnqnB5ms7A/PhvYKZfE17VKm532HgvmnyABNc
   IGhIqdJVXKK7ajS2q3Vl2Tkmzvo2uc6nHlgzYaLZAYpAcXaBqbPGHRen6
   wl1/bRcBG3GWS6gTs1FgxIlE9gqy4+ZjN4SdC6ekfHctmYx6Fce1mQtII
   z3Nd+7eGwEJwI47liSFMvSLs8lbb7kguU/PapKXU23Pz4PU6+uObeLdbA
   Q==;
X-CSE-ConnectionGUID: zZ4GHaDkRYKCgZHPdp7xfQ==
X-CSE-MsgGUID: 2zRXzQ2lRTGy5nZORkf6vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="159756261"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="159756261"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:09 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C3D5EC226A
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 59340D52B8
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DBA3420071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8C62C1A01E9;
	Mon, 18 Nov 2024 17:30:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/32] ostree: upgrade 2024.8 -> 2024.9
Date: Mon, 18 Nov 2024 17:29:32 +0800
Message-Id: <1731922195-5266-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--11.247800-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrm+CakZjf9C3I9EDAP/dpti15
	IFUNL+ET1jypNY0wtaYjFhLOQQccdvoLRFtw/0CmGXGu0jdPFGQyhLY8urUHvhPiIPO2d8g5ESn
	P3J1QtqeQPt0G3h0TaRCd6bg7fqTkE59Ffrx428oD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpieQ+d62dLG/3sAGjS6lxxKupx23gbuS5505SDu2UGfe9bUSmq0lfNG6PFj
	JEFr+olwXCBO/GKkVr3FLeZXNZS4DjAdLIal4R66tZ8sYxlBFIhIWr3HF6f5afLevpyxNtDLzzO
	kzyoSbJAMtemr/IAjQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113875

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- deploy: Don't recompute verity checksums if not enabled
- prepare-root: allow sysroot.readonly=true with kernel cmdline ro
- rust-bindings: Fix readthedocs.io link
- curl: Add more assertions for curl return values
- checkout: Add commentary around whiteout "quoting"
- commit: Give a better error message for unhandled file type
- deploy: Don't copy xattrs for devicetree
- tests: Skip checking for immutable bit on composefs
- tests: Work around GPG 2.2.45 error behaviour when revoking an expired key
- checkout: Only verify digest if repo requires fsverity
- prepare-root: Fix composefs docs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2024.8.bb => ostree_2024.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2024.8.bb => ostree_2024.9.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.8.bb b/meta-oe/recipes-extended/ostree/ostree_2024.9.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2024.8.bb
rename to meta-oe/recipes-extended/ostree/ostree_2024.9.bb
index 4fd7a1417..863d8e46a 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.8.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.9.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "e2136e116669f114ff7349f12e299f63c0bece733451649414a8dcd85b863c3f"
+SRC_URI[sha256sum] = "4356170ec5f7a09428b6add77e2c6f31d4049ab765ee67cf929bfa3b750d3e1b"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.34.1


