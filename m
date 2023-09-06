Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9864CCCFA19
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:03:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2527.1693965802114742474
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="119206066"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="119206066"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:03:08 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C631F076F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:03:06 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id AB4A2D8BB9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:03:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id B3EA2814DE;
	Wed,  6 Sep 2023 11:03:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-snagboot: upgrade 1.1 -> 1.2
Date: Wed,  6 Sep 2023 10:02:49 +0800
Message-Id: <1693965769-14810-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10--4.447400-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwN76LiU8zntr+I
	hmgj6NxW+vKnbgltiZxCNEei2kg1tJRobICtS/kfBe3KRVyu+k1DVmiiHQSFeCWxD2S0xfx/q1h
	2HGLwG3Dg8q4Y37zKTdHYmTeSzCtY51YHJ+FKPkAD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpi1tz08t0rrMXqpFVUzB+4Y7cPsR57JkIzEITY2UGMiNwpeqaZhManGJSDl
	QPoCUXSsX24ahsS5PuAMuqetGVetnyef22ep6XYxlblqLlYqXJnrk32fIEu+8SieTn7YpMA27hb
	XatTPalIkhduGRAHHz2teT1VzinNMUcYA3uNiESKxVypmaLcRHgJgAHeZDhLEtHX7YwBNPb+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104757

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    i.MX:
        Add i.MX8QM to SDPV SoCs
    snagflash/DFU: Add dfu-keep, dfu-detach and dfu-reset
    snagflash/UMS: various fixes, document creation of static block device paths
    AM335x:
        Fix issue where SPL output is confused with UART pings
        Catch spurious errors
        Fix race condition between BOOTP and TFTP servers
        Add progress bar for UART recovery
        Fix case conversion issue with firmware binary paths
    AM335x setup script:
        Improve robustness of SUDOER username detection
        Add custom shell prompt
        Fix issue where stdout is broken after exiting from recovery shell
        Silence spurious errors
    Document AM62Ax platforms and test AM62A7 device
    install: Fix issue where old builds confuse installation script
    pyproject: Change version-fetching method to avoid implicit setuptools dependency
    snagrecover/DFU: Catch spurious error on DFU_DETACH

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-snagboot_1.1.bb => python3-snagboot_1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_1.1.bb => python3-snagboot_1.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb b/meta-python/recipes-devtools/python/python3-snagboot_1.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_1.1.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_1.2.bb
index e6f3148ce0..57a3280de4 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_1.2.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "40b045e6225f3544080558e4bd604d116d4cffceea80cb84307579d914e4e498"
+SRC_URI[sha256sum] = "3d5cdd5ffe7355deba27657e6f45d45538a398f92215d219a8cfd6e716f67c34"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


