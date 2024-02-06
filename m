Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4D6C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:10:34 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.17146.1707207028405885064
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=duWJ8CGd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707207029; x=1738743029;
  h=from:to:cc:subject:date:message-id;
  bh=AHklYXCRnzyVnS+T/r+8+0ZV+wgYArMblluBBmRLOFo=;
  b=duWJ8CGdv7irRFHcOfD9nzdfFWdxUqO4Y6OQBjdeZ6JqDewpillGmyqk
   EZ4zZvDqt/TnTAXDR+PmJPENfhRFTlX4977lHVcofmHVpKoHwT6xqRi8K
   bfL32BVedljWaac8ico8yf9ewN6HoGBDdWs5osLIk5By7HWk+PxiFAIVj
   /efWYMyCRXCWTRQXnTR6IwCGPxULOWg1BqyMNf4ndCvox7o12daUPuxOx
   828jIAoWqh6BJ/AVndDX9fHR/3IRIht6Yulj6NiXCY9gbzOvZl6aFByRQ
   PBrJvsQG1VKa25fUY5DAf14CWEdgZiAORINuPqEUF7eIU0hBNC3MUa8OG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148555196"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148555196"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:10:26 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 03E9623B961
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:10:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 452A8CFBC0
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:10:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CC686E5E51
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:10:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 697AF1A006A;
	Tue,  6 Feb 2024 16:10:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libblockdev: upgrade 3.0.4 -> 3.1.0
Date: Tue,  6 Feb 2024 16:05:40 +0800
Message-Id: <1707206740-5305-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--6.413000-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvO8B7vl7G5M0b4E
	LhML5UNkFpv4ALYwnexgRWLzgh5fxh2QnRzQMDajXke6tLU6lcKIrmqDVyayv4VquVYFwXAmNq8
	ylq3YspIZCUGt3x2RMWzf+aeoMauUCtNdSL7NMxRIcJTn2HkqsQGZ/+APXW9kkHPVkBTu31PhpJ
	sYQnO7ixRzLyaspBhBhksQo257I1g/IVzSvtxQYR1kSRHxj+Z5DqaUR6lw5a8agfsCivbmXgfx0
	KyJe7un4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2fuzwJAEkzruT3Er
	/Wp7qkQQf5beUHrsHFFBtMfutWmRIYiqWqYhUFJiZuPE1j94YELixrsCJ1jTwSC6qIZ5nkmjxYy
	RBa/qJcFwgTvxipFajoczmuoPCq3loF4ecBbtl4MZiv30Fm1TujByzlOzNEbGEufUEKp6a+VQF5
	Gc+T6r
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108604

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- tests: Default to /tmp for create_sparse_tempfile()
- tests: Avoid setting up intermediary loop device for the nvme target
- tests: Remove unreliable nvme attribute checks
- lvm-dbus: Fix leaking error
- lvm-dbus: Avoid using already-freed memory
- utils: Add expected printf string annotation
- fs: Report reason for open() and ioctl() failures
- ci: Add an action to compile libblockdev with different compilers
- Sync spec with downstream
- Add BDPluginSpec constructor and use it in plugin_specs_from_names
- overrides: Remove unused 'sys' import
- ci: Manually prepare spec file for Packit
- ci: Remove the custom version command for Packit
- swap: Add support for checking label and UUID format
- fs: Add a function to check label format for F2FS
- fs: Add a generic function to check for fs info availability
- fs: Fix allowed UUID for generic mkfs with VFAT
- fs: Add support for getting filesystem min size for NTFS and Ext
- tests: Remove some obsolete rules to skip tests
- Mark NVDIMM plugin as deprecated since 3.1
- part: Fix potential double free when getting parttype
- tests: Use BDPluginSpec constructor in LVM DBus plugin tests
- python: Add a deepcopy function to our structs
- Fix missing progress initialization in bd_crypto_luks_add_key
- tests: Skip some checks for btrfs errors with btrfs-progs 6.6.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libblockdev/{libblockdev_3.0.4.bb => libblockdev_3.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_3.0.4.bb => libblockdev_3.1.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.0.4.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_3.0.4.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_3.1.0.bb
index d6ee103bb..60182d84e 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.0.4.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "autoconf-archive-native glib-2.0 kmod udev libnvme"
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=master;protocol=https \
            file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
            "
-SRCREV = "ec0120de06f28ecfc10953b712f7f42735787bcf"
+SRCREV = "65f50bf912374b85d673f2716ea0c8306980c95b"
 S = "${WORKDIR}/git"
 
 FILES:${PN} += "${libdir}/python3.*/site-packages"
-- 
2.34.1


