Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E753AC282C4
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2204.1740525898343880793
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ty+dlulG;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525898; x=1772061898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=B0NMBSa3FvWq90cQAEKZvDcVgmCdNqq5CYorsLCWcrU=;
  b=Ty+dlulGeada8oAjfxSVKVF41bg+Nm98SxCip5m0oHgbjnPIxwaPGh7W
   4Bcqmkm5LENyZ+1ezcbZHbJx7Cv+i5cFITG9mBlnfjmxY3k6yt/14PUFb
   8E2ZLIRglEIIhgiC4OB1IZeO5iLS4DJPzRO5qsZGiYgM0QsqAlBs6ACAl
   TYcyo98AG7B/GnF7w5EB3TxyNgvlrvu48DyiWY2xUtHk+jdvP20q8eF4a
   feK8vM7sjL+25AcdxiOAIk1Ee6BHQMGkIvTfBMY/x9JkgwtThkJNV18R0
   wswOv524Cn115jEuQ6wwjgbg0KilIaWBnnqn50jExuUNNmSXmxTMOkemc
   w==;
X-CSE-ConnectionGUID: FzICnLEaQe+lsKGV9JcRmA==
X-CSE-MsgGUID: g0Ulbrd9RMaRanCrYUTRwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170032168"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170032168"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:56 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2409BD6EA5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC8BBC8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A210E1A0073;
	Wed, 26 Feb 2025 07:24:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 11/51] iscsi-initiator-utils: upgrade 2.1.10 -> 2.1.11
Date: Wed, 26 Feb 2025 07:24:01 +0800
Message-Id: <1740525881-21103-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115610

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- iscsid: Rate limit session reopen log messages
- Preparing for version 2.1.10
- Fix bug where abort_tmo read failures were ignored.
- Fix gcc issues
- Change a discovery function to void return type
- Fix firmware targets startup to always be "onboot"
- More testing cleanup, and fix dprint test usage
- Improve iscsiadm command line parsing messages
- grammar nitpicks
- Bugfix read specific sysfs value "off" of session attribute
- Fix a typo in test/README
- Make it visible when memory allocation failure
- improve the comments in idbm_lock()
- iscsid: Fix hang during login with scan=manual
- Fix memory leak in iscsi_check_session_use_count
- IPv6 support for iBFT iSCSI boot
- fix 4 issues which are finded when building with clang 17

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nitiator-utils_2.1.10.bb => iscsi-initiator-utils_2.1.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.10.bb => iscsi-initiator-utils_2.1.11.bb} (98%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.10.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
similarity index 98%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.10.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
index 6a272775f6..5f88aea5f2 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.10.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
@@ -12,7 +12,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "d0f04ae4b9bf0bc0be55fbda5f235afdfbf5dd19"
+SRCREV = "4b3e853ab468a95d8a035efa8fc4298a6c6318a3"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https \
            file://0001-Makefile-Do-not-set-Werror.patch \
-- 
2.43.0


