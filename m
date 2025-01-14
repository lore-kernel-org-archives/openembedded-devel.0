Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85C2C02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:02 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.40058.1736843339803171724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WhBFBnfl;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843340; x=1768379340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ouYc8s9OwUX40HV3H6F3HnS9GSjdV+020bFxI2obhog=;
  b=WhBFBnfl1Eg79c1k1wgjkszuFaNmGIVumbUcIOw5gnAjdcGrBxPipTkO
   O3IuULPdkP/mI1mAHPzDJqrIETb+3Fcb1pHDAtsP0RM3ZZoK+Xl7M+8OK
   ODzTcsX+/WJc0tdSc9Gx9j50sGfntDgx5Zx79JGEodZv7uvE7yR0TbCRy
   SiCygg0yXRVMnUiahsgpUoEMgQDPXllvJ+w1yMkD5tkV2gX2dg+vbraR9
   EokU6nGVk36N2TR+Ig6VMSaXTT+Rohz2aGxcyepZyo+Pb67fbF2heZyAX
   MpuIcq9MtPZUiujG9qMcZVDVtDS1GpLX4rkjqqJLfjgA4Jge2mnr3nYNS
   w==;
X-CSE-ConnectionGUID: p1hP+teFTl6q1ZjcIAQzOQ==
X-CSE-MsgGUID: x3Wcigo5TjqL885WqS53Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="173815673"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="173815673"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:28:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 59C7CE8520
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A7AAD3F0A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 92F9B20071A35
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 40C191A006C;
	Tue, 14 Jan 2025 16:28:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/30] ddrescue: upgrade 1.28 -> 1.29
Date: Tue, 14 Jan 2025 16:28:22 +0800
Message-Id: <1736843329-4131-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--5.703900-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/ye9VsdrlGzy3pxAd6mi1Ga1YC5LPd7Bvbbgz
	V/cQg6Um3fH5TKil+bhPtrLscgBAEqr78yjl3kp6HWRJEfGP5nmjy03X2hNeV45V1ACIyZtnkXM
	lASFsw/HS9SPWrOX9MV6+koXFID7Dowve/cNZOwzEOJqSsn5KmazghBiD4bcIkMdDYxplfPgruY
	kPRDOuBNMi/Gw8t6nASk7jNjzFORHtWteqKqfAdfx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkLKoU
	szL+VmmWq1/zhdxCQKOdZSOhzx8hzM8HubNfKJDuce7gFxhKa3zndiJkHFMhGFHVj+6F+rIMBbl
	t7zglMHx76rw/D5YpoAy6p60ZV62v2ThXg3lx4DdB/CxWTRRu25FeHtsUoHuxDsqsoTX7zDYHOw
	5dmhI1hHHFRi+K2GhPl43pEBwidschXTZ3Wukbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114848

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: address changed to <http://fsf.org/>

Changelog:
==========
- The new option '--continue-on-errno' has been added.
- If ddrescue exits because of a fatal read error, it now prints the value of
  the variable 'errno' so that it can be used as argument to
  '--continue-on-errno'.
- When using '--ask' and '--verbose', print rescue options before asking user.
- Option '--log-reads' now records the value of errno if different from EIO.
  (The four changes above suggested by Christian Franke).
- The effect of option '-O, --reopen-on-error' has been extended to all phases.
- It has been documented in the manual that '--reopen-on-error' may be needed
  when using '--continue-on-errno'.
- A compilation error on FiwixOS 3.3 about an ambiguous call to std::abs has
  been fixed. (Reported by Jordi Sanfeliu).
- The chapter 'Syntax of command-line arguments' has been added to the manual.
- Two examples of combined use with lziprecover have been added to the manual.
  (One of them uses the new Forward Error Correction (FEC) feature of
  lziprecover).
- It has been documented in the manual that option '-b' of ddrescuelog is
  position dependent. (Reported by Winston B. E.).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ddrescue/{ddrescue_1.28.bb => ddrescue_1.29.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.28.bb => ddrescue_1.29.bb} (88%)

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.28.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.29.bb
similarity index 88%
rename from meta-oe/recipes-extended/ddrescue/ddrescue_1.28.bb
rename to meta-oe/recipes-extended/ddrescue/ddrescue_1.29.bb
index 0863fc1209..2b11982d5c 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.28.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.29.bb
@@ -6,12 +6,12 @@ HOMEPAGE = "http://www.gnu.org/software/ddrescue/ddrescue.html"
 SECTION = "console"
 LICENSE = "GPL-2.0-or-later"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
                     file://main_common.cc;beginline=5;endline=16;md5=ad099df052bdd8297f490712285069da \
                     "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
-SRC_URI[sha256sum] = "6626c07a7ca1cc1d03cad0958522c5279b156222d32c342e81117cfefaeb10c1"
+SRC_URI[sha256sum] = "01a414327853b39fba2fd0ece30f7bee2e9d8c8e8eb314318524adf5a60039a3"
 
 # This isn't already added by base.bbclass
 do_unpack[depends] += "lzip-native:do_populate_sysroot"
-- 
2.43.0


