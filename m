Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7627C021A7
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46621.1739178111389260159
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uCjiQi+8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178112; x=1770714112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1q0LrMXoo9K1Fo1OrNr7FYNQ/tYovBRRa5V2aMJN3to=;
  b=uCjiQi+8zTIrLbJ0yJquL1T3pwZqRnZWO/2FFOCbGw8bQ0z/66By9xZf
   +gtnBW11cnG9rWwOYVB2WDpiHZPNQ2SwnyfbRCQVQrts2W5N+3pUdrgYw
   67/0I7EOr3cYG75DcMHYnvMxkV+bZ43bbHENV+qUHGepcweVUkbOuobmC
   T4wMf9WPMnNeUhzO59D6hvxuDRYScK4s+efZKj8Zcl5T3Ojp4FDfVfwvw
   5kYMTfNrN3FkTQptYXCC3mpPvW5VzXVRjqinNtGc1mcB8zdu0qV+4rFep
   KPmTOcKuRPaMcvb1g2NCucNKX3gCwQWOQLAim8RsFVn2FsjcP2mp4bB9t
   w==;
X-CSE-ConnectionGUID: Dv8ii860QD+dCSDUBU5PdA==
X-CSE-MsgGUID: bQS1aGiJQ/St7BltQ3m8+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168935920"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168935920"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:50 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C9919E8520
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 90246D5081
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:47 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3290A1A000B;
	Mon, 10 Feb 2025 17:01:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 07/66] gparted: upgrade 1.6.0 -> 1.7.0
Date: Mon, 10 Feb 2025 17:00:36 +0800
Message-Id: <1739178095-26432-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115335

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  * Recognise NBDs (Network Block Devices)
  * Add support for Bcachefs (experimental), single device file systems only
  * Prevent GParted probe starting LVM Volume Groups
  * Increase minimum required version of libparted to 3.2
  * Update CI jobs for Ubuntu 24.04 LTS and use Rocky Linux 8
  * Read exFAT file system usage from exfatprogs >= 1.2.3
  * Fix serial number for my USB key showing binary data
  * Add support for Bcachefs, single device file systems only
  * Prevent GParted probe starting LVM Volume Groups
  * Fix hang searching partitions when btrfs-progs not installed
  * Increase minimum required version of libparted to 3.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gparted/{gparted_1.6.0.bb => gparted_1.7.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_1.6.0.bb => gparted_1.7.0.bb} (93%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.6.0.bb b/meta-gnome/recipes-extended/gparted/gparted_1.7.0.bb
similarity index 93%
rename from meta-gnome/recipes-extended/gparted/gparted_1.6.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_1.7.0.bb
index ab2890679a..ec221a140f 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.6.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.7.0.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'file://0001-Install-polkit-action-unconditionally-executable-pke.patch', '', d)} \
 "
-SRC_URI[sha256sum] = "9b9f51b3ce494ddcb59a55e1ae6679c09436604e331dbf5a536d60ded6c6ea5b"
+SRC_URI[sha256sum] = "84ae3b9973e443a2175f07aa0dc2aceeadb1501e0f8953cec83b0ec3347b7d52"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gparted/files/gparted/"
 UPSTREAM_CHECK_REGEX = "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
-- 
2.43.0


