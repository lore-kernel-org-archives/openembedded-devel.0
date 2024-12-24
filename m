Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832DEE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:20 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.30358.1735032439837642540
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rpubMA35;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032439; x=1766568439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tRO2+8WL34g7ikXbL+BhQSEXMTrRlJbj/VI2AeImafI=;
  b=rpubMA35EACVfzqlq47f3w3v4uwEig8cYyfgbLmo/qqOQWu9FOahXlW7
   uxK5cgwX4711YpUBPGOnx8r8PgsMhWFjzru7WBaNGo9DXp2nnq/742Afs
   nq/HWHi7VCqHdM7WwgPGA0xQMXjlhpT7u+22b48dazu3+JaZsLA680Vx8
   VDJcHppFju/iwnbuJtw7x/t08HaaAOaKPeRc2MPI8V2S9Ic68hD8tsQlR
   21QxmO70I6M9vKbh72TnRSuUf+ktSCTkDzTKO4FS0B1yM5ECYc1BLudrL
   Iep+2w0DBGfhlgtZFGay1DEEUTEursMiF5V+2Y0TmGnR2SN7XyLls25oH
   w==;
X-CSE-ConnectionGUID: IHYLCmZDSrWkHsRrjURQ6w==
X-CSE-MsgGUID: T6oI5hSPRUmSbqsQxXffqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="172776088"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="172776088"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:17 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 89E76EA890
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 56B4AD3F36
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E1ABD20071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 897F61A0073;
	Tue, 24 Dec 2024 17:27:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/67] ostree: upgrade 2024.9 -> 2024.10
Date: Tue, 24 Dec 2024 17:26:00 +0800
Message-Id: <1735032421-13513-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--10.171500-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzMcZL/toKwUhH6
	cbAZmiKWiG5/X4lGCD9Z94mCPwoGbiZ6TxAhrtSuKsurITpSv+O061diBteN1/4DDXoaCqk7zoj
	Un4YR+oi5b+I3y6AsJvL3NxFKQpq17VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOMnqEa+vzV4edJPazRUTU0WzXVR6bXx5ehMxKDqgAFSzfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTthUfR2rvBju5oEvw0p8P8VEqOtLm5gmzGHbxLOPOBYaHkPqwh9mnYzcsOtXxgBGGk
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114479

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- prepare-root: Add composefs.enabled=verity
- README: Update buildstream URL to new github repo
- composefs: Ensure buffer is suitably aligned for struct fsverity_digest
- core: Always sort incoming xattrs
- Fix ci
- sign-ed25519: Fix error message of validate_length
- rofiles-fuse: when fuse execution fails, rofiles-fuse still returns exit code 0
- libostree/deploy: enable composefs by default
- man: Note semantics combining root.transient with composefs.enabled

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2024.9.bb => ostree_2024.10.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2024.9.bb => ostree_2024.10.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.9.bb b/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2024.9.bb
rename to meta-oe/recipes-extended/ostree/ostree_2024.10.bb
index 863d8e46a5..0667fd670f 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.9.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "4356170ec5f7a09428b6add77e2c6f31d4049ab765ee67cf929bfa3b750d3e1b"
+SRC_URI[sha256sum] = "54e3387dee1ff16031a0679aca2b60da90ab7f4a26c211822333c7f23000abee"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.43.0


