Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FC1C49EA1
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.33825.1721034176804143516
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LJP057DA;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034178; x=1752570178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YajZZpZZVPvpzCjIJnRLG39Mwo6r3moJP/UR/NADMDk=;
  b=LJP057DA2A8mFTArBDcSVo0NLA24kY8rflCiXUOBvQ12A3HgJn84w482
   D0ny8whJvsNTMlTeICMFyHXKGg11gOHYssuidMlLptppQYmD01/fghBz0
   13SoDPhyqWQG+/QH9/CAyYrPhHZAOckKmDCOhbeD/3Fp4h8OiWTVYMu/e
   tZ7O6kcOyeDapxUKgSpdYThM1CoZ1NvvU5bRClXaGuwI51tVaH5jV1CyM
   lUrekbYTuEg46bGXh3zhgO1fNPSMfyyjZJAtnFrZnd9t0eKtnDt69QZ5/
   tSHbXqpIOVIeC9EjTAFcHNKlBDnIyk651REbL3O0dszdm/WUQpuSl+Nlx
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="154933595"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="154933595"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 03298C68E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 33EA5CFAB2
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A6FC520071A31
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 55B4B1A000C;
	Mon, 15 Jul 2024 17:02:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/38] libbpf: upgrade 1.4.3 -> 1.4.5
Date: Mon, 15 Jul 2024 17:02:02 +0800
Message-Id: <1721034151-540-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--3.634200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyt8afRw5MY3AL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VRvtxLq45qm9TuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLhphqipnEX3PoZZi/IkGcckfRhdidsajMURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2eVW
	/ZdL52j2pfa409vQDLIqVQd6DKuONDNOVDVGChG8Yub+HToGsGawexdQh514j+T55Vy3ie2hhkf
	QP2nhE5CkCnK3WEYl4DTi9BLGCc2fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111326

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- fix BPF skeleton forward/backward compat handling
- detect broken PID filtering logic for multi-uprobe

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbpf/{libbpf_1.4.3.bb => libbpf_1.4.5.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.3.bb => libbpf_1.4.5.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb
index 665585d0c..5ee770148 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.3"
-SRCREV = "f8c6e0393d4be665fc0b584266b2a1354a71835e"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.5"
+SRCREV = "a5086158dc90593b4e4b3ddbafab9bdaf9ec97ef"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
-- 
2.34.1


