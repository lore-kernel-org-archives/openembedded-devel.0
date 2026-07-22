Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44867C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44604.1784715814088869902
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SBIqZKIa;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715814; x=1816251814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ajRqVYbqGy0m1PF3eYHq6GmvBafPrtqJMW54nrH0h9o=;
  b=SBIqZKIaI+Xeh4UDvn4qgo728f2amnPX5zq0urcKrZ9iopGMw98GFdnG
   C3fpbzFOzOQGkIjgvoAwvHefTmV/vKBjNIwxRDo6IOiQJ2oIRU/mz70NQ
   D/LrploN20bVsvEHyJ/I3GXxTBZw5zpXty4OjIARP/C58q14qTire8n9M
   zcBTx03SY9/PRGl1FNOJqMoscALSdWvY7JnO/ZQC4hwIFq+K0M9a94xd9
   zbZ7QvQn6PF9q9cUKLifk6NSXz8dRrWEzwdSteSHULz1xiM6gia/eJ5zC
   6z6rVDFT9rMefJyEAT4Ha44IUh37mJOOISiT4QqjsIMMnSGVPxHeAHg7f
   A==;
X-CSE-ConnectionGUID: M5vMFtdkTzmKkBoh4hrbCg==
X-CSE-MsgGUID: ONR59gevSX+p0xj1SCcVpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="251743026"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="251743026"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 41E1342A302
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:32 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E1176180F57E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id ED63E40267A;
	Wed, 22 Jul 2026 10:23:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 03/37] iscsi-initiator-utils: upgrade 2.1.11 -> 2.1.12
Date: Wed, 22 Jul 2026 18:22:46 +0800
Message-ID: <20260722102320.1019-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128373

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- avoid possible double free of found in idbm_rec_update_param (#528)
- Modify log function to print session id (#498)
- Add tcp.congestion_control configuration option (#520)
- iscsi-gen-initiatorname use @IQN_PREFIX@ as default
- iscsi-init.service: Use iscsi-gen-initiatorname
- Fix issue with IPv6 adapter interfaces (#508)
- Small cleanups for firmware discovery. (#522)
- Fix unused variable warning in usr/io.c (#524)
- Make iface.example a doc file. (#526)
- Fix security issues recently discovered by Keith at Linneman Labs (#535)
- Makefile: fix "No rule to make target 'iscsiuio/Makefile.in" issue (#506)
- fwparam_ppc.c: Fix the calloc-transposed-args issue (#504)
- Fix incorrect parsing of node.discovery_type "static" and "fw" (#518)
- doc: fixup iscsiadm man page option for -r (#501)
- Fix typo in initiator.c (#507)
- iscsi: validate interface IP against target address family (#527)
- iscsi: delay reconnect until interface has valid IP. (#511)
- Fix minor typo ("authenticaton") (#500)
- iscsi_net_util: avoid copying NULL pointers with strlcpy()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tiator-utils_2.1.11.bb => iscsi-initiator-utils_2.1.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.11.bb => iscsi-initiator-utils_2.1.12.bb} (98%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.12.bb
similarity index 98%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.12.bb
index f13982ed55..9275835f1a 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.12.bb
@@ -12,9 +12,9 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "4b3e853ab468a95d8a035efa8fc4298a6c6318a3"
+SRCREV = "7e00642c40123e0b3f949e74c3945872c17a407e"
 
-SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https \
+SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https;tag=${PV} \
            file://0001-Makefile-Do-not-set-Werror.patch \
            file://initd.debian \
            file://99_iscsi-initiator-utils \
-- 
2.43.0


