Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D8AC54ECC
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.16488.1747731315687047643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YD4x3M7+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731315; x=1779267315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/4jOZSpn5lsG9cxmmaiFPHEIP9olsd30kinuCZpF6Xs=;
  b=YD4x3M7+OFZsypTkyJYlwDQ8O8XrEdUwBXMsWuZJiK0PCdXVYQcv470F
   kv0QhkWUlPvGdTF2iaMA1GajE9mxFappuc4CPgefgWxAJ7XcQysEoH/6H
   ojJkTqkA3JBOplCvqn7Ss8YDqr2zTNdoHoQ8GS+iuOdNjPq2QKNqv+3Mz
   utNyS2NhiqQ8qxaGglrDMDis9Gz75CQxkTDieoENsygMIs8VCsTzw4g2V
   dnz8rdGQ9ge8aHYATU2p+q9w2cLejsDzFN9xQqZE3dP0Mjv5b9O05sI62
   9WwzNqaw2A1eE7k2OVlHq/ZbmRzwS5sCyVeEorkSVMWzqZPnOgG+lcU5Q
   A==;
X-CSE-ConnectionGUID: /J3ntOrAS2eV6OOhOuryJA==
X-CSE-MsgGUID: Ubq4rZHFQJ6XCSp1+VTk/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="200435228"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="200435228"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:12 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E2A4FD505C
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A29B6F336
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 35C3D1A0078;
	Tue, 20 May 2025 16:55:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/27] iotop: upgrade 1.27 -> 1.29
Date: Tue, 20 May 2025 16:54:37 +0800
Message-Id: <1747731299-20448-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117487

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- add option to specify bin directory
- fix batch mode
- Fix Linux kernel incompatible struct taskstats

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/iotop/{iotop_1.27.bb => iotop_1.29.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/iotop/{iotop_1.27.bb => iotop_1.29.bb} (90%)

diff --git a/meta-oe/recipes-extended/iotop/iotop_1.27.bb b/meta-oe/recipes-extended/iotop/iotop_1.29.bb
similarity index 90%
rename from meta-oe/recipes-extended/iotop/iotop_1.27.bb
rename to meta-oe/recipes-extended/iotop/iotop_1.29.bb
index 60157305c5..fc1251a899 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.27.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.29.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3154adaa1a9ca0d8dcc1944518ece1b9"
 
 DEPENDS = "ncurses"
 
-SRC_URI = "git://github.com/Tomas-M/iotop.git;branch=master;protocol=https"
-SRCREV = "4e32789e496a027201e66b5773a9d7955f7c638b"
+SRC_URI = "git://github.com/Tomas-M/iotop.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "dd0f4ad5ec03b9fd642f54144f6465cf6d2c1d12"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


